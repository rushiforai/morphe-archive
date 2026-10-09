from __future__ import annotations

import io
import re
import struct
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

# Magic constant for global-metadata.dat
IL2CPP_METADATA_MAGIC = 0xFAB11BAF


@dataclass(frozen=True)
class MetadataLayout:
    string_offset_header: int
    string_size_header: int
    methods_offset_header: int
    methods_size_header: int
    type_definitions_offset_header: int
    type_definitions_size_header: int
    method_record_size: int
    method_name_index_offset: int
    method_return_type_offset: int
    method_parameter_start_offset: int
    method_parameter_count_offset: int
    type_record_size: int
    type_name_index_offset: int
    type_namespace_index_offset: int
    type_method_start_offset: int
    type_method_count_offset: int


SUPPORTED_LAYOUTS: dict[tuple[int, int], MetadataLayout] = {
    (29, 0): MetadataLayout(
        string_offset_header=24,
        string_size_header=28,
        methods_offset_header=48,
        methods_size_header=52,
        type_definitions_offset_header=160,
        type_definitions_size_header=164,
        method_record_size=32,
        method_name_index_offset=0,
        method_return_type_offset=8,
        method_parameter_start_offset=12,
        method_parameter_count_offset=30,
        type_record_size=88,
        type_name_index_offset=0,
        type_namespace_index_offset=4,
        type_method_start_offset=36,
        type_method_count_offset=64,
    ),
    (31, 0): MetadataLayout(
        string_offset_header=24,
        string_size_header=28,
        methods_offset_header=48,
        methods_size_header=52,
        type_definitions_offset_header=160,
        type_definitions_size_header=164,
        method_record_size=36,
        method_name_index_offset=0,
        method_return_type_offset=8,
        method_parameter_start_offset=16,
        method_parameter_count_offset=34,
        type_record_size=88,
        type_name_index_offset=0,
        type_namespace_index_offset=4,
        type_method_start_offset=36,
        type_method_count_offset=64,
    ),
}


@dataclass
class Il2CppTypeDefinition:
    name: str
    namespace: str
    method_start_index: int = 0
    method_count: int = 0
    name_index: int = 0
    namespace_index: int = 0


@dataclass
class Il2CppMethodDefinition:
    name: str
    return_type_idx: int = 0
    parameter_start_index: int = 0
    parameter_count: int = 0
    name_index: int = 0


@dataclass
class Il2CppMethodMatch:
    namespace: str
    type_name: str
    method_name: str
    parameter_count: int = 0


class Il2CppMetadata:
    """Parser for Unity IL2CPP global-metadata.dat binary files."""

    def __init__(self, data: bytes, *, metadata_subversion: int = 0) -> None:
        if len(data) < 256:
            raise ValueError(
                f"Metadata file too small ({len(data)} bytes, minimum 256)"
            )

        self.data = data
        self.metadata_subversion = metadata_subversion
        self.sanity = struct.unpack_from("<I", data, 0)[0]
        if self.sanity != IL2CPP_METADATA_MAGIC:
            raise ValueError(
                f"Invalid metadata file magic: 0x{self.sanity:08x} "
                f"(expected 0x{IL2CPP_METADATA_MAGIC:08x})"
            )

        self.version = struct.unpack_from("<I", data, 4)[0]
        layout = SUPPORTED_LAYOUTS.get((self.version, self.metadata_subversion))
        if layout is None:
            raise ValueError(
                f"Unsupported IL2CPP metadata layout: {self.version}.{self.metadata_subversion}"
            )
        self.layout = layout

        self.string_offset = struct.unpack_from(
            "<I", data, layout.string_offset_header
        )[0]
        self.string_size = struct.unpack_from("<I", data, layout.string_size_header)[0]
        self.methods_offset = struct.unpack_from(
            "<I", data, layout.methods_offset_header
        )[0]
        self.methods_size = struct.unpack_from("<I", data, layout.methods_size_header)[
            0
        ]
        self.type_definitions_offset = struct.unpack_from(
            "<I", data, layout.type_definitions_offset_header
        )[0]
        self.type_definitions_size = struct.unpack_from(
            "<I", data, layout.type_definitions_size_header
        )[0]

        self.headers: dict[str, int] = {
            "stringOffset": self.string_offset,
            "stringSize": self.string_size,
            "methodsOffset": self.methods_offset,
            "methodsSize": self.methods_size,
            "typeDefinitionsOffset": self.type_definitions_offset,
            "typeDefinitionsSize": self.type_definitions_size,
        }

        self.method_definitions: list[Il2CppMethodDefinition] = []
        self.type_definitions: list[Il2CppTypeDefinition] = []

        self._parse_method_definitions()
        self._parse_type_definitions()

    def get_string_from_index(self, index: int) -> str:
        """Reads a null-terminated UTF-8 string from the string table at the given offset."""
        if index < 0 or index >= self.string_size:
            return ""
        abs_offset = self.string_offset + index
        if abs_offset >= len(self.data):
            return ""
        end = self.data.find(b"\x00", abs_offset)
        if end == -1:
            end = min(abs_offset + 256, len(self.data))
        return self.data[abs_offset:end].decode("utf-8", errors="replace")

    def _parse_method_definitions(self) -> None:
        """Parses the method definitions table according to the selected layout."""
        if self.methods_offset == 0 or self.methods_size == 0:
            return

        if self.methods_size % self.layout.method_record_size != 0:
            raise ValueError(
                f"Methods table size ({self.methods_size} bytes) is not a multiple of "
                f"record size ({self.layout.method_record_size} bytes)"
            )

        count = self.methods_size // self.layout.method_record_size
        for i in range(count):
            offset = self.methods_offset + i * self.layout.method_record_size
            if offset + self.layout.method_record_size > len(self.data):
                break
            name_idx = struct.unpack_from(
                "<i", self.data, offset + self.layout.method_name_index_offset
            )[0]
            return_type_idx = struct.unpack_from(
                "<i", self.data, offset + self.layout.method_return_type_offset
            )[0]
            param_start = struct.unpack_from(
                "<i", self.data, offset + self.layout.method_parameter_start_offset
            )[0]
            param_count = struct.unpack_from(
                "<H", self.data, offset + self.layout.method_parameter_count_offset
            )[0]
            name = self.get_string_from_index(name_idx)
            self.method_definitions.append(
                Il2CppMethodDefinition(
                    name=name,
                    return_type_idx=return_type_idx,
                    parameter_start_index=param_start,
                    parameter_count=param_count,
                    name_index=name_idx,
                )
            )

    def _parse_type_definitions(self) -> None:
        """Parses the type definitions table according to the selected layout."""
        if self.type_definitions_offset == 0 or self.type_definitions_size == 0:
            return

        if self.type_definitions_size % self.layout.type_record_size != 0:
            raise ValueError(
                f"Type definitions table size ({self.type_definitions_size} bytes) is not a multiple of "
                f"record size ({self.layout.type_record_size} bytes)"
            )

        count = self.type_definitions_size // self.layout.type_record_size
        for i in range(count):
            offset = self.type_definitions_offset + i * self.layout.type_record_size
            if offset + self.layout.type_record_size > len(self.data):
                break
            name_idx = struct.unpack_from(
                "<i", self.data, offset + self.layout.type_name_index_offset
            )[0]
            namespace_idx = struct.unpack_from(
                "<i", self.data, offset + self.layout.type_namespace_index_offset
            )[0]
            method_start = struct.unpack_from(
                "<i", self.data, offset + self.layout.type_method_start_offset
            )[0]
            method_count = struct.unpack_from(
                "<H", self.data, offset + self.layout.type_method_count_offset
            )[0]

            name = self.get_string_from_index(name_idx)
            namespace = self.get_string_from_index(namespace_idx)

            self.type_definitions.append(
                Il2CppTypeDefinition(
                    name=name,
                    namespace=namespace,
                    method_start_index=method_start,
                    method_count=method_count,
                    name_index=name_idx,
                    namespace_index=namespace_idx,
                )
            )


class Il2CppSymbolMap:
    """Aggregates Il2Cpp types, method names, and provides fast symbol search."""

    def __init__(self, metadata: Il2CppMetadata) -> None:
        self.metadata = metadata
        self.matches: list[Il2CppMethodMatch] = []

        for tdef in metadata.type_definitions:
            for i in range(tdef.method_count):
                m_idx = tdef.method_start_index + i
                if 0 <= m_idx < len(metadata.method_definitions):
                    mdef = metadata.method_definitions[m_idx]
                    self.matches.append(
                        Il2CppMethodMatch(
                            namespace=tdef.namespace,
                            type_name=tdef.name,
                            method_name=mdef.name,
                            parameter_count=mdef.parameter_count,
                        )
                    )

    def search(self, query: str | None = None) -> list[Il2CppMethodMatch]:
        """Filters methods by case-insensitive substring or regex query across namespace, type, or method."""
        if not query:
            return list(self.matches)

        # Check if query is a valid regex
        try:
            pattern = re.compile(query, re.IGNORECASE)
            use_regex = True
        except re.error:
            pattern = None
            use_regex = False
        q_lower = query.lower()

        results: list[Il2CppMethodMatch] = []
        for m in self.matches:
            full_sig = f"{m.namespace}.{m.type_name}.{m.method_name}"
            if (
                use_regex
                and pattern is not None
                and (
                    pattern.search(m.method_name)
                    or pattern.search(m.type_name)
                    or pattern.search(full_sig)
                )
            ):
                results.append(m)
                continue

            if (
                q_lower in m.method_name.lower()
                or q_lower in m.type_name.lower()
                or q_lower in full_sig.lower()
            ):
                results.append(m)

        return results


def extract_il2cpp_metadata_from_artifact(
    artifact_path: Path,
) -> tuple[bytes, dict[str, bytes]]:
    """Extracts `global-metadata.dat` and native `.so` files from an APK or multi-split container.

    Returns (metadata_bytes, {lib_relative_path: lib_bytes}).
    Raises FileNotFoundError if global-metadata.dat cannot be located.
    """
    metadata_rel_path = "assets/bin/Data/Managed/Metadata/global-metadata.dat"
    metadata_bytes: bytes | None = None
    native_libs: dict[str, bytes] = {}

    if not artifact_path.is_file():
        raise FileNotFoundError(f"Artifact file not found: {artifact_path}")

    with zipfile.ZipFile(artifact_path, "r") as zf:
        namelist = zf.namelist()

        # Check if direct APK
        if metadata_rel_path in namelist:
            metadata_bytes = zf.read(metadata_rel_path)
            for name in namelist:
                if name.startswith("lib/") and name.endswith(".so"):
                    native_libs[name] = zf.read(name)
            return metadata_bytes, native_libs

        # Check for split container (APKM, APKS, XAPK) containing inner APKs
        apk_members = [m for m in namelist if m.endswith(".apk")]
        if apk_members:
            for apk_member in apk_members:
                inner_bytes = zf.read(apk_member)
                with zipfile.ZipFile(io.BytesIO(inner_bytes), "r") as inner_zf:
                    inner_names = inner_zf.namelist()
                    if metadata_rel_path in inner_names:
                        metadata_bytes = inner_zf.read(metadata_rel_path)
                    for name in inner_names:
                        if name.startswith("lib/") and name.endswith(".so"):
                            native_libs[name] = inner_zf.read(name)

            if metadata_bytes is not None:
                return metadata_bytes, native_libs

    raise FileNotFoundError("global-metadata.dat not found in artifact")


def analyze_il2cpp(
    artifact_path: Path, query: str | None = None
) -> list[dict[str, Any]]:
    """Analyzes an artifact for IL2CPP metadata and returns matching symbol dictionaries."""
    metadata_bytes, _native_libs = extract_il2cpp_metadata_from_artifact(artifact_path)
    metadata = Il2CppMetadata(metadata_bytes)
    symbol_map = Il2CppSymbolMap(metadata)
    matches = symbol_map.search(query)

    records: list[dict[str, Any]] = []
    for match in matches:
        records.append(
            {
                "namespace": match.namespace,
                "type": match.type_name,
                "method": match.method_name,
                "parameters_count": match.parameter_count,
            }
        )
    return records
