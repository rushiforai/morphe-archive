import contextlib
import os
import re
import shutil
import subprocess
from pathlib import Path

from src.core.logger import pr, wpr
from src.core.prebuilts import get_highest_ver

_SECRET_PATTERNS = re.compile(r"(keystore-password=|keystore-entry-password=)\S+")


class PatcherError(Exception):
    pass

class SignatureError(PatcherError):
    """Raised when sig.txt has no entry for a package, or apksigner reports a hash mismatch."""

def _run_java(*args: str | Path, capture: bool = True, timeout: int = 600) -> str:
    result = subprocess.run(["java", *(str(a) for a in args)], capture_output=capture, text=True, timeout=timeout)
    combined = (result.stdout or "") + (result.stderr or "")
    if result.returncode != 0:
        redacted = _SECRET_PATTERNS.sub(r"\1***", combined)
        raise PatcherError(redacted.strip())
    return combined

def _parse_patch_block(output: str, patch_name: str) -> list[str]:
    if m := re.search(rf"Name:\s*{re.escape(patch_name)}\n.*?Compatible versions:\s*\n(.*?)(?:\n\n|\Z)", output, re.DOTALL | re.IGNORECASE):
        return [v.strip() for v in m.group(1).splitlines() if v.strip()]
    return []

def _parse_versions_output(output: str) -> list[str]:
    marker = "Most common compatible versions:\n"
    if marker not in output:
        return []

    block = output.split(marker)[1].split("\n\n")[0]
    versions = []
    for line in block.splitlines():
        clean_ver = line.split("(")[0].strip()
        if clean_ver:
            versions.append(clean_ver)

    return versions

def _redact_args(args: list[str | Path]) -> list[str]:
    return [_SECRET_PATTERNS.sub(r"\1***", str(a)) for a in args]

class PatcherCLI:
    def __init__(self, cli_jar: Path, mpp_map: dict[tuple[str, str], Path], apksigner: Path, ks_path: Path | None = None, sig_file: Path = Path("sig.txt")) -> None:
        self.cli_jar = cli_jar
        self.mpp_map = mpp_map
        self.apksigner = apksigner
        self.ks_path = ks_path
        self._signatures: dict[str, str] = {}
        if sig_file.exists():
            for line in sig_file.read_text(encoding="utf-8").splitlines():
                if parts := line.split():
                    self._signatures[parts[-1]] = parts[0].lower()

    def has_signature(self, pkg_name: str) -> bool:
        expected = self._signatures.get(pkg_name)
        return bool(expected and expected.strip())

    def list_patches(self, pkg_name: str) -> str:
        return "".join(_run_java("-jar", self.cli_jar, "list-patches", "--patches", mpp, "-f", pkg_name, "-v", "-p", timeout=60) for mpp in self.mpp_map.values())

    def list_versions(self, pkg_name: str) -> str:
        parts = []
        for mpp in self.mpp_map.values():
            with contextlib.suppress(PatcherError):
                parts.append(_run_java("-jar", self.cli_jar, "list-versions", "--patches", mpp, "-f", pkg_name, timeout=60))
        return "\n".join(parts)

    def get_last_supported_version(self, list_patches_output: str, pkg_name: str, patches: dict[str, dict]) -> str | None:
        all_included = [p for spec in patches.values() for p in spec["include"]]
        if all_included and (all_vers := [v for p in all_included for v in _parse_patch_block(list_patches_output, p)]):
            return get_highest_ver(all_vers)

        versions_output = self.list_versions(pkg_name)
        if "Any" in versions_output:
            return None

        if not (versions := _parse_versions_output(versions_output)):
            raise PatcherError(f"No patches found for '{pkg_name}'")
        return get_highest_ver(versions)

    def resolve_auto_patches(self, list_patches_output: str) -> tuple[str, str]:
        microg_patch = psu_patch = ""
        for line in list_patches_output.splitlines():
            if not line.lower().startswith("name:"):
                continue

            patch_name = line[5:].strip()
            name_lower = patch_name.lower()
            if "gmscore" in name_lower or "microg" in name_lower:
                microg_patch = patch_name
            elif "disable play store updates" in name_lower:
                psu_patch = patch_name

        return microg_patch, psu_patch

    def build_patch_args(self, patches: dict[str, dict], extra_args: list[str], arch: str, auto_patches: tuple[str, str], exclusive: bool = False, force: bool = False) -> list[str]:
        active_auto = {p for p in auto_patches if p}
        p_args: list[str] = ["-f"] if force else []
        for src, spec in patches.items():
            p_args.extend(("--patches", str(self.mpp_map[(src, spec["version"])])))
            for p in spec["include"]:
                if p in active_auto:
                    wpr(f"You can't include '{p}' patch as that's done by builder automatically")
                else:
                    p_args.extend(("-e", p))
            for p in spec["exclude"]:
                p_args.extend(("-d", p))
        if exclusive:
            p_args.append("--exclusive")

        p_args.extend(extra_args)
        for auto_p in active_auto:
            p_args.extend(("-e", auto_p))
        p_args.extend(("--striplibs", "arm64-v8a,armeabi-v7a" if arch == "all" else arch))
        return p_args

    def patch(self, stock_apk: Path, output_apk: Path, patch_args: list[str]) -> None:
        tmp_files_dir = output_apk.parent / f"tmp-{output_apk.stem}"
        base_cmd = ["-jar", self.cli_jar, "patch", stock_apk, "--purge", "-o", output_apk, "-t", tmp_files_dir]
        ks_args: list[str] = []
        if self.ks_path and (ks_pass := os.getenv("KEYSTORE_PASS")) and (ks_alias := os.getenv("KEYSTORE_ALIAS")):
            ks_args = [f"--keystore={self.ks_path}", f"--keystore-entry-password={ks_pass}", f"--keystore-password={ks_pass}", f"--signer={ks_alias}", f"--keystore-entry-alias={ks_alias}"]
        elif Path("morphe.keystore").exists():
            ks_args = ["--keystore=morphe.keystore"]

        pr(" ".join(_redact_args(["java", *base_cmd, *ks_args, *patch_args])))
        try:
            _run_java(*base_cmd, *ks_args, *patch_args, capture=False)
        except subprocess.TimeoutExpired:
            output_apk.unlink(missing_ok=True)
            raise PatcherError(f"Patching '{stock_apk.name}' failed, process timed out after 10 minutes") from None
        except PatcherError as exc:
            output_apk.unlink(missing_ok=True)
            raise PatcherError(f"Patching '{stock_apk.name}' failed:\n{exc}") from exc
        finally:
            shutil.rmtree(tmp_files_dir, ignore_errors=True)

    def check_signature(self, apk: Path, pkg_name: str) -> bool:
        expected = self._signatures.get(pkg_name)
        if not expected:
            return True

        try:
            output = _run_java("--enable-native-access=ALL-UNNAMED", "-jar", self.apksigner, "verify", "--print-certs", apk)
            return expected.lower() in output.lower()
        except PatcherError:
            return False