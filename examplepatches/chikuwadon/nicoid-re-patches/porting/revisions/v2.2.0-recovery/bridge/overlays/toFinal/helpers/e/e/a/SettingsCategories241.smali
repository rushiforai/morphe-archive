.class public final Le/e/a/SettingsCategories241;
.super Ljava/lang/Object;
.source "SettingsCategories241.java"


# static fields
.field private static final CATEGORIES:[[Ljava/lang/String;

.field private static final ITEMS:[[Ljava/lang/String;

.field private static final KEY_ALIASES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final PREFIX:Ljava/lang/String; = "nicoid_group_205_"

.field private static final TAG:Ljava/lang/String; = "nicoid-settings241"


# direct methods
.method static constructor <clinit>()V
    .registers 43

    .line 29
    const-string v0, "General"

    const-string v1, "\u4e00\u822c"

    const-string v2, "\u5168\u822c"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v3

    .line 30
    const-string v0, "Account"

    const-string v1, "\u5e33\u865f"

    const-string v2, "\u30a2\u30ab\u30a6\u30f3\u30c8"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    .line 31
    const-string v0, "Language"

    const-string/jumbo v1, "\u8a9e\u8a00"

    const-string/jumbo v2, "\u8a00\u8a9e"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    .line 32
    const-string v0, "Theme and colors"

    const-string v1, "\u4e3b\u984c\u8207\u914d\u8272"

    const-string v2, "\u30c6\u30fc\u30de\u30fb\u914d\u8272"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v6

    .line 33
    const-string v0, "Display"

    const-string/jumbo v1, "\u756b\u9762\u986f\u793a"

    const-string/jumbo v2, "\u753b\u9762\u8868\u793a"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v7

    .line 34
    const-string v0, "Tabs"

    const-string v1, "\u5206\u9801"

    const-string v2, "\u30bf\u30d6"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v8

    .line 35
    const-string v0, "Video lists and menus"

    const-string/jumbo v1, "\u5f71\u7247\u6e05\u55ae\u8207\u9078\u55ae"

    const-string v2, "\u52d5\u753b\u4e00\u89a7\u30fb\u30e1\u30cb\u30e5\u30fc"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v9

    .line 36
    const-string v0, "Playback"

    const-string/jumbo v1, "\u64ad\u653e"

    const-string v2, "\u518d\u751f"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v10

    .line 37
    const-string v0, "Playback actions"

    const-string/jumbo v1, "\u64ad\u653e\u884c\u70ba"

    const-string v2, "\u518d\u751f\u6642\u306e\u52d5\u4f5c"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v11

    .line 38
    const-string v0, "Player controls"

    const-string/jumbo v1, "\u64ad\u653e\u5668\u64cd\u4f5c"

    const-string v2, "\u30d7\u30ec\u30fc\u30e4\u30fc\u64cd\u4f5c"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v12

    .line 39
    const-string v0, "Gestures"

    const-string/jumbo v1, "\u624b\u52e2"

    const-string v2, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v13

    .line 40
    const-string v0, "Comments"

    const-string/jumbo v1, "\u7559\u8a00"

    const-string v14, "\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v14, v0, v1}, [Ljava/lang/String;

    move-result-object v14

    .line 41
    const-string v0, "NG and filters"

    const-string v1, "\u5c01\u9396\u8207\u904e\u6ffe"

    const-string v15, "NG\u30fb\u30d5\u30a3\u30eb\u30bf\u30fc"

    filled-new-array {v15, v0, v1}, [Ljava/lang/String;

    move-result-object v15

    .line 42
    const-string v0, "Cache and storage"

    const-string/jumbo v1, "\u5feb\u53d6\u8207\u5132\u5b58"

    move-object/from16 v16, v3

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30fb\u4fdd\u5b58"

    filled-new-array {v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 43
    const-string v1, "Google Cast"

    filled-new-array {v1, v1, v1}, [Ljava/lang/String;

    move-result-object v17

    .line 44
    const-string v1, "Debugging"

    const-string v3, "\u5075\u932f"

    move-object/from16 v18, v0

    const-string v0, "\u30c7\u30d0\u30c3\u30b0"

    filled-new-array {v0, v1, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 45
    const-string v1, "Settings backup"

    const-string/jumbo v3, "\u8a2d\u5b9a\u5099\u4efd"

    move-object/from16 v19, v0

    const-string/jumbo v0, "\u8a2d\u5b9a\u306e\u30d0\u30c3\u30af\u30a2\u30c3\u30d7"

    filled-new-array {v0, v1, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 46
    const-string v1, "About nicoid"

    const-string/jumbo v3, "\u95dc\u65bcnicoid"

    move-object/from16 v20, v0

    const-string v0, "nicoid\u306b\u3064\u3044\u3066"

    filled-new-array {v0, v1, v3}, [Ljava/lang/String;

    move-result-object v0

    move-object/from16 v3, v16

    move-object/from16 v16, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v0

    filled-new-array/range {v3 .. v20}, [[Ljava/lang/String;

    move-result-object v0

    .line 28
    invoke-static {v0}, Le/e/a/SettingsCategories241;->appendLiveCategory([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    .line 49
    const-string/jumbo v0, "\u672c\u4f53\u306e\u8996\u8074\u5c65\u6b74\u306e\u4fdd\u5b58\u6570"

    const-string v1, "\u30a2\u30d7\u30ea\u7d42\u4e86\u6642\u306e\u78ba\u8a8d"

    const-string/jumbo v3, "\u8d77\u52d5\u6642\u306e\u753b\u9762"

    filled-new-array {v3, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    .line 50
    const-string v0, "\u30ed\u30b0\u30a4\u30f3"

    const-string v1, "\u30ed\u30b0\u30a2\u30a6\u30c8"

    const-string v5, "\u30ed\u30b0\u30a4\u30f3\u305b\u305a\u306b\u4f7f\u7528"

    filled-new-array {v5, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    .line 51
    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e"

    const-string v1, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e"

    filled-new-array {v1, v0}, [Ljava/lang/String;

    move-result-object v6

    .line 52
    const-string v0, "\u30c6\u30fc\u30de"

    const-string v7, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc"

    move-object v8, v7

    filled-new-array {v0, v8}, [Ljava/lang/String;

    move-result-object v7

    .line 53
    const-string v9, "\u30b9\u30c6\u30fc\u30bf\u30b9\u30d0\u30fc\u975e\u8868\u793a"

    const-string/jumbo v10, "\u901a\u5e38\u753b\u9762\u306e\u5411\u304d"

    const-string v11, "\u518d\u751f\u753b\u9762\u306e\u5411\u304d"

    filled-new-array {v10, v11, v9}, [Ljava/lang/String;

    move-result-object v9

    .line 54
    const-string/jumbo v12, "\u8907\u6570\u30bf\u30d6\u3092\u4f7f\u7528\u3059\u308b"

    const-string v13, "\u30a2\u30d7\u30ea\u30d0\u30fc\u3068\u30bf\u30d6\u30d0\u30fc\u306e\u914d\u7f6e"

    const-string v14, "\u30bf\u30d6\u30d0\u30fc\u306e\u30dc\u30bf\u30f3\u8868\u793a"

    const-string v15, "\u30bf\u30d6\u5207\u308a\u66ff\u3048\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3"

    move-object/from16 v22, v1

    const-string v1, "\u30bf\u30d6\u306e\u30b9\u30af\u30ed\u30fc\u30eb\u4f4d\u7f6e\u3092\u5fa9\u5143"

    filled-new-array {v12, v13, v14, v15, v1}, [Ljava/lang/String;

    move-result-object v14

    .line 55
    const-string v28, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30b7\u30e7\u30fc\u30c8\u3092\u8868\u793a"

    const-string v29, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30cb\u30b3\u751f\u3092\u8868\u793a"

    const-string/jumbo v23, "\u691c\u7d22\u30b5\u30b8\u30a7\u30b9\u30c8"

    const-string v24, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306b\u8996\u8074\u9032\u6357\u3092\u8868\u793a"

    const-string v25, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306e\u89d2\u4e38\u8868\u793a"

    const-string v26, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3"

    const-string v27, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee"

    filled-new-array/range {v23 .. v29}, [Ljava/lang/String;

    move-result-object v16

    .line 56
    const-string v31, "\u30aa\u30fc\u30c7\u30a3\u30aa\u30d5\u30a9\u30fc\u30ab\u30b9"

    const-string v32, "\u30a2\u30f3\u30d3\u30a8\u30f3\u30c8\u30e2\u30fc\u30c9"

    const-string v23, "\u518d\u751f\u30e2\u30fc\u30c9"

    const-string/jumbo v24, "\u753b\u8cea"

    const-string v25, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u753b\u8cea"

    const-string v26, "\u5148\u884c\u518d\u751f"

    const-string v27, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    const-string/jumbo v28, "\u9577\u62bc\u3057\u4e2d\u306e\u518d\u751f\u901f\u5ea6"

    const-string v29, "\u518d\u751f\u4f4d\u7f6e\u306e\u4fdd\u5b58"

    const-string/jumbo v30, "\u753b\u9762OFF\u6642\u3082\u97f3\u58f0\u3092\u518d\u751f"

    filled-new-array/range {v23 .. v32}, [Ljava/lang/String;

    move-result-object v17

    .line 57
    const-string v27, "\u30a2\u30d7\u30ea\u5fa9\u5e30\u6642\u306e\u52d5\u4f5c"

    const-string v28, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    const-string v23, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    const-string v24, "\u30ea\u30f3\u30af\u6642\u306e\u52d5\u4f5c"

    const-string v25, "\u30ea\u30f3\u30af\u304b\u3089\u8d77\u52d5\u3057\u305f\u5834\u5408\u306e\u623b\u308b\u52d5\u4f5c"

    const-string v26, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    filled-new-array/range {v23 .. v28}, [Ljava/lang/String;

    move-result-object v18

    .line 58
    const-string v29, "\u30b7\u30f3\u30b0\u30eb\u30bf\u30c3\u30d7\u306e\u64cd\u4f5c\u90e8\u8868\u793a\u9818\u57df"

    const-string v30, "\u30b3\u30e1\u30f3\u30c8\u306e\u76db\u308a\u4e0a\u304c\u308a"

    const-string v23, "\u52d5\u753b\u518d\u751f\u753b\u9762\u306e\u521d\u671f\u30d1\u30cd\u30eb"

    const-string/jumbo v24, "\u64cd\u4f5c\u90e8\u306e\u5e38\u6642\u8868\u793a"

    const-string/jumbo v25, "\u64cd\u4f5c\u30dc\u30bf\u30f3\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    const-string v26, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u306e\u52d5\u753b\u60c5\u5831\u30dc\u30bf\u30f3\u306e\u4f4d\u7f6e"

    const-string v27, "\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u3067\u30b7\u30fc\u30af"

    const-string v28, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3067\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u30b7\u30fc\u30af"

    filled-new-array/range {v23 .. v30}, [Ljava/lang/String;

    move-result-object v19

    .line 59
    const-string v27, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7"

    const-string v28, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u4e2d\u306b\u64cd\u4f5c\u90e8\u3092\u8868\u793a\u3057\u306a\u3044"

    const-string v23, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc"

    const-string v24, "\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u8abf\u6574"

    const-string v25, "\u30b9\u30ef\u30a4\u30d7\u3067\u8f1d\u5ea6\u8abf\u6574"

    const-string v26, "\u5de6\u53f3\u30b9\u30ef\u30a4\u30d7\u3067\u30b7\u30fc\u30af"

    filled-new-array/range {v23 .. v28}, [Ljava/lang/String;

    move-result-object v20

    move-object/from16 v21, v4

    .line 60
    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u3092\u8868\u793a\u3057\u306a\u3044"

    move-object/from16 v23, v5

    const-string/jumbo v5, "\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8"

    move-object/from16 v24, v6

    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u8a2d\u5b9a"

    move-object/from16 v25, v1

    const-string v1, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570"

    filled-new-array {v6, v1, v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/SettingsCategories241;->appendLength([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 61
    const-string v5, "NG\u30b3\u30e1\u30f3\u30c8\u30ea\u30b9\u30c8"

    const-string v6, "\u5171\u6709NG\u30ec\u30d9\u30eb"

    move-object/from16 v26, v1

    const-string v1, "\u30b3\u30f3\u30c6\u30f3\u30c4\u30d5\u30a3\u30eb\u30bf\u30fc"

    filled-new-array {v5, v6, v1}, [Ljava/lang/String;

    move-result-object v6

    .line 62
    const-string v31, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u5168\u3066\u524a\u9664\u3059\u308b"

    const-string/jumbo v32, "\u65e7\u4fdd\u5b58\u5148\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    const-string v27, "\u30ad\u30e3\u30c3\u30b7\u30e5\u5bb9\u91cf"

    const-string v28, "\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148"

    const-string v29, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u307f\u3092\u4f7f\u7528\u3057\u518d\u751f"

    const-string v30, "\u52d5\u753b\u30fb\u97f3\u58f0\u306e\u4fdd\u5b58\u5148\u30d5\u30a9\u30eb\u30c0"

    filled-new-array/range {v27 .. v32}, [Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Le/e/a/TemporaryCache221;->categoryItems([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v27

    move-object/from16 v28, v2

    .line 63
    const-string/jumbo v2, "\u63a5\u7d9a"

    move-object/from16 v29, v0

    const-string/jumbo v0, "\u63a5\u7d9a\u89e3\u9664"

    move-object/from16 v30, v4

    const-string v4, "Cast\u306e\u753b\u8cea\u56fa\u5b9a"

    move-object/from16 v31, v1

    const-string v1, "Cast\u518d\u751f\u6642\u30b3\u30e1\u30f3\u30c8\u3092\u6e1b\u3089\u3059"

    filled-new-array {v2, v0, v4, v1}, [Ljava/lang/String;

    move-result-object v4

    move-object/from16 v32, v1

    .line 64
    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    move-object/from16 v33, v13

    move-object/from16 v13, v19

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v19

    move-object/from16 v34, v4

    .line 65
    const-string/jumbo v4, "\u8a2d\u5b9a\u3092\u30a8\u30af\u30b9\u30dd\u30fc\u30c8"

    move-object/from16 v35, v5

    const-string/jumbo v5, "\u8a2d\u5b9a\u3092\u30a4\u30f3\u30dd\u30fc\u30c8"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    .line 66
    const-string v5, "Version.6.49"

    move-object/from16 v36, v4

    const-string v4, "\u30d1\u30c3\u30c1\u30d0\u30fc\u30b8\u30e7\u30f3"

    move-object/from16 v37, v6

    const-string v6, "\u30e9\u30a4\u30bb\u30f3\u30b9"

    filled-new-array {v6, v5, v4}, [Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, v21

    move-object/from16 v21, v4

    move-object v4, v5

    move-object/from16 v38, v1

    move-object/from16 v39, v10

    move-object/from16 v40, v11

    move-object v1, v12

    move-object/from16 v42, v15

    move-object/from16 v10, v16

    move-object/from16 v11, v17

    move-object/from16 v12, v18

    move-object/from16 v5, v23

    move-object/from16 v6, v24

    move-object/from16 v17, v27

    move-object/from16 v15, v30

    move-object/from16 v41, v33

    move-object/from16 v18, v34

    move-object/from16 v16, v37

    move-object/from16 v24, v0

    move-object/from16 v23, v8

    move-object v8, v9

    move-object v9, v14

    move-object/from16 v14, v20

    move-object/from16 v0, v35

    move-object/from16 v20, v36

    filled-new-array/range {v4 .. v21}, [[Ljava/lang/String;

    move-result-object v4

    .line 48
    invoke-static {v4}, Le/e/a/SettingsCategories241;->appendLiveItems([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v4

    sput-object v4, Le/e/a/SettingsCategories241;->ITEMS:[[Ljava/lang/String;

    .line 68
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Le/e/a/SettingsCategories241;->KEY_ALIASES:Ljava/util/Map;

    .line 70
    const-string v5, "startup_screen"

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v3, "multiple_video_tabs"

    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    const-string v1, "search_suggestions_enabled"

    const-string/jumbo v3, "\u691c\u7d22\u30b5\u30b8\u30a7\u30b9\u30c8"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string v1, "show_shorts_menu"

    const-string v3, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30b7\u30e7\u30fc\u30c8\u3092\u8868\u793a"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v1, "double_tap_seek_seconds"

    const-string v3, "\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u3067\u30b7\u30fc\u30af"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    const-string v1, "popup_double_tap_seek"

    const-string v3, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3067\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u30b7\u30fc\u30af"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v1, "gesture_horizontal_seek"

    const-string v3, "\u5de6\u53f3\u30b9\u30ef\u30a4\u30d7\u3067\u30b7\u30fc\u30af"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const-string v1, "gesture_vertical_options"

    const-string v3, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string v1, "videolist_tap"

    const-string v3, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    const-string v1, "intent_type"

    const-string v3, "\u30ea\u30f3\u30af\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    const-string v1, "app_switch_playback"

    const-string v3, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    const-string v1, "nicoid_app_resume_playback"

    const-string v3, "\u30a2\u30d7\u30ea\u5fa9\u5e30\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    const-string v1, "back_playback"

    const-string v3, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    const-string v1, "nicoid_initial_player_panel"

    const-string v3, "\u52d5\u753b\u518d\u751f\u753b\u9762\u306e\u521d\u671f\u30d1\u30cd\u30eb"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    const-string v1, "nicoid_ng_comments"

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "nicoid_scrolling_comment_max_chars"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u6587\u5b57\u6570\u5236\u9650"

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v0, "nicoid_filter_list"

    move-object/from16 v1, v31

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    const-string v0, "google_cast_connect"

    invoke-interface {v4, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string v0, "google_cast_disconnect"

    move-object/from16 v1, v24

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v0, "comment_cast_min"

    move-object/from16 v1, v32

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v0, "video_menu_visible_items"

    const-string v1, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string v0, "app_theme"

    move-object/from16 v3, v29

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v0, "custom_palette"

    move-object/from16 v8, v23

    invoke-interface {v4, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v0, "custom_palette_enabled"

    invoke-interface {v4, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v0, "list_gestures_enabled"

    move-object/from16 v3, v28

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v0, "nicoid_restore_tab_scroll"

    move-object/from16 v3, v25

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v0, "tab_swipe_animation"

    move-object/from16 v3, v42

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const-string v0, "tab_switch_animation"

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string v0, "tab_animation_enabled"

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const-string v0, "show_watch_progress"

    const-string v3, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306b\u8996\u8074\u9032\u6357\u3092\u8868\u793a"

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    const-string v0, "main_rotation"

    move-object/from16 v3, v39

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string v0, "player_rotation"

    move-object/from16 v5, v40

    invoke-interface {v4, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v0, "display_mode"

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    const-string v0, "app_lang"

    move-object/from16 v3, v22

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    const-string v0, "video_menu_options"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    const-string v0, "video_info_follow_button"

    const-string v1, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const-string v0, "multiple_video_tabs_at_bottom"

    move-object/from16 v1, v41

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v0, "nicoid_app_tab_layout"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    const-string v0, "google_cast"

    invoke-interface {v4, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v0, "comment_fetch_limit"

    move-object/from16 v1, v26

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string v0, "play_mode"

    const-string v1, "\u518d\u751f\u30e2\u30fc\u30c9"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string v0, "quality_mode"

    const-string/jumbo v1, "\u753b\u8cea"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v0, "mobile_quality_mode"

    const-string v1, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u753b\u8cea"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v0, "default_playback_speed"

    const-string v1, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const-string v0, "nicoid_share_debug"

    move-object/from16 v1, v38

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    const-string v0, "nicoid_external_back_playback"

    const-string v1, "\u30ea\u30f3\u30af\u304b\u3089\u8d77\u52d5\u3057\u305f\u5834\u5408\u306e\u623b\u308b\u52d5\u4f5c"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string v0, "mp4_tree_uri"

    const-string v1, "\u52d5\u753b\u30fb\u97f3\u58f0\u306e\u4fdd\u5b58\u5148\u30d5\u30a9\u30eb\u30c0"

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendLength([Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    array-length v0, p0

    add-int/lit8 v1, v0, 0x1

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    const-string v1, "\u30b3\u30e1\u30f3\u30c8\u306e\u6587\u5b57\u6570\u5236\u9650"

    aput-object v1, p0, v0

    return-object p0
.end method

.method private static appendLiveCategory([[Ljava/lang/String;)[[Ljava/lang/String;
    .registers 4

    const-string v0, "\u30cb\u30b3\u751f"

    const-string v1, "Niconico Live"

    const-string v2, "Niconico \u76f4\u64ad"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/SettingsCategories241;->appendRow([[Ljava/lang/String;[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static appendLiveItems([[Ljava/lang/String;)[[Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/SettingsCategories241;->appendRow([[Ljava/lang/String;[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static appendRow([[Ljava/lang/String;[Ljava/lang/String;)[[Ljava/lang/String;
    .registers 4

    array-length v0, p0

    add-int/lit8 v1, v0, 0x1

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[Ljava/lang/String;

    aput-object p1, p0, v0

    return-object p0
.end method

.method public static apply(Landroid/preference/PreferenceActivity;)V
    .registers 21

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackDisplayOptions;->installPreferences(Landroid/preference/PreferenceActivity;)V

    move-object/from16 v0, p0

    .line 242
    const-string v1, "nicoid-settings241"

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_11

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_11

    .line 243
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "app_lang"

    const-string v4, "0"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 244
    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    if-eqz v2, :cond_11

    .line 247
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 248
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 249
    new-instance v5, Ljava/util/IdentityHashMap;

    invoke-direct {v5}, Ljava/util/IdentityHashMap;-><init>()V

    const/4 v7, 0x0

    .line 251
    :goto_0
    invoke-virtual {v2}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v8

    if-lt v7, v8, :cond_c

    .line 265
    sget-object v7, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    array-length v8, v7

    new-array v8, v8, [Landroid/preference/PreferenceCategory;

    .line 266
    array-length v9, v7

    new-array v10, v9, [I

    .line 267
    array-length v7, v7

    new-array v7, v7, [I

    .line 268
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    const/4 v12, 0x0

    .line 269
    :goto_1
    sget-object v13, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    array-length v13, v13

    if-lt v12, v13, :cond_b

    .line 271
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v12, 0x0

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v14, " / "

    if-nez v13, :cond_3

    .line 311
    :try_start_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_4
    if-lt v6, v9, :cond_0

    .line 320
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "categorized="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", release settings=78, extra/unclassified="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", categories="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    array-length v2, v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 320
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    invoke-static {v0}, Le/e/a/SettingsValue251;->install(Landroid/preference/PreferenceActivity;)V

    .line 323
    invoke-static {v0}, Le/e/a/SettingsLabels252;->install(Landroid/preference/PreferenceActivity;)V

    .line 324
    invoke-static {v0}, Le/e/a/AppResume253;->install(Landroid/preference/PreferenceActivity;)V

    invoke-static {v0}, Le/e/a/ResumeModes272;->reparent(Landroid/preference/PreferenceActivity;)V

    const-string v2, "nicoid_group_205_19"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v0, v2}, Le/e/a/LiveSettings;->install(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    return-void

    .line 319
    :cond_0
    aget v3, v10, v6

    add-int/2addr v2, v3

    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 311
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/preference/PreferenceCategory;

    .line 312
    invoke-virtual {v5}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v2, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_3

    .line 314
    :cond_2
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v7

    add-int/lit16 v7, v7, 0x2710

    invoke-virtual {v5, v7}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    .line 315
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Original category still populated: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/preference/PreferenceCategory;->getKey()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/preference/PreferenceCategory;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 271
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/preference/Preference;

    .line 274
    invoke-static {v13}, Le/e/a/SettingsCategories241;->isRedundantSleep(Landroid/preference/Preference;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 275
    invoke-static {v2, v13}, Le/e/a/SettingsCategories241;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v14

    if-eqz v14, :cond_4

    .line 276
    invoke-virtual {v14, v13}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 277
    :cond_4
    const-string v13, "Removed redundant sleep-playback preference from settings"

    invoke-static {v1, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 280
    :cond_5
    invoke-static {v13}, Le/e/a/SettingsCategories241;->locate(Landroid/preference/Preference;)[I

    move-result-object v15

    if-nez v15, :cond_7

    add-int/lit8 v12, v12, 0x1

    .line 283
    invoke-virtual {v5, v13}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/preference/PreferenceCategory;

    if-nez v15, :cond_6

    .line 285
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v6, "Unclassified root preference left unchanged: "

    invoke-direct {v15, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_6
    const/16 v16, 0x0

    .line 288
    invoke-static {v15}, Le/e/a/SettingsCategories241;->fallbackCategory(Landroid/preference/PreferenceCategory;)I

    move-result v6

    move-object/from16 v17, v3

    .line 289
    aget v3, v7, v6

    add-int/lit8 v18, v3, 0x1

    aput v18, v7, v6

    add-int/lit16 v3, v3, 0x3e8

    filled-new-array {v6, v3}, [I

    move-result-object v3

    move-object/from16 v18, v3

    .line 290
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v19, v7

    const-string v7, "Unclassified preference preserved in category "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 291
    const-string v6, ": "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " (from "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Landroid/preference/PreferenceCategory;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 290
    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v15, v18

    goto :goto_5

    :cond_7
    move-object/from16 v17, v3

    move-object/from16 v19, v7

    const/16 v16, 0x0

    .line 293
    :goto_5
    invoke-static {v2, v13}, Le/e/a/SettingsCategories241;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v3

    if-eqz v3, :cond_a

    const/4 v6, 0x1

    .line 297
    aget v7, v15, v6

    if-ltz v7, :cond_8

    sget-object v14, Le/e/a/SettingsCategories241;->ITEMS:[[Ljava/lang/String;

    aget v18, v15, v16

    aget-object v14, v14, v18

    move/from16 v18, v6

    array-length v6, v14

    if-ge v7, v6, :cond_9

    .line 298
    aget-object v6, v14, v7

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9

    .line 299
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_9

    invoke-virtual {v13, v6}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_6

    :cond_8
    move/from16 v18, v6

    .line 301
    :cond_9
    :goto_6
    aget v6, v15, v16

    aget-object v6, v8, v6

    .line 304
    invoke-virtual {v3, v13}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 305
    aget v3, v15, v18

    invoke-virtual {v13, v3}, Landroid/preference/Preference;->setOrder(I)V

    .line 306
    invoke-virtual {v6, v13}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 307
    aget v3, v15, v16

    aget v6, v10, v3

    add-int/lit8 v6, v6, 0x1

    aput v6, v10, v3

    .line 308
    new-instance v3, Ljava/lang/StringBuilder;

    aget v6, v15, v16

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, ":"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v6, v15, v18

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 309
    invoke-interface {v11, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Multiple settings map to "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    move-object/from16 v3, v17

    move-object/from16 v7, v19

    goto/16 :goto_2

    :cond_b
    move-object/from16 v19, v7

    .line 269
    invoke-static {v0, v2, v12}, Le/e/a/SettingsCategories241;->category(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceScreen;I)Landroid/preference/PreferenceCategory;

    move-result-object v6

    aput-object v6, v8, v12

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v7, v19

    goto/16 :goto_1

    :cond_c
    const/16 v16, 0x0

    .line 252
    invoke-virtual {v2, v7}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v6

    .line 253
    instance-of v8, v6, Landroid/preference/PreferenceCategory;

    if-eqz v8, :cond_f

    .line 254
    check-cast v6, Landroid/preference/PreferenceCategory;

    .line 255
    invoke-virtual {v6}, Landroid/preference/PreferenceCategory;->getKey()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_d

    invoke-virtual {v6}, Landroid/preference/PreferenceCategory;->getKey()Ljava/lang/String;

    move-result-object v8

    const-string v9, "nicoid_group_205_"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_e

    :cond_d
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e
    move/from16 v8, v16

    .line 256
    :goto_7
    invoke-virtual {v6}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v9

    if-ge v8, v9, :cond_10

    .line 257
    invoke-virtual {v6, v8}, Landroid/preference/PreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v9

    .line 258
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    invoke-virtual {v5, v9, v6}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 262
    :cond_f
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_10
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    :catch_0
    move-exception v0

    .line 326
    const-string v2, "Category migration failed (settings values remain unchanged)"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_11
    return-void
.end method

.method private static category(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceScreen;I)Landroid/preference/PreferenceCategory;
    .registers 8

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "nicoid_group_205_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v1, p2, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 201
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 202
    sget-object v2, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    aget-object v2, v2, p2

    const/4 v3, 0x0

    .line 203
    aget-object v2, v2, v3

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 204
    instance-of v4, v1, Landroid/preference/PreferenceCategory;

    if-eqz v4, :cond_0

    .line 206
    check-cast v1, Landroid/preference/PreferenceCategory;

    .line 207
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 208
    invoke-static {p2}, Le/e/a/LiveSettings;->categoryOrder(I)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    .line 209
    invoke-virtual {v1, v3}, Landroid/preference/PreferenceCategory;->setOrderingAsAdded(Z)V

    return-object v1

    :cond_0
    if-nez v1, :cond_1

    .line 213
    new-instance v1, Landroid/preference/PreferenceCategory;

    invoke-direct {v1, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 214
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    .line 215
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 216
    invoke-static {p2}, Le/e/a/LiveSettings;->categoryOrder(I)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    .line 217
    invoke-virtual {v1, v3}, Landroid/preference/PreferenceCategory;->setOrderingAsAdded(Z)V

    .line 218
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    return-object v1

    .line 212
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Category key collision "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static fallbackCategory(Landroid/preference/PreferenceCategory;)I
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 223
    :cond_0
    invoke-virtual {p0}, Landroid/preference/PreferenceCategory;->getKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x11

    if-eqz v1, :cond_1

    .line 224
    const-string v4, "nicoid_group_205_"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 226
    :try_start_0
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    sub-int/2addr v1, v2

    if-ltz v1, :cond_1

    .line 227
    sget-object v4, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    array-length v4, v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-ge v1, v4, :cond_1

    return v1

    .line 230
    :catch_0
    :cond_1
    invoke-virtual {p0}, Landroid/preference/PreferenceCategory;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 232
    const-string v1, "debug"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "\u30c7\u30d0\u30c3\u30b0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "\u5075\u932f"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 233
    const-string v1, "cache"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "\u30ad\u30e3\u30c3\u30b7\u30e5"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string/jumbo v1, "\u5feb\u53d6"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 234
    const-string v1, "backup"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "\u30d0\u30c3\u30af\u30a2\u30c3\u30d7"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "\u5099\u4efd"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 235
    const-string v1, "googlecast"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 p0, 0xe

    return p0

    .line 236
    :cond_2
    const-string v1, "account"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "\u30a2\u30ab\u30a6\u30f3\u30c8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "\u5e33\u865f"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 237
    const-string v1, "about"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "nicoid\u306b\u3064\u3044\u3066"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string/jumbo v1, "\u95dc\u65bc"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 238
    const-string v1, "player"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "\u30d7\u30ec\u30fc\u30e4\u30fc"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "\u64ad\u653e\u5668"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    return v0

    :cond_3
    const/4 p0, 0x7

    return p0

    :cond_4
    return v3

    :cond_5
    return v2

    :cond_6
    const/16 p0, 0x10

    return p0

    :cond_7
    const/16 p0, 0xd

    return p0

    :cond_8
    const/16 p0, 0xf

    return p0
.end method

.method private static isRedundantSleep(Landroid/preference/Preference;)Z
    .registers 3

    if-eqz p0, :cond_0

    .line 169
    const-string v0, "nicoid_keep_audio_screen_off"

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 170
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\u30b9\u30ea\u30fc\u30d7\u518d\u751f"

    invoke-static {p0, v0}, Le/e/a/SettingsCategories241;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static locate(Landroid/preference/Preference;)[I
    .registers 10

    .line 173
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/TemporaryCache221;->category(Ljava/lang/String;)[I

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v1

    :cond_0
    const-string v1, "nicoid_app_resume_popup"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x8

    const/4 v2, 0x7

    filled-new-array {v1, v2}, [I

    move-result-object v1

    return-object v1

    :cond_1
    const-string v1, "nicoid_scrolling_comment_max_chars"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0xb

    const/4 v2, 0x5

    filled-new-array {v1, v2}, [I

    move-result-object v1

    return-object v1

    :cond_2
    invoke-static {v0}, Le/e/a/PlaybackDisplayOptions;->category(Ljava/lang/String;)[I

    move-result-object v1

    if-eqz v1, :cond_3

    return-object v1

    :cond_3
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    if-nez v1, :cond_4

    const-string p0, ""

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    .line 175
    :goto_0
    const-string v1, "nicoid_storage_diagnostic"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_5

    const/16 p0, 0xf

    filled-new-array {p0, v2}, [I

    move-result-object p0

    return-object p0

    :cond_5
    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v3, v1

    goto :goto_1

    .line 176
    :cond_6
    sget-object v3, Le/e/a/SettingsCategories241;->KEY_ALIASES:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 177
    :goto_1
    invoke-static {p0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const/4 v4, 0x0

    move v5, v4

    .line 178
    :goto_2
    sget-object v6, Le/e/a/SettingsCategories241;->ITEMS:[[Ljava/lang/String;

    array-length v6, v6

    if-lt v5, v6, :cond_9

    if-eqz v0, :cond_7

    .line 184
    const-string v3, "nicoid_external_back_playback"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 p0, 0x8

    const/4 v0, 0x2

    filled-new-array {p0, v0}, [I

    move-result-object p0

    return-object p0

    .line 185
    :cond_7
    const-string v0, "Version 6.49"

    invoke-static {v0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/16 p0, 0x11

    filled-new-array {p0, v2}, [I

    move-result-object p0

    return-object p0

    :cond_8
    return-object v1

    :cond_9
    move v6, v4

    .line 178
    :goto_3
    sget-object v7, Le/e/a/SettingsCategories241;->ITEMS:[[Ljava/lang/String;

    aget-object v7, v7, v5

    array-length v8, v7

    if-lt v6, v8, :cond_a

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 179
    :cond_a
    aget-object v7, v7, v6

    if-eqz v3, :cond_b

    .line 180
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    filled-new-array {v5, v6}, [I

    move-result-object p0

    return-object p0

    .line 181
    :cond_b
    invoke-static {p0, v7}, Le/e/a/SettingsCategories241;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    filled-new-array {v5, v6}, [I

    move-result-object p0

    return-object p0

    :cond_c
    add-int/lit8 v6, v6, 0x1

    goto :goto_3
.end method

.method private static matches(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 161
    invoke-static {p1}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 163
    :cond_0
    sget-object v0, Ljava/util/Locale;->JAPANESE:Ljava/util/Locale;

    invoke-static {p1, v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 164
    :cond_1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {p1, v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 165
    :cond_2
    sget-object v0, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-static {p1, v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    .line 166
    :cond_3
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static normalized(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 5

    if-nez p0, :cond_0

    .line 149
    const-string p0, ""

    return-object p0

    .line 150
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    .line 152
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 158
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 153
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 154
    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v2}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 155
    const-string v3, ":\uff1a\u30fb-\u2010\u2011\u2013\u2014"

    invoke-virtual {v3, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_2

    .line 156
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    const/4 v0, 0x0

    .line 189
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 190
    :cond_0
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    if-ne v1, p1, :cond_1

    return-object p0

    .line 192
    :cond_1
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_2

    .line 193
    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/SettingsCategories241;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static updateLanguage(Landroid/preference/PreferenceActivity;)V
    .registers 10

    if-eqz p0, :cond_4

    .line 118
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p0}, Le/e/a/TemporaryCache221;->refreshLabels(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/NgCommentSettings;->refreshLength(Landroid/preference/PreferenceActivity;)V

    const/4 v0, 0x0

    move v1, v0

    .line 121
    :goto_0
    sget-object v2, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    array-length v3, v2

    if-lt v1, v3, :cond_2

    .line 130
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    if-eqz p0, :cond_4

    move v1, v0

    .line 131
    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 132
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 133
    instance-of v3, v2, Landroid/preference/PreferenceCategory;

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 134
    invoke-virtual {v2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x11

    const/4 v5, 0x2

    .line 135
    filled-new-array {v5, v4}, [I

    move-result-object v4

    move v6, v0

    :goto_2
    if-ge v6, v5, :cond_1

    aget v7, v4, v6

    .line 136
    sget-object v8, Le/e/a/SettingsCategories241;->CATEGORIES:[[Ljava/lang/String;

    aget-object v7, v8, v7

    .line 137
    aget-object v8, v7, v0

    invoke-static {v8}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    const/4 v8, 0x1

    .line 138
    aget-object v8, v7, v8

    invoke-static {v8}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 139
    aget-object v8, v7, v5

    invoke-static {v8}, Le/e/a/SettingsCategories241;->normalized(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 140
    :cond_0
    aget-object v3, v7, v0

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 122
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "nicoid_group_205_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 123
    instance-of v5, v3, Landroid/preference/PreferenceCategory;

    if-eqz v5, :cond_3

    .line 124
    aget-object v1, v2, v1

    .line 125
    aget-object v1, v1, v0

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    :cond_3
    move v1, v4

    goto/16 :goto_0

    :cond_4
    return-void
.end method
