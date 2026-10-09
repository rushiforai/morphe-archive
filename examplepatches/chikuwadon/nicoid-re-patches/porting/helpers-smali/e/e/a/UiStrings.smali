.class public final Le/e/a/UiStrings;
.super Ljava/lang/Object;
.source "UiStrings.java"


# static fields
.field private static final JAPANESE_ALIASES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final JAPANESE_LOOKUP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TEXT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile selectedLanguage:I


# direct methods
.method static constructor <clinit>()V
    .registers 25

    .line 9
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    .line 13
    const/4 v0, -0x1

    sput v0, Le/e/a/UiStrings;->selectedLanguage:I

    .line 15
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Bold comments"

    const-string v2, "\u7c97\u9ad4\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u3092\u592a\u5b57\u306b\u3059\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Applies on the next playback"

    const-string v2, "\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\u3055\u308c\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "I will change the language of the entire application."

    const-string v2, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "External memory (SD card)"

    const-string v2, "\u5916\u90e8\u30e1\u30e2\u30ea\uff08SD\u30ab\u30fc\u30c9\uff09"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "None (view all)"

    const-string v2, "\u6307\u5b9a\u306a\u3057\uff08\u3059\u3079\u3066\u8868\u793a\uff09"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "Are you sure you want to delete all the cache?"

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u3059\u3079\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "I set the comment drawing frame rate limit."

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u306e\u4e0a\u9650\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "I will change the display method suitable for each tablet, smartphone"

    const-string v2, "\u30bf\u30d6\u30ec\u30c3\u30c8\u3084\u30b9\u30de\u30fc\u30c8\u30d5\u30a9\u30f3\u306b\u9069\u3057\u305f\u8868\u793a\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "I will change the method of playing videos (streaming / cache)"

    const-string v2, "\u52d5\u753b\u306e\u518d\u751f\u65b9\u6cd5\uff08\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\uff0f\u30ad\u30e3\u30c3\u30b7\u30e5\uff09\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "I will change the language of the comment and video information. (The default is subject to the language of the entire application.)"

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3067\u304d\u307e\u3059\uff08\u30c7\u30d5\u30a9\u30eb\u30c8\u306f\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u306b\u5f93\u3044\u307e\u3059\uff09\u3002"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "And what to do when you tap the video list. (Item other than that you set will be displayed by tapping the triangle in the bottom right-hand corner.)"

    const-string v2, "\u52d5\u753b\u30ea\u30b9\u30c8\u3092\u30bf\u30c3\u30d7\u3057\u305f\u3068\u304d\u306e\u52d5\u4f5c\u3092\u8a2d\u5b9a\u3057\u307e\u3059\uff08\u8a2d\u5b9a\u4ee5\u5916\u306e\u9805\u76ee\u306f\u53f3\u4e0b\u306e\u4e09\u89d2\u3092\u30bf\u30c3\u30d7\u3059\u308b\u3068\u8868\u793a\u3055\u308c\u307e\u3059\uff09\u3002"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "Video List of cached (Viewable offline)"

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\uff08\u30aa\u30d5\u30e9\u30a4\u30f3\u8996\u8074\u53ef\u80fd\uff09"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "Keywords video, tag search"

    const-string v2, "\u52d5\u753b\u306e\u30ad\u30fc\u30ef\u30fc\u30c9\u3001\u30bf\u30b0\u691c\u7d22"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "\u8a00\u8a9e"

    const-string v2, "Language"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    const-string v1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    const-string v3, "Pop-up playback"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, " comments. "

    const-string v4, " \u5247\u7559\u8a00\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4ef6\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Settings"

    const-string v4, "\u8a2d\u5b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Standard"

    const-string v5, "\u6a19\u6e96"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Automatic"

    const-string v6, "\u81ea\u52d5"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Speed"

    const-string v7, "\u901f\u5ea6"

    filled-new-array {v1, v7}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "\u00d7"

    const-string v8, "\u500d"

    filled-new-array {v1, v8}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Minimum"

    const-string v9, "\u6700\u5c0f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Small"

    const-string v10, "\u5c0f"

    filled-new-array {v1, v10}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Large"

    const-string v11, "\u5927"

    filled-new-array {v1, v11}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Maximum"

    const-string v12, "\u6700\u5927"

    filled-new-array {v1, v12}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Cooking"

    const-string v13, "\u6599\u7406"

    filled-new-array {v1, v13}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Nature"

    const-string v14, "\u81ea\u7136"

    filled-new-array {v1, v14}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Animals"

    const-string v15, "\u52d5\u7269"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Use without signing in"

    move-object/from16 v16, v15

    const-string v15, "\u4e0d\u767b\u5165\u4f7f\u7528"

    move-object/from16 v17, v14

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v14, "Playback mode"

    move-object/from16 v18, v1

    const-string v1, "\u64ad\u653e\u6a21\u5f0f"

    move-object/from16 v19, v15

    filled-new-array {v14, v1}, [Ljava/lang/String;

    move-result-object v15

    invoke-interface {v0, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v15, "Settings saved"

    move-object/from16 v20, v1

    const-string v1, "\u5df2\u5132\u5b58\u8a2d\u5b9a"

    filled-new-array {v15, v1}, [Ljava/lang/String;

    move-result-object v15

    invoke-interface {v0, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v15, "\u8a9e\u8a00"

    move-object/from16 v21, v1

    filled-new-array {v2, v15}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "\u61f8\u6d6e\u8996\u7a97\u64ad\u653e"

    move-object/from16 v22, v14

    filled-new-array {v3, v1}, [Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v3, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v14, "Signed in successfully"

    move-object/from16 v23, v13

    const-string v13, "\u767b\u5165\u6210\u529f"

    filled-new-array {v14, v13}, [Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v14, "Reset to default"

    move-object/from16 v24, v13

    const-string v13, "\u9084\u539f\u9810\u8a2d\u503c"

    filled-new-array {v14, v13}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306b\u623b\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Play using cached files only"

    const-string v14, "\u50c5\u4f7f\u7528\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u307f\u3092\u4f7f\u7528\u3057\u518d\u751f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Always"

    const-string v14, "\u4e00\u5f8b\u4f7f\u7528"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u5e38\u306b\u4f7f\u7528"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "On mobile data only"

    const-string v14, "\u50c5\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u307f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Never"

    const-string v14, "\u4e0d\u4f7f\u7528"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4f7f\u7528\u3057\u306a\u3044"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Quality on mobile data"

    const-string v14, "\u884c\u52d5\u7db2\u8def\u756b\u8cea"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u753b\u8cea"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Quality"

    const-string v14, "\u756b\u8cea"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u54c1\u8cea"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Comments to load"

    const-string v14, "\u7559\u8a00\u8f09\u5165\u6578\u91cf"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Target: "

    const-string v14, "\u76ee\u6a19\uff1a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u53d6\u5f97\u6570\uff1a"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Applies on the next playback. The number of additional comments depends on the video and sign-in status."

    const-string v14, "\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548\u3002\u53ef\u984d\u5916\u8f09\u5165\u7684\u7559\u8a00\u6578\u91cf\u4f9d\u5f71\u7247\u53ca\u767b\u5165\u72c0\u614b\u800c\u7570\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6b21\u56de\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\u3055\u308c\u307e\u3059\u3002\u8ffd\u52a0\u53d6\u5f97\u6570\u306f\u52d5\u753b\u3084\u30ed\u30b0\u30a4\u30f3\u72b6\u614b\u306b\u3088\u308a\u7570\u306a\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save debug log"

    const-string v14, "\u5132\u5b58\u5075\u932f\u7d00\u9304"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save playback and network diagnostics to Downloads"

    const-string v14, "\u5c07\u64ad\u653e\u8207\u7db2\u8def\u8a3a\u65b7\u8a18\u9304\u5132\u5b58\u81f3 Downloads"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save diagnostic logs, including playback status and network errors, to the Downloads folder for troubleshooting."

    const-string v14, "\u5c07\u64ad\u653e\u72c0\u614b\u8207\u7db2\u8def\u932f\u8aa4\u7b49\u8a3a\u65b7\u8a18\u9304\u5132\u5b58\u81f3 Downloads \u8cc7\u6599\u593e\uff0c\u4ee5\u4fbf\u6392\u67e5\u554f\u984c\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u72b6\u6cc1\u3084\u901a\u4fe1\u30a8\u30e9\u30fc\u306a\u3069\u306e\u8a3a\u65ad\u30ed\u30b0\u3092 Download \u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58\u3057\u307e\u3059\u3002\u4e0d\u5177\u5408\u5831\u544a\u6642\u306b\u5229\u7528\u3067\u304d\u307e\u3059\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Nicoru count"

    const-string v14, "Nico \u8b9a\u6578\u91cf\u9806\u5e8f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30cb\u30b3\u308b\u6570\u9806"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Comments to load"

    const-string v14, "\u7559\u8a00\u8f09\u5165\u6578\u91cf"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Standard (no additional loading)"

    const-string v14, "\u6a19\u6e96\uff08\u4e0d\u984d\u5916\u8f09\u5165\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6a19\u6e96\uff08\u8ffd\u52a0\u53d6\u5f97\u306a\u3057\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Applies on the next playback. Additional comments depend on the video and sign-in status."

    const-string v14, "\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548\u3002\u53ef\u984d\u5916\u8f09\u5165\u7684\u7559\u8a00\u6578\u91cf\u4f9d\u5f71\u7247\u53ca\u767b\u5165\u72c0\u614b\u800c\u7570\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\u3002\u8ffd\u52a0\u53d6\u5f97\u3067\u304d\u308b\u4ef6\u6570\u306f\u52d5\u753b\u3084\u30ed\u30b0\u30a4\u30f3\u72b6\u614b\u306b\u3088\u3063\u3066\u7570\u306a\u308a\u307e\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Follow playback position"

    const-string v14, "\u81ea\u52d5\u8ddf\u96a8\u64ad\u653e\u4f4d\u7f6e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u4f4d\u7f6e\u306b\u81ea\u52d5\u8ffd\u5f93"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Playback time"

    const-string v14, "\u64ad\u653e\u6642\u9593\u9806\u5e8f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u6642\u9593\u9806"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Posting time"

    const-string v14, "\u767c\u4f48\u6642\u9593\u9806\u5e8f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6295\u7a3f\u6642\u9593\u9806"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Comment shadow style"

    const-string v14, "\u5f48\u5e55\u9670\u5f71\u6a23\u5f0f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u7a2e\u985e"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Comment shadow size"

    const-string v14, "\u5f48\u5e55\u9670\u5f71\u5927\u5c0f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u5927\u304d\u3055"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Maximum comment rows"

    const-string v14, "\u5f48\u5e55\u6700\u5927\u884c\u6578"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30e1\u30f3\u30c8\u306e\u6700\u5927\u884c\u6570"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Comment display duration"

    const-string v14, "\u5f48\u5e55\u986f\u793a\u6642\u9593"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30e1\u30f3\u30c8\u306e\u8868\u793a\u6642\u9593"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Use the default quality setting"

    const-string v14, "\u4f7f\u7528\u9810\u8a2d\u756b\u8cea\u8a2d\u5b9a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u901a\u5e38\u306e\u753b\u8cea\u8a2d\u5b9a\u306b\u5f93\u3046"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Rankings"

    const-string v14, "\u6392\u884c\u699c"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Legacy comment path limit"

    const-string v14, "\u820a\u7559\u8a00\u8def\u5f91\u8f09\u5165\u4e0a\u9650"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u65e7\u30b3\u30e1\u30f3\u30c8\u7d4c\u8def\u306e\u53d6\u5f97\u4e0a\u9650"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Legacy comment path only; applies on the next playback"

    const-string v14, "\u50c5\u9069\u7528\u65bc\u820a\u7559\u8a00\u8def\u5f91\uff0c\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u65e7\u30b3\u30e1\u30f3\u30c8\u7d4c\u8def\u306b\u306e\u307f\u9069\u7528\u3002\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Automatic (based on video length)"

    const-string v14, "\u81ea\u52d5\uff08\u4f9d\u5f71\u7247\u9577\u5ea6\u8abf\u6574\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u81ea\u52d5\uff08\u52d5\u753b\u306e\u9577\u3055\u306b\u5fdc\u3058\u3066\u5909\u66f4\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, " comments"

    const-string v14, " \u5247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4ef6"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save the debug log to Downloads?"

    const-string v14, "\u8981\u5c07\u5075\u932f\u7d00\u9304\u5132\u5b58\u81f3 Downloads \u55ce\uff1f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save"

    const-string v14, "\u5132\u5b58"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4fdd\u5b58"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Search suggestions"

    const-string v14, "\u641c\u5c0b\u5efa\u8b70"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u691c\u7d22\u30b5\u30b8\u30a7\u30b9\u30c8"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Show suggestions while entering a search"

    const-string v14, "\u8f38\u5165\u641c\u5c0b\u6642\u986f\u793a\u5efa\u8b70"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u691c\u7d22\u5165\u529b\u6642\u306b\u5019\u88dc\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Reduce displayed comments and frame rate for stable casting."

    const-string v14, "\u6e1b\u5c11\u986f\u793a\u7684\u5f48\u5e55\u6578\u91cf\u4e26\u9650\u5236\u5f71\u683c\u7387\uff0c\u4ee5\u7a69\u5b9a\u6295\u653e\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u52d5\u4f5c\u3092\u5b89\u5b9a\u3055\u305b\u308b\u305f\u3081\u8868\u793a\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u91cf\u3092\u5c11\u306a\u304f\u3057\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3092\u4f4e\u304f\u5236\u9650\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save debug log"

    const-string v14, "\u5132\u5b58\u5075\u932f\u8a18\u9304"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Save playback and network logs to Downloads"

    const-string v14, "\u5c07\u64ad\u653e\u8207\u7db2\u8def\u8a18\u9304\u5132\u5b58\u81f3 Downloads"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Saved to Downloads"

    const-string v14, "\u5df2\u5132\u5b58\u81f3 Downloads"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "Download\u306b\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not save the log"

    const-string v14, "\u7121\u6cd5\u5132\u5b58\u8a18\u9304"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30ed\u30b0\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Theme"

    const-string v14, "\u4e3b\u984c"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c6\u30fc\u30de"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Light mode"

    const-string v14, "\u6dfa\u8272\u6a21\u5f0f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30e9\u30a4\u30c8\u30e2\u30fc\u30c9"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Dark mode"

    const-string v14, "\u6df1\u8272\u6a21\u5f0f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Change playback speed"

    const-string v14, "\u8b8a\u66f4\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u901f\u5ea6\u5909\u66f4"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Swipe to adjust volume"

    const-string v14, "\u6ed1\u52d5\u8abf\u6574\u97f3\u91cf"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u8abf\u6574"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Swipe vertically to adjust volume. When brightness gestures are also enabled, use the right side of the video."

    const-string v14, "\u4e0a\u4e0b\u6ed1\u52d5\u8abf\u6574\u97f3\u91cf\u3002\u82e5\u540c\u6642\u555f\u7528\u4eae\u5ea6\u8abf\u6574\uff0c\u8acb\u5728\u5f71\u7247\u53f3\u5074\u64cd\u4f5c\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u3092\u8abf\u6574\u3057\u307e\u3059\u3002\u8f1d\u5ea6\u8abf\u6574\u3082ON\u306e\u5834\u5408\u306f\u52d5\u753b\u306e\u53f3\u5074\u3067\u64cd\u4f5c\u3057\u307e\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Swipe to adjust brightness"

    const-string v14, "\u6ed1\u52d5\u8abf\u6574\u4eae\u5ea6"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b9\u30ef\u30a4\u30d7\u3067\u8f1d\u5ea6\u8abf\u6574"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Swipe vertically to adjust video brightness. When volume gestures are also enabled, use the left side of the video."

    const-string v14, "\u4e0a\u4e0b\u6ed1\u52d5\u8abf\u6574\u64ad\u653e\u756b\u9762\u7684\u4eae\u5ea6\u3002\u82e5\u540c\u6642\u555f\u7528\u97f3\u91cf\u8abf\u6574\uff0c\u8acb\u5728\u5f71\u7247\u5de6\u5074\u64cd\u4f5c\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u518d\u751f\u753b\u9762\u306e\u8f1d\u5ea6\u3092\u8abf\u6574\u3057\u307e\u3059\u3002\u97f3\u91cf\u8abf\u6574\u3082ON\u306e\u5834\u5408\u306f\u52d5\u753b\u306e\u5de6\u5074\u3067\u64cd\u4f5c\u3057\u307e\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Cache copy completed"

    const-string v14, "\u5feb\u53d6\u8907\u88fd\u5b8c\u6210"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u30b3\u30d4\u30fc\u304c\u5b8c\u4e86\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Copying cached videos\u2026"

    const-string v14, "\u6b63\u5728\u8907\u88fd\u5feb\u53d6\u5f71\u7247\u2026"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc\u4e2d"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Copy"

    const-string v14, "\u8907\u88fd"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30d4\u30fc"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not copy the cache. The original files have been kept."

    const-string v14, "\u7121\u6cd5\u8907\u88fd\u5feb\u53d6\u3002\u539f\u59cb\u6a94\u6848\u5df2\u4fdd\u7559\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b3\u30d4\u30fc\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u4fdd\u6301\u3055\u308c\u3066\u3044\u307e\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not open the folder picker"

    const-string v14, "\u7121\u6cd5\u958b\u555f\u8cc7\u6599\u593e\u9078\u64c7\u756b\u9762"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d5\u30a9\u30eb\u30c0\u30fc\u9078\u629e\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Copy cached videos from the previous folder. The original files will not be deleted."

    const-string v14, "\u5f9e\u5148\u524d\u7684\u5132\u5b58\u4f4d\u7f6e\u8907\u88fd\u5feb\u53d6\u5f71\u7247\u3002\u539f\u59cb\u6a94\u6848\u4e0d\u6703\u88ab\u522a\u9664\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4ee5\u524d\u306e\u4fdd\u5b58\u5148\u304b\u3089\u30b3\u30d4\u30fc\u3057\u307e\u3059\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u524a\u9664\u3057\u307e\u305b\u3093"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Cannot use this folder. Please choose another one."

    const-string v14, "\u7121\u6cd5\u4f7f\u7528\u6b64\u5132\u5b58\u4f4d\u7f6e\u3002\u8acb\u9078\u64c7\u5176\u4ed6\u8cc7\u6599\u593e\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4fdd\u5b58\u5148\u3092\u4f7f\u7528\u3067\u304d\u307e\u305b\u3093\u3002\u5225\u306e\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Later"

    const-string v14, "\u7a0d\u5f8c"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u5f8c\u3067"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Copy existing cache"

    const-string v14, "\u8907\u88fd\u73fe\u6709\u5feb\u53d6"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u65e2\u5b58\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Choose a cache folder in Settings"

    const-string v14, "\u8acb\u5728\u8a2d\u5b9a\u4e2d\u9078\u64c7\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u8a2d\u5b9a\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Casting video"

    const-string v14, "\u6b63\u5728\u6295\u653e\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30ad\u30e3\u30b9\u30c8\u518d\u751f\u4e2d\u3067\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Allow display over other apps to use pop-up playback"

    const-string v14, "\u82e5\u8981\u4f7f\u7528\u61f8\u6d6e\u8996\u7a97\u64ad\u653e\uff0c\u8acb\u5141\u8a31\u986f\u793a\u5728\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u4e0a\u5c64"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u3092\u5229\u7528\u3059\u308b\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3092\u8a31\u53ef\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Permissions"

    const-string v14, "\u6b0a\u9650"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d1\u30fc\u30df\u30c3\u30b7\u30e7\u30f3\u306e\u53d6\u5f97"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "This video uses RTMP and cannot be played"

    const-string v14, "\u6b64\u5f71\u7247\u4f7f\u7528 RTMP\uff0c\u7121\u6cd5\u64ad\u653e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u3053\u306e\u52d5\u753b\u306fRTMP\u3092\u4f7f\u7528\u3057\u3066\u3044\u308b\u70ba\u518d\u751f\u3067\u304d\u307e\u305b\u3093"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Play"

    const-string v14, "\u64ad\u653e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u3059\u308b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Playlist"

    const-string v14, "\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u30ea\u30b9\u30c8"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Gameplay videos"

    const-string v14, "\u904a\u6232\u5be6\u6cc1\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u5b9f\u6cc1\u30d7\u30ec\u30a4\u52d5\u753b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Virtual"

    const-string v14, "\u865b\u64ec"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d0\u30fc\u30c1\u30e3\u30eb"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Random"

    const-string v14, "\u96a8\u6a5f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30e9\u30f3\u30c0\u30e0"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Least popular first"

    const-string v14, "\u4eba\u6c23\u7531\u4f4e\u5230\u9ad8"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4eba\u6c17\u304c\u4f4e\u3044\u9806"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Most popular first"

    const-string v14, "\u4eba\u6c23\u7531\u9ad8\u5230\u4f4e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4eba\u6c17\u304c\u9ad8\u3044\u9806"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Default order"

    const-string v14, "\u4e0d\u6307\u5b9a\u6392\u5e8f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4e26\u3073\u9806\u6307\u5b9a\u306a\u3057"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Recommended for you"

    const-string v14, "\u70ba\u4f60\u63a8\u85a6\u7684\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u3042\u306a\u305f\u306b\u30aa\u30b9\u30b9\u30e1\u306e\u52d5\u753b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Videos recommended based on your viewing history"

    const-string v14, "\u6839\u64da\u89c0\u770b\u7d00\u9304\u63a8\u85a6\u7684\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u904e\u53bb\u306e\u8996\u8074\u60c5\u5831\u306a\u3069\u304b\u3089\u306e\u30aa\u30b9\u30b9\u30e1\u52d5\u753b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Disconnect from the device"

    const-string v14, "\u4e2d\u65b7\u8207\u88dd\u7f6e\u7684\u9023\u7dda"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u7aef\u672b\u3068\u306e\u63a5\u7d9a\u3092\u89e3\u9664"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Already added"

    const-string v14, "\u5df2\u52a0\u5165"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u65e2\u306b\u767b\u9332\u6e08\u307f\u3067\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Remove %s from favorites?"

    const-string v14, "\u8981\u5c07 %s \u5f9e\u6211\u7684\u6700\u611b\u79fb\u9664\u55ce\uff1f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "%s \u3092\u304a\u6c17\u306b\u5165\u308a\u304b\u3089\u89e3\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not follow"

    const-string v14, "\u7121\u6cd5\u8ffd\u8e64"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d5\u30a9\u30ed\u30fc\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Followed"

    const-string v14, "\u5df2\u8ffd\u8e64"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d5\u30a9\u30ed\u30fc\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Follow %s?"

    const-string v14, "\u8981\u8ffd\u8e64 %s \u55ce\uff1f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "%s \u3092\u30d5\u30a9\u30ed\u30fc\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Follow"

    const-string v14, "\u8ffd\u8e64"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d5\u30a9\u30ed\u30fc"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Following"

    const-string v14, "\u5df2\u8ffd\u8e64"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30d5\u30a9\u30ed\u30fc\u6e08\u307f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Ascending (top to bottom)"

    const-string v14, "\u905e\u589e\uff08\u7531\u4e0a\u5230\u4e0b\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6607\u9806(\u4e0a\u304b\u3089\u4e0b)"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Descending (bottom to top)"

    const-string v14, "\u905e\u6e1b\uff08\u7531\u4e0b\u5230\u4e0a\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u964d\u9806(\u4e0b\u304b\u3089\u4e0a)"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Views:<b>%s</b> Comments:<b>%s</b> Mylists:<b>%s</b> Likes:<b>%s</b>"

    const-string v14, "\u89c0\u770b:<b>%s</b> \u7559\u8a00:<b>%s</b> \u64ad\u653e\u6e05\u55ae:<b>%s</b> \u6309\u8b9a:<b>%s</b>"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f:<b>%s</b> \u30b3\u30e1:<b>%s</b> \u30de\u30a4:<b>%s</b> \u3044\u3044\u306d:<b>%s</b>"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Genre:<font color=\'#000000\'><b>%s</b></font><br>Best rank:<font color=\'#000000\'><b>%s</b></font>"

    const-string v14, "\u985e\u5225:<font color=\'#000000\'><b>%s</b></font><br>\u6700\u9ad8\u6392\u540d:<font color=\'#000000\'><b>%s</b></font>"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b8\u30e3\u30f3\u30eb:<font color=\'#000000\'><b>%s</b></font><br>\u904e\u53bb\u6700\u9ad8:<font color=\'#000000\'><b>%s</b></font>"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Category:<font color=\'#000000\'><b>%s</b></font><br>Yesterday:<font color=\'#000000\'><b>%s</b></font> (Best:<font color=\'#000000\'><b>%s</b></font>)"

    const-string v14, "\u5206\u985e:<font color=\'#000000\'><b>%s</b></font><br>\u6628\u65e5\u6392\u540d:<font color=\'#000000\'><b>%s</b></font>\uff08\u6700\u9ad8\u6392\u540d:<font color=\'#000000\'><b>%s</b></font>\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30ab\u30c6\u30b4\u30ea:<font color=\'#000000\'><b>%s</b></font><br>\u524d\u65e5\u9806\u4f4d:<font color=\'#000000\'><b>%s</b></font>(\u904e\u53bb\u6700\u9ad8:<font color=\'#000000\'><b>%s</b></font>)"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Access to media and files is required to save watch history and download cached videos.\nRestart the app to show the permission dialog again, or grant storage access under Apps \u2192 nicoid in your device settings."

    const-string v14, "\u5132\u5b58\u89c0\u770b\u7d00\u9304\u53ca\u4e0b\u8f09\u5feb\u53d6\u5f71\u7247\u9700\u8981\u5a92\u9ad4\u8207\u6a94\u6848\u5b58\u53d6\u6b0a\u9650\u3002\n\u8acb\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u4ee5\u518d\u6b21\u986f\u793a\u6b0a\u9650\u5c0d\u8a71\u6846\uff0c\u6216\u5728\u88dd\u7f6e\u8a2d\u5b9a\u7684\u300c\u61c9\u7528\u7a0b\u5f0f \u2192 nicoid\u300d\u4e2d\u6388\u4e88\u5132\u5b58\u7a7a\u9593\u5b58\u53d6\u6b0a\u9650\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u5c65\u6b74\u306e\u4fdd\u5b58\u3084\u30ad\u30e3\u30c3\u30b7\u30e5\u306a\u3069\u3092\u53d6\u5f97\u3059\u308b\u70ba\u306b\u30e1\u30c7\u30a3\u30a2\u3001\u30d5\u30a1\u30a4\u30eb\u3078\u306e\u30a2\u30af\u30bb\u30b9\u8a31\u53ef\u304c\u5fc5\u8981\u3067\u3059\u3002\n\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u518d\u5ea6\u8a31\u53ef\u30c0\u30a4\u30a2\u30ed\u30b0\u3092\u8868\u793a\u3055\u305b\u308b\u304b\u3001\u7aef\u672b\u306e\u8a2d\u5b9a\u753b\u9762\u304b\u3089\u30a2\u30d7\u30ea\u2192nicoid\u3092\u9078\u629e\u3057\u3001\u30b9\u30c8\u30ec\u30fc\u30b8\u306e\u30a2\u30af\u30bb\u30b9\u6a29\u9650\u3092\u4ed8\u4e0e\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Paid"

    const-string v14, "\u4ed8\u8cbb"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6709\u6599"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Device storage (app-specific folder)"

    const-string v14, "\u88dd\u7f6e\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u672c\u4f53\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u30fc\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "SD card (app-specific folder)"

    const-string v14, "SD \u5361\uff08\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "SD\u30ab\u30fc\u30c9\uff08\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u30fc\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Internal storage (private app data)"

    const-string v14, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u79c1\u4eba\u8cc7\u6599\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u5185\u90e8\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u975e\u516c\u958b\u9818\u57df\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Shorts"

    const-string v14, "\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Watch short videos"

    const-string v14, "\u89c0\u770b\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u8996\u8074"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Restart app"

    const-string v14, "\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Share debug log"

    const-string v14, "\u5206\u4eab\u5075\u932f\u7d00\u9304"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Other"

    const-string v14, "\u5176\u4ed6"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u305d\u306e\u4ed6"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Restart to apply settings"

    const-string v14, "\u91cd\u65b0\u555f\u52d5\u4ee5\u5957\u7528\u8a2d\u5b9a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u8a2d\u5b9a\u3092\u53cd\u6620\u3057\u3066\u6700\u521d\u304b\u3089\u958b\u304f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Settings"

    filled-new-array {v13, v4}, [Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v4, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "App settings"

    const-string v14, "\u61c9\u7528\u7a0b\u5f0f\u8a2d\u5b9a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30a2\u30d7\u30ea\u8a2d\u5b9a"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "General and playback settings"

    const-string v14, "\u4e00\u822c\u8207\u64ad\u653e\u8a2d\u5b9a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4e00\u822c\u8a2d\u5b9a\u30fb\u518d\u751f\u8a2d\u5b9a"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Show Shorts in the sidebar"

    const-string v14, "\u5728\u5074\u908a\u9078\u55ae\u986f\u793a\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30b7\u30e7\u30fc\u30c8\u3092\u8868\u793a"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Show the Shorts entry below Rankings"

    const-string v14, "\u5728\u6392\u884c\u699c\u4e0b\u65b9\u986f\u793a\u77ed\u7247\u5165\u53e3"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u4e0b\u306b\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u5165\u53e3\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Debug"

    const-string v14, "\u5075\u932f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c7\u30d0\u30c3\u30b0"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "\u8a00\u8a9e"

    filled-new-array {v2, v15}, [Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Share diagnostic logs, including playback errors, request destinations and response codes, when reporting a problem. Review the log and recipient before sharing."

    const-string v14, "\u56de\u5831\u554f\u984c\u6642\u53ef\u5206\u4eab\u8a3a\u65b7\u7d00\u9304\uff0c\u5167\u5bb9\u5305\u542b\u64ad\u653e\u932f\u8aa4\u3001\u9023\u7dda\u76ee\u6a19\u8207\u56de\u61c9\u4ee3\u78bc\u3002\u5206\u4eab\u524d\u8acb\u78ba\u8a8d\u7d00\u9304\u5167\u5bb9\u53ca\u63a5\u6536\u5c0d\u8c61\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u751f\u30a8\u30e9\u30fc\u3084\u901a\u4fe1\u5148\u3001\u5fdc\u7b54\u30b3\u30fc\u30c9\u306a\u3069\u306e\u8a3a\u65ad\u30ed\u30b0\u3092\u5171\u6709\u3057\u307e\u3059\u3002\u4e0d\u5177\u5408\u306e\u5831\u544a\u6642\u306b\u5229\u7528\u3067\u304d\u307e\u3059\u3002\u5171\u6709\u524d\u306b\u30ed\u30b0\u306e\u5185\u5bb9\u3068\u9001\u4fe1\u5148\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Choose a video to watch"

    const-string v14, "\u9078\u64c7\u60f3\u770b\u7684\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6c17\u306b\u306a\u308b\u52d5\u753b\u3092\u9078\u3093\u3067\u518d\u751f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Search short videos"

    const-string v14, "\u641c\u5c0b\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Search"

    const-string v14, "\u641c\u5c0b"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u691c\u7d22"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Loading short videos\u2026"

    const-string v14, "\u6b63\u5728\u8f09\u5165\u77ed\u7247\u2026"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u8aad\u307f\u8fbc\u3093\u3067\u3044\u307e\u3059\u2026"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Retry"

    const-string v14, "\u91cd\u8a66"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u518d\u8a66\u884c"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Return to NicoNico home"

    const-string v14, "\u8fd4\u56de Niconico \u9996\u9801"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306e\u30db\u30fc\u30e0\u306b\u623b\u308b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Return to NicoNico"

    const-string v14, "\u8fd4\u56de Niconico"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306b\u623b\u308b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Refresh short videos"

    const-string v14, "\u91cd\u65b0\u6574\u7406\u77ed\u7247\u6e05\u55ae"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u4e00\u89a7\u3092\u66f4\u65b0"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not load short videos. Check your connection and try again."

    const-string v14, "\u7121\u6cd5\u8f09\u5165\u77ed\u7247\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, " videos"

    const-string v14, " \u90e8\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, " \u672c\u306e\u52d5\u753b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "NicoNico  \u2022  "

    const-string v14, "Niconico  \u2022  "

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b  \u2022  "

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Searching short videos\u2026"

    const-string v14, "\u6b63\u5728\u641c\u5c0b\u77ed\u7247\u2026"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22\u3057\u3066\u3044\u307e\u3059\u2026"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not load search results. Check your connection and try again."

    const-string v14, "\u7121\u6cd5\u8f09\u5165\u641c\u5c0b\u7d50\u679c\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u691c\u7d22\u7d50\u679c\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "No short videos found. Try another keyword."

    const-string v14, "\u627e\u4e0d\u5230\u77ed\u7247\u3002\u8acb\u5617\u8a66\u5176\u4ed6\u95dc\u9375\u5b57\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u30ad\u30fc\u30ef\u30fc\u30c9\u3092\u5909\u3048\u3066\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Current short"

    const-string v14, "\u76ee\u524d\u7684\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u73fe\u5728\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Previous short"

    const-string v14, "\u4e0a\u4e00\u90e8\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u524d\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Short video list"

    const-string v14, "\u77ed\u7247\u6e05\u55ae"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u4e00\u89a7"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Shorts home"

    const-string v14, "\u77ed\u7247\u9996\u9801"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u306e\u30db\u30fc\u30e0"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Video details"

    const-string v14, "\u5f71\u7247\u8cc7\u8a0a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u52d5\u753b\u60c5\u5831"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Next short"

    const-string v14, "\u4e0b\u4e00\u90e8\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6b21\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Swipe up for the next video or down for the previous one"

    const-string v14, "\u5411\u4e0a\u6ed1\u52d5\u5207\u63db\u4e0b\u4e00\u90e8\uff0c\u5411\u4e0b\u6ed1\u52d5\u5207\u63db\u4e0a\u4e00\u90e8"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4e0a\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u6b21\u3001\u4e0b\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u524d\u306e\u52d5\u753b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Short videos"

    const-string v14, "\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Refresh"

    const-string v14, "\u91cd\u65b0\u6574\u7406"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u66f4\u65b0"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Close"

    const-string v14, "\u95dc\u9589"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u9589\u3058\u308b"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "This is the first video"

    const-string v14, "\u9019\u662f\u7b2c\u4e00\u90e8\u5f71\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6700\u521d\u306e\u52d5\u753b\u3067\u3059"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Could not load the list. Please try again."

    const-string v14, "\u7121\u6cd5\u8f09\u5165\u6e05\u55ae\u3002\u8acb\u518d\u8a66\u4e00\u6b21\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "No more short videos found"

    const-string v14, "\u6c92\u6709\u627e\u5230\u66f4\u591a\u77ed\u7247"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u65b0\u3057\u3044\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Refresh did not complete. Please try again."

    const-string v14, "\u91cd\u65b0\u6574\u7406\u672a\u5b8c\u6210\u3002\u8acb\u518d\u8a66\u4e00\u6b21\u3002"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u66f4\u65b0\u304c\u5b8c\u4e86\u3057\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Maximum quality (highest available resolution; varies by video)"

    const-string v14, "\u6700\u9ad8\u756b\u8cea\uff08\u6700\u9ad8\u53ef\u7528\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6700\u5927\u753b\u8cea\uff08\u6700\u5927\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "High quality (highest available resolution; varies by video)"

    const-string v14, "\u9ad8\u756b\u8cea\uff08\u6700\u9ad8\u53ef\u7528\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u9ad8\u753b\u8cea\uff08\u6700\u5927\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Standard quality (second-highest resolution; varies by video)"

    const-string v14, "\u6a19\u6e96\u756b\u8cea\uff08\u7b2c\u4e8c\u9ad8\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6a19\u6e96\u753b\u8cea\uff082\u756a\u76ee\u306e\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Low quality (third-highest resolution; varies by video)"

    const-string v14, "\u4f4e\u756b\u8cea\uff08\u7b2c\u4e09\u9ad8\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4f4e\u753b\u8cea\uff083\u756a\u76ee\u306e\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Maximum quality"

    const-string v14, "\u6700\u9ad8\u756b\u8cea"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6700\u5927\u753b\u8cea"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "High quality"

    const-string v14, "\u9ad8\u756b\u8cea"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u9ad8\u753b\u8cea"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Standard quality"

    const-string v14, "\u6a19\u6e96\u756b\u8cea"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u6a19\u6e96\u753b\u8cea"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Low quality"

    const-string v14, "\u4f4e\u756b\u8cea"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u4f4e\u753b\u8cea"

    invoke-interface {v0, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v13, "Standard"

    filled-new-array {v13, v5}, [Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v5, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Auto"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Speed"

    filled-new-array {v5, v7}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Quality"

    const-string v6, "\u756b\u8cea"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u753b\u8cea"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Loop"

    const-string v6, "\u5faa\u74b0"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30eb\u30fc\u30d7"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Playback speed"

    const-string v6, "\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u901f\u5ea6"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Cancel"

    const-string v6, "\u53d6\u6d88"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not retrieve video quality"

    const-string v6, "\u7121\u6cd5\u53d6\u5f97\u5f71\u7247\u756b\u8cea"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u753b\u8cea\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Quality: "

    const-string v6, "\u756b\u8cea\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u753b\u8cea: "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Playback speed: "

    const-string v6, "\u64ad\u653e\u901f\u5ea6\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u901f\u5ea6: "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "\u00d7"

    filled-new-array {v5, v8}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Loop playback: "

    const-string v6, "\u5faa\u74b0\u64ad\u653e\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30eb\u30fc\u30d7\u518d\u751f: "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Action failed. Please check the log."

    const-string v6, "\u64cd\u4f5c\u5931\u6557\u3002\u8acb\u67e5\u770b\u7d00\u9304\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u64cd\u4f5c\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Default playback speed"

    const-string v6, "\u9810\u8a2d\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "No change (original behavior)"

    const-string v6, "\u7dad\u6301\u539f\u672c\u7684\u884c\u70ba"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u4f55\u3082\u3057\u306a\u3044\uff08\u5f93\u6765\u306e\u52d5\u4f5c\uff09"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Background playback"

    const-string v6, "\u80cc\u666f\u64ad\u653e"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    filled-new-array {v3, v1}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "When switching apps"

    const-string v6, "\u5207\u63db\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u884c\u70ba"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "When pressing Back during playback"

    const-string v6, "\u64ad\u653e\u6642\u6309\u4e0b\u8fd4\u56de\u7684\u884c\u70ba"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Save playback position"

    const-string v6, "\u5132\u5b58\u64ad\u653e\u9032\u5ea6"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u4f4d\u7f6e\u306e\u4fdd\u5b58"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Save each video\'s playback position and resume from it next time"

    const-string v6, "\u5132\u5b58\u6bcf\u90e8\u5f71\u7247\u7684\u64ad\u653e\u9032\u5ea6\uff0c\u4e0b\u6b21\u64ad\u653e\u6642\u5f9e\u8a72\u4f4d\u7f6e\u7e7c\u7e8c"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b\u3054\u3068\u306b\u518d\u751f\u4f4d\u7f6e\u3092\u4fdd\u5b58\u3057\u3001\u6b21\u56de\u306e\u518d\u751f\u6642\u306b\u518d\u958b\u3057\u307e\u3059"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Allow display over other apps to use pop-up playback"

    const-string v6, "\u4f7f\u7528\u61f8\u6d6e\u8996\u7a97\u64ad\u653e\u9700\u8981\u5141\u8a31\u986f\u793a\u5728\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u4e0a\u5c64"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Patch version"

    const-string v6, "\u4fee\u88dc\u7a0b\u5f0f\u7248\u672c"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30d1\u30c3\u30c1\u30d0\u30fc\u30b8\u30e7\u30f3"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Use wallpaper colors on Android 12 and later"

    const-string v6, "\u5728 Android 12 \u4ee5\u4e0a\u7248\u672c\u5957\u7528\u684c\u5e03\u8272\u5f69"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Android 12\u4ee5\u964d\u306e\u58c1\u7d19\u306e\u8272\u3092\u30a2\u30d7\u30ea\u306b\u9069\u7528\u3057\u307e\u3059"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Increase the comment limit"

    const-string v6, "\u63d0\u9ad8\u7559\u8a00\u8f09\u5165\u4e0a\u9650"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570\u306e\u4e0a\u9650\u3092\u62e1\u5f35"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Load more comments for videos using the legacy format. This increases data usage and rendering load."

    const-string v6, "\u8f09\u5165\u66f4\u591a\u820a\u683c\u5f0f\u5f71\u7247\u7684\u7559\u8a00\u3002\u9019\u6703\u589e\u52a0\u7db2\u8def\u6d41\u91cf\u8207\u7e6a\u88fd\u8ca0\u64d4\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5f93\u6765\u5f62\u5f0f\u306e\u52d5\u753b\u3067\u53d6\u5f97\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u6570\u3092\u5897\u3084\u3057\u307e\u3059\u3002\u901a\u4fe1\u91cf\u3068\u63cf\u753b\u8ca0\u8377\u304c\u5897\u3048\u307e\u3059"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Comment size"

    const-string v6, "\u7559\u8a00\u5927\u5c0f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u306e\u5927\u304d\u3055"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Smallest, small, standard, large or largest (applies on the next playback)"

    const-string v6, "\u6700\u5c0f\u3001\u5c0f\u3001\u6a19\u6e96\u3001\u5927\u3001\u6700\u5927\uff08\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548\uff09"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6700\u5c0f\u30fb\u5c0f\u30fb\u6a19\u6e96\u30fb\u5927\u30fb\u6700\u5927\uff08\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\uff09"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Smallest"

    filled-new-array {v5, v9}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Small"

    filled-new-array {v5, v10}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Large"

    filled-new-array {v5, v11}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v11, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Largest"

    filled-new-array {v5, v12}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v12, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Connect"

    const-string v6, "\u9023\u7dda"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u63a5\u7d9a"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Choose a device to connect to"

    const-string v6, "\u9078\u64c7\u8981\u9023\u7dda\u7684\u88dd\u7f6e"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u63a5\u7d9a\u3059\u308b\u7aef\u672b\u3092\u9078\u629e"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Disconnect"

    const-string v6, "\u4e2d\u65b7\u9023\u7dda"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u63a5\u7d9a\u89e3\u9664"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Disconnect Google Cast"

    const-string v6, "\u4e2d\u65b7 Google Cast \u9023\u7dda"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Google Cast \u306e\u63a5\u7d9a\u3092\u89e3\u9664"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Shared storage (app-specific folder)"

    const-string v6, "\u5171\u7528\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff09"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5171\u6709\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u5c02\u7528\u9818\u57df\uff09"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Internal storage (private app folder)"

    const-string v6, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u79c1\u4eba\u8cc7\u6599\u593e\uff09"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u672c\u4f53\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u5185\u90e8\u9818\u57df\uff09"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Choose shared storage, an SD card or internal storage. Existing cached files will not be moved."

    const-string v6, "\u53ef\u9078\u64c7\u5171\u7528\u5132\u5b58\u7a7a\u9593\u3001SD \u5361\u6216\u5167\u90e8\u5132\u5b58\u7a7a\u9593\u3002\u73fe\u6709\u5feb\u53d6\u6a94\u6848\u4e0d\u6703\u79fb\u52d5\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5171\u6709\u30b9\u30c8\u30ec\u30fc\u30b8\u3001SD\u30ab\u30fc\u30c9\u3001\u672c\u4f53\u5185\u90e8\u9818\u57df\u304b\u3089\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3067\u304d\u307e\u3059\u3002\u5909\u66f4\u524d\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u79fb\u52d5\u3055\u308c\u307e\u305b\u3093"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "New from followed users"

    const-string v6, "\u8ffd\u8e64\u5c0d\u8c61\u7684\u65b0\u5f71\u7247"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30d5\u30a9\u30ed\u30fc\u65b0\u7740"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "New videos from followed users"

    const-string v6, "\u8ffd\u8e64\u5c0d\u8c61\u7684\u6700\u65b0\u5f71\u7247"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u65b0\u7740\u52d5\u753b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Selected: "

    const-string v6, "\u5df2\u9078\u53d6\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u9078\u629e\u4e2d: "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, " history entries. Delete them?"

    const-string v6, " \u7b46\u7d00\u9304\uff0c\u8981\u522a\u9664\u55ce\uff1f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u4ef6\u306e\u5c65\u6b74\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Delete"

    const-string v6, "\u522a\u9664"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u524a\u9664"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Video"

    const-string v6, "\u5f71\u7247"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Select history entries to delete"

    const-string v6, "\u9078\u53d6\u8981\u522a\u9664\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u524a\u9664\u3059\u308b\u5c65\u6b74\u3092\u9078\u629e"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Delete selected history"

    const-string v6, "\u522a\u9664\u9078\u53d6\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u9078\u629e\u3057\u305f\u5c65\u6b74\u3092\u524a\u9664"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, " items"

    const-string v6, " \u7b46"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u4ef6"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "The sign-in screen stopped responding. Restart the app and try again."

    const-string v6, "\u767b\u5165\u756b\u9762\u6c92\u6709\u56de\u61c9\u3002\u8acb\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u753b\u9762\u306e\u8868\u793a\u304c\u505c\u6b62\u3057\u307e\u3057\u305f\u3002\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not open the sign-in screen.\n"

    const-string v6, "\u7121\u6cd5\u958b\u555f\u767b\u5165\u756b\u9762\u3002\n"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f\u3002\n"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Save"

    const-string v6, "\u5132\u5b58"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u4fdd\u5b58"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Sign-in method"

    const-string v6, "\u767b\u5165\u65b9\u5f0f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u65b9\u6cd5"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Standard sign-in"

    const-string v6, "\u4e00\u822c\u767b\u5165"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u901a\u5e38\u30ed\u30b0\u30a4\u30f3"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Enter session cookie"

    const-string v6, "\u624b\u52d5\u8f38\u5165 Cookie"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Cookie\u624b\u52d5\u5165\u529b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Sign in to Niconico on another device or PC and paste the user_session cookie value from your browser. You can also enter user_session=\u2026 . Do not share your cookie with others."

    const-string v6, "\u8acb\u5728\u5176\u4ed6\u88dd\u7f6e\u6216\u96fb\u8166\u767b\u5165 Niconico\uff0c\u518d\u8cbc\u4e0a\u700f\u89bd\u5668 Cookie \u4e2d\u7684 user_session \u503c\u3002\u4e5f\u53ef\u8f38\u5165 user_session=\u2026 \u3002\u8acb\u52ff\u5c07 Cookie \u63d0\u4f9b\u7d66\u4ed6\u4eba\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5225\u306e\u7aef\u672b\u30fbPC\u3067\u30cb\u30b3\u30cb\u30b3\u306b\u30ed\u30b0\u30a4\u30f3\u3057\u3001\u30d6\u30e9\u30a6\u30b6\u306eCookie\u304b\u3089user_session\u306e\u5024\u3092\u8cbc\u308a\u4ed8\u3051\u3066\u304f\u3060\u3055\u3044\u3002user_session=\u2026 \u306e\u5f62\u5f0f\u3067\u3082\u5165\u529b\u3067\u304d\u307e\u3059\u3002Cookie\u306f\u4ed6\u306e\u4eba\u306b\u6e21\u3055\u306a\u3044\u3067\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Enter the user_session value or use the user_session=\u2026 format."

    const-string v6, "\u8acb\u8f38\u5165 user_session \u503c\uff0c\u6216\u4f7f\u7528 user_session=\u2026 \u683c\u5f0f\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "user_session\u306e\u5024\u3001\u307e\u305f\u306fuser_session=\u2026 \u306e\u5f62\u5f0f\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Cookie saved. If authentication fails, sign in again and obtain a new cookie."

    const-string v6, "\u5df2\u5132\u5b58 Cookie\u3002\u82e5\u9a57\u8b49\u5931\u6557\uff0c\u8acb\u91cd\u65b0\u767b\u5165\u4e26\u53d6\u5f97\u65b0\u7684 Cookie\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Cookie\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f\u3002\u8a8d\u8a3c\u304c\u901a\u3089\u306a\u3044\u5834\u5408\u306f\u3001\u30ed\u30b0\u30a4\u30f3\u3057\u76f4\u3057\u3066Cookie\u3092\u518d\u53d6\u5f97\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not save the cookie. Please try again."

    const-string v6, "\u7121\u6cd5\u5132\u5b58 Cookie\uff0c\u8acb\u91cd\u8a66\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Cookie\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Signed in"

    const-string v6, "\u5df2\u767b\u5165"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Nico Reports has been discontinued. Visit the official NicoNico website for new videos from followed users."

    const-string v6, "Nico Reports \u5df2\u505c\u6b62\u670d\u52d9\u3002\u8acb\u524d\u5f80 Niconico \u5b98\u65b9\u7db2\u7ad9\u67e5\u770b\u8ffd\u8e64\u5c0d\u8c61\u7684\u65b0\u5f71\u7247\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30cb\u30b3\u30ec\u30dd\u306f\u30b5\u30fc\u30d3\u30b9\u304c\u7d42\u4e86\u3057\u307e\u3057\u305f\u3002\u30d5\u30a9\u30ed\u30fc\u65b0\u7740\u306f\u30cb\u30b3\u30cb\u30b3\u516c\u5f0f\u30b5\u30a4\u30c8\u3067\u78ba\u8a8d\u3067\u304d\u307e\u3059\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Save location: "

    const-string v6, "\u5132\u5b58\u4f4d\u7f6e\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u4fdd\u5b58\u5148: "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Sign-in details saved"

    const-string v6, "\u5df2\u5132\u5b58\u767b\u5165\u8cc7\u6599"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3092\u4fdd\u5b58\u6e08\u307f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Sign out"

    const-string v6, "\u767b\u51fa"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a2\u30a6\u30c8"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not delete history. Please try again."

    const-string v6, "\u7121\u6cd5\u522a\u9664\u7d00\u9304\uff0c\u8acb\u91cd\u8a66\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5c65\u6b74\u3092\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Remove saved sign-in details and sign out?"

    const-string v6, "\u8981\u522a\u9664\u5df2\u5132\u5b58\u7684\u767b\u5165\u8cc7\u6599\u4e26\u767b\u51fa\u55ce\uff1f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3092\u524a\u9664\u3057\u3066\u30ed\u30b0\u30a2\u30a6\u30c8\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Signed out"

    const-string v6, "\u5df2\u767b\u51fa"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a2\u30a6\u30c8\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not sign out. Please try again."

    const-string v6, "\u7121\u6cd5\u767b\u51fa\uff0c\u8acb\u91cd\u8a66\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ed\u30b0\u30a2\u30a6\u30c8\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Content filter"

    const-string v6, "\u5167\u5bb9\u7be9\u9078\u5668"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30b3\u30f3\u30c6\u30f3\u30c4\u30d5\u30a3\u30eb\u30bf"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Keyword filter"

    const-string v6, "\u95dc\u9375\u5b57\u7be9\u9078\u5668"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ad\u30fc\u30ef\u30fc\u30c9\u30d5\u30a3\u30eb\u30bf"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Channel filter"

    const-string v6, "\u983b\u9053\u7be9\u9078\u5668"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30c1\u30e3\u30f3\u30cd\u30eb\u30d5\u30a3\u30eb\u30bf"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Enter uploader or channel names to hide, separated by commas or new lines. Names are matched by substring. Applies the next time a list is loaded."

    const-string v6, "\u8f38\u5165\u8981\u96b1\u85cf\u7684\u6295\u7a3f\u8005\u6216\u983b\u9053\u540d\u7a31\uff0c\u4ee5\u9017\u865f\u6216\u63db\u884c\u5206\u9694\u3002\u4ee5\u540d\u7a31\u90e8\u5206\u76f8\u7b26\u5224\u5b9a\uff0c\u4e0b\u6b21\u8f09\u5165\u6e05\u55ae\u6642\u5957\u7528\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u975e\u8868\u793a\u306b\u3059\u308b\u6295\u7a3f\u8005\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u540d\u3092\u30ab\u30f3\u30de\u307e\u305f\u306f\u6539\u884c\u3067\u533a\u5207\u3063\u3066\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002\u540d\u524d\u306e\u90e8\u5206\u4e00\u81f4\u3067\u5224\u5b9a\u3057\u307e\u3059\u3002\u6b21\u306e\u4e00\u89a7\u8aad\u307f\u8fbc\u307f\u304b\u3089\u53cd\u6620\u3055\u308c\u307e\u3059\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Enter keywords found in video titles, separated by commas or new lines. Matching videos will be hidden the next time a list is loaded."

    const-string v6, "\u8f38\u5165\u5f71\u7247\u6a19\u984c\u4e2d\u7684\u95dc\u9375\u5b57\uff0c\u4ee5\u9017\u865f\u6216\u63db\u884c\u5206\u9694\u3002\u4e0b\u6b21\u8f09\u5165\u6e05\u55ae\u6642\u6703\u96b1\u85cf\u7b26\u5408\u7684\u5f71\u7247\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b\u30bf\u30a4\u30c8\u30eb\u306b\u542b\u307e\u308c\u308b\u30ad\u30fc\u30ef\u30fc\u30c9\u3092\u30ab\u30f3\u30de\u307e\u305f\u306f\u6539\u884c\u3067\u533a\u5207\u3063\u3066\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002\u6b21\u306e\u4e00\u89a7\u8aad\u307f\u8fbc\u307f\u304b\u3089\u975e\u8868\u793a\u306b\u306a\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "<b>%s</b> <font color=\'red\'>Watched %s times</font>"

    const-string v6, "<b>%s</b> <font color=\'red\'>\u89c0\u770b %s \u6b21</font>"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "<b>%s</b> <font color=\'red\'>%s\u56de\u8996\u8074</font>"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Not signed in; no saved sign-in details"

    const-string v6, "\u672a\u767b\u5165\uff0c\u6c92\u6709\u5df2\u5132\u5b58\u7684\u767b\u5165\u8cc7\u6599"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u672a\u30ed\u30b0\u30a4\u30f3\u30fb\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u306a\u3057"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Share playback and connection diagnostics"

    const-string v6, "\u5206\u4eab\u64ad\u653e\u8207\u9023\u7dda\u8a3a\u65b7\u8cc7\u8a0a"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Video loading has stalled. Start playback again."

    const-string v6, "\u5f71\u7247\u8f09\u5165\u505c\u6eef\u3002\u8acb\u91cd\u65b0\u958b\u59cb\u64ad\u653e\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b\u306e\u8aad\u307f\u8fbc\u307f\u304c\u9032\u307f\u307e\u305b\u3093\u3002\u518d\u751f\u3092\u3084\u308a\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not retrieve video details: "

    const-string v6, "\u7121\u6cd5\u53d6\u5f97\u5f71\u7247\u8cc7\u8a0a\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093: "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not retrieve video details. Check your connection."

    const-string v6, "\u7121\u6cd5\u53d6\u5f97\u5f71\u7247\u8cc7\u8a0a\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "No supported playback format is available for this video"

    const-string v6, "\u9019\u90e8\u5f71\u7247\u6c92\u6709\u53ef\u652f\u63f4\u7684\u64ad\u653e\u683c\u5f0f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u3053\u306e\u52d5\u753b\u306b\u5bfe\u5fdc\u3059\u308b\u518d\u751f\u5f62\u5f0f\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Could not retrieve playback information. Check your connection and viewing permissions."

    const-string v6, "\u7121\u6cd5\u53d6\u5f97\u64ad\u653e\u8cc7\u8a0a\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u8207\u89c0\u770b\u6b0a\u9650\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u60c5\u5831\u306e\u53d6\u5f97\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3084\u8996\u8074\u6a29\u9650\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Views: %,d  Comments: %,d  Mylists: %,d  Likes: %,d"

    const-string v6, "\u89c0\u770b\uff1a%,d  \u7559\u8a00\uff1a%,d  \u64ad\u653e\u6e05\u55ae\uff1a%,d  \u6309\u8b9a\uff1a%,d"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f:%,d  \u30b3\u30e1\u30f3\u30c8:%,d  \u30de\u30a4\u30ea\u30b9:%,d  \u3044\u3044\u306d:%,d"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Views"

    const-string v6, "\u89c0\u770b"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u518d\u751f\u6570"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Likes"

    const-string v6, "\u6309\u8b9a"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u3044\u3044\u306d"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Mylists"

    const-string v6, "\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30de\u30a4\u30ea\u30b9"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Play video"

    const-string v6, "\u64ad\u653e\u5f71\u7247"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u52d5\u753b\u518d\u751f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Download cache"

    const-string v6, "\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Download cache"

    const-string v6, "\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u53d6\u5f97"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Close mini-game"

    const-string v6, "\u95dc\u9589\u5c0f\u904a\u6232"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30df\u30cb\u30b2\u30fc\u30e0\u3092\u9589\u3058\u308b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Bicycle Run. Tap to jump, then tap again in midair for a double jump. Avoid obstacles and gaps. Tap after game over to try again."

    const-string v6, "\u81ea\u884c\u8eca\u8dd1\u9177\u3002\u8f15\u89f8\u8df3\u8e8d\uff0c\u5728\u7a7a\u4e2d\u518d\u6b21\u8f15\u89f8\u53ef\u4e8c\u6bb5\u8df3\u3002\u907f\u958b\u969c\u7919\u8207\u7f3a\u53e3\u3002\u904a\u6232\u7d50\u675f\u5f8c\u8f15\u89f8\u91cd\u8a66\u3002"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u81ea\u8ee2\u8eca\u30e9\u30f3\u3002\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7\u3002\u969c\u5bb3\u7269\u3068\u7a74\u3092\u907f\u3051\u307e\u3059\u3002\u7d42\u4e86\u5f8c\u306f\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226\u3002"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Bicycle Run"

    const-string v6, "\u81ea\u884c\u8eca\u8dd1\u9177"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u81ea\u8ee2\u8eca\u30e9\u30f3"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Distance: "

    const-string v6, "\u8ddd\u96e2\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u8ddd\u96e2 "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, " m   Best: "

    const-string v6, " m   \u6700\u4f73\uff1a "

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, " m   \u30d9\u30b9\u30c8 "

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Tap to jump; tap again in midair"

    const-string v6, "\u8f15\u89f8\u8df3\u8e8d\uff0c\u5728\u7a7a\u4e2d\u518d\u9ede\u4e00\u6b21\u53ef\u4e8c\u6bb5\u8df3"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Game over"

    const-string v6, "\u904a\u6232\u7d50\u675f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30b2\u30fc\u30e0\u30aa\u30fc\u30d0\u30fc"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Jump over obstacles and gaps"

    const-string v6, "\u8df3\u904e\u969c\u7919\u8207\u7f3a\u53e3"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u969c\u5bb3\u7269\u3068\u7a74\u3092\u30b8\u30e3\u30f3\u30d7\u3067\u907f\u3051\u3088\u3046"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Tap to try again"

    const-string v6, "\u8f15\u89f8\u91cd\u8a66"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Tap to start"

    const-string v6, "\u8f15\u89f8\u958b\u59cb"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30bf\u30c3\u30d7\u3057\u3066\u30b9\u30bf\u30fc\u30c8"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "All categories"

    const-string v6, "\u7d9c\u5408"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u7dcf\u5408"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Gaming"

    const-string v6, "\u904a\u6232"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30b2\u30fc\u30e0"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Anime"

    const-string v6, "\u52d5\u756b"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30a2\u30cb\u30e1"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Vocaloid"

    const-string v6, "VOCALOID"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30dc\u30ab\u30ed"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Synthesized voice commentary, explanations and skits"

    const-string v6, "\u8a9e\u97f3\u5408\u6210\u5be6\u6cc1\u3001\u89e3\u8aaa\u8207\u5287\u5834"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u97f3\u58f0\u5408\u6210\u5b9f\u6cc1\u30fb\u89e3\u8aac\u30fb\u5287\u5834"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Entertainment"

    const-string v6, "\u5a1b\u6a02"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30a8\u30f3\u30bf\u30e1"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Music"

    const-string v6, "\u97f3\u6a02"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u97f3\u697d"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Singing covers"

    const-string v6, "\u7ffb\u5531"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6b4c\u3063\u3066\u307f\u305f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Dance covers"

    const-string v6, "\u7ffb\u8df3"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u8e0a\u3063\u3066\u307f\u305f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Instrumental covers"

    const-string v6, "\u6f14\u594f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6f14\u594f\u3057\u3066\u307f\u305f"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Explanations and tutorials"

    const-string v6, "\u89e3\u8aaa\u8207\u6559\u5b78"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u89e3\u8aac\u30fb\u8b1b\u5ea7"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Cooking"

    move-object/from16 v6, v23

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Travel and outdoors"

    const-string v6, "\u65c5\u904a\u8207\u6236\u5916"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u65c5\u884c\u30fb\u30a2\u30a6\u30c8\u30c9\u30a2"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Nature"

    move-object/from16 v6, v17

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Vehicles"

    const-string v6, "\u4ea4\u901a\u5de5\u5177"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u4e57\u308a\u7269"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Technology and crafts"

    const-string v6, "\u6280\u8853\u8207\u624b\u4f5c"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6280\u8853\u30fb\u5de5\u4f5c"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Society, politics and current affairs"

    const-string v6, "\u793e\u6703\u3001\u653f\u6cbb\u8207\u6642\u4e8b"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u793e\u4f1a\u30fb\u653f\u6cbb\u30fb\u6642\u4e8b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Radio"

    const-string v6, "\u5ee3\u64ad"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30e9\u30b8\u30aa"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Sports"

    const-string v6, "\u904b\u52d5"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30b9\u30dd\u30fc\u30c4"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Animals"

    move-object/from16 v6, v16

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v5, "Settings"

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Setting"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "About nicoid Re"

    const-string v5, "\u95dc\u65bc nicoid Re"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "nicoid\u306b\u3064\u3044\u3066"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "About nicoid Re"

    const-string v5, "\u95dc\u65bc nicoid Re"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "About nicoid"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "About nicoid Re"

    const-string v5, "\u95dc\u65bc nicoid Re"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u95dc\u65bcnicoid"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "App language"

    const-string v5, "\u61c9\u7528\u7a0b\u5f0f\u8a9e\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "App language"

    const-string v5, "\u61c9\u7528\u7a0b\u5f0f\u8a9e\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Language of the entire application"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "App language"

    const-string v5, "\u61c9\u7528\u7a0b\u5f0f\u8a9e\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u8a9e\u8a00\u7684\u6574\u500b\u61c9\u7528\u7a0b\u5e8f\u7684"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose the language used throughout the app"

    const-string v5, "\u9078\u64c7\u6574\u500b\u61c9\u7528\u7a0b\u5f0f\u4f7f\u7528\u7684\u8a9e\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose the language used throughout the app"

    const-string v5, "\u9078\u64c7\u6574\u500b\u61c9\u7528\u7a0b\u5f0f\u4f7f\u7528\u7684\u8a9e\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I will change the language of the entire application."

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose the language used throughout the app"

    const-string v5, "\u9078\u64c7\u6574\u500b\u61c9\u7528\u7a0b\u5f0f\u4f7f\u7528\u7684\u8a9e\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6211\u5c07\u6539\u8b8a\u6574\u500b\u61c9\u7528\u7a0b\u5e8f\u7684\u8a9e\u8a00"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "External storage (SD card)"

    const-string v5, "\u5916\u90e8\u5132\u5b58\u7a7a\u9593\uff08SD \u5361\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5916\u90e8\u30e1\u30e2\u30ea\uff08SD\u30ab\u30fc\u30c9\uff09"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "External storage (SD card)"

    const-string v5, "\u5916\u90e8\u5132\u5b58\u7a7a\u9593\uff08SD \u5361\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "External memory (SD card)"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "External storage (SD card)"

    const-string v5, "\u5916\u90e8\u5132\u5b58\u7a7a\u9593\uff08SD \u5361\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5916\u90e8\u5b58\u5132\u5668\uff08SD\u5361\uff09"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Internal storage"

    const-string v5, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u672c\u4f53\u30e1\u30e2\u30ea"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Internal storage"

    const-string v5, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Internal memory"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Internal storage"

    const-string v5, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6a5f\u8eab\u5167\u5b58"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Unlimited"

    const-string v5, "\u7121\u9650\u5236"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7121\u5236\u9650"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Unlimited"

    const-string v5, "\u7121\u9650\u5236"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Limitless"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Tablet"

    const-string v5, "\u5e73\u677f\u96fb\u8166"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30bf\u30d6\u30ec\u30c3\u30c8"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Tablet"

    const-string v5, "\u5e73\u677f\u96fb\u8166"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Tablets"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Tablet"

    const-string v5, "\u5e73\u677f\u96fb\u8166"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5e73\u677f\u96fb\u8166"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Ask every time"

    const-string v5, "\u6bcf\u6b21\u8a62\u554f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6bce\u56de\u9078\u629e\u3059\u308b"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Ask every time"

    const-string v5, "\u6bcf\u6b21\u8a62\u554f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I choose every time"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Ask every time"

    const-string v5, "\u6bcf\u6b21\u8a62\u554f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6bcf\u6b21\u9078\u64c7"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Video details"

    const-string v5, "\u5f71\u7247\u8cc7\u8a0a"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Video Info"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Video details"

    const-string v5, "\u5f71\u7247\u8cc7\u8a0a"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u52d5\u756b\u60c5\u5831"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Play video"

    const-string v5, "\u64ad\u653e\u5f71\u7247"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Video playback"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Play video"

    const-string v5, "\u64ad\u653e\u5f71\u7247"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u64ad\u653e\u52d5\u756b"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    filled-new-array {v3, v1}, [Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Popup\u64ad\u653e"

    filled-new-array {v3, v1}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "High"

    const-string v5, "\u9ad8"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5f37"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "High"

    const-string v5, "\u9ad8"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Strength"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Low"

    const-string v5, "\u4f4e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5f31"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Low"

    const-string v5, "\u4f4e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Weak"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "None (show all)"

    const-string v5, "\u7121\uff08\u986f\u793a\u5168\u90e8\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7121(\u5168\u3066\u8868\u793a)"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "None (show all)"

    const-string v5, "\u7121\uff08\u986f\u793a\u5168\u90e8\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "None (view all)"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "None (show all)"

    const-string v5, "\u7121\uff08\u986f\u793a\u5168\u90e8\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7121(\u5168\u90e8\u986f\u793a)"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Standard quality"

    const-string v5, "\u6a19\u6e96\u756b\u8cea"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Economy image quality"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Standard quality"

    const-string v5, "\u6a19\u6e96\u756b\u8cea"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7d93\u6fdf\u756b\u8cea"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Original quality"

    const-string v5, "\u539f\u59cb\u756b\u8cea"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30aa\u30ea\u30b8\u30ca\u30eb\u753b\u8cea"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Original quality"

    const-string v5, "\u539f\u59cb\u756b\u8cea"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Original image quality"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Original quality"

    const-string v5, "\u539f\u59cb\u756b\u8cea"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u539f\u59cb\u756b\u8cea"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Follow device settings"

    const-string v5, "\u4f9d\u7167\u88dd\u7f6e\u8a2d\u5b9a"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7aef\u672b\u306e\u8a2d\u5b9a\u306b\u5f93\u3046"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Follow device settings"

    const-string v5, "\u4f9d\u7167\u88dd\u7f6e\u8a2d\u5b9a"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Follow the configuration of the terminal"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Follow device settings"

    const-string v5, "\u4f9d\u7167\u88dd\u7f6e\u8a2d\u5b9a"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u4f9d\u7167\u5ba2\u6236\u7aef\u8a2d\u5b9a"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Lock to landscape"

    const-string v5, "\u56fa\u5b9a\u6a6b\u5411"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6a2a\u753b\u9762\u56fa\u5b9a"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Lock to landscape"

    const-string v5, "\u56fa\u5b9a\u6a6b\u5411"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Horizontal screen fixed"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Lock to landscape"

    const-string v5, "\u56fa\u5b9a\u6a6b\u5411"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u56fa\u5b9a\u6a6b\u5411\u756b\u9762"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Lock to portrait"

    const-string v5, "\u56fa\u5b9a\u76f4\u5411"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7e26\u753b\u9762\u56fa\u5b9a"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Lock to portrait"

    const-string v5, "\u56fa\u5b9a\u76f4\u5411"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Vertical screen fixed"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Lock to portrait"

    const-string v5, "\u56fa\u5b9a\u76f4\u5411"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u56fa\u5b9a\u7e31\u5411\u756b\u9762"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Auto-rotate using sensors"

    const-string v5, "\u4f9d\u611f\u61c9\u5668\u81ea\u52d5\u65cb\u8f49"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30bb\u30f3\u30b5\u30fc\u306b\u5f93\u3046"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Auto-rotate using sensors"

    const-string v5, "\u4f9d\u611f\u61c9\u5668\u81ea\u52d5\u65cb\u8f49"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I follow the sensor"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Auto-rotate using sensors"

    const-string v5, "\u4f9d\u611f\u61c9\u5668\u81ea\u52d5\u65cb\u8f49"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u4f9d\u7167\u611f\u61c9\u5668"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Always"

    const-string v5, "\u4e00\u5f8b\u4f7f\u7528"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5e38\u306b\u4f7f\u7528"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "On mobile data only"

    const-string v5, "\u50c5\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u307f"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Never"

    const-string v5, "\u4e0d\u4f7f\u7528"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u4f7f\u7528\u3057\u306a\u3044"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Soft shadow"

    const-string v5, "\u67d4\u548c\u9670\u5f71"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u307c\u304b\u3057"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Outline"

    const-string v5, "\u63cf\u908a"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7e01\u53d6\u308a"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Clear all cache"

    const-string v5, "\u6e05\u9664\u6240\u6709\u5feb\u53d6"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u5168\u3066\u524a\u9664\u3059\u308b"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Clear all cache"

    const-string v5, "\u6e05\u9664\u6240\u6709\u5feb\u53d6"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I delete all the cache"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Clear all cache"

    const-string v5, "\u6e05\u9664\u6240\u6709\u5feb\u53d6"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6e05\u9664\u5feb\u53d6"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Clear all cached files?"

    const-string v5, "\u8981\u6e05\u9664\u6240\u6709\u5feb\u53d6\u6a94\u6848\u55ce\uff1f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u5168\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Clear all cached files?"

    const-string v5, "\u8981\u6e05\u9664\u6240\u6709\u5feb\u53d6\u6a94\u6848\u55ce\uff1f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Are you sure you want to delete all the cache?"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Clear all cached files?"

    const-string v5, "\u8981\u6e05\u9664\u6240\u6709\u5feb\u53d6\u6a94\u6848\u55ce\uff1f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u8981\u6e05\u9664\u5168\u90e8\u5feb\u53d6\u55ce\uff1f"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Cache location"

    const-string v5, "\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Cache location"

    const-string v5, "\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Cache destination"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Cache location"

    const-string v5, "\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7de9\u5b58\u76ee\u7684\u5730"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Hide cached videos from galleries"

    const-string v5, "\u5728\u76f8\u7c3f\u4e2d\u96b1\u85cf\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30d5\u30a9\u30eb\u30c0\u975e\u8868\u793a"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Prevent gallery apps from displaying cached video files"

    const-string v5, "\u907f\u514d\u76f8\u7c3f\u61c9\u7528\u7a0b\u5f0f\u986f\u793a\u5feb\u53d6\u7684\u5f71\u7247\u6a94\u6848"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30a2\u30eb\u30d0\u30e0\u306a\u3069\u304b\u3089\u30ad\u30e3\u30c3\u30b7\u30e5\u3057\u305f\u52d5\u753b\u30d5\u30a1\u30a4\u30eb\u3092\u95b2\u89a7\u3067\u304d\u306a\u3044\u3088\u3046\u306b\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Caching is available during normal playback only. The white seek-bar segment shows caching progress."

    const-string v5, "\u5feb\u53d6\u50c5\u9069\u7528\u65bc\u4e00\u822c\u64ad\u653e\u3002\u9032\u5ea6\u5217\u7684\u767d\u8272\u90e8\u5206\u8868\u793a\u5feb\u53d6\u9032\u5ea6\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u901a\u5e38\u518d\u751f\u306e\u307f\u5b9f\u884c\u3055\u308c\u307e\u3059\uff08\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3001nicoidcast\u3067\u306f\u5b9f\u884c\u3055\u308c\u307e\u305b\u3093\uff09\n\u30b7\u30fc\u30af\u30d0\u30fc\u306e\u767d\u306e\u30b2\u30fc\u30b8\u304c\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u9032\u884c\u5ea6\u306b\u306a\u308a\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Caching is available during normal playback only. The white seek-bar segment shows caching progress."

    const-string v5, "\u5feb\u53d6\u50c5\u9069\u7528\u65bc\u4e00\u822c\u64ad\u653e\u3002\u9032\u5ea6\u5217\u7684\u767d\u8272\u90e8\u5206\u8868\u793a\u5feb\u53d6\u9032\u5ea6\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Normal playback is executed only for the cache. (Pop-up, it does not run on nicoidcast)\nGauge of white seek bar is the progress of the cache"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Caching is available during normal playback only. The white seek-bar segment shows caching progress."

    const-string v5, "\u5feb\u53d6\u50c5\u9069\u7528\u65bc\u4e00\u822c\u64ad\u653e\u3002\u9032\u5ea6\u5217\u7684\u767d\u8272\u90e8\u5206\u8868\u793a\u5feb\u53d6\u9032\u5ea6\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5feb\u53d6\u53ea\u4f7f\u7528\u65bc\u4e00\u822c\u64ad\u653e\uff08Popup\u3001nicoidcast\u4e0d\u4f7f\u7528\uff09\n\u5728\u6642\u9593\u8ef8\u4ee5\u767d\u8272\u9577\u689d\u986f\u793a\u5feb\u53d6\u9032\u884c\u5ea6"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Cache size limit"

    const-string v5, "\u5feb\u53d6\u5bb9\u91cf\u4e0a\u9650"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u5bb9\u91cf"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Cache size limit"

    const-string v5, "\u5feb\u53d6\u5bb9\u91cf\u4e0a\u9650"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Cache capacity"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Cache size limit"

    const-string v5, "\u5feb\u53d6\u5bb9\u91cf\u4e0a\u9650"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5feb\u53d6\u5bb9\u91cf"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Set the maximum storage space used by cached files"

    const-string v5, "\u8a2d\u5b9a\u5feb\u53d6\u6a94\u6848\u53ef\u4f7f\u7528\u7684\u6700\u5927\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306b\u4f7f\u7528\u3059\u308b\u6700\u5927\u5bb9\u91cf\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Set the maximum storage space used by cached files"

    const-string v5, "\u8a2d\u5b9a\u5feb\u53d6\u6a94\u6848\u53ef\u4f7f\u7528\u7684\u6700\u5927\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "You can set the maximum capacity to be used for cache"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Set the maximum storage space used by cached files"

    const-string v5, "\u8a2d\u5b9a\u5feb\u53d6\u6a94\u6848\u53ef\u4f7f\u7528\u7684\u6700\u5927\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u8a2d\u5b9a\u5feb\u53d6\u4f7f\u7528\u7684\u6700\u5927\u5bb9\u91cf"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Use cached files for offline playback"

    const-string v5, "\u4f7f\u7528\u5feb\u53d6\u6a94\u6848\u96e2\u7dda\u64ad\u653e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u307f\u3092\u4f7f\u7528\u3057\u518d\u751f"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "For fully cached videos, also use cached video details and comments to play without network access"

    const-string v5, "\u64ad\u653e\u5df2\u5b8c\u6574\u5feb\u53d6\u7684\u5f71\u7247\u6642\uff0c\u4e5f\u4f7f\u7528\u5feb\u53d6\u7684\u5f71\u7247\u8cc7\u8a0a\u8207\u7559\u8a00\uff0c\u4e0d\u9023\u7dda\u81f3\u7db2\u8def"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u6e08\u307f(100\uff05)\u306e\u52d5\u753b\u3092\u518d\u751f\u3059\u308b\u3068\u304d\u3001\u52d5\u753b\u3060\u3051\u3067\u306a\u304f\u52d5\u753b\u60c5\u5831\u3084\u30b3\u30e1\u30f3\u30c8\u3082\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u4f7f\u7528\u3057\u30c7\u30fc\u30bf\u901a\u4fe1\u3092\u884c\u308f\u305a\u306b\u518d\u751f\u3057\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Fast cache download (not recommended)"

    const-string v5, "\u5feb\u901f\u4e0b\u8f09\u5feb\u53d6\uff08\u4e0d\u5efa\u8b70\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u9ad8\u901f\u53d6\u5f97\u30e2\u30fc\u30c9(\u975e\u63a8\u5968)"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Use fast download for all playback (not recommended)"

    const-string v5, "\u6240\u6709\u64ad\u653e\u65b9\u5f0f\u7686\u4f7f\u7528\u5feb\u901f\u4e0b\u8f09\uff08\u4e0d\u5efa\u8b70\uff09"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u3059\u3079\u3066\u9ad8\u901f\u53d6\u5f97\u30e2\u30fc\u30c9(\u975e\u63a8\u5968)"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Download faster at reduced quality. Applies only to caching and overrides the quality setting. Future service changes may make this option unavailable."

    const-string v5, "\u964d\u4f4e\u756b\u8cea\u4ee5\u52a0\u5feb\u4e0b\u8f09\u3002\u50c5\u9069\u7528\u65bc\u5feb\u53d6\uff0c\u4e26\u5ffd\u7565\u756b\u8cea\u8a2d\u5b9a\u3002\u672a\u4f86\u670d\u52d9\u8b8a\u66f4\u53ef\u80fd\u5c0e\u81f4\u6b64\u9078\u9805\u5931\u6548\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30aa\u30ea\u30b8\u30ca\u30eb\u753b\u8cea\u3088\u308a\u52a3\u5316\u3057\u307e\u3059\u304c\u9ad8\u901f\u306b\u53d6\u5f97\u53ef\u80fd\u306a\u30aa\u30d7\u30b7\u30e7\u30f3\u3067\u3059\u3002\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u307f\u306b\u9069\u5fdc\u3055\u308c\u753b\u8cea\u8a2d\u5b9a\u306f\u7121\u8996\u3055\u308c\u307e\u3059\u3002\u4eca\u5f8c\u306e\u4ed5\u69d8\u5909\u66f4\u3067\u52d5\u4f5c\u3057\u306a\u304f\u306a\u308b\u53ef\u80fd\u6027\u304c\u3042\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Use the fast download method for all playback modes. This does not reduce startup or seek-loading time."

    const-string v5, "\u5728\u6240\u6709\u64ad\u653e\u6a21\u5f0f\u4f7f\u7528\u5feb\u901f\u4e0b\u8f09\u65b9\u5f0f\u3002\u9019\u4e0d\u6703\u7e2e\u77ed\u958b\u59cb\u64ad\u653e\u6216\u62d6\u66f3\u9032\u5ea6\u5f8c\u7684\u8f09\u5165\u6642\u9593\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3060\u3051\u3067\u306f\u306a\u304f\u3059\u3079\u3066\u306e\u518d\u751f\u65b9\u6cd5\u3067\u9ad8\u901f\u53d6\u5f97\u306e\u65b9\u6cd5\u3092\u4f7f\u7528\u3057\u307e\u3059\u3002\u518d\u751f\u958b\u59cb\u307e\u3067\u306e\u6642\u9593\u3084\u30b7\u30fc\u30af\u5f8c\u306e\u8aad\u307f\u8fbc\u307f\u304c\u77ed\u304f\u306a\u308b\u308f\u3051\u3067\u306f\u3042\u308a\u307e\u305b\u3093\u3002"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comments"

    const-string v5, "\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comments"

    const-string v5, "\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Comment"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comments"

    const-string v5, "\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u8a55\u8ad6"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comment opacity"

    const-string v5, "\u7559\u8a00\u4e0d\u900f\u660e\u5ea6"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u306e\u4e0d\u900f\u660e\u5ea6"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Adjust how transparent comments appear"

    const-string v5, "\u8abf\u6574\u7559\u8a00\u986f\u793a\u7684\u900f\u660e\u7a0b\u5ea6"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u306e\u8868\u793a\u3092\u900f\u904e\u3059\u308b\u3053\u3068\u304c\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Reduce comments while casting"

    const-string v5, "\u6295\u653e\u6642\u6e1b\u5c11\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ad\u30e3\u30b9\u30c8\u518d\u751f\u6642\u30b3\u30e1\u30f3\u30c8\u3092\u6e1b\u3089\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Reduce comments and frame rate for smoother casting. Turn this off if the receiving device can handle normal comment rendering."

    const-string v5, "\u6e1b\u5c11\u7559\u8a00\u8207\u5e40\u7387\u4ee5\u6539\u5584\u6295\u653e\u7a69\u5b9a\u6027\u3002\u63a5\u6536\u88dd\u7f6e\u6548\u80fd\u8db3\u5920\u6642\u53ef\u95dc\u9589\uff0c\u4ee5\u6b63\u5e38\u6578\u91cf\u8207\u5e40\u7387\u986f\u793a\u7559\u8a00\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u52d5\u4f5c\u3092\u5b89\u5b9a\u3055\u305b\u308b\u305f\u3081\u8868\u793a\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u91cf\u3092\u5c11\u306a\u304f\u3057\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3092\u4f4e\u304f\u5236\u9650\u3057\u307e\u3059\u3002\u518d\u751f\u5074\u306e\u30b9\u30da\u30c3\u30af\u306b\u4f59\u88d5\u304c\u3042\u308b\u5834\u5408\u3001\u7121\u52b9\u306b\u3059\u308b\u3068\u901a\u5e38\u306e\u30b3\u30e1\u30f3\u30c8\u91cf\u30fb\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3067\u8868\u793a\u3059\u308b\u3053\u3068\u304c\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comment frame rate"

    const-string v5, "\u7559\u8a00\u7e6a\u88fd\u5e40\u7387"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comment frame rate"

    const-string v5, "\u7559\u8a00\u7e6a\u88fd\u5e40\u7387"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Drawing frame rate"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comment frame rate"

    const-string v5, "\u7559\u8a00\u7e6a\u88fd\u5e40\u7387"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u7e6a\u88fd\u5e40\u7387"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Set the maximum frame rate for comment rendering"

    const-string v5, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u6700\u9ad8\u5e40\u7387"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u4e0a\u9650\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Set the maximum frame rate for comment rendering"

    const-string v5, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u6700\u9ad8\u5e40\u7387"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I set the comment drawing frame rate limit."

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Set the maximum frame rate for comment rendering"

    const-string v5, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u6700\u9ad8\u5e40\u7387"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u6211\u8a2d\u7f6e\u7684\u8a3b\u91cb\u7e6a\u5716\u5e40\u901f\u7387\u9650\u5236\u3002"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Hide comments by default"

    const-string v5, "\u9810\u8a2d\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u3092\u8868\u793a\u3057\u306a\u3044"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Hide comments by default"

    const-string v5, "\u9810\u8a2d\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Do not show comment"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Hide comments by default"

    const-string v5, "\u9810\u8a2d\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u4e0d\u986f\u793a\u8a55\u8ad6"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Start playback with comments hidden"

    const-string v5, "\u958b\u59cb\u64ad\u653e\u6642\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u3092\u30c7\u30d5\u30a9\u30eb\u30c8\u3067\u975e\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Start playback with comments hidden"

    const-string v5, "\u958b\u59cb\u64ad\u653e\u6642\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I can hide by default comment"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Start playback with comments hidden"

    const-string v5, "\u958b\u59cb\u64ad\u653e\u6642\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u8a55\u8ad6\u9810\u8a2d\u70ba\u4e0d\u986f\u793a"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Comment shadow"

    const-string v5, "\u7559\u8a00\u9670\u5f71"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u306e\u30c9\u30ed\u30c3\u30d7\u30b7\u30e3\u30c9\u30a6"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose the shadow style for comments"

    const-string v5, "\u9078\u64c7\u7559\u8a00\u7684\u9670\u5f71\u6a23\u5f0f"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u306e\u30c9\u30ed\u30c3\u30d7\u30b7\u30e3\u30c9\u30a6\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose a layout suited to a phone or tablet"

    const-string v5, "\u9078\u64c7\u9069\u5408\u624b\u6a5f\u6216\u5e73\u677f\u96fb\u8166\u7684\u7248\u9762\u914d\u7f6e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30bf\u30d6\u30ec\u30c3\u30c8\u30fb\u30b9\u30de\u30fc\u30c8\u30d5\u30a9\u30f3\u305d\u308c\u305e\u308c\u306b\u9069\u3057\u305f\u8868\u793a\u65b9\u6cd5\u306b\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose a layout suited to a phone or tablet"

    const-string v5, "\u9078\u64c7\u9069\u5408\u624b\u6a5f\u6216\u5e73\u677f\u96fb\u8166\u7684\u7248\u9762\u914d\u7f6e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I will change the display method suitable for each tablet, smartphone"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose a layout suited to a phone or tablet"

    const-string v5, "\u9078\u64c7\u9069\u5408\u624b\u6a5f\u6216\u5e73\u677f\u96fb\u8166\u7684\u7248\u9762\u914d\u7f6e"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u8b8a\u66f4\u9069\u61c9\u5e73\u677f\u96fb\u8166\u30fb\u667a\u6167\u578b\u624b\u6a5f\u7b49\u8868\u793a\u65b9\u6cd5"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Available on tablets only"

    const-string v5, "\u50c5\u9069\u7528\u65bc\u5e73\u677f\u96fb\u8166"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30bf\u30d6\u30ec\u30c3\u30c8\u7aef\u672b\u306e\u307f\u5909\u66f4\u53ef\u80fd\u3067\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Available on tablets only"

    const-string v5, "\u50c5\u9069\u7528\u65bc\u5e73\u677f\u96fb\u8166"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Can be changed only tablets"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Available on tablets only"

    const-string v5, "\u50c5\u9069\u7528\u65bc\u5e73\u677f\u96fb\u8166"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u50c5\u5e73\u677f\u96fb\u8166\u9069\u7528\u8b8a\u66f4"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Action when opening a video link"

    const-string v5, "\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u30ea\u30f3\u30af\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Action when opening a video link"

    const-string v5, "\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Operation of the link-time"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Action when opening a video link"

    const-string v5, "\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u9023\u7d50\u6642\u7684\u52d5\u4f5c"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose what happens when another app opens a video link"

    const-string v5, "\u9078\u64c7\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5916\u90e8\u30a2\u30d7\u30ea\u304b\u3089\u306e\u547c\u3073\u51fa\u3057\u6642\u306e\u52d5\u4f5c\u3092\u9078\u629e\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose what happens when another app opens a video link"

    const-string v5, "\u9078\u64c7\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "I want the behavior of the call from the external application"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Choose what happens when another app opens a video link"

    const-string v5, "\u9078\u64c7\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u9078\u64c7\u5f9e\u5916\u90e8\u61c9\u7528\u7a0b\u5f0f\u53eb\u51fa\u6642\u7684\u52d5\u4f5c"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Experimental features"

    const-string v5, "\u5be6\u9a57\u6027\u529f\u80fd"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5b9f\u9a13\u7684\u6a5f\u80fd"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "About experimental features"

    const-string v5, "\u95dc\u65bc\u5be6\u9a57\u6027\u529f\u80fd"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u5b9f\u9a13\u7684\u6a5f\u80fd\u306b\u3064\u3044\u3066"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "Leave these options off for normal use. They may not work correctly and may be removed without notice."

    const-string v5, "\u4e00\u822c\u4f7f\u7528\u6642\u8acb\u4fdd\u6301\u95dc\u9589\u3002\u9019\u4e9b\u9078\u9805\u53ef\u80fd\u7121\u6cd5\u6b63\u5e38\u904b\u4f5c\uff0c\u4e14\u53ef\u80fd\u4e0d\u53e6\u884c\u901a\u77e5\u5c31\u79fb\u9664\u3002"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u901a\u5e38\u306f\u8a2d\u5b9a\u3057\u306a\u3044\u3067\u304f\u3060\u3055\u3044\u3002\u3053\u3061\u3089\u306e\u30aa\u30d7\u30b7\u30e7\u30f3\u306f\u6b63\u3057\u304f\u52d5\u4f5c\u3057\u306a\u304b\u3063\u305f\u308a\u4e88\u544a\u306a\u304f\u5ec3\u6b62\u3059\u308b\u53ef\u80fd\u6027\u304c\u3042\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    filled-new-array {v2, v15}, [Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v4, "\u8a9e"

    filled-new-array {v2, v15}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Signing in\u2026"

    const-string v4, "\u6b63\u5728\u767b\u5165\u2026"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ed\u30b0\u30a4\u30f3\u4e2d"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Signing in\u2026"

    const-string v4, "\u6b63\u5728\u767b\u5165\u2026"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Log in"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Signing in\u2026"

    const-string v4, "\u6b63\u5728\u767b\u5165\u2026"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u767b\u5165\u4e2d"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign in with your NicoNico account"

    const-string v4, "\u4f7f\u7528 Niconico \u5e33\u865f\u767b\u5165"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306e\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u30fb\u30d1\u30b9\u30ef\u30fc\u30c9\u3092\u8a2d\u5b9a"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign in with your NicoNico account"

    const-string v4, "\u4f7f\u7528 Niconico \u5e33\u865f\u767b\u5165"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Set the e-mail address password of Nico Nico Douga"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign in with your NicoNico account"

    const-string v4, "\u4f7f\u7528 Niconico \u5e33\u865f\u767b\u5165"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8a2d\u5b9aNICONICO\u52d5\u756b\u7684\u96fb\u90f5\u5730\u5740\u30fb\u5bc6\u78bc"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Signed in successfully"

    move-object/from16 v4, v24

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v5, "\u30ed\u30b0\u30a4\u30f3\u306b\u6210\u529f\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Signed in successfully"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v5, "I have successfully logged"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Signed in successfully"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign-in failed. Check your email address and password."

    const-string v4, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u8207\u5bc6\u78bc\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ed\u30b0\u30a4\u30f3\u306b\u5931\u6557\u3057\u307e\u3057\u305f\n\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u3068\u30d1\u30b9\u30ef\u30fc\u30c9\u3092\u304a\u78ba\u304b\u3081\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign-in failed. Check your email address and password."

    const-string v4, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u8207\u5bc6\u78bc\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I failed to login"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign-in failed. Check your email address and password."

    const-string v4, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u8207\u5bc6\u78bc\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u767b\u5165\u5931\u6557"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Sign-in failed. Check your verification code."

    const-string v4, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u9a57\u8b49\u78bc\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ed\u30b0\u30a4\u30f3\u306b\u5931\u6557\u3057\u307e\u3057\u305f\n\u78ba\u8a8d\u30b3\u30fc\u30c9\u304c\u9593\u9055\u3063\u3066\u3044\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "App screen orientation"

    const-string v4, "\u4e00\u822c\u756b\u9762\u65b9\u5411"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u901a\u5e38\u753b\u9762\u306e\u5411\u304d"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "App screen orientation"

    const-string v4, "\u4e00\u822c\u756b\u9762\u65b9\u5411"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "The orientation of the screen"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "App screen orientation"

    const-string v4, "\u4e00\u822c\u756b\u9762\u65b9\u5411"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u756b\u9762\u65b9\u5411"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose how the app screen rotates"

    const-string v4, "\u9078\u64c7\u4e00\u822c\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u901a\u5e38\u753b\u9762\u306e\u5411\u304d\u306e\u56fa\u5b9a\u30fb\u5909\u66f4\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose how the app screen rotates"

    const-string v4, "\u9078\u64c7\u4e00\u822c\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I set the fixed and how to change the orientation of the normal screen"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose how the app screen rotates"

    const-string v4, "\u9078\u64c7\u4e00\u822c\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8a2d\u5b9a\u4e00\u822c\u756b\u9762\u65b9\u5411\u7684\u56fa\u5b9a\u30fb\u8b8a\u66f4\u65b9\u6cd5"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Low quality on mobile data"

    const-string v4, "\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642\u964d\u4f4e\u756b\u8cea"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u4f4e\u753b\u8cea\u518d\u751f"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Use low quality on mobile data, regardless of the quality setting"

    const-string v4, "\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642\u4e00\u5f8b\u4f7f\u7528\u4f4e\u756b\u8cea\uff0c\u4e0d\u53d7\u756b\u8cea\u8a2d\u5b9a\u5f71\u97ff"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u3001\u753b\u8cea\u8a2d\u5b9a\u306b\u304b\u304b\u308f\u3089\u305a\u4f4e\u753b\u8cea\u3067\u53d6\u5f97\u3057\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u305b\u305a\u306b\u4f7f\u7528"

    move-object/from16 v5, v18

    move-object/from16 v4, v19

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "The use without logging"

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Use nicoid without a NicoNico account"

    const-string v4, "\u4e0d\u767b\u5165 Niconico \u5e33\u865f\u5373\u53ef\u4f7f\u7528 nicoid"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ed\u30b0\u30a4\u30f3\u305b\u305a\u306bnicoid\u3092\u4f7f\u7528\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Use nicoid without a NicoNico account"

    const-string v4, "\u4e0d\u767b\u5165 Niconico \u5e33\u865f\u5373\u53ef\u4f7f\u7528 nicoid"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Use nicoid without logging"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Use nicoid without a NicoNico account"

    const-string v4, "\u4e0d\u767b\u5165 Niconico \u5e33\u865f\u5373\u53ef\u4f7f\u7528 nicoid"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u4e0d\u767b\u5165\u4f7f\u7528nicoid"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "\u518d\u751f\u30e2\u30fc\u30c9"

    move-object/from16 v4, v20

    move-object/from16 v5, v22

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Play mode"

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose streaming or cached playback"

    const-string v4, "\u9078\u64c7\u4e32\u6d41\u6216\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u753b\u306e\u518d\u751f\u65b9\u6cd5\uff08\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\u30fb\u30ad\u30e3\u30c3\u30b7\u30e5\uff09\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose streaming or cached playback"

    const-string v4, "\u9078\u64c7\u4e32\u6d41\u6216\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I will change the method of playing videos (streaming / cache)"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose streaming or cached playback"

    const-string v4, "\u9078\u64c7\u4e32\u6d41\u6216\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u756b\u64ad\u653e\u65b9\u6cd5\uff08\u4e32\u6d41\u30fb\u5feb\u53d6\uff09\u8b8a\u66f4"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Comment and video details language"

    const-string v4, "\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Comment and video details language"

    const-string v4, "\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Language of the comment and video information"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Comment and video details language"

    const-string v4, "\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose the language for comments and video details. By default, this follows the app language."

    const-string v4, "\u9078\u64c7\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00\u3002\u9810\u8a2d\u4f7f\u7528\u61c9\u7528\u7a0b\u5f0f\u7684\u8a9e\u8a00\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3067\u304d\u307e\u3059\uff08\u30c7\u30d5\u30a9\u30eb\u30c8\u306f\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u306b\u5f93\u3044\u307e\u3059\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose the language for comments and video details. By default, this follows the app language."

    const-string v4, "\u9078\u64c7\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00\u3002\u9810\u8a2d\u4f7f\u7528\u61c9\u7528\u7a0b\u5f0f\u7684\u8a9e\u8a00\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I will change the language of the comment and video information. (The default is subject to the language of the entire application.)"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose the language for comments and video details. By default, this follows the app language."

    const-string v4, "\u9078\u64c7\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00\u3002\u9810\u8a2d\u4f7f\u7528\u61c9\u7528\u7a0b\u5f0f\u7684\u8a9e\u8a00\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8b8a\u66f4\u8a55\u8ad6\u30fb\u52d5\u756b\u60c5\u5831\u7684\u8a9e\u8a00"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Player screen orientation"

    const-string v4, "\u64ad\u653e\u756b\u9762\u65b9\u5411"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u518d\u751f\u753b\u9762\u306e\u5411\u304d"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose how the player screen rotates"

    const-string v4, "\u9078\u64c7\u64ad\u653e\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u518d\u751f\u753b\u9762\uff08\u30d7\u30ec\u30a4\u30e4\u30fc\uff09\u306e\u5411\u304d\u306e\u56fa\u5b9a\u30fb\u5909\u66f4\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose how the player screen rotates"

    const-string v4, "\u9078\u64c7\u64ad\u653e\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I set the fixed and how to change the screen orientation in player"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose how the player screen rotates"

    const-string v4, "\u9078\u64c7\u64ad\u653e\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8a2d\u5b9a\u64ad\u653e\u5668\u756b\u9762\u65b9\u5411\u7684\u56fa\u5b9a\u30fb\u8b8a\u66f4\u65b9\u6cd5"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Start before comments finish loading"

    const-string v4, "\u7559\u8a00\u8f09\u5165\u5b8c\u6210\u524d\u958b\u59cb\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5148\u884c\u518d\u751f"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Start before comments finish loading"

    const-string v4, "\u7559\u8a00\u8f09\u5165\u5b8c\u6210\u524d\u958b\u59cb\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Preceding Play"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Start before comments finish loading"

    const-string v4, "\u7559\u8a00\u8f09\u5165\u5b8c\u6210\u524d\u958b\u59cb\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5148\u884c\u64ad\u653e"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Start playback as soon as the video is ready, even if comments are still loading"

    const-string v4, "\u5f71\u7247\u6e96\u5099\u597d\u5f8c\u7acb\u5373\u64ad\u653e\uff0c\u5373\u4f7f\u7559\u8a00\u4ecd\u5728\u8f09\u5165"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u753b\u306e\u53d6\u5f97\u304c\u5b8c\u4e86\u3057\u305f\u6642\u70b9\u3067\u30b3\u30e1\u30f3\u30c8\u306e\u53d6\u5f97\u304c\u5b8c\u4e86\u3057\u3066\u3044\u306a\u304f\u3066\u3082\u52d5\u753b\u306e\u518d\u751f\u3092\u958b\u59cb\u3057\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Start playback as soon as the video is ready, even if comments are still loading"

    const-string v4, "\u5f71\u7247\u6e96\u5099\u597d\u5f8c\u7acb\u5373\u64ad\u653e\uff0c\u5373\u4f7f\u7559\u8a00\u4ecd\u5728\u8f09\u5165"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I will start playing the video acquisition of comment even if not completed at the time of acquisition of the video was completed"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Start playback as soon as the video is ready, even if comments are still loading"

    const-string v4, "\u5f71\u7247\u6e96\u5099\u597d\u5f8c\u7acb\u5373\u64ad\u653e\uff0c\u5373\u4f7f\u7559\u8a00\u4ecd\u5728\u8f09\u5165"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u756b\u53d6\u5f97\u5f8c\u5c1a\u672a\u53d6\u5f97\u8a55\u8ad6\u6642\u76f4\u63a5\u64ad\u653e"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Stable cached playback (temporary workaround)"

    const-string v4, "\u7a69\u5b9a\u5feb\u53d6\u64ad\u653e\uff08\u66ab\u6642\u89e3\u6c7a\u65b9\u6848\uff09"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u5b89\u5b9a\u518d\u751f\uff08\u66ab\u5b9a\u5bfe\u5fdc\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Reduce stuttering when playing cached videos from external storage. Leave this off if playback works normally. This temporary workaround may be removed."

    const-string v4, "\u6e1b\u5c11\u64ad\u653e\u5916\u90e8\u5132\u5b58\u7a7a\u9593\u5feb\u53d6\u5f71\u7247\u6642\u7684\u5361\u9813\u3002\u64ad\u653e\u6b63\u5e38\u6642\u8acb\u4fdd\u6301\u95dc\u9589\uff0c\u6b64\u66ab\u6642\u89e3\u6c7a\u65b9\u6848\u672a\u4f86\u53ef\u80fd\u79fb\u9664\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u4e00\u90e8\u74b0\u5883\u4e0b\u3067\u5916\u90e8\u30e1\u30e2\u30ea\u306b\u30ad\u30e3\u30c3\u30b7\u30e5\u3055\u308c\u305f\u52d5\u753b\u3092\u518d\u751f\u6642\u306b\u30d7\u30c4\u30d7\u30c4\u9014\u5207\u308c\u308b\u73fe\u8c61\u3092\u89e3\u6d88\u51fa\u6765\u307e\u3059\uff08\u518d\u751f\u306b\u554f\u984c\u304c\u306a\u3044\u5834\u5408\u8a2d\u5b9a\u3057\u306a\u3044\u3067\u4e0b\u3055\u3044\u3002\u66ab\u5b9a\u5bfe\u5fdc\u306e\u305f\u3081\u524a\u9664\u3055\u308c\u308b\u53ef\u80fd\u6027\u304c\u3042\u308a\u307e\u3059\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Video quality"

    const-string v4, "\u5f71\u7247\u756b\u8cea"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Image quality"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Video quality"

    const-string v4, "\u5f71\u7247\u756b\u8cea"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u756b\u8cea"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose the video quality to download or stream"

    const-string v4, "\u9078\u64c7\u4e0b\u8f09\u6216\u4e32\u6d41\u7684\u5f71\u7247\u756b\u8cea"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u53d6\u5f97\u3059\u308b\u52d5\u753b\u306e\u753b\u8cea\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose the video quality to download or stream"

    const-string v4, "\u9078\u64c7\u4e0b\u8f09\u6216\u4e32\u6d41\u7684\u5f71\u7247\u756b\u8cea"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I can change the quality of the video to get"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose the video quality to download or stream"

    const-string v4, "\u9078\u64c7\u4e0b\u8f09\u6216\u4e32\u6d41\u7684\u5f71\u7247\u756b\u8cea"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u80fd\u8b8a\u66f4\u53d6\u5f97\u52d5\u756b\u7684\u756b\u8cea"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Settings saved"

    move-object/from16 v4, v21

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v5, "\u8a2d\u5b9a\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Settings saved"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v5, "I have to save the settings"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Settings saved"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Shared comment filter strength"

    const-string v4, "\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5f37\u5ea6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5171\u6709NG\u30ec\u30d9\u30eb"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Shared comment filter strength"

    const-string v4, "\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5f37\u5ea6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "NG share level"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Shared comment filter strength"

    const-string v4, "\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5f37\u5ea6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5206\u4eabNG\u7b49\u7d1a"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Adjust the strength of the shared comment filter"

    const-string v4, "\u8abf\u6574\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5668\u7684\u5f37\u5ea6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5171\u6709NG\u30ec\u30d9\u30eb\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Adjust the strength of the shared comment filter"

    const-string v4, "\u8abf\u6574\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5668\u7684\u5f37\u5ea6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "I will modify the share NG level"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Adjust the strength of the shared comment filter"

    const-string v4, "\u8abf\u6574\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5668\u7684\u5f37\u5ea6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8b8a\u66f4\u5206\u4eabNG\u7b49\u7d1a"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Keep playing with the screen off"

    const-string v4, "\u87a2\u5e55\u95dc\u9589\u6642\u7e7c\u7e8c\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30b9\u30ea\u30fc\u30d7\u518d\u751f"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Continue normal playback when the screen turns off"

    const-string v4, "\u87a2\u5e55\u95dc\u9589\u5f8c\u4ecd\u7e7c\u7e8c\u4e00\u822c\u64ad\u653e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u901a\u5e38\u518d\u751f\u72b6\u614b\u3067\u30b9\u30ea\u30fc\u30d7\uff08\u753b\u9762\u30aa\u30d5\uff09\u306b\u3057\u3066\u3082\u518d\u751f\u3092\u7d9a\u3051\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Hide status bar"

    const-string v4, "\u96b1\u85cf\u72c0\u614b\u5217"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30b9\u30c6\u30fc\u30bf\u30b9\u30d0\u30fc\u975e\u8868\u793a"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Hide the status bar in full screen"

    const-string v4, "\u5168\u87a2\u5e55\u6642\u96b1\u85cf\u72c0\u614b\u5217"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30d5\u30eb\u30b9\u30af\u30ea\u30fc\u30f3\u6642\u30b9\u30c6\u30fc\u30bf\u30b9\u30d0\u30fc\u3092\u975e\u8868\u793a\u306b\u3057\u307e\u3059"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Action when tapping a video"

    const-string v4, "\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Action when tapping a video"

    const-string v4, "\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Operation of the tap when"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Action when tapping a video"

    const-string v4, "\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8f15\u89f8\u6642\u52d5\u4f5c"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose what happens when tapping a video. Use the triangle at the bottom right for other actions."

    const-string v4, "\u9078\u64c7\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba\u3002\u5176\u4ed6\u64cd\u4f5c\u53ef\u7531\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\u958b\u555f\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u753b\u3092\u30bf\u30c3\u30d7\u3057\u305f\u6642\u306e\u52d5\u4f5c\u3092\u9078\u629e\u3067\u304d\u307e\u3059\uff08\u8a2d\u5b9a\u3057\u305f\u9805\u76ee\u4ee5\u5916\u306f\u53f3\u4e0b\u306e\u4e09\u89d2\u5f62\u3092\u30bf\u30c3\u30d7\u3059\u308b\u3053\u3068\u3067\u8868\u793a\u3055\u308c\u307e\u3059\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 506
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose what happens when tapping a video. Use the triangle at the bottom right for other actions."

    const-string v4, "\u9078\u64c7\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba\u3002\u5176\u4ed6\u64cd\u4f5c\u53ef\u7531\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\u958b\u555f\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "And what to do when you tap the video list. (Item other than that you set will be displayed by tapping the triangle in the bottom right-hand corner.)"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Choose what happens when tapping a video. Use the triangle at the bottom right for other actions."

    const-string v4, "\u9078\u64c7\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba\u3002\u5176\u4ed6\u64cd\u4f5c\u53ef\u7531\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\u958b\u555f\u3002"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u9078\u64c7\u8f15\u89f8\u6642\u7684\u52d5\u4f5c\uff08\u5df2\u8a2d\u5b9a\u9805\u76ee\u4ee5\u5916\u8acb\u8f15\u89f8\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "General"

    const-string v4, "\u4e00\u822c"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5168\u822c"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "General"

    const-string v4, "\u4e00\u822c"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Whole"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "General"

    const-string v4, "\u4e00\u822c"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5168\u9ad4"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Followed users"

    const-string v4, "\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30e6\u30fc\u30b6\u30fc"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Followed users"

    const-string v4, "\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "User favorite"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Followed users"

    const-string v4, "\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u7528\u6236\u559c\u611b"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Users you follow"

    const-string v4, "\u4f60\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "User list of favorite"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Users you follow"

    const-string v4, "\u4f60\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u559c\u6b61\u7684\u7528\u6236\u5217\u8868"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Your account\'s playlists"

    const-string v4, "\u5e33\u865f\u7684\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30a2\u30ab\u30a6\u30f3\u30c8\u306e\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Your account\'s playlists"

    const-string v4, "\u5e33\u865f\u7684\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "My List list of accounts"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Your account\'s playlists"

    const-string v4, "\u5e33\u865f\u7684\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5e33\u6236\u7684\u6211\u7684\u6e05\u55ae\u4e00\u89bd"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Watch later"

    const-string v4, "\u7a0d\u5f8c\u89c0\u770b"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Watch later"

    const-string v4, "\u7a0d\u5f8c\u89c0\u770b"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "My List for the time being"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Watch later"

    const-string v4, "\u7a0d\u5f8c\u89c0\u770b"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u4e00\u79d2\u6e05\u55ae"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Your Watch later playlist"

    const-string v4, "\u7a0d\u5f8c\u89c0\u770b\u6e05\u55ae"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30a2\u30ab\u30a6\u30f3\u30c8\u306e\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Your Watch later playlist"

    const-string v4, "\u7a0d\u5f8c\u89c0\u770b\u6e05\u55ae"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "My List list for the time being of the account"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Your Watch later playlist"

    const-string v4, "\u7a0d\u5f8c\u89c0\u770b\u6e05\u55ae"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u5e33\u6236\u7684\u4e00\u79d2\u6e05\u55ae\u4e00\u89bd"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Bookmarks saved on this device"

    const-string v4, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u66f8\u7c64"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u672c\u4f53\u306b\u767b\u9332\u3057\u305f\u30d6\u30c3\u30af\u30de\u30fc\u30af"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Bookmarks saved on this device"

    const-string v4, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u66f8\u7c64"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "A list of bookmarks that it has registered with the body"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Bookmarks saved on this device"

    const-string v4, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u66f8\u7c64"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u88dd\u7f6e\u672c\u9ad4\u4e0a\u7684\u66f8\u7c64\u4e00\u89bd"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cached videos"

    const-string v4, "\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cached videos"

    const-string v4, "\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Cache list"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 530
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cached videos"

    const-string v4, "\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u7de9\u5b58\u5217\u8868"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cached videos available offline"

    const-string v4, "\u53ef\u96e2\u7dda\u89c0\u770b\u7684\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\uff08\u30aa\u30d5\u30e9\u30a4\u30f3\u8996\u8074\u53ef\u80fd\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cached videos available offline"

    const-string v4, "\u53ef\u96e2\u7dda\u89c0\u770b\u7684\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Video List of cached (Viewable offline)"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cached videos available offline"

    const-string v4, "\u53ef\u96e2\u7dda\u89c0\u770b\u7684\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u7de9\u5b58\u7684\u8996\u983b\u5217\u8868\uff08\u96e2\u7dda\u700f\u89bd\uff09"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "On this device"

    const-string v4, "\u6b64\u88dd\u7f6e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u672c\u4f53"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "On this device"

    const-string v4, "\u6b64\u88dd\u7f6e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Body"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "On this device"

    const-string v4, "\u6b64\u88dd\u7f6e"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u88dd\u7f6e\u672c\u9ad4"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Cache download started"

    const-string v4, "\u5df2\u958b\u59cb\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u3092\u958b\u59cb\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Watch history on this device"

    const-string v4, "\u6b64\u88dd\u7f6e\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u672c\u4f53\u306e\u8996\u8074\u5c65\u6b74"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Watch history on this device"

    const-string v4, "\u6b64\u88dd\u7f6e\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Viewing history of the body"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Watch history on this device"

    const-string v4, "\u6b64\u88dd\u7f6e\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u88dd\u7f6e\u672c\u9ad4\u7684\u8996\u807d\u7d00\u9304"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Enter video ID"

    const-string v4, "\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u753bID\u5165\u529b"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Enter video ID"

    const-string v4, "\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Video ID input"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Enter video ID"

    const-string v4, "\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u8f38\u5165\u52d5\u756bID"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Open a video by its ID"

    const-string v4, "\u4ee5\u5f71\u7247 ID \u958b\u555f\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u753bID\u3092\u76f4\u63a5\u6307\u5b9a\u3057\u30a2\u30af\u30bb\u30b9"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Open a video by its ID"

    const-string v4, "\u4ee5\u5f71\u7247 ID \u958b\u555f\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Accessed directly specify the video ID"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Open a video by its ID"

    const-string v4, "\u4ee5\u5f71\u7247 ID \u958b\u555f\u5f71\u7247"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u7d93\u7531\u76f4\u63a5\u6307\u5b9a\u52d5\u756bID\u9032\u5165"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Enter a video ID"

    const-string v4, "\u8acb\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "ID\u304c\u5165\u529b\u3055\u308c\u3066\u3044\u307e\u305b\u3093"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Enter a video ID"

    const-string v4, "\u8acb\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "ID has not been entered"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Enter a video ID"

    const-string v4, "\u8acb\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u672a\u8f38\u5165ID"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 550
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "nicoid settings"

    const-string v4, "nicoid \u8a2d\u5b9a"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "nicoid\u306e\u8a2d\u5b9a"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "nicoid settings"

    const-string v4, "nicoid \u8a2d\u5b9a"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Setting nicoid"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Search by keyword or tag"

    const-string v4, "\u4ee5\u95dc\u9375\u5b57\u6216\u6a19\u7c64\u641c\u5c0b"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u753b\u306e\u30ad\u30fc\u30ef\u30fc\u30c9\u3001\u30bf\u30b0\u691c\u7d22"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 553
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Search by keyword or tag"

    const-string v4, "\u4ee5\u95dc\u9375\u5b57\u6216\u6a19\u7c64\u641c\u5c0b"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "Keywords video, tag search"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 554
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Search by keyword or tag"

    const-string v4, "\u4ee5\u95dc\u9375\u5b57\u6216\u6a19\u7c64\u641c\u5c0b"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const-string v4, "\u52d5\u756b\u7684\u95dc\u9375\u5b57\u3001\u6a19\u7c64\u641c\u5c0b"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 555
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v2, "Pop up\u64ad\u653e"

    filled-new-array {v3, v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 556
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Download the video cache in the background?"

    const-string v2, "\u8981\u5728\u80cc\u666f\u4e0b\u8f09\u5f71\u7247\u5feb\u53d6\u55ce\uff1f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u53d6\u5f97\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "Play continuously"

    const-string v2, "\u9023\u7e8c\u64ad\u653e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u9023\u7d9a\u518d\u751f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "\u8d77\u52d5\u6642\u306e\u753b\u9762"

    const-string v2, "Startup screen"

    const-string v3, "\u555f\u52d5\u756b\u9762"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "\u30cb\u30b3\u30ec\u30dd"

    const-string v2, "Nico Reports"

    const-string v3, "Nico \u52d5\u614b"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "\u6295\u7a3f\u8005\u306e\u30d5\u30a9\u30ed\u30fc\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    const-string v2, "Show creator follow button"

    const-string v3, "\u986f\u793a\u6295\u7a3f\u8005\u8ffd\u8e64\u6309\u9215"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    const-string v1, "\u52d5\u753b\u60c5\u5831\u306b\u30d5\u30a9\u30ed\u30fc\u30dc\u30bf\u30f3\u3092\u8868\u793a\u3057\u307e\u3059"

    const-string v2, "Show a follow button in video details"

    const-string v3, "\u5728\u5f71\u7247\u8cc7\u8a0a\u986f\u793a\u8ffd\u8e64\u6309\u9215"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Le/e/a/UiStrings;->buildJapaneseLookup()V

    .line 559
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 589
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildJapaneseLookup()V
    .registers 7

    .line 568
    const-string v0, "[A-Za-z][A-Za-z0-9 \u2019\'/-]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 569
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 570
    sget-object v2, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_15
    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_7a

    .line 574
    sget-object v2, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 575
    sget-object v2, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2b
    :goto_2b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_39

    .line 582
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    sget-object v1, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 583
    return-void

    .line 575
    :cond_39
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 576
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 577
    sget-object v6, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2b

    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_2b

    if-eqz v2, :cond_2b

    array-length v6, v2

    if-lez v6, :cond_2b

    aget-object v6, v2, v4

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2b

    .line 578
    aget-object v2, v2, v4

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 579
    if-eqz v2, :cond_2b

    sget-object v6, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v6, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2b

    .line 570
    :cond_7a
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 571
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 572
    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-nez v6, :cond_15

    if-eqz v3, :cond_15

    array-length v6, v3

    if-lez v6, :cond_15

    aget-object v6, v3, v4

    invoke-interface {v1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15

    aget-object v3, v3, v4

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_15
.end method

.method private static lookup(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    .line 561
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 562
    if-eqz v0, :cond_b

    return-object v0

    .line 563
    :cond_b
    const-string v0, "[0-9]+\u884c"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " rows"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " \u884c"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 564
    :cond_49
    const-string v0, "[0-9]+\u79d2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_86

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " seconds"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " \u79d2"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 565
    :cond_86
    const/4 p0, 0x0

    return-object p0
.end method

.method public static selectLanguage(Ljava/lang/String;)V
    .registers 3

    .line 591
    const/4 v0, -0x1

    if-nez p0, :cond_6

    sput v0, Le/e/a/UiStrings;->selectedLanguage:I

    return-void

    .line 592
    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 593
    const-string v1, "0"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7e

    const-string v1, "ja"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7e

    const-string v1, "ja-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7e

    const-string v1, "japanese"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    goto :goto_7e

    .line 594
    :cond_31
    const-string v1, "1"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7a

    const-string v1, "en"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7a

    const-string v1, "en-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7a

    const-string v1, "english"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_52

    goto :goto_7a

    .line 595
    :cond_52
    const-string v1, "2"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_76

    const-string v1, "zh"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_76

    const-string v1, "zh-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_76

    const-string v1, "chinese"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_73

    goto :goto_76

    .line 596
    :cond_73
    sput v0, Le/e/a/UiStrings;->selectedLanguage:I

    goto :goto_81

    .line 595
    :cond_76
    :goto_76
    const/4 p0, 0x2

    sput p0, Le/e/a/UiStrings;->selectedLanguage:I

    goto :goto_81

    .line 594
    :cond_7a
    :goto_7a
    const/4 p0, 0x1

    sput p0, Le/e/a/UiStrings;->selectedLanguage:I

    goto :goto_81

    .line 593
    :cond_7e
    :goto_7e
    const/4 p0, 0x0

    sput p0, Le/e/a/UiStrings;->selectedLanguage:I

    .line 597
    :goto_81
    return-void
.end method

.method private static toJapanese(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 585
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 586
    :cond_4
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 587
    if-nez v0, :cond_f

    goto :goto_10

    :cond_f
    move-object p0, v0

    :goto_10
    return-object p0
.end method

.method public static translate(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 599
    const-string v0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string p0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    .line 600
    :cond_a
    const-string v0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const-string p0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    .line 601
    :cond_14
    sget v0, Le/e/a/UiStrings;->selectedLanguage:I

    .line 602
    if-gez v0, :cond_21

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 603
    :cond_21
    if-nez p0, :cond_25

    const/4 p0, 0x0

    return-object p0

    .line 604
    :cond_25
    if-nez v0, :cond_2c

    invoke-static {p0}, Le/e/a/UiStrings;->toJapanese(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 605
    :cond_2c
    invoke-static {p0}, Le/e/a/UiStrings;->lookup(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 606
    if-nez v1, :cond_33

    goto :goto_37

    :cond_33
    add-int/lit8 v0, v0, -0x1

    aget-object p0, v1, v0

    :goto_37
    return-object p0
.end method

.method public static translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    .line 609
    const-string v0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string p0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    .line 610
    :cond_a
    const-string v0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const-string p0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    .line 611
    :cond_14
    if-nez p0, :cond_18

    const/4 p0, 0x0

    return-object p0

    .line 612
    :cond_18
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    .line 613
    const-string v0, "en"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_31

    const-string v1, "zh"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_31

    invoke-static {p0}, Le/e/a/UiStrings;->toJapanese(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 614
    :cond_31
    invoke-static {p0}, Le/e/a/UiStrings;->lookup(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 615
    if-nez v1, :cond_38

    goto :goto_40

    :cond_38
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    aget-object p0, v1, p0

    :goto_40
    return-object p0
.end method
