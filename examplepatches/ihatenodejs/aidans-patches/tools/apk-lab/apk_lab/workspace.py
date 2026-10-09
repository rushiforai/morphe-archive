from __future__ import annotations

import hashlib
import json
import logging
import shutil
from collections.abc import Generator
from contextlib import contextmanager
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from apk_lab.archives import is_contained_path

MARKER_FILENAME = ".marker.json"
SCHEMA_VERSION = 1


class WorkspaceError(Exception):
    """Raised for invalid workspace operations or unsafe paths."""


logger = logging.getLogger(__name__)


def compute_digest(obj: Any) -> str:
    """Computes a deterministic SHA-256 hex digest of an object."""
    encoded = json.dumps(obj, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


class WorkspaceManager:
    def __init__(self, root: str | Path = ".apk-lab"):
        self.root = Path(root).resolve()

    def ensure_root(self) -> Path:
        self.root.mkdir(parents=True, exist_ok=True)
        return self.root

    def create_run_dir(
        self,
        package_name: str,
        version_code: int,
        input_sha256: str,
        input_path: str | Path,
        command: str,
        config: dict[str, Any],
        tool_versions: dict[str, str],
    ) -> Path:
        """Creates a managed run directory and writes .marker.json."""
        self.ensure_root()

        config_payload = {
            "command": command,
            "config": config,
            "toolVersions": tool_versions,
        }
        config_digest = compute_digest(config_payload)[:12]
        version_slot = f"{version_code}-{input_sha256[:12]}"

        run_dir = (self.root / package_name / version_slot / config_digest).resolve()
        # Verify run_dir is strictly inside root
        if not is_contained_path(run_dir, self.root, allow_equal=False):
            raise WorkspaceError(
                f"Calculated run directory {run_dir} escapes root {self.root}"
            )

        run_dir.mkdir(parents=True, exist_ok=True)

        marker_data = {
            "schemaVersion": SCHEMA_VERSION,
            "inputCanonicalPath": str(Path(input_path).resolve()),
            "inputSha256": input_sha256,
            "command": command,
            "configDigest": config_digest,
            "toolVersions": tool_versions,
            "createdAt": datetime.now(timezone.utc).isoformat(),
        }

        marker_file = run_dir / MARKER_FILENAME
        with open(marker_file, "w", encoding="utf-8") as f:
            json.dump(marker_data, f, indent=2, sort_keys=True)

        return run_dir

    def validate_run_dir(self, run_dir: Path) -> dict[str, Any]:
        """Validates that a path is a genuine, safe managed run directory."""
        # 1. Must not be a symlink
        if run_dir.is_symlink():
            raise WorkspaceError(f"Path {run_dir} is a symlink")

        resolved = run_dir.resolve()
        if resolved.is_symlink():
            raise WorkspaceError(f"Path {resolved} is a symlink")

        # 2. Must be inside root
        if not is_contained_path(resolved, self.root, allow_equal=False):
            raise WorkspaceError(
                f"Path {resolved} is outside workspace root {self.root}"
            )
        # 3. Must be a directory
        if not resolved.is_dir():
            raise WorkspaceError(f"Path {resolved} is not a directory")

        # 4. Must contain valid .marker.json
        marker_file = resolved / MARKER_FILENAME
        if not marker_file.is_file():
            raise WorkspaceError(f"Directory {resolved} is missing {MARKER_FILENAME}")

        try:
            with open(marker_file, "r", encoding="utf-8") as f:
                data = json.load(f)
            if data.get("schemaVersion") != SCHEMA_VERSION:
                raise WorkspaceError(f"Unsupported marker schema in {resolved}")
            return data
        except json.JSONDecodeError as e:
            raise WorkspaceError(f"Corrupt {MARKER_FILENAME} in {resolved}: {e}") from e

    def find_all_runs(self) -> list[Path]:
        """Finds all valid run directories under root."""
        if not self.root.is_dir():
            return []

        runs: list[Path] = []
        for marker in self.root.glob(f"*/*/*/{MARKER_FILENAME}"):
            run_dir = marker.parent
            try:
                self.validate_run_dir(run_dir)
                runs.append(run_dir)
            except WorkspaceError:
                continue
        return sorted(runs)

    def clean_run(self, run_path: str | Path, dry_run: bool = False) -> bool:
        """Cleans a single run directory after verifying marker."""
        path = Path(run_path)
        self.validate_run_dir(path)

        if not dry_run:
            shutil.rmtree(path)
            self._clean_empty_parents(path.parent)
        return True

    def clean_package(self, package_name: str, dry_run: bool = False) -> list[Path]:
        """Cleans all runs belonging to a package."""
        pkg_dir = (self.root / package_name).resolve()
        if not is_contained_path(pkg_dir, self.root, allow_equal=False):
            raise WorkspaceError(f"Invalid package directory {pkg_dir}")

        cleaned: list[Path] = []
        if not pkg_dir.is_dir():
            return cleaned

        for marker in pkg_dir.glob(f"*/*/{MARKER_FILENAME}"):
            run_dir = marker.parent
            try:
                self.validate_run_dir(run_dir)
                cleaned.append(run_dir)
                if not dry_run:
                    shutil.rmtree(run_dir)
            except WorkspaceError:
                continue

        if not dry_run and cleaned:
            self._clean_empty_parents(pkg_dir)

        return sorted(cleaned)

    def clean_stale(self, days: float, dry_run: bool = False) -> list[Path]:
        if days < 0:
            raise WorkspaceError(f"Stale age must be non-negative: {days}")

        """Cleans runs older than the specified number of days."""
        now = datetime.now(timezone.utc)
        cutoff_seconds = days * 86400.0

        stale: list[Path] = []
        for run_dir in self.find_all_runs():
            try:
                marker = self.validate_run_dir(run_dir)
                created_iso = marker.get("createdAt")
                if not created_iso:
                    continue
                created_dt = datetime.fromisoformat(created_iso)
                age = (now - created_dt).total_seconds()
                if age >= cutoff_seconds:
                    stale.append(run_dir)
                    if not dry_run:
                        shutil.rmtree(run_dir)
                        self._clean_empty_parents(run_dir.parent)
            except (WorkspaceError, OSError, ValueError) as err:
                logger.debug(
                    "Skipping invalid or inaccessible run dir %s: %s", run_dir, err
                )
                continue

        return sorted(stale)

    def _clean_empty_parents(self, start_dir: Path) -> None:
        curr = start_dir.resolve()
        resolved_root = self.root.resolve()
        while curr != resolved_root and curr.is_relative_to(resolved_root):
            try:
                if curr.is_dir() and not any(curr.iterdir()):
                    curr.rmdir()
                    curr = curr.parent.resolve()
                else:
                    break
            except OSError:
                break

    @contextmanager
    def ephemeral_run(
        self,
        package_name: str,
        version_code: int,
        input_sha256: str,
        input_path: str | Path,
        command: str,
        config: dict[str, Any],
        tool_versions: dict[str, str],
        keep_workspace: bool = False,
    ) -> Generator[Path, None, None]:
        """Context manager creating a managed run dir and cleaning it up unless keep_workspace is True."""
        run_dir = self.create_run_dir(
            package_name=package_name,
            version_code=version_code,
            input_sha256=input_sha256,
            input_path=input_path,
            command=command,
            config=config,
            tool_versions=tool_versions,
        )
        try:
            yield run_dir
        finally:
            if not keep_workspace:
                try:
                    shutil.rmtree(run_dir)
                    self._clean_empty_parents(run_dir.parent)
                except OSError as err:
                    logger.debug(
                        "Failed to clean up ephemeral run dir %s: %s", run_dir, err
                    )
