#!/usr/bin/env python3
"""Validate Psylos SoundCloud patch fingerprints/anchors against an apktool tree."""
from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class Target:
    descriptor: str
    method_fragment: str
    anchors: tuple[str, ...]


TARGETS = (
    Target(
        "Lcom/soundcloud/android/settings/main/SettingsScreenKt;",
        "a(Lcom/soundcloud/android/settings/main/SettingsState;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V",
        (
            "Landroidx/compose/foundation/layout/ColumnScopeInstance;->INSTANCE",
            "Landroidx/compose/runtime/Updater;->d",
            "Lcom/soundcloud/android/settings/main/OfflineSyncSettingState$Visible;",
        ),
    ),
    Target(
        "Lov/e;",
        "onClick(Landroid/view/View;)V",
        (
            "Lcom/soundcloud/android/foundation/domain/playlists/PlaylistItem;->getPermalinkUrl()Ljava/lang/String;",
            "Lcom/soundcloud/android/playlists/PlaylistDetailsMetadata;->f:Lcom/soundcloud/android/playlists/PlaylistDetailsMetadata$OfflineOptions;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/trackpage/TrackDetailsPagePresenter$fetchData$2;",
        "apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        (
            "Lcom/soundcloud/android/foundation/domain/tracks/TrackItem;->getPermalinkUrl()Ljava/lang/String;",
            "TrackDetailsPagePresenter$fetchData$2;->a:Lcom/soundcloud/android/foundation/domain/TrackUrn;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/trackpage/TrackDetailsPagePresenter$subscribeForDownloadClick$1;",
        "accept(Ljava/lang/Object;)V",
        (
            "Lcom/soundcloud/android/trackpage/TrackPageView$DownloadClick;->a:Lcom/soundcloud/android/foundation/domain/TrackUrn;",
            "Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/trackpage/TrackDetailsPagePresenter$toPageResultObservable$1$7$1;",
        "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
        (
            "Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton$State;",
            "Lcom/soundcloud/android/trackpage/EngagementsItem$Download;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/playlist/view/renderers/PlaylistEngagementsPlayableRenderer;",
        "a(Landroid/view/View;Lcom/soundcloud/android/playlist/view/PlaylistDetailsInputs;Lcom/soundcloud/android/playlists/PlaylistDetailsMetadata;)V",
        (
            "Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton$ViewState;",
            "Lcom/soundcloud/android/ui/components/buttons/DownloadActionButton$State;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/features/library/LibraryLinksViewHolder;",
        "bindItem(Ljava/lang/Object;)V",
        (
            "LibraryLinksViewHolder;->a:Lcom/soundcloud/android/ui/components/actionlists/ActionListItem;",
            "LibraryLinksViewHolder;->b:Lcom/soundcloud/android/ui/components/actionlists/ActionListItem;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/features/bottomsheet/playlist/c;",
        "invoke()Ljava/lang/Object;",
        (
            "PlaylistMenuItem$Download;->e:Lcom/soundcloud/android/foundation/actions/models/DownloadParams$Add;",
            "PlaylistMenuItem$Downloaded;->e:Lcom/soundcloud/android/foundation/actions/models/DownloadParams$Remove;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/features/bottomsheet/playlist/PlaylistBottomSheetViewModel$playlistLoader$1$3;",
        "a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        (
            "PlaylistItem;->getPlaylistUrn()Lcom/soundcloud/android/foundation/domain/PlaylistUrn;",
            "PlaylistItem;->getPermalinkUrl()Ljava/lang/String;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/features/bottomsheet/playlist/PlaylistMenuItem$Downloaded;",
        "<init>(Lcom/soundcloud/android/foundation/actions/models/DownloadParams$Remove;)V",
        (
            "R$string;->remove_download_playlist:I",
            "R$drawable;->ic_actions_downloaded:I",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/features/bottomsheet/track/TrackMenuItem$RemoveFromDownload;",
        "<init>(Lcom/soundcloud/android/foundation/domain/TrackUrn;)V",
        (
            "R$string;->menu_remove_from_downloads:I",
            "R$drawable;->ic_actions_downloaded:I",
        ),
    ),
    Target(
        "La50/b;",
        "invoke()Ljava/lang/Object;",
        (
            "TrackMenuItem$RemoveFromDownload;->e:Lcom/soundcloud/android/foundation/domain/TrackUrn;",
            "TrackMenuItem$SelectiveDownload;->e:Lcom/soundcloud/android/foundation/domain/TrackUrn;",
            "TrackBottomSheetViewModel;->z:Ljava/lang/String;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/cast/ui/DefaultCastButtonInstaller;",
        "a(Landroidx/fragment/app/FragmentActivity;Landroid/view/Menu;I)Lcom/soundcloud/java/optional/Optional;",
        (
            "Lcom/soundcloud/java/optional/Optional;->g(Ljava/lang/Object;)Lcom/soundcloud/java/optional/Optional;",
            "Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;",
        ),
    ),
    Target(
        "Lcom/soundcloud/android/cast/ui/DefaultCastButtonInstaller;",
        "b(Lcom/soundcloud/android/cast/ui/ThemeableMediaRouteButton;)V",
        ("Landroidx/mediarouter/app/MediaRouteButton;->setDialogFactory",),
    ),
)

EXCLUDED_SOURCE_TERMS = (
    "HIDE_HOME_",
    "HIDE_TOP_UPLOAD",
    "HIDE_TOP_INBOX",
    "HIDE_TOP_NOTIFICATIONS",
    "HIDE_BOTTOM_CREATE",
    "BOTTOM_NAV_ICON_ONLY",
    "HomeSectionFilter",
    "applyBottomNavigation",
    "applyUploadVisibility",
    "applyInboxVisibility",
    "applyNotificationVisibility",
)


def build_class_index(apktool_dir: Path) -> dict[str, Path]:
    result: dict[str, Path] = {}
    class_re = re.compile(r"^\.class\s+.*?\s+(L[^;]+;)$", re.MULTILINE)
    for smali_dir in sorted(apktool_dir.glob("smali*")):
        for path in smali_dir.rglob("*.smali"):
            text = path.read_text(encoding="utf-8", errors="replace")
            match = class_re.search(text)
            if match:
                result[match.group(1)] = path
    return result


def extract_method(text: str, fragment: str) -> str | None:
    lines = text.splitlines()
    for start, line in enumerate(lines):
        if line.startswith(".method ") and fragment in line:
            for end in range(start + 1, len(lines)):
                if lines[end].startswith(".end method"):
                    return "\n".join(lines[start : end + 1])
    return None


def validate(apktool_dir: Path, repo_dir: Path) -> list[str]:
    errors: list[str] = []
    class_index = build_class_index(apktool_dir)

    for target in TARGETS:
        path = class_index.get(target.descriptor)
        if path is None:
            errors.append(f"Missing class: {target.descriptor}")
            continue
        text = path.read_text(encoding="utf-8", errors="replace")
        method = extract_method(text, target.method_fragment)
        if method is None:
            errors.append(f"Missing method: {target.descriptor}->{target.method_fragment}")
            continue
        for anchor in target.anchors:
            if anchor not in method:
                errors.append(
                    f"Missing anchor in {target.descriptor}->{target.method_fragment}: {anchor}"
                )

    private_roots = (
        repo_dir / "patches/src/main/kotlin/psylos",
        repo_dir / "extensions/soundcloud/src/main/java/psylos",
    )
    for root in private_roots:
        for path in root.rglob("*"):
            if not path.is_file():
                continue
            text = path.read_text(encoding="utf-8", errors="replace")
            for term in EXCLUDED_SOURCE_TERMS:
                if term in text:
                    errors.append(f"Excluded workflow term {term!r} found in {path}")

    constants = (
        repo_dir
        / "patches/src/main/kotlin/hoodles/morphe/patches/soundcloud/shared/Constants.kt"
    ).read_text(encoding="utf-8")
    if constants.count('packageName = "com.soundcloud.android"') != 1:
        errors.append("SoundCloud package compatibility is missing or duplicated")

    return errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("apktool_dir", type=Path)
    parser.add_argument(
        "--repo",
        type=Path,
        default=Path(__file__).resolve().parents[1],
    )
    args = parser.parse_args()

    errors = validate(args.apktool_dir.resolve(), args.repo.resolve())
    if errors:
        print("Validation failed:", file=sys.stderr)
        for error in errors:
            print(f"- {error}", file=sys.stderr)
        return 1

    print(f"Validated {len(TARGETS)} SoundCloud method fingerprints and hook anchors.")
    print("Validated SoundCloud-only compatibility and absence of excluded UI workflows.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
