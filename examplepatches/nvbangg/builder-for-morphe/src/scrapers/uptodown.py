# ---------------------------------------------------------
# Copyright (C) 2026 krvstek
# 
# DO NOT REMOVE OR ALTER THIS COPYRIGHT HEADER.
# This file is part of uni-apks.
# Canonical source: https://github.com/krvstek/uni-apks
#
# Licensed under the GNU GPLv3. You may modify this file,
# but you MUST keep this original copyright notice intact
# and prominently state any changes made.
# See the AUTHORS file in the root directory for details.
# ---------------------------------------------------------

import json  # noqa: I001
from pathlib import Path

from src.core.network import NetworkManager
from src.scrapers.base import AppMetadata, BaseScraper, DownloadResult, ScraperError, _parse_html

_DEFAULT_ARCH: frozenset[str] = frozenset({"arm64-v8a, armeabi-v7a, x86_64", "arm64-v8a, armeabi-v7a, x86, x86_64", "arm64-v8a, armeabi-v7a"})


class UptodownError(ScraperError):
    pass

class UptodownScraper(BaseScraper):
    def __init__(self, net: NetworkManager) -> None:
        super().__init__(net)
        self._versions_cache: dict[str, str] = {}

    def fetch_metadata(self, url: str) -> AppMetadata:
        versions_html = self.net.get(f"{url}/versions")
        self._versions_cache[url] = versions_html
        pkg_html = self.net.get(f"{url}/download")
        soup_pkg = _parse_html(pkg_html)
        th = soup_pkg.find("th", string="Package Name")
        if th and (td := th.find_next_sibling("td")):
            pkg_name = td.get_text(strip=True)
        else:
            raise UptodownError("Package name not found")

        soup_ver = _parse_html(versions_html)
        versions = [text for el in soup_ver.select(".version") if (text := el.get_text(strip=True))]
        return AppMetadata(pkg_name=pkg_name, versions=versions)

    def download(self, url: str, version: str, dest: Path, arch: str, dpi: str) -> DownloadResult:
        versions_html = self._versions_cache.get(url) or self.net.get(f"{url}/versions")
        self._versions_cache[url] = versions_html

        apparch: set[str] = set(_DEFAULT_ARCH)
        if arch != "all":
            apparch.add(arch)

        soup = _parse_html(versions_html)
        data_code = str(soup.select_one("#detail-app-name")["data-code"])
        version_url_data = self._find_version_url(url, data_code, version)
        ver_url = "/".join((version_url_data["url"], version_url_data["extraURL"], str(version_url_data["versionID"])))
        is_bundle = version_url_data.get("kindFile") == "xapk"
        soup_ver = _parse_html(self.net.get(ver_url))
        btn_variants = soup_ver.select_one(".button.variants")
        if btn_variants and (data_version := btn_variants.get("data-version")):
            resp, is_bundle = self._pick_variant_file(url, data_code, str(data_version), apparch)
            soup_ver = _parse_html(resp)

        dl_url = soup_ver.select_one("#detail-download-button")["data-url"]
        out_path = dest.with_suffix(".apkm") if is_bundle else dest
        self.net.download(f"https://dw.uptodown.com/dwn/{dl_url}", out_path)
        return DownloadResult(path=out_path, is_bundle=is_bundle)

    def _find_version_url(self, url: str, data_code: str, version: str) -> dict:
        for i in range(1, 21):
            payload = json.loads(self.net.get(f"{url}/apps/{data_code}/versions/{i}"))
            data = payload.get("data")
            if not data:
                break

            for entry in data:
                if entry.get("version") != version:
                    continue
                ver_url_dict = entry.get("versionURL") or {}
                return ver_url_dict | {"kindFile": entry.get("kindFile", "")}
        raise UptodownError("Version not found")

    def _pick_variant_file(self, url: str, data_code: str, data_version: str, apparch: set[str]) -> tuple[str, bool]:
        base_url = url.rsplit("/", 1)[0]
        files_html = json.loads(self.net.get(f"{base_url}/app/{data_code}/version/{data_version}/files")).get("content", "")
        soup = _parse_html(files_html)
        content = soup.select_one(".content")
        node_arch = ""
        for child in content.children:
            if not getattr(child, "name", None):
                continue

            if "variant" not in child.get("class", []):
                node_arch = child.get_text(strip=True)
                continue

            if not node_arch or node_arch not in apparch:
                continue

            file_type_tag = child.select_one(".v-file > span")
            is_bundle = file_type_tag.get_text(strip=True) == "xapk" if file_type_tag else False
            v_report = child.select_one(".v-report")
            if v_report is None:
                continue

            file_id = v_report.get("data-file-id")
            if file_id is None:
                continue

            return self.net.get(f"{url}/download/{file_id}-x"), is_bundle
        raise UptodownError("No matching variant found")