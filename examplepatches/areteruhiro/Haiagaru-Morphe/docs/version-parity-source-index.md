# 版別処理の索引（自動抽出）

2026-11-02更新。191/226/242の版名とv191/v226/v242条件（コメントを含む）の参照索引です。名前の違いを吸収するbindingも含み、未対応機能の一覧や全項目の端末検証完了を意味しません。機能ごとの判断はversion-parity-20261101.mdを参照。

57ファイル、412参照行。

| ファイル | 参照行 |
| --- | --- |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/BrowsingHistory.java` | 132, 133 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/DeleteReadThreads.java` | 329, 330, 337, 338 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/Haiagaru.java` | 341, 503, 504, 508, 858, 859, 866, 895, 900, 1174, 1652, 1968, 2008, 3729, 3730, 3983, 3984, 3985, 4001, 4239, 4682, 4683, 5262, 5263, 5264, 5278, 5511, 5512, 5514, 5630, 5631 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/HiddenDroppedThreads.java` | 28 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/HomeSelectionBar.java` | 18 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/ImgurWebUpload.java` | 38, 39 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/LegacyAutoReload.java` | 27 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/MediaViewerNavigation.java` | 296, 297, 298, 299, 300 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/NativeNgStore.java` | 36, 37, 38 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/NativeThreadContext.java` | 9, 11, 22 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/NativeToolTabs.java` | 155, 162, 164, 176, 178, 195, 201, 202, 203, 205, 212, 213, 214, 241, 289, 290, 291, 292, 293, 294, 295, 329, 334, 339 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/NativeUploadHistory.java` | 90, 91, 94, 98, 106, 257, 258, 264, 285, 286, 287, 301, 302 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/NgManagement.java` | 21 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/PopularReplies.java` | 116, 121 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/PostedThreadCountValue.java` | 23 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/ProgrammableNgController.java` | 597, 599 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/QuickFilterToolbar.java` | 33, 34, 36, 52, 59, 125, 163, 166, 191, 193, 195 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/ResponseMenuSettings.java` | 48 |
| `extensions/chmate/src/main/java/app/morphe/extension/chmate/StringReplacement.java` | 34, 35 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/BeAutoLogoutPatch.kt` | 19 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/BoardCookiesPatch.kt` | 18 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/BrowsingHistoryPatch.kt` | 12, 27, 28, 51 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/CachedWacchoiSearchPatch.kt` | 16, 17, 28, 29, 38, 39, 52, 53 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/DirectBodySelectionPatch.kt` | 13, 14, 15, 77 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/EdgeReporterDisplayPatch.kt` | 13, 14, 15, 19 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ExternalBoardAuthPatch.kt` | 120 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ExternalBoardEditorPatch.kt` | 17 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ExtraQuickFiltersPatch.kt` | 16, 17, 18 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/FavoriteThreadsPatch.kt` | 13, 15, 16 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/GifViewerPatch.kt` | 25, 26, 30, 52, 67, 76, 78, 79 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/GlobalTitleSearchPatch.kt` | 11, 12, 13, 22, 23 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/HaiagaruPatch.kt` | 52, 53, 54, 80, 81, 82, 111, 195, 215, 216, 219, 221, 230, 231, 233, 266, 307, 335, 336, 338, 343, 344, 346, 359, 510, 514, 518, 636, 660, 701, 734, 789, 850, 851, 895, 896, 901, 914, 915, 917, 922, 932, 1055, 1124, 1128, 1130, 1177, 1179, 1203, 1230, 1232, 1260, 1278, 1287, 1315, 1316, 1317, 1341, 1405, 1406, 1436, 1437, 1458, 1487, 1488, 1490, 1493, 1496, 1497, 1514, 1563, 1571, 1586, 1591, 1596, 1633, 1683, 1687, 1688, 1689, 1704, 1781, 1825, 1845, 1917, 1953, 1958, 1963, 1975, 2269, 2272, 2273, 2625, 2628, 2630, 2651, 2666, 2680, 2683, 2710, 2735, 2811, 2845, 2846, 2848, 2851, 2978, 2982, 3025, 3033, 3126, 3127, 3133, 3150, 3180, 3213, 3214, 3216, 3220, 3279, 3302, 3304, 3363, 3472, 3501, 3502, 3503, 3506, 3526, 3527, 3867, 3868, 3870, 3900, 4082, 4784, 4809, 6120, 6121, 6122, 6197, 6901, 6906, 6907, 6908, 6972, 8210, 8252, 8293, 8296, 8297, 8299, 8340, 8349, 8366, 8368, 8389, 8390, 8392 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/HiddenNgUnreadPatch.kt` | 13, 14, 15, 38 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/HomeRefreshKeywordsPatch.kt` | 14 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ImgurWebUploadPatch.kt` | 22, 23, 24, 33, 34, 36 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeDrawDatesPatch.kt` | 10 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeImageClosePatch.kt` | 14 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeReaderUiPatch.kt` | 17, 36, 37, 38, 49, 67, 71, 106 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeToolTabsPatch.kt` | 20, 21, 22 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeUiThemePatch.kt` | 16, 17, 19 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeUpdatePolicyPatch.kt` | 23, 36, 45 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/NativeUploadHistoryPatch.kt` | 17, 36, 37, 38, 41, 51, 52, 64 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/PatrolImagesPatch.kt` | 19, 20, 21, 24, 59, 60 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/PatrolIntervalPatch.kt` | 20, 21, 22 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/PopularRepliesPatch.kt` | 34, 35, 50, 66, 79, 92 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/PosterHighlightPatch.kt` | 13, 14, 16, 32, 33, 34, 62 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/PosterIdChainNgPatch.kt` | 20, 21, 23, 89, 90, 91 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ProgrammableNgPatch.kt` | 17, 75, 128, 132, 136 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ReadingPositionPatch.kt` | 8 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/RelatedThreadsPatch.kt` | 9, 10, 11 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/StringReplacementPatch.kt` | 16, 17, 19 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ThreadArchiveOrderPatch.kt` | 16, 17, 18, 26, 27, 28, 34, 35, 36 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ThreadKeywordOrderPatch.kt` | 13 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ThreadRefreshCachePatch.kt` | 14, 15, 16 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ThumbnailRebindPatch.kt` | 18 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/VideoViewerPatch.kt` | 53, 54, 55 |
| `patches/src/main/kotlin/app/morphe/patches/chmate/ViewingUserAgentPatch.kt` | 18, 19, 20, 26, 27 |
