from __future__ import annotations

import re
import subprocess
from dataclasses import dataclass, field
from pathlib import Path

from apk_lab.archives import materialize_artifact_apks
from apk_lab.inspection import find_build_tools_bin, inspect_artifact


@dataclass
class ManifestComponent:
    component_type: str  # activity, service, receiver, provider
    name: str
    exported: bool | None = None
    permission: str | None = None
    authorities: str | None = None
    intent_actions: list[str] = field(default_factory=list)


def parse_manifest_xmltree(xmltree_output: str) -> list[ManifestComponent]:
    """Parses aapt2 dump xmltree AndroidManifest.xml output into structured components."""
    components: list[ManifestComponent] = []
    current_comp: ManifestComponent | None = None
    current_comp_depth: int = -1
    current_tag: str | None = None

    for line in xmltree_output.splitlines():
        elem_match = re.match(r"^(\s*)E:\s+([a-zA-Z0-9_\-]+)", line)
        if elem_match:
            depth = len(elem_match.group(1))
            tag = elem_match.group(2)
            if current_comp is not None and depth <= current_comp_depth:
                components.append(current_comp)
                current_comp = None
                current_comp_depth = -1
            if tag in ("activity", "service", "receiver", "provider"):
                current_comp = ManifestComponent(component_type=tag, name="")
                current_comp_depth = depth
                current_tag = tag
                continue
            current_tag = tag
            continue

        if current_comp is not None:
            line_str = line.strip()
            # Match attributes (quoted or unquoted)
            attr_match = re.search(
                r'A:\s+http://schemas\.android\.com/apk/res/android:(\w+)[^=]*=(?:"([^"]+)"|([^\s(]+))',
                line_str,
            )
            if attr_match:
                attr_name = attr_match.group(1)
                attr_val = (
                    attr_match.group(2)
                    if attr_match.group(2) is not None
                    else attr_match.group(3)
                )
                if attr_name == "name":
                    if current_tag == "action":
                        current_comp.intent_actions.append(attr_val)
                    elif (
                        current_tag == current_comp.component_type
                        and not current_comp.name
                    ):
                        current_comp.name = attr_val
                elif current_tag == current_comp.component_type:
                    if attr_name == "exported":
                        current_comp.exported = (
                            attr_val.lower() == "true" or attr_val == "0xffffffff"
                        )
                    elif attr_name == "permission":
                        current_comp.permission = attr_val
                    elif attr_name == "authorities":
                        current_comp.authorities = attr_val

    if current_comp:
        components.append(current_comp)

    return components


def inspect_artifact_components(
    artifact_path: Path | str,
    component_type: str | None = None,
) -> list[ManifestComponent]:
    """Extracts manifest components from the base split of an artifact."""
    path = Path(artifact_path).resolve()
    insp = inspect_artifact(path)
    aapt2 = find_build_tools_bin("aapt2")

    with materialize_artifact_apks(path, insp) as apks:
        for apk in apks:
            if (
                apk.is_base
                or "base" in apk.split_name
                or apk.container_member == "base.apk"
                or len(apks) == 1
            ):
                res = subprocess.run(
                    [
                        str(aapt2),
                        "dump",
                        "xmltree",
                        "--file",
                        "AndroidManifest.xml",
                        str(apk.path),
                    ],
                    capture_output=True,
                    text=True,
                    check=True,
                )
                components = parse_manifest_xmltree(res.stdout)
                if component_type:
                    components = [
                        c for c in components if c.component_type == component_type
                    ]
                return components

    return []
