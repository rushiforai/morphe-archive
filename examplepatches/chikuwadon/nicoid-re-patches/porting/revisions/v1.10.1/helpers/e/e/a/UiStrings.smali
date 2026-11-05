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
    .registers 24

    .line 9
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    .line 10
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    .line 11
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    const/4 v2, -0x1

    .line 13
    sput v2, Le/e/a/UiStrings;->selectedLanguage:I

    .line 15
    const-string v2, "Playback speed while holding"

    const-string v3, "\u9577\u6309\u6642\u7684\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u9577\u62bc\u3057\u4e2d\u306e\u518d\u751f\u901f\u5ea6"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    const-string v2, "%s: Changes playback speed while you hold the video. Release to restore the previous speed (slider fully left to disable)."

    const-string v3, "%s\uff1a\u9577\u6309\u5f71\u7247\u756b\u9762\u6642\u66ab\u6642\u8b8a\u66f4\u64ad\u653e\u901f\u5ea6\uff0c\u653e\u958b\u5f8c\u6062\u5fa9\u539f\u901f\uff08\u6ed1\u687f\u6700\u5de6\u7aef\u70ba\u505c\u7528\uff09\u3002"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "%s\uff1a\u52d5\u753b\u753b\u9762\u306e\u9577\u62bc\u3057\u4e2d\u3060\u3051\u518d\u751f\u901f\u5ea6\u3092\u5909\u66f4\u3057\u307e\u3059\u3002\u6307\u3092\u96e2\u3059\u3068\u5143\u306b\u623b\u308a\u307e\u3059\uff08\u5de6\u7aef\u3067\u7121\u52b9\uff09\u3002"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    const-string v2, "Startup screen"

    const-string v3, "\u555f\u52d5\u756b\u9762"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u8d77\u52d5\u6642\u306e\u753b\u9762"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    const-string v2, "Within 6 months"

    const-string v3, "\u534a\u5e74\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u534a\u5e74\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    const-string v2, "Within 1 year"

    const-string v3, "1 \u5e74\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "1\u5e74\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    const-string v2, "Within 3 years"

    const-string v3, "3 \u5e74\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "3\u5e74\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    const-string v2, "Within 5 years"

    const-string v3, "5 \u5e74\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "5\u5e74\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    const-string v2, "Up to 1 minute"

    const-string v3, "1 \u5206\u9418\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "1\u5206\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    const-string v2, "Up to 3 minutes"

    const-string v3, "3 \u5206\u9418\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "3\u5206\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    const-string v2, "Up to 5 minutes"

    const-string v3, "5 \u5206\u9418\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "5\u5206\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    const-string v2, "Up to 10 minutes"

    const-string v3, "10 \u5206\u9418\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "10\u5206\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    const-string v2, "Up to 20 minutes"

    const-string v3, "20 \u5206\u9418\u5167"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "20\u5206\u4ee5\u5185"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    const-string v2, "20 minutes or longer"

    const-string v3, "20 \u5206\u9418\u4ee5\u4e0a"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "20\u5206\u4ee5\u4e0a"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    const-string v2, "60 minutes or longer"

    const-string v3, "60 \u5206\u9418\u4ee5\u4e0a"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "60\u5206\u4ee5\u4e0a"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    const-string v2, "Nico Reports"

    const-string v3, "Nico \u52d5\u614b"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u30cb\u30b3\u30ec\u30dd"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    const-string v2, "Show creator follow button"

    const-string v3, "\u986f\u793a\u6295\u7a3f\u8005\u8ffd\u8e64\u6309\u9215"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u6295\u7a3f\u8005\u306e\u30d5\u30a9\u30ed\u30fc\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    const-string v2, "Show a follow button in video details"

    const-string v3, "\u5728\u5f71\u7247\u8cc7\u8a0a\u986f\u793a\u8ffd\u8e64\u6309\u9215"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u52d5\u753b\u60c5\u5831\u306b\u30d5\u30a9\u30ed\u30fc\u30dc\u30bf\u30f3\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    const-string v2, "Bold comments"

    const-string v3, "\u7c97\u9ad4\u7559\u8a00"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u3092\u592a\u5b57\u306b\u3059\u308b"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    const-string v2, "Applies on the next playback"

    const-string v3, "\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\u3055\u308c\u307e\u3059"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    const-string v2, "I will change the language of the entire application."

    const-string v3, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3057\u307e\u3059\u3002"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    const-string v2, "External memory (SD card)"

    const-string v3, "\u5916\u90e8\u30e1\u30e2\u30ea\uff08SD\u30ab\u30fc\u30c9\uff09"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const-string v2, "None (view all)"

    const-string v3, "\u6307\u5b9a\u306a\u3057\uff08\u3059\u3079\u3066\u8868\u793a\uff09"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    const-string v2, "Are you sure you want to delete all the cache?"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u3059\u3079\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    const-string v2, "I set the comment drawing frame rate limit."

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u306e\u4e0a\u9650\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    const-string v2, "I will change the display method suitable for each tablet, smartphone"

    const-string v3, "\u30bf\u30d6\u30ec\u30c3\u30c8\u3084\u30b9\u30de\u30fc\u30c8\u30d5\u30a9\u30f3\u306b\u9069\u3057\u305f\u8868\u793a\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    const-string v2, "I will change the method of playing videos (streaming / cache)"

    const-string v3, "\u52d5\u753b\u306e\u518d\u751f\u65b9\u6cd5\uff08\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\uff0f\u30ad\u30e3\u30c3\u30b7\u30e5\uff09\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    const-string v2, "I will change the language of the comment and video information. (The default is subject to the language of the entire application.)"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3067\u304d\u307e\u3059\uff08\u30c7\u30d5\u30a9\u30eb\u30c8\u306f\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u306b\u5f93\u3044\u307e\u3059\uff09\u3002"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    const-string v2, "And what to do when you tap the video list. (Item other than that you set will be displayed by tapping the triangle in the bottom right-hand corner.)"

    const-string v3, "\u52d5\u753b\u30ea\u30b9\u30c8\u3092\u30bf\u30c3\u30d7\u3057\u305f\u3068\u304d\u306e\u52d5\u4f5c\u3092\u8a2d\u5b9a\u3057\u307e\u3059\uff08\u8a2d\u5b9a\u4ee5\u5916\u306e\u9805\u76ee\u306f\u53f3\u4e0b\u306e\u4e09\u89d2\u3092\u30bf\u30c3\u30d7\u3059\u308b\u3068\u8868\u793a\u3055\u308c\u307e\u3059\uff09\u3002"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    const-string v2, "Video List of cached (Viewable offline)"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\uff08\u30aa\u30d5\u30e9\u30a4\u30f3\u8996\u8074\u53ef\u80fd\uff09"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    const-string v2, "Keywords video, tag search"

    const-string v3, "\u52d5\u753b\u306e\u30ad\u30fc\u30ef\u30fc\u30c9\u3001\u30bf\u30b0\u691c\u7d22"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v2, "\u8a00\u8a9e"

    const-string v3, "Language"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    const-string v4, "Pop-up playback"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    const-string v2, " comments. "

    const-string v5, " \u5247\u7559\u8a00\u3002"

    filled-new-array {v2, v5}, [Ljava/lang/String;

    move-result-object v2

    const-string v5, "\u4ef6\u3002"

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    const-string v2, "Settings"

    const-string v5, "\u8a2d\u5b9a"

    filled-new-array {v2, v5}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v2, "Standard"

    const-string v6, "\u6a19\u6e96"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u6a19\u6e96"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const-string v2, "Auto"

    const-string v6, "\u81ea\u52d5"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u81ea\u52d5"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-string v2, "Speed"

    const-string v6, "\u901f\u5ea6"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u901f\u5ea6"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const-string v2, "\u00d7"

    const-string v6, "\u500d"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u500d"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string v2, "Smallest"

    const-string v6, "\u6700\u5c0f"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u6700\u5c0f"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v2, "Small"

    const-string v6, "\u5c0f"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u5c0f"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v2, "Large"

    const-string v6, "\u5927"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u5927"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v2, "Largest"

    const-string v6, "\u6700\u5927"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u6700\u5927"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string v2, "Cooking"

    const-string v6, "\u6599\u7406"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u6599\u7406"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    const-string v2, "Nature"

    const-string v6, "\u81ea\u7136"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u81ea\u7136"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v2, "Animals"

    const-string v6, "\u52d5\u7269"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "\u52d5\u7269"

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v2, "Use without signing in"

    const-string v6, "\u4e0d\u767b\u5165\u4f7f\u7528"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v7, "Playback mode"

    const-string v8, "\u64ad\u653e\u6a21\u5f0f"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v9, "Settings saved"

    const-string v10, "\u5df2\u5132\u5b58\u8a2d\u5b9a"

    filled-new-array {v9, v10}, [Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v11, "\u8a9e\u8a00"

    filled-new-array {v3, v11}, [Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v3, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v12, "\u61f8\u6d6e\u8996\u7a97\u64ad\u653e"

    filled-new-array {v4, v12}, [Ljava/lang/String;

    move-result-object v13

    invoke-interface {v0, v4, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v13, "Signed in successfully"

    const-string v14, "\u767b\u5165\u6210\u529f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v15

    invoke-interface {v0, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    const-string v15, "Reset to default"

    move-object/from16 v16, v1

    const-string v1, "\u9084\u539f\u9810\u8a2d\u503c"

    filled-new-array {v15, v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v15, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306b\u623b\u3059"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    const-string v1, "Use cached files for offline playback"

    const-string v15, "\u4f7f\u7528\u5feb\u53d6\u6a94\u6848\u96e2\u7dda\u64ad\u653e"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    const-string v15, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u307f\u3092\u4f7f\u7528\u3057\u518d\u751f"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v1, "Always"

    const-string v15, "\u4e00\u5f8b\u4f7f\u7528"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    const-string v15, "\u5e38\u306b\u4f7f\u7528"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    const-string v1, "On mobile data only"

    const-string v15, "\u50c5\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    const-string v15, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u307f"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string v1, "Never"

    const-string v15, "\u4e0d\u4f7f\u7528"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    const-string v15, "\u4f7f\u7528\u3057\u306a\u3044"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v1, "Quality on mobile data"

    const-string v15, "\u884c\u52d5\u7db2\u8def\u756b\u8cea"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    const-string v15, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u306e\u753b\u8cea"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    const-string v1, "Quality"

    const-string v15, "\u756b\u8cea"

    filled-new-array {v1, v15}, [Ljava/lang/String;

    move-result-object v1

    move-object/from16 v17, v9

    const-string v9, "\u54c1\u8cea"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v1, "Comments to load"

    const-string v9, "\u7559\u8a00\u8f09\u5165\u6578\u91cf"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const-string v1, "Target: "

    const-string v9, "\u76ee\u6a19\uff1a"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u53d6\u5f97\u6570\uff1a"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string v1, "Applies on the next playback. The number of additional comments depends on the video and sign-in status."

    const-string v9, "\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548\u3002\u53ef\u984d\u5916\u8f09\u5165\u7684\u7559\u8a00\u6578\u91cf\u4f9d\u5f71\u7247\u53ca\u767b\u5165\u72c0\u614b\u800c\u7570\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6b21\u56de\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\u3055\u308c\u307e\u3059\u3002\u8ffd\u52a0\u53d6\u5f97\u6570\u306f\u52d5\u753b\u3084\u30ed\u30b0\u30a4\u30f3\u72b6\u614b\u306b\u3088\u308a\u7570\u306a\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    const-string v1, "Save debug log"

    const-string v9, "\u5132\u5b58\u5075\u932f\u8a18\u9304"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    const-string v1, "Save playback and network logs to Downloads"

    const-string v9, "\u5c07\u64ad\u653e\u8207\u7db2\u8def\u8a18\u9304\u5132\u5b58\u81f3 Downloads"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    const-string v1, "Save diagnostic logs, including playback status and network errors, to the Downloads folder for troubleshooting."

    const-string v9, "\u5c07\u64ad\u653e\u72c0\u614b\u8207\u7db2\u8def\u932f\u8aa4\u7b49\u8a3a\u65b7\u8a18\u9304\u5132\u5b58\u81f3 Downloads \u8cc7\u6599\u593e\uff0c\u4ee5\u4fbf\u6392\u67e5\u554f\u984c\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u72b6\u6cc1\u3084\u901a\u4fe1\u30a8\u30e9\u30fc\u306a\u3069\u306e\u8a3a\u65ad\u30ed\u30b0\u3092 Download \u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58\u3057\u307e\u3059\u3002\u4e0d\u5177\u5408\u5831\u544a\u6642\u306b\u5229\u7528\u3067\u304d\u307e\u3059\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    const-string v1, "Nicoru count"

    const-string v9, "Nico \u8b9a\u6578\u91cf\u9806\u5e8f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30cb\u30b3\u308b\u6570\u9806"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v1, "Standard (no additional loading)"

    const-string v9, "\u6a19\u6e96\uff08\u4e0d\u984d\u5916\u8f09\u5165\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6a19\u6e96\uff08\u8ffd\u52a0\u53d6\u5f97\u306a\u3057\uff09"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    const-string v1, "Applies on the next playback. Additional comments depend on the video and sign-in status."

    const-string v9, "\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548\u3002\u53ef\u984d\u5916\u8f09\u5165\u7684\u7559\u8a00\u6578\u91cf\u4f9d\u5f71\u7247\u53ca\u767b\u5165\u72c0\u614b\u800c\u7570\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\u3002\u8ffd\u52a0\u53d6\u5f97\u3067\u304d\u308b\u4ef6\u6570\u306f\u52d5\u753b\u3084\u30ed\u30b0\u30a4\u30f3\u72b6\u614b\u306b\u3088\u3063\u3066\u7570\u306a\u308a\u307e\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string v1, "Follow playback position"

    const-string v9, "\u81ea\u52d5\u8ddf\u96a8\u64ad\u653e\u4f4d\u7f6e"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u4f4d\u7f6e\u306b\u81ea\u52d5\u8ffd\u5f93"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v1, "Playback time"

    const-string v9, "\u64ad\u653e\u6642\u9593\u9806\u5e8f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u6642\u9593\u9806"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v1, "Posting time"

    const-string v9, "\u767c\u4f48\u6642\u9593\u9806\u5e8f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6295\u7a3f\u6642\u9593\u9806"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string v1, "Comment shadow style"

    const-string v9, "\u5f48\u5e55\u9670\u5f71\u6a23\u5f0f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u7a2e\u985e"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v1, "Comment shadow size"

    const-string v9, "\u5f48\u5e55\u9670\u5f71\u5927\u5c0f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u5927\u304d\u3055"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v1, "Maximum comment rows"

    const-string v9, "\u5f48\u5e55\u6700\u5927\u884c\u6578"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30e1\u30f3\u30c8\u306e\u6700\u5927\u884c\u6570"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v1, "Comment display duration"

    const-string v9, "\u5f48\u5e55\u986f\u793a\u6642\u9593"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30e1\u30f3\u30c8\u306e\u8868\u793a\u6642\u9593"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v1, "Use the default quality setting"

    const-string v9, "\u4f7f\u7528\u9810\u8a2d\u756b\u8cea\u8a2d\u5b9a"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u901a\u5e38\u306e\u753b\u8cea\u8a2d\u5b9a\u306b\u5f93\u3046"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v1, "Rankings"

    const-string v9, "\u6392\u884c\u699c"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string v1, "Legacy comment path limit"

    const-string v9, "\u820a\u7559\u8a00\u8def\u5f91\u8f09\u5165\u4e0a\u9650"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u65e7\u30b3\u30e1\u30f3\u30c8\u7d4c\u8def\u306e\u53d6\u5f97\u4e0a\u9650"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const-string v1, "Legacy comment path only; applies on the next playback"

    const-string v9, "\u50c5\u9069\u7528\u65bc\u820a\u7559\u8a00\u8def\u5f91\uff0c\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u65e7\u30b3\u30e1\u30f3\u30c8\u7d4c\u8def\u306b\u306e\u307f\u9069\u7528\u3002\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    const-string v1, "Automatic (based on video length)"

    const-string v9, "\u81ea\u52d5\uff08\u4f9d\u5f71\u7247\u9577\u5ea6\u8abf\u6574\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u81ea\u52d5\uff08\u52d5\u753b\u306e\u9577\u3055\u306b\u5fdc\u3058\u3066\u5909\u66f4\uff09"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string v1, " items"

    const-string v9, " \u7b46"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4ef6"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v1, "Save the debug log to Downloads?"

    const-string v9, "\u8981\u5c07\u5075\u932f\u7d00\u9304\u5132\u5b58\u81f3 Downloads \u55ce\uff1f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    const-string v1, "Save"

    const-string v9, "\u5132\u5b58"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4fdd\u5b58"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    const-string v1, "Search suggestions"

    const-string v9, "\u641c\u5c0b\u5efa\u8b70"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u691c\u7d22\u30b5\u30b8\u30a7\u30b9\u30c8"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    const-string v1, "Show suggestions while entering a search"

    const-string v9, "\u8f38\u5165\u641c\u5c0b\u6642\u986f\u793a\u5efa\u8b70"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u691c\u7d22\u5165\u529b\u6642\u306b\u5019\u88dc\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const-string v1, "Reduce displayed comments and frame rate for stable casting."

    const-string v9, "\u6e1b\u5c11\u986f\u793a\u7684\u5f48\u5e55\u6578\u91cf\u4e26\u9650\u5236\u5f71\u683c\u7387\uff0c\u4ee5\u7a69\u5b9a\u6295\u653e\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u52d5\u4f5c\u3092\u5b89\u5b9a\u3055\u305b\u308b\u305f\u3081\u8868\u793a\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u91cf\u3092\u5c11\u306a\u304f\u3057\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3092\u4f4e\u304f\u5236\u9650\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v1, "Saved to Downloads"

    const-string v9, "\u5df2\u5132\u5b58\u81f3 Downloads"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "Download\u306b\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string v1, "Could not save the log"

    const-string v9, "\u7121\u6cd5\u5132\u5b58\u8a18\u9304"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ed\u30b0\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v1, "Theme"

    const-string v9, "\u4e3b\u984c"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30c6\u30fc\u30de"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v1, "Light mode"

    const-string v9, "\u6dfa\u8272\u6a21\u5f0f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30e9\u30a4\u30c8\u30e2\u30fc\u30c9"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const-string v1, "Dark mode"

    const-string v9, "\u6df1\u8272\u6a21\u5f0f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    const-string v1, "Change playback speed"

    const-string v9, "\u8b8a\u66f4\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u901f\u5ea6\u5909\u66f4"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string v1, "Swipe to adjust volume"

    const-string v9, "\u6ed1\u52d5\u8abf\u6574\u97f3\u91cf"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u8abf\u6574"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v1, "Swipe vertically to adjust volume. When brightness gestures are also enabled, use the right side of the video."

    const-string v9, "\u4e0a\u4e0b\u6ed1\u52d5\u8abf\u6574\u97f3\u91cf\u3002\u82e5\u540c\u6642\u555f\u7528\u4eae\u5ea6\u8abf\u6574\uff0c\u8acb\u5728\u5f71\u7247\u53f3\u5074\u64cd\u4f5c\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u97f3\u91cf\u3092\u8abf\u6574\u3057\u307e\u3059\u3002\u8f1d\u5ea6\u8abf\u6574\u3082ON\u306e\u5834\u5408\u306f\u52d5\u753b\u306e\u53f3\u5074\u3067\u64cd\u4f5c\u3057\u307e\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v1, "Swipe to adjust brightness"

    const-string v9, "\u6ed1\u52d5\u8abf\u6574\u4eae\u5ea6"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b9\u30ef\u30a4\u30d7\u3067\u8f1d\u5ea6\u8abf\u6574"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v1, "Swipe vertically to adjust video brightness. When volume gestures are also enabled, use the left side of the video."

    const-string v9, "\u4e0a\u4e0b\u6ed1\u52d5\u8abf\u6574\u64ad\u653e\u756b\u9762\u7684\u4eae\u5ea6\u3002\u82e5\u540c\u6642\u555f\u7528\u97f3\u91cf\u8abf\u6574\uff0c\u8acb\u5728\u5f71\u7247\u5de6\u5074\u64cd\u4f5c\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4e0a\u4e0b\u30b9\u30ef\u30a4\u30d7\u3067\u518d\u751f\u753b\u9762\u306e\u8f1d\u5ea6\u3092\u8abf\u6574\u3057\u307e\u3059\u3002\u97f3\u91cf\u8abf\u6574\u3082ON\u306e\u5834\u5408\u306f\u52d5\u753b\u306e\u5de6\u5074\u3067\u64cd\u4f5c\u3057\u307e\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    const-string v1, "Cache copy completed"

    const-string v9, "\u5feb\u53d6\u8907\u88fd\u5b8c\u6210"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u30b3\u30d4\u30fc\u304c\u5b8c\u4e86\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const-string v1, "Copying cached videos\u2026"

    const-string v9, "\u6b63\u5728\u8907\u88fd\u5feb\u53d6\u5f71\u7247\u2026"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc\u4e2d"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    const-string v1, "Download cache"

    const-string v9, "\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string v1, "Downloading cache"

    const-string v9, "\u6b63\u5728\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u4e2d"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    const-string v1, "Cache download complete"

    const-string v9, "\u5feb\u53d6\u4e0b\u8f09\u5b8c\u6210"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u5b8c\u4e86"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string v1, "Downloaded: "

    const-string v9, "\u5df2\u4e0b\u8f09\uff1a"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u53d6\u5f97\u6e08\u307f: "

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string v1, "Copy"

    const-string v9, "\u8907\u88fd"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30d4\u30fc"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    const-string v1, "Could not copy the cache. The original files have been kept."

    const-string v9, "\u7121\u6cd5\u8907\u88fd\u5feb\u53d6\u3002\u539f\u59cb\u6a94\u6848\u5df2\u4fdd\u7559\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b3\u30d4\u30fc\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u4fdd\u6301\u3055\u308c\u3066\u3044\u307e\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v1, "Could not open the folder picker"

    const-string v9, "\u7121\u6cd5\u958b\u555f\u8cc7\u6599\u593e\u9078\u64c7\u756b\u9762"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d5\u30a9\u30eb\u30c0\u30fc\u9078\u629e\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    const-string v1, "Copy cached videos from the previous folder. The original files will not be deleted."

    const-string v9, "\u5f9e\u5148\u524d\u7684\u5132\u5b58\u4f4d\u7f6e\u8907\u88fd\u5feb\u53d6\u5f71\u7247\u3002\u539f\u59cb\u6a94\u6848\u4e0d\u6703\u88ab\u522a\u9664\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4ee5\u524d\u306e\u4fdd\u5b58\u5148\u304b\u3089\u30b3\u30d4\u30fc\u3057\u307e\u3059\u3002\u5143\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u524a\u9664\u3057\u307e\u305b\u3093"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const-string v1, "Cannot use this folder. Please choose another one."

    const-string v9, "\u7121\u6cd5\u4f7f\u7528\u6b64\u5132\u5b58\u4f4d\u7f6e\u3002\u8acb\u9078\u64c7\u5176\u4ed6\u8cc7\u6599\u593e\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4fdd\u5b58\u5148\u3092\u4f7f\u7528\u3067\u304d\u307e\u305b\u3093\u3002\u5225\u306e\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v1, "Later"

    const-string v9, "\u7a0d\u5f8c"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u5f8c\u3067"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const-string v1, "Copy existing cache"

    const-string v9, "\u8907\u88fd\u73fe\u6709\u5feb\u53d6"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u65e2\u5b58\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u30b3\u30d4\u30fc"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string v1, "Choose a cache folder in Settings"

    const-string v9, "\u8acb\u5728\u8a2d\u5b9a\u4e2d\u9078\u64c7\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u8a2d\u5b9a\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    const-string v1, "Casting video"

    const-string v9, "\u6b63\u5728\u6295\u653e\u5f71\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ad\u30e3\u30b9\u30c8\u518d\u751f\u4e2d\u3067\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v1, "Allow display over other apps to use pop-up playback"

    const-string v9, "\u82e5\u8981\u4f7f\u7528\u61f8\u6d6e\u8996\u7a97\u64ad\u653e\uff0c\u8acb\u5141\u8a31\u986f\u793a\u5728\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u4e0a\u5c64"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u3092\u5229\u7528\u3059\u308b\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3092\u8a31\u53ef\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v1, "Permissions"

    const-string v9, "\u6b0a\u9650"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d1\u30fc\u30df\u30c3\u30b7\u30e7\u30f3\u306e\u53d6\u5f97"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v1, "This video uses RTMP and cannot be played"

    const-string v9, "\u6b64\u5f71\u7247\u4f7f\u7528 RTMP\uff0c\u7121\u6cd5\u64ad\u653e"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u3053\u306e\u52d5\u753b\u306fRTMP\u3092\u4f7f\u7528\u3057\u3066\u3044\u308b\u70ba\u518d\u751f\u3067\u304d\u307e\u305b\u3093"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    const-string v1, "Play"

    const-string v9, "\u64ad\u653e"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u3059\u308b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-string v1, "Playlist"

    const-string v9, "\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u30ea\u30b9\u30c8"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v1, "Gameplay videos"

    const-string v9, "\u904a\u6232\u5be6\u6cc1\u5f71\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u5b9f\u6cc1\u30d7\u30ec\u30a4\u52d5\u753b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-string v1, "Virtual"

    const-string v9, "\u865b\u64ec"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d0\u30fc\u30c1\u30e3\u30eb"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string v1, "Random"

    const-string v9, "\u96a8\u6a5f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30e9\u30f3\u30c0\u30e0"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v1, "Least popular first"

    const-string v9, "\u4eba\u6c23\u7531\u4f4e\u5230\u9ad8"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4eba\u6c17\u304c\u4f4e\u3044\u9806"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    const-string v1, "Most popular first"

    const-string v9, "\u4eba\u6c23\u7531\u9ad8\u5230\u4f4e"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4eba\u6c17\u304c\u9ad8\u3044\u9806"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    const-string v1, "Default order"

    const-string v9, "\u4e0d\u6307\u5b9a\u6392\u5e8f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4e26\u3073\u9806\u6307\u5b9a\u306a\u3057"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    const-string v1, "Recommended for you"

    const-string v9, "\u70ba\u4f60\u63a8\u85a6\u7684\u5f71\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u3042\u306a\u305f\u306b\u30aa\u30b9\u30b9\u30e1\u306e\u52d5\u753b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    const-string v1, "Videos recommended based on your viewing history"

    const-string v9, "\u6839\u64da\u89c0\u770b\u7d00\u9304\u63a8\u85a6\u7684\u5f71\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u904e\u53bb\u306e\u8996\u8074\u60c5\u5831\u306a\u3069\u304b\u3089\u306e\u30aa\u30b9\u30b9\u30e1\u52d5\u753b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    const-string v1, "Disconnect from the device"

    const-string v9, "\u4e2d\u65b7\u8207\u88dd\u7f6e\u7684\u9023\u7dda"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u7aef\u672b\u3068\u306e\u63a5\u7d9a\u3092\u89e3\u9664"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    const-string v1, "Already added"

    const-string v9, "\u5df2\u52a0\u5165"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u65e2\u306b\u767b\u9332\u6e08\u307f\u3067\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    const-string v1, "Remove %s from favorites?"

    const-string v9, "\u8981\u5c07 %s \u5f9e\u6211\u7684\u6700\u611b\u79fb\u9664\u55ce\uff1f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "%s \u3092\u304a\u6c17\u306b\u5165\u308a\u304b\u3089\u89e3\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    const-string v1, "Could not follow"

    const-string v9, "\u7121\u6cd5\u8ffd\u8e64"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d5\u30a9\u30ed\u30fc\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    const-string v1, "Followed"

    const-string v9, "\u5df2\u8ffd\u8e64"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d5\u30a9\u30ed\u30fc\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    const-string v1, "Follow %s?"

    const-string v9, "\u8981\u8ffd\u8e64 %s \u55ce\uff1f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "%s \u3092\u30d5\u30a9\u30ed\u30fc\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    const-string v1, "Follow"

    const-string v9, "\u8ffd\u8e64"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d5\u30a9\u30ed\u30fc"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const-string v1, "Following"

    const-string v9, "\u5df2\u8ffd\u8e64"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30d5\u30a9\u30ed\u30fc\u6e08\u307f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    const-string v1, "Ascending (top to bottom)"

    const-string v9, "\u905e\u589e\uff08\u7531\u4e0a\u5230\u4e0b\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6607\u9806(\u4e0a\u304b\u3089\u4e0b)"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    const-string v1, "Descending (bottom to top)"

    const-string v9, "\u905e\u6e1b\uff08\u7531\u4e0b\u5230\u4e0a\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u964d\u9806(\u4e0b\u304b\u3089\u4e0a)"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    const-string v1, "Views:<b>%s</b> Comments:<b>%s</b> Mylists:<b>%s</b> Likes:<b>%s</b>"

    const-string v9, "\u89c0\u770b:<b>%s</b> \u7559\u8a00:<b>%s</b> \u64ad\u653e\u6e05\u55ae:<b>%s</b> \u6309\u8b9a:<b>%s</b>"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f:<b>%s</b> \u30b3\u30e1:<b>%s</b> \u30de\u30a4:<b>%s</b> \u3044\u3044\u306d:<b>%s</b>"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    const-string v1, "Genre:<font color=\'#000000\'><b>%s</b></font><br>Best rank:<font color=\'#000000\'><b>%s</b></font>"

    const-string v9, "\u985e\u5225:<font color=\'#000000\'><b>%s</b></font><br>\u6700\u9ad8\u6392\u540d:<font color=\'#000000\'><b>%s</b></font>"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b8\u30e3\u30f3\u30eb:<font color=\'#000000\'><b>%s</b></font><br>\u904e\u53bb\u6700\u9ad8:<font color=\'#000000\'><b>%s</b></font>"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    const-string v1, "Category:<font color=\'#000000\'><b>%s</b></font><br>Yesterday:<font color=\'#000000\'><b>%s</b></font> (Best:<font color=\'#000000\'><b>%s</b></font>)"

    const-string v9, "\u5206\u985e:<font color=\'#000000\'><b>%s</b></font><br>\u6628\u65e5\u6392\u540d:<font color=\'#000000\'><b>%s</b></font>\uff08\u6700\u9ad8\u6392\u540d:<font color=\'#000000\'><b>%s</b></font>\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30ab\u30c6\u30b4\u30ea:<font color=\'#000000\'><b>%s</b></font><br>\u524d\u65e5\u9806\u4f4d:<font color=\'#000000\'><b>%s</b></font>(\u904e\u53bb\u6700\u9ad8:<font color=\'#000000\'><b>%s</b></font>)"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    const-string v1, "Access to media and files is required to save watch history and download cached videos.\nRestart the app to show the permission dialog again, or grant storage access under Apps \u2192 nicoid in your device settings."

    const-string v9, "\u5132\u5b58\u89c0\u770b\u7d00\u9304\u53ca\u4e0b\u8f09\u5feb\u53d6\u5f71\u7247\u9700\u8981\u5a92\u9ad4\u8207\u6a94\u6848\u5b58\u53d6\u6b0a\u9650\u3002\n\u8acb\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u4ee5\u518d\u6b21\u986f\u793a\u6b0a\u9650\u5c0d\u8a71\u6846\uff0c\u6216\u5728\u88dd\u7f6e\u8a2d\u5b9a\u7684\u300c\u61c9\u7528\u7a0b\u5f0f \u2192 nicoid\u300d\u4e2d\u6388\u4e88\u5132\u5b58\u7a7a\u9593\u5b58\u53d6\u6b0a\u9650\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u5c65\u6b74\u306e\u4fdd\u5b58\u3084\u30ad\u30e3\u30c3\u30b7\u30e5\u306a\u3069\u3092\u53d6\u5f97\u3059\u308b\u70ba\u306b\u30e1\u30c7\u30a3\u30a2\u3001\u30d5\u30a1\u30a4\u30eb\u3078\u306e\u30a2\u30af\u30bb\u30b9\u8a31\u53ef\u304c\u5fc5\u8981\u3067\u3059\u3002\n\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u518d\u5ea6\u8a31\u53ef\u30c0\u30a4\u30a2\u30ed\u30b0\u3092\u8868\u793a\u3055\u305b\u308b\u304b\u3001\u7aef\u672b\u306e\u8a2d\u5b9a\u753b\u9762\u304b\u3089\u30a2\u30d7\u30ea\u2192nicoid\u3092\u9078\u629e\u3057\u3001\u30b9\u30c8\u30ec\u30fc\u30b8\u306e\u30a2\u30af\u30bb\u30b9\u6a29\u9650\u3092\u4ed8\u4e0e\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    const-string v1, "Paid"

    const-string v9, "\u4ed8\u8cbb"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6709\u6599"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    const-string v1, "Device storage (app-specific folder)"

    const-string v9, "\u88dd\u7f6e\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u672c\u4f53\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u30fc\uff09"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    const-string v1, "SD card (app-specific folder)"

    const-string v9, "SD \u5361\uff08\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "SD\u30ab\u30fc\u30c9\uff08\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u30fc\uff09"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    const-string v1, "Internal storage (private app data)"

    const-string v9, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u79c1\u4eba\u8cc7\u6599\uff09"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u5185\u90e8\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u975e\u516c\u958b\u9818\u57df\uff09"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const-string v1, "Shorts"

    const-string v9, "\u77ed\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    const-string v1, "Watch short videos"

    const-string v9, "\u89c0\u770b\u77ed\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u8996\u8074"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    const-string v1, "Restart app"

    const-string v9, "\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    const-string v1, "Share debug log"

    const-string v9, "\u5206\u4eab\u5075\u932f\u7d00\u9304"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    const-string v1, "Other"

    const-string v9, "\u5176\u4ed6"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u305d\u306e\u4ed6"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    const-string v1, "Restart to apply settings"

    const-string v9, "\u91cd\u65b0\u555f\u52d5\u4ee5\u5957\u7528\u8a2d\u5b9a"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u8a2d\u5b9a\u3092\u53cd\u6620\u3057\u3066\u6700\u521d\u304b\u3089\u958b\u304f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const-string v1, "App settings"

    const-string v9, "\u61c9\u7528\u7a0b\u5f0f\u8a2d\u5b9a"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30a2\u30d7\u30ea\u8a2d\u5b9a"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string v1, "General and playback settings"

    const-string v9, "\u4e00\u822c\u8207\u64ad\u653e\u8a2d\u5b9a"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u4e00\u822c\u8a2d\u5b9a\u30fb\u518d\u751f\u8a2d\u5b9a"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    const-string v1, "Show Shorts in the sidebar"

    const-string v9, "\u5728\u5074\u908a\u9078\u55ae\u986f\u793a\u77ed\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30b7\u30e7\u30fc\u30c8\u3092\u8868\u793a"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    const-string v1, "Show the Shorts entry below Rankings"

    const-string v9, "\u5728\u6392\u884c\u699c\u4e0b\u65b9\u986f\u793a\u77ed\u7247\u5165\u53e3"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u4e0b\u306b\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u5165\u53e3\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const-string v1, "Debug"

    const-string v9, "\u5075\u932f"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30c7\u30d0\u30c3\u30b0"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    const-string v1, "\u8a00\u8a9e"

    filled-new-array {v3, v11}, [Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    const-string v1, "Share diagnostic logs, including playback errors, request destinations and response codes, when reporting a problem. Review the log and recipient before sharing."

    const-string v9, "\u56de\u5831\u554f\u984c\u6642\u53ef\u5206\u4eab\u8a3a\u65b7\u7d00\u9304\uff0c\u5167\u5bb9\u5305\u542b\u64ad\u653e\u932f\u8aa4\u3001\u9023\u7dda\u76ee\u6a19\u8207\u56de\u61c9\u4ee3\u78bc\u3002\u5206\u4eab\u524d\u8acb\u78ba\u8a8d\u7d00\u9304\u5167\u5bb9\u53ca\u63a5\u6536\u5c0d\u8c61\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u751f\u30a8\u30e9\u30fc\u3084\u901a\u4fe1\u5148\u3001\u5fdc\u7b54\u30b3\u30fc\u30c9\u306a\u3069\u306e\u8a3a\u65ad\u30ed\u30b0\u3092\u5171\u6709\u3057\u307e\u3059\u3002\u4e0d\u5177\u5408\u306e\u5831\u544a\u6642\u306b\u5229\u7528\u3067\u304d\u307e\u3059\u3002\u5171\u6709\u524d\u306b\u30ed\u30b0\u306e\u5185\u5bb9\u3068\u9001\u4fe1\u5148\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    const-string v1, "Choose a video to watch"

    const-string v9, "\u9078\u64c7\u60f3\u770b\u7684\u5f71\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u6c17\u306b\u306a\u308b\u52d5\u753b\u3092\u9078\u3093\u3067\u518d\u751f"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    const-string v1, "Search short videos"

    const-string v9, "\u641c\u5c0b\u77ed\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    const-string v1, "Search"

    const-string v9, "\u641c\u5c0b"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u691c\u7d22"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    const-string v1, "Loading short videos\u2026"

    const-string v9, "\u6b63\u5728\u8f09\u5165\u77ed\u7247\u2026"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u8aad\u307f\u8fbc\u3093\u3067\u3044\u307e\u3059\u2026"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    const-string v1, "Retry"

    const-string v9, "\u91cd\u8a66"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u518d\u8a66\u884c"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-string v1, "Return to NicoNico home"

    const-string v9, "\u8fd4\u56de Niconico \u9996\u9801"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306e\u30db\u30fc\u30e0\u306b\u623b\u308b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    const-string v1, "Return to NicoNico"

    const-string v9, "\u8fd4\u56de Niconico"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306b\u623b\u308b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    const-string v1, "Refresh short videos"

    const-string v9, "\u91cd\u65b0\u6574\u7406\u77ed\u7247\u6e05\u55ae"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u4e00\u89a7\u3092\u66f4\u65b0"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    const-string v1, "Could not load short videos. Check your connection and try again."

    const-string v9, "\u7121\u6cd5\u8f09\u5165\u77ed\u7247\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    const-string v1, " videos"

    const-string v9, " \u90e8\u5f71\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, " \u672c\u306e\u52d5\u753b"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const-string v1, "NicoNico  \u2022  "

    const-string v9, "Niconico  \u2022  "

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b  \u2022  "

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string v1, "Searching short videos\u2026"

    const-string v9, "\u6b63\u5728\u641c\u5c0b\u77ed\u7247\u2026"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22\u3057\u3066\u3044\u307e\u3059\u2026"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v1, "Could not load search results. Check your connection and try again."

    const-string v9, "\u7121\u6cd5\u8f09\u5165\u641c\u5c0b\u7d50\u679c\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u691c\u7d22\u7d50\u679c\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v1, "No short videos found. Try another keyword."

    const-string v9, "\u627e\u4e0d\u5230\u77ed\u7247\u3002\u8acb\u5617\u8a66\u5176\u4ed6\u95dc\u9375\u5b57\u3002"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u30ad\u30fc\u30ef\u30fc\u30c9\u3092\u5909\u3048\u3066\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string v1, "Current short"

    const-string v9, "\u76ee\u524d\u7684\u77ed\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u73fe\u5728\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v1, "Previous short"

    const-string v9, "\u4e0a\u4e00\u90e8\u77ed\u7247"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u524d\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    const-string v1, "Short video list"

    const-string v9, "\u77ed\u7247\u6e05\u55ae"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u4e00\u89a7"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v1, "Shorts home"

    const-string v9, "\u77ed\u7247\u9996\u9801"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u306e\u30db\u30fc\u30e0"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    const-string v1, "Video details"

    const-string v9, "\u5f71\u7247\u8cc7\u8a0a"

    move-object/from16 v18, v10

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v10

    move-object/from16 v19, v7

    const-string v7, "\u52d5\u753b\u60c5\u5831"

    invoke-interface {v0, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    const-string v7, "Next short"

    const-string v10, "\u4e0b\u4e00\u90e8\u77ed\u7247"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u6b21\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    const-string v7, "Swipe up for the next video or down for the previous one"

    const-string v10, "\u5411\u4e0a\u6ed1\u52d5\u5207\u63db\u4e0b\u4e00\u90e8\uff0c\u5411\u4e0b\u6ed1\u52d5\u5207\u63db\u4e0a\u4e00\u90e8"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u4e0a\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u6b21\u3001\u4e0b\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u524d\u306e\u52d5\u753b"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    const-string v7, "Short videos"

    const-string v10, "\u77ed\u7247"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string v7, "Refresh"

    const-string v10, "\u91cd\u65b0\u6574\u7406"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u66f4\u65b0"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    const-string v7, "Close"

    const-string v10, "\u95dc\u9589"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u9589\u3058\u308b"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    const-string v7, "This is the first video"

    const-string v10, "\u9019\u662f\u7b2c\u4e00\u90e8\u5f71\u7247"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u6700\u521d\u306e\u52d5\u753b\u3067\u3059"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v7, "Could not load the list. Please try again."

    const-string v10, "\u7121\u6cd5\u8f09\u5165\u6e05\u55ae\u3002\u8acb\u518d\u8a66\u4e00\u6b21\u3002"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v7, "No more short videos found"

    const-string v10, "\u6c92\u6709\u627e\u5230\u66f4\u591a\u77ed\u7247"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u65b0\u3057\u3044\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v7, "Refresh did not complete. Please try again."

    const-string v10, "\u91cd\u65b0\u6574\u7406\u672a\u5b8c\u6210\u3002\u8acb\u518d\u8a66\u4e00\u6b21\u3002"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u66f4\u65b0\u304c\u5b8c\u4e86\u3057\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v7, "Maximum quality (highest available resolution; varies by video)"

    const-string v10, "\u6700\u9ad8\u756b\u8cea\uff08\u6700\u9ad8\u53ef\u7528\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u6700\u5927\u753b\u8cea\uff08\u6700\u5927\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    const-string v7, "High quality (highest available resolution; varies by video)"

    const-string v10, "\u9ad8\u756b\u8cea\uff08\u6700\u9ad8\u53ef\u7528\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u9ad8\u753b\u8cea\uff08\u6700\u5927\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    const-string v7, "Standard quality (second-highest resolution; varies by video)"

    const-string v10, "\u6a19\u6e96\u756b\u8cea\uff08\u7b2c\u4e8c\u9ad8\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u6a19\u6e96\u753b\u8cea\uff082\u756a\u76ee\u306e\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    const-string v7, "Low quality (third-highest resolution; varies by video)"

    const-string v10, "\u4f4e\u756b\u8cea\uff08\u7b2c\u4e09\u9ad8\u89e3\u6790\u5ea6\uff0c\u4f9d\u5f71\u7247\u800c\u7570\uff09"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u4f4e\u753b\u8cea\uff083\u756a\u76ee\u306e\u89e3\u50cf\u5ea6\u30fb\u52d5\u753b\u306b\u3088\u308a\u5909\u52d5\uff09"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    const-string v7, "Maximum quality"

    const-string v10, "\u6700\u9ad8\u756b\u8cea"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u6700\u5927\u753b\u8cea"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    const-string v7, "High quality"

    const-string v10, "\u9ad8\u756b\u8cea"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const-string v10, "\u9ad8\u753b\u8cea"

    invoke-interface {v0, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    const-string v7, "Standard quality"

    const-string v10, "\u6a19\u6e96\u756b\u8cea"

    move-object/from16 v20, v8

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v8

    move-object/from16 v21, v2

    const-string v2, "\u6a19\u6e96\u753b\u8cea"

    invoke-interface {v0, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    const-string v2, "Low quality"

    const-string v8, "\u4f4e\u756b\u8cea"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u4f4e\u753b\u8cea"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    const-string v2, "Quality"

    filled-new-array {v2, v15}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u753b\u8cea"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    const-string v2, "Loop"

    const-string v8, "\u5faa\u74b0"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30eb\u30fc\u30d7"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    const-string v2, "Playback speed"

    const-string v8, "\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u901f\u5ea6"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    const-string v2, "Cancel"

    const-string v8, "\u53d6\u6d88"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const-string v2, "Could not retrieve video quality"

    const-string v8, "\u7121\u6cd5\u53d6\u5f97\u5f71\u7247\u756b\u8cea"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u753b\u8cea\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    const-string v2, "Quality: "

    const-string v8, "\u756b\u8cea\uff1a "

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u753b\u8cea: "

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    const-string v2, "Playback speed: "

    const-string v8, "\u64ad\u653e\u901f\u5ea6\uff1a "

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u901f\u5ea6: "

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    const-string v2, "Loop playback: "

    const-string v8, "\u5faa\u74b0\u64ad\u653e\uff1a "

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30eb\u30fc\u30d7\u518d\u751f: "

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    const-string v2, "Action failed. Please check the log."

    const-string v8, "\u64cd\u4f5c\u5931\u6557\u3002\u8acb\u67e5\u770b\u7d00\u9304\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u64cd\u4f5c\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    const-string v2, "Default playback speed"

    const-string v8, "\u9810\u8a2d\u64ad\u653e\u901f\u5ea6"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    const-string v2, "No change (original behavior)"

    const-string v8, "\u7dad\u6301\u539f\u672c\u7684\u884c\u70ba"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u4f55\u3082\u3057\u306a\u3044\uff08\u5f93\u6765\u306e\u52d5\u4f5c\uff09"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    const-string v2, "Background playback"

    const-string v8, "\u80cc\u666f\u64ad\u653e"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    filled-new-array {v4, v12}, [Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    const-string v2, "When switching apps"

    const-string v8, "\u5207\u63db\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u884c\u70ba"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    const-string v2, "When pressing Back during playback"

    const-string v8, "\u64ad\u653e\u6642\u6309\u4e0b\u8fd4\u56de\u7684\u884c\u70ba"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    const-string v2, "Save playback position"

    const-string v8, "\u5132\u5b58\u64ad\u653e\u9032\u5ea6"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u4f4d\u7f6e\u306e\u4fdd\u5b58"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    const-string v2, "Save each video\'s playback position and resume from it next time"

    const-string v8, "\u5132\u5b58\u6bcf\u90e8\u5f71\u7247\u7684\u64ad\u653e\u9032\u5ea6\uff0c\u4e0b\u6b21\u64ad\u653e\u6642\u5f9e\u8a72\u4f4d\u7f6e\u7e7c\u7e8c"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u52d5\u753b\u3054\u3068\u306b\u518d\u751f\u4f4d\u7f6e\u3092\u4fdd\u5b58\u3057\u3001\u6b21\u56de\u306e\u518d\u751f\u6642\u306b\u518d\u958b\u3057\u307e\u3059"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    const-string v2, "Allow display over other apps to use pop-up playback"

    const-string v8, "\u4f7f\u7528\u61f8\u6d6e\u8996\u7a97\u64ad\u653e\u9700\u8981\u5141\u8a31\u986f\u793a\u5728\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u4e0a\u5c64"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    const-string v2, "Patch version"

    const-string v8, "\u4fee\u88dc\u7a0b\u5f0f\u7248\u672c"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30d1\u30c3\u30c1\u30d0\u30fc\u30b8\u30e7\u30f3"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    const-string v2, "Use wallpaper colors on Android 12 and later"

    const-string v8, "\u5728 Android 12 \u4ee5\u4e0a\u7248\u672c\u5957\u7528\u684c\u5e03\u8272\u5f69"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "Android 12\u4ee5\u964d\u306e\u58c1\u7d19\u306e\u8272\u3092\u30a2\u30d7\u30ea\u306b\u9069\u7528\u3057\u307e\u3059"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    const-string v2, "Increase the comment limit"

    const-string v8, "\u63d0\u9ad8\u7559\u8a00\u8f09\u5165\u4e0a\u9650"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\u6570\u306e\u4e0a\u9650\u3092\u62e1\u5f35"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    const-string v2, "Load more comments for videos using the legacy format. This increases data usage and rendering load."

    const-string v8, "\u8f09\u5165\u66f4\u591a\u820a\u683c\u5f0f\u5f71\u7247\u7684\u7559\u8a00\u3002\u9019\u6703\u589e\u52a0\u7db2\u8def\u6d41\u91cf\u8207\u7e6a\u88fd\u8ca0\u64d4\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u5f93\u6765\u5f62\u5f0f\u306e\u52d5\u753b\u3067\u53d6\u5f97\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u6570\u3092\u5897\u3084\u3057\u307e\u3059\u3002\u901a\u4fe1\u91cf\u3068\u63cf\u753b\u8ca0\u8377\u304c\u5897\u3048\u307e\u3059"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    const-string v2, "Comment size"

    const-string v8, "\u7559\u8a00\u5927\u5c0f"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30b3\u30e1\u30f3\u30c8\u306e\u5927\u304d\u3055"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    const-string v2, "Smallest, small, standard, large or largest (applies on the next playback)"

    const-string v8, "\u6700\u5c0f\u3001\u5c0f\u3001\u6a19\u6e96\u3001\u5927\u3001\u6700\u5927\uff08\u4e0b\u6b21\u64ad\u653e\u6642\u751f\u6548\uff09"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u6700\u5c0f\u30fb\u5c0f\u30fb\u6a19\u6e96\u30fb\u5927\u30fb\u6700\u5927\uff08\u6b21\u306e\u518d\u751f\u304b\u3089\u53cd\u6620\uff09"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    const-string v2, "Connect"

    const-string v8, "\u9023\u7dda"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u63a5\u7d9a"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    const-string v2, "Choose a device to connect to"

    const-string v8, "\u9078\u64c7\u8981\u9023\u7dda\u7684\u88dd\u7f6e"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u63a5\u7d9a\u3059\u308b\u7aef\u672b\u3092\u9078\u629e"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    const-string v2, "Disconnect"

    const-string v8, "\u4e2d\u65b7\u9023\u7dda"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u63a5\u7d9a\u89e3\u9664"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    const-string v2, "Disconnect Google Cast"

    const-string v8, "\u4e2d\u65b7 Google Cast \u9023\u7dda"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "Google Cast \u306e\u63a5\u7d9a\u3092\u89e3\u9664"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    const-string v2, "Shared storage (app-specific folder)"

    const-string v8, "\u5171\u7528\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff09"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u5171\u6709\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u5c02\u7528\u9818\u57df\uff09"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    const-string v2, "Internal storage (private app folder)"

    const-string v8, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593\uff08\u61c9\u7528\u7a0b\u5f0f\u79c1\u4eba\u8cc7\u6599\u593e\uff09"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u672c\u4f53\u30b9\u30c8\u30ec\u30fc\u30b8\uff08\u30a2\u30d7\u30ea\u5185\u90e8\u9818\u57df\uff09"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    const-string v2, "Choose shared storage, an SD card or internal storage. Existing cached files will not be moved."

    const-string v8, "\u53ef\u9078\u64c7\u5171\u7528\u5132\u5b58\u7a7a\u9593\u3001SD \u5361\u6216\u5167\u90e8\u5132\u5b58\u7a7a\u9593\u3002\u73fe\u6709\u5feb\u53d6\u6a94\u6848\u4e0d\u6703\u79fb\u52d5\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u5171\u6709\u30b9\u30c8\u30ec\u30fc\u30b8\u3001SD\u30ab\u30fc\u30c9\u3001\u672c\u4f53\u5185\u90e8\u9818\u57df\u304b\u3089\u4fdd\u5b58\u5148\u3092\u9078\u629e\u3067\u304d\u307e\u3059\u3002\u5909\u66f4\u524d\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u79fb\u52d5\u3055\u308c\u307e\u305b\u3093"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    const-string v2, "New from followed users"

    const-string v8, "\u8ffd\u8e64\u5c0d\u8c61\u7684\u65b0\u5f71\u7247"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30d5\u30a9\u30ed\u30fc\u65b0\u7740"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    const-string v2, "New videos from followed users"

    const-string v8, "\u8ffd\u8e64\u5c0d\u8c61\u7684\u6700\u65b0\u5f71\u7247"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u65b0\u7740\u52d5\u753b"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    const-string v2, "Selected: "

    const-string v8, "\u5df2\u9078\u53d6\uff1a "

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u9078\u629e\u4e2d: "

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    const-string v2, " history entries. Delete them?"

    const-string v8, " \u7b46\u7d00\u9304\uff0c\u8981\u522a\u9664\u55ce\uff1f"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u4ef6\u306e\u5c65\u6b74\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    const-string v2, "Delete"

    const-string v8, "\u522a\u9664"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u524a\u9664"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    const-string v2, "Video"

    const-string v8, "\u5f71\u7247"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u52d5\u753b"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    const-string v2, "Select history entries to delete"

    const-string v8, "\u9078\u53d6\u8981\u522a\u9664\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u524a\u9664\u3059\u308b\u5c65\u6b74\u3092\u9078\u629e"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    const-string v2, "Delete selected history"

    const-string v8, "\u522a\u9664\u9078\u53d6\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u9078\u629e\u3057\u305f\u5c65\u6b74\u3092\u524a\u9664"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    const-string v2, "The sign-in screen stopped responding. Restart the app and try again."

    const-string v8, "\u767b\u5165\u756b\u9762\u6c92\u6709\u56de\u61c9\u3002\u8acb\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a4\u30f3\u753b\u9762\u306e\u8868\u793a\u304c\u505c\u6b62\u3057\u307e\u3057\u305f\u3002\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    const-string v2, "Could not open the sign-in screen.\n"

    const-string v8, "\u7121\u6cd5\u958b\u555f\u767b\u5165\u756b\u9762\u3002\n"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a4\u30f3\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f\u3002\n"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    const-string v2, "Sign-in method"

    const-string v8, "\u767b\u5165\u65b9\u5f0f"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a4\u30f3\u65b9\u6cd5"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    const-string v2, "Standard sign-in"

    const-string v8, "\u4e00\u822c\u767b\u5165"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u901a\u5e38\u30ed\u30b0\u30a4\u30f3"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    const-string v2, "Enter session cookie"

    const-string v8, "\u624b\u52d5\u8f38\u5165 Cookie"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "Cookie\u624b\u52d5\u5165\u529b"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    const-string v2, "Sign in to Niconico on another device or PC and paste the user_session cookie value from your browser. You can also enter user_session=\u2026 . Do not share your cookie with others."

    const-string v8, "\u8acb\u5728\u5176\u4ed6\u88dd\u7f6e\u6216\u96fb\u8166\u767b\u5165 Niconico\uff0c\u518d\u8cbc\u4e0a\u700f\u89bd\u5668 Cookie \u4e2d\u7684 user_session \u503c\u3002\u4e5f\u53ef\u8f38\u5165 user_session=\u2026 \u3002\u8acb\u52ff\u5c07 Cookie \u63d0\u4f9b\u7d66\u4ed6\u4eba\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u5225\u306e\u7aef\u672b\u30fbPC\u3067\u30cb\u30b3\u30cb\u30b3\u306b\u30ed\u30b0\u30a4\u30f3\u3057\u3001\u30d6\u30e9\u30a6\u30b6\u306eCookie\u304b\u3089user_session\u306e\u5024\u3092\u8cbc\u308a\u4ed8\u3051\u3066\u304f\u3060\u3055\u3044\u3002user_session=\u2026 \u306e\u5f62\u5f0f\u3067\u3082\u5165\u529b\u3067\u304d\u307e\u3059\u3002Cookie\u306f\u4ed6\u306e\u4eba\u306b\u6e21\u3055\u306a\u3044\u3067\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    const-string v2, "Enter the user_session value or use the user_session=\u2026 format."

    const-string v8, "\u8acb\u8f38\u5165 user_session \u503c\uff0c\u6216\u4f7f\u7528 user_session=\u2026 \u683c\u5f0f\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "user_session\u306e\u5024\u3001\u307e\u305f\u306fuser_session=\u2026 \u306e\u5f62\u5f0f\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    const-string v2, "Cookie saved. If authentication fails, sign in again and obtain a new cookie."

    const-string v8, "\u5df2\u5132\u5b58 Cookie\u3002\u82e5\u9a57\u8b49\u5931\u6557\uff0c\u8acb\u91cd\u65b0\u767b\u5165\u4e26\u53d6\u5f97\u65b0\u7684 Cookie\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "Cookie\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f\u3002\u8a8d\u8a3c\u304c\u901a\u3089\u306a\u3044\u5834\u5408\u306f\u3001\u30ed\u30b0\u30a4\u30f3\u3057\u76f4\u3057\u3066Cookie\u3092\u518d\u53d6\u5f97\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    const-string v2, "Could not save the cookie. Please try again."

    const-string v8, "\u7121\u6cd5\u5132\u5b58 Cookie\uff0c\u8acb\u91cd\u8a66\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "Cookie\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    const-string v2, "Signed in"

    const-string v8, "\u5df2\u767b\u5165"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a4\u30f3\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    const-string v2, "Nico Reports has been discontinued. Visit the official NicoNico website for new videos from followed users."

    const-string v8, "Nico Reports \u5df2\u505c\u6b62\u670d\u52d9\u3002\u8acb\u524d\u5f80 Niconico \u5b98\u65b9\u7db2\u7ad9\u67e5\u770b\u8ffd\u8e64\u5c0d\u8c61\u7684\u65b0\u5f71\u7247\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30cb\u30b3\u30ec\u30dd\u306f\u30b5\u30fc\u30d3\u30b9\u304c\u7d42\u4e86\u3057\u307e\u3057\u305f\u3002\u30d5\u30a9\u30ed\u30fc\u65b0\u7740\u306f\u30cb\u30b3\u30cb\u30b3\u516c\u5f0f\u30b5\u30a4\u30c8\u3067\u78ba\u8a8d\u3067\u304d\u307e\u3059\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    const-string v2, "App-private folder (default)"

    const-string v8, "\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\uff08\u9810\u8a2d\uff09"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u30fc\uff08\u30c7\u30d5\u30a9\u30eb\u30c8\uff09"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    const-string v2, "Choose a folder in shared storage or on an SD card"

    const-string v8, "\u9078\u64c7\u5171\u7528\u5132\u5b58\u7a7a\u9593\u6216 SD \u5361\u4e0a\u7684\u8cc7\u6599\u593e"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u5171\u6709\u30b9\u30c8\u30ec\u30fc\u30b8\u30fbSD\u30ab\u30fc\u30c9\u306e\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    const-string v2, "Save location: "

    const-string v8, "\u5132\u5b58\u4f4d\u7f6e\uff1a "

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u4fdd\u5b58\u5148: "

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    const-string v2, "Sign-in details saved"

    const-string v8, "\u5df2\u5132\u5b58\u767b\u5165\u8cc7\u6599"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3092\u4fdd\u5b58\u6e08\u307f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    const-string v2, "Sign out"

    const-string v8, "\u767b\u51fa"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a2\u30a6\u30c8"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    const-string v2, "Could not delete history. Please try again."

    const-string v8, "\u7121\u6cd5\u522a\u9664\u7d00\u9304\uff0c\u8acb\u91cd\u8a66\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u5c65\u6b74\u3092\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    const-string v2, "Remove saved sign-in details and sign out?"

    const-string v8, "\u8981\u522a\u9664\u5df2\u5132\u5b58\u7684\u767b\u5165\u8cc7\u6599\u4e26\u767b\u51fa\u55ce\uff1f"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3092\u524a\u9664\u3057\u3066\u30ed\u30b0\u30a2\u30a6\u30c8\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    const-string v2, "Signed out"

    const-string v8, "\u5df2\u767b\u51fa"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a2\u30a6\u30c8\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    const-string v2, "Could not sign out. Please try again."

    const-string v8, "\u7121\u6cd5\u767b\u51fa\uff0c\u8acb\u91cd\u8a66\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ed\u30b0\u30a2\u30a6\u30c8\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    const-string v2, "Content filter"

    const-string v8, "\u5167\u5bb9\u7be9\u9078\u5668"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30b3\u30f3\u30c6\u30f3\u30c4\u30d5\u30a3\u30eb\u30bf"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    const-string v2, "Keyword filter"

    const-string v8, "\u95dc\u9375\u5b57\u7be9\u9078\u5668"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30ad\u30fc\u30ef\u30fc\u30c9\u30d5\u30a3\u30eb\u30bf"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    const-string v2, "Channel filter"

    const-string v8, "\u983b\u9053\u7be9\u9078\u5668"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30c1\u30e3\u30f3\u30cd\u30eb\u30d5\u30a3\u30eb\u30bf"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    const-string v2, "Enter uploader or channel names to hide, separated by commas or new lines. Names are matched by substring. Applies the next time a list is loaded."

    const-string v8, "\u8f38\u5165\u8981\u96b1\u85cf\u7684\u6295\u7a3f\u8005\u6216\u983b\u9053\u540d\u7a31\uff0c\u4ee5\u9017\u865f\u6216\u63db\u884c\u5206\u9694\u3002\u4ee5\u540d\u7a31\u90e8\u5206\u76f8\u7b26\u5224\u5b9a\uff0c\u4e0b\u6b21\u8f09\u5165\u6e05\u55ae\u6642\u5957\u7528\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u975e\u8868\u793a\u306b\u3059\u308b\u6295\u7a3f\u8005\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u540d\u3092\u30ab\u30f3\u30de\u307e\u305f\u306f\u6539\u884c\u3067\u533a\u5207\u3063\u3066\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002\u540d\u524d\u306e\u90e8\u5206\u4e00\u81f4\u3067\u5224\u5b9a\u3057\u307e\u3059\u3002\u6b21\u306e\u4e00\u89a7\u8aad\u307f\u8fbc\u307f\u304b\u3089\u53cd\u6620\u3055\u308c\u307e\u3059\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    const-string v2, "Enter keywords found in video titles, separated by commas or new lines. Matching videos will be hidden the next time a list is loaded."

    const-string v8, "\u8f38\u5165\u5f71\u7247\u6a19\u984c\u4e2d\u7684\u95dc\u9375\u5b57\uff0c\u4ee5\u9017\u865f\u6216\u63db\u884c\u5206\u9694\u3002\u4e0b\u6b21\u8f09\u5165\u6e05\u55ae\u6642\u6703\u96b1\u85cf\u7b26\u5408\u7684\u5f71\u7247\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u52d5\u753b\u30bf\u30a4\u30c8\u30eb\u306b\u542b\u307e\u308c\u308b\u30ad\u30fc\u30ef\u30fc\u30c9\u3092\u30ab\u30f3\u30de\u307e\u305f\u306f\u6539\u884c\u3067\u533a\u5207\u3063\u3066\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044\u3002\u6b21\u306e\u4e00\u89a7\u8aad\u307f\u8fbc\u307f\u304b\u3089\u975e\u8868\u793a\u306b\u306a\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    const-string v2, "<b>%s</b> <font color=\'red\'>Watched %s times</font>"

    const-string v8, "<b>%s</b> <font color=\'red\'>\u89c0\u770b %s \u6b21</font>"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "<b>%s</b> <font color=\'red\'>%s\u56de\u8996\u8074</font>"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    const-string v2, "Not signed in; no saved sign-in details"

    const-string v8, "\u672a\u767b\u5165\uff0c\u6c92\u6709\u5df2\u5132\u5b58\u7684\u767b\u5165\u8cc7\u6599"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u672a\u30ed\u30b0\u30a4\u30f3\u30fb\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u306a\u3057"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    const-string v2, "Share playback and connection diagnostics"

    const-string v8, "\u5206\u4eab\u64ad\u653e\u8207\u9023\u7dda\u8a3a\u65b7\u8cc7\u8a0a"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    const-string v2, "Video loading has stalled. Start playback again."

    const-string v8, "\u5f71\u7247\u8f09\u5165\u505c\u6eef\u3002\u8acb\u91cd\u65b0\u958b\u59cb\u64ad\u653e\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u52d5\u753b\u306e\u8aad\u307f\u8fbc\u307f\u304c\u9032\u307f\u307e\u305b\u3093\u3002\u518d\u751f\u3092\u3084\u308a\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    const-string v2, "Could not retrieve video details: "

    const-string v8, "\u7121\u6cd5\u53d6\u5f97\u5f71\u7247\u8cc7\u8a0a\uff1a "

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093: "

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    const-string v2, "Could not retrieve video details. Check your connection."

    const-string v8, "\u7121\u6cd5\u53d6\u5f97\u5f71\u7247\u8cc7\u8a0a\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    const-string v2, "No supported playback format is available for this video"

    const-string v8, "\u9019\u90e8\u5f71\u7247\u6c92\u6709\u53ef\u652f\u63f4\u7684\u64ad\u653e\u683c\u5f0f"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u3053\u306e\u52d5\u753b\u306b\u5bfe\u5fdc\u3059\u308b\u518d\u751f\u5f62\u5f0f\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    const-string v2, "Could not retrieve playback information. Check your connection and viewing permissions."

    const-string v8, "\u7121\u6cd5\u53d6\u5f97\u64ad\u653e\u8cc7\u8a0a\u3002\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u8207\u89c0\u770b\u6b0a\u9650\u3002"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u60c5\u5831\u306e\u53d6\u5f97\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3084\u8996\u8074\u6a29\u9650\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    const-string v2, "Views: %,d  Comments: %,d  Mylists: %,d  Likes: %,d"

    const-string v8, "\u89c0\u770b\uff1a%,d  \u7559\u8a00\uff1a%,d  \u64ad\u653e\u6e05\u55ae\uff1a%,d  \u6309\u8b9a\uff1a%,d"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f:%,d  \u30b3\u30e1\u30f3\u30c8:%,d  \u30de\u30a4\u30ea\u30b9:%,d  \u3044\u3044\u306d:%,d"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    const-string v2, "Views"

    const-string v8, "\u89c0\u770b"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u518d\u751f\u6570"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    const-string v2, "Likes"

    const-string v8, "\u6309\u8b9a"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u3044\u3044\u306d"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    const-string v2, "Mylists"

    const-string v8, "\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "\u30de\u30a4\u30ea\u30b9"

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    const-string v2, "Play video"

    const-string v8, "\u64ad\u653e\u5f71\u7247"

    move-object/from16 v22, v15

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v15

    move-object/from16 v23, v6

    const-string v6, "\u52d5\u753b\u518d\u751f"

    invoke-interface {v0, v6, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    const-string v6, "Download cache"

    const-string v15, "\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u53d6\u5f97"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    const-string v6, "Close mini-game"

    const-string v15, "\u95dc\u9589\u5c0f\u904a\u6232"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30df\u30cb\u30b2\u30fc\u30e0\u3092\u9589\u3058\u308b"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    const-string v6, "Bicycle Run. Tap to jump, then tap again in midair for a double jump. Avoid obstacles and gaps. Tap after game over to try again."

    const-string v15, "\u81ea\u884c\u8eca\u8dd1\u9177\u3002\u8f15\u89f8\u8df3\u8e8d\uff0c\u5728\u7a7a\u4e2d\u518d\u6b21\u8f15\u89f8\u53ef\u4e8c\u6bb5\u8df3\u3002\u907f\u958b\u969c\u7919\u8207\u7f3a\u53e3\u3002\u904a\u6232\u7d50\u675f\u5f8c\u8f15\u89f8\u91cd\u8a66\u3002"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u81ea\u8ee2\u8eca\u30e9\u30f3\u3002\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7\u3002\u969c\u5bb3\u7269\u3068\u7a74\u3092\u907f\u3051\u307e\u3059\u3002\u7d42\u4e86\u5f8c\u306f\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226\u3002"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    const-string v6, "Bicycle Run"

    const-string v15, "\u81ea\u884c\u8eca\u8dd1\u9177"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u81ea\u8ee2\u8eca\u30e9\u30f3"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    const-string v6, "Distance: "

    const-string v15, "\u8ddd\u96e2\uff1a "

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u8ddd\u96e2 "

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const-string v6, " m   Best: "

    const-string v15, " m   \u6700\u4f73\uff1a "

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, " m   \u30d9\u30b9\u30c8 "

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    const-string v6, "Tap to jump; tap again in midair"

    const-string v15, "\u8f15\u89f8\u8df3\u8e8d\uff0c\u5728\u7a7a\u4e2d\u518d\u9ede\u4e00\u6b21\u53ef\u4e8c\u6bb5\u8df3"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    const-string v6, "Game over"

    const-string v15, "\u904a\u6232\u7d50\u675f"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30b2\u30fc\u30e0\u30aa\u30fc\u30d0\u30fc"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    const-string v6, "Jump over obstacles and gaps"

    const-string v15, "\u8df3\u904e\u969c\u7919\u8207\u7f3a\u53e3"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u969c\u5bb3\u7269\u3068\u7a74\u3092\u30b8\u30e3\u30f3\u30d7\u3067\u907f\u3051\u3088\u3046"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    const-string v6, "Tap to try again"

    const-string v15, "\u8f15\u89f8\u91cd\u8a66"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    const-string v6, "Tap to start"

    const-string v15, "\u8f15\u89f8\u958b\u59cb"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30bf\u30c3\u30d7\u3057\u3066\u30b9\u30bf\u30fc\u30c8"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    const-string v6, "All categories"

    const-string v15, "\u7d9c\u5408"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u7dcf\u5408"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    const-string v6, "Gaming"

    const-string v15, "\u904a\u6232"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30b2\u30fc\u30e0"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    const-string v6, "Anime"

    const-string v15, "\u52d5\u756b"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30a2\u30cb\u30e1"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    const-string v6, "Vocaloid"

    const-string v15, "VOCALOID"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30dc\u30ab\u30ed"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    const-string v6, "Synthesized voice commentary, explanations and skits"

    const-string v15, "\u8a9e\u97f3\u5408\u6210\u5be6\u6cc1\u3001\u89e3\u8aaa\u8207\u5287\u5834"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u97f3\u58f0\u5408\u6210\u5b9f\u6cc1\u30fb\u89e3\u8aac\u30fb\u5287\u5834"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    const-string v6, "Entertainment"

    const-string v15, "\u5a1b\u6a02"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30a8\u30f3\u30bf\u30e1"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    const-string v6, "Music"

    const-string v15, "\u97f3\u6a02"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u97f3\u697d"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    const-string v6, "Singing covers"

    const-string v15, "\u7ffb\u5531"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u6b4c\u3063\u3066\u307f\u305f"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    const-string v6, "Dance covers"

    const-string v15, "\u7ffb\u8df3"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u8e0a\u3063\u3066\u307f\u305f"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    const-string v6, "Instrumental covers"

    const-string v15, "\u6f14\u594f"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u6f14\u594f\u3057\u3066\u307f\u305f"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    const-string v6, "Explanations and tutorials"

    const-string v15, "\u89e3\u8aaa\u8207\u6559\u5b78"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u89e3\u8aac\u30fb\u8b1b\u5ea7"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    const-string v6, "Travel and outdoors"

    const-string v15, "\u65c5\u904a\u8207\u6236\u5916"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u65c5\u884c\u30fb\u30a2\u30a6\u30c8\u30c9\u30a2"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    const-string v6, "Vehicles"

    const-string v15, "\u4ea4\u901a\u5de5\u5177"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u4e57\u308a\u7269"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    const-string v6, "Technology and crafts"

    const-string v15, "\u6280\u8853\u8207\u624b\u4f5c"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u6280\u8853\u30fb\u5de5\u4f5c"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    const-string v6, "Society, politics and current affairs"

    const-string v15, "\u793e\u6703\u3001\u653f\u6cbb\u8207\u6642\u4e8b"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u793e\u4f1a\u30fb\u653f\u6cbb\u30fb\u6642\u4e8b"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    const-string v6, "Radio"

    const-string v15, "\u5ee3\u64ad"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30e9\u30b8\u30aa"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    const-string v6, "Sports"

    const-string v15, "\u904b\u52d5"

    filled-new-array {v6, v15}, [Ljava/lang/String;

    move-result-object v6

    const-string v15, "\u30b9\u30dd\u30fc\u30c4"

    invoke-interface {v0, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    const-string v6, "Settings"

    filled-new-array {v6, v5}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Setting"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    const-string v5, "About nicoid Re"

    const-string v6, "\u95dc\u65bc nicoid Re"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "nicoid\u306b\u3064\u3044\u3066"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    const-string v5, "About nicoid Re"

    const-string v6, "\u95dc\u65bc nicoid Re"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "About nicoid"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    const-string v5, "About nicoid Re"

    const-string v6, "\u95dc\u65bc nicoid Re"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u95dc\u65bcnicoid"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    const-string v5, "App language"

    const-string v6, "\u61c9\u7528\u7a0b\u5f0f\u8a9e\u8a00"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    const-string v5, "App language"

    const-string v6, "\u61c9\u7528\u7a0b\u5f0f\u8a9e\u8a00"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Language of the entire application"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    const-string v5, "App language"

    const-string v6, "\u61c9\u7528\u7a0b\u5f0f\u8a9e\u8a00"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u8a9e\u8a00\u7684\u6574\u500b\u61c9\u7528\u7a0b\u5e8f\u7684"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    const-string v5, "Choose the language used throughout the app"

    const-string v6, "\u9078\u64c7\u6574\u500b\u61c9\u7528\u7a0b\u5f0f\u4f7f\u7528\u7684\u8a9e\u8a00"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    const-string v5, "Choose the language used throughout the app"

    const-string v6, "\u9078\u64c7\u6574\u500b\u61c9\u7528\u7a0b\u5f0f\u4f7f\u7528\u7684\u8a9e\u8a00"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "I will change the language of the entire application."

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    const-string v5, "Choose the language used throughout the app"

    const-string v6, "\u9078\u64c7\u6574\u500b\u61c9\u7528\u7a0b\u5f0f\u4f7f\u7528\u7684\u8a9e\u8a00"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6211\u5c07\u6539\u8b8a\u6574\u500b\u61c9\u7528\u7a0b\u5e8f\u7684\u8a9e\u8a00"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    const-string v5, "External storage (SD card)"

    const-string v6, "\u5916\u90e8\u5132\u5b58\u7a7a\u9593\uff08SD \u5361\uff09"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5916\u90e8\u30e1\u30e2\u30ea\uff08SD\u30ab\u30fc\u30c9\uff09"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    const-string v5, "External storage (SD card)"

    const-string v6, "\u5916\u90e8\u5132\u5b58\u7a7a\u9593\uff08SD \u5361\uff09"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "External memory (SD card)"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    const-string v5, "External storage (SD card)"

    const-string v6, "\u5916\u90e8\u5132\u5b58\u7a7a\u9593\uff08SD \u5361\uff09"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u5916\u90e8\u5b58\u5132\u5668\uff08SD\u5361\uff09"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    const-string v5, "Internal storage"

    const-string v6, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u672c\u4f53\u30e1\u30e2\u30ea"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    const-string v5, "Internal storage"

    const-string v6, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Internal memory"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    const-string v5, "Internal storage"

    const-string v6, "\u5167\u90e8\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6a5f\u8eab\u5167\u5b58"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    const-string v5, "Unlimited"

    const-string v6, "\u7121\u9650\u5236"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u7121\u5236\u9650"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    const-string v5, "Unlimited"

    const-string v6, "\u7121\u9650\u5236"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Limitless"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    const-string v5, "Tablet"

    const-string v6, "\u5e73\u677f\u96fb\u8166"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v15, "\u30bf\u30d6\u30ec\u30c3\u30c8"

    invoke-interface {v0, v15, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    const-string v5, "Tablet"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v15, "Tablets"

    invoke-interface {v0, v15, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    const-string v5, "Tablet"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    const-string v5, "Ask every time"

    const-string v6, "\u6bcf\u6b21\u8a62\u554f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6bce\u56de\u9078\u629e\u3059\u308b"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    const-string v5, "Ask every time"

    const-string v6, "\u6bcf\u6b21\u8a62\u554f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "I choose every time"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    const-string v5, "Ask every time"

    const-string v6, "\u6bcf\u6b21\u8a62\u554f"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u6bcf\u6b21\u9078\u64c7"

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    const-string v5, "Video Info"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    const-string v5, "\u52d5\u756b\u60c5\u5831"

    filled-new-array {v1, v9}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    const-string v1, "Video playback"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    const-string v1, "\u64ad\u653e\u52d5\u756b"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    const-string v1, "Popup\u64ad\u653e"

    filled-new-array {v4, v12}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    const-string v1, "High"

    const-string v2, "\u9ad8"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5f37"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    const-string v1, "High"

    const-string v2, "\u9ad8"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Strength"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    const-string v1, "Low"

    const-string v2, "\u4f4e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5f31"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    const-string v1, "Low"

    const-string v2, "\u4f4e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Weak"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    const-string v1, "None (show all)"

    const-string v2, "\u7121\uff08\u986f\u793a\u5168\u90e8\uff09"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7121(\u5168\u3066\u8868\u793a)"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    const-string v1, "None (show all)"

    const-string v2, "\u7121\uff08\u986f\u793a\u5168\u90e8\uff09"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "None (view all)"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    const-string v1, "None (show all)"

    const-string v2, "\u7121\uff08\u986f\u793a\u5168\u90e8\uff09"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7121(\u5168\u90e8\u986f\u793a)"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    const-string v1, "Economy image quality"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    const-string v1, "\u7d93\u6fdf\u756b\u8cea"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    const-string v1, "Original quality"

    const-string v2, "\u539f\u59cb\u756b\u8cea"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u30aa\u30ea\u30b8\u30ca\u30eb\u753b\u8cea"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    const-string v1, "Original quality"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "Original image quality"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    const-string v1, "Original quality"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    const-string v1, "Follow device settings"

    const-string v2, "\u4f9d\u7167\u88dd\u7f6e\u8a2d\u5b9a"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7aef\u672b\u306e\u8a2d\u5b9a\u306b\u5f93\u3046"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    const-string v1, "Follow device settings"

    const-string v2, "\u4f9d\u7167\u88dd\u7f6e\u8a2d\u5b9a"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Follow the configuration of the terminal"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    const-string v1, "Follow device settings"

    const-string v2, "\u4f9d\u7167\u88dd\u7f6e\u8a2d\u5b9a"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u4f9d\u7167\u5ba2\u6236\u7aef\u8a2d\u5b9a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    const-string v1, "Lock to landscape"

    const-string v2, "\u56fa\u5b9a\u6a6b\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u6a2a\u753b\u9762\u56fa\u5b9a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    const-string v1, "Lock to landscape"

    const-string v2, "\u56fa\u5b9a\u6a6b\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Horizontal screen fixed"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    const-string v1, "Lock to landscape"

    const-string v2, "\u56fa\u5b9a\u6a6b\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u56fa\u5b9a\u6a6b\u5411\u756b\u9762"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    const-string v1, "Lock to portrait"

    const-string v2, "\u56fa\u5b9a\u76f4\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7e26\u753b\u9762\u56fa\u5b9a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    const-string v1, "Lock to portrait"

    const-string v2, "\u56fa\u5b9a\u76f4\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Vertical screen fixed"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    const-string v1, "Lock to portrait"

    const-string v2, "\u56fa\u5b9a\u76f4\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u56fa\u5b9a\u7e31\u5411\u756b\u9762"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    const-string v1, "Auto-rotate using sensors"

    const-string v2, "\u4f9d\u611f\u61c9\u5668\u81ea\u52d5\u65cb\u8f49"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30bb\u30f3\u30b5\u30fc\u306b\u5f93\u3046"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    const-string v1, "Auto-rotate using sensors"

    const-string v2, "\u4f9d\u611f\u61c9\u5668\u81ea\u52d5\u65cb\u8f49"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I follow the sensor"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    const-string v1, "Auto-rotate using sensors"

    const-string v2, "\u4f9d\u611f\u61c9\u5668\u81ea\u52d5\u65cb\u8f49"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u4f9d\u7167\u611f\u61c9\u5668"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    const-string v1, "Soft shadow"

    const-string v2, "\u67d4\u548c\u9670\u5f71"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u307c\u304b\u3057"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    const-string v1, "Outline"

    const-string v2, "\u63cf\u908a"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7e01\u53d6\u308a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    const-string v1, "Clear all cache"

    const-string v2, "\u6e05\u9664\u6240\u6709\u5feb\u53d6"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u5168\u3066\u524a\u9664\u3059\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    const-string v1, "Clear all cache"

    const-string v2, "\u6e05\u9664\u6240\u6709\u5feb\u53d6"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I delete all the cache"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-string v1, "Clear all cache"

    const-string v2, "\u6e05\u9664\u6240\u6709\u5feb\u53d6"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u6e05\u9664\u5feb\u53d6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string v1, "Clear all cached files?"

    const-string v2, "\u8981\u6e05\u9664\u6240\u6709\u5feb\u53d6\u6a94\u6848\u55ce\uff1f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u5168\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    const-string v1, "Clear all cached files?"

    const-string v2, "\u8981\u6e05\u9664\u6240\u6709\u5feb\u53d6\u6a94\u6848\u55ce\uff1f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Are you sure you want to delete all the cache?"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    const-string v1, "Clear all cached files?"

    const-string v2, "\u8981\u6e05\u9664\u6240\u6709\u5feb\u53d6\u6a94\u6848\u55ce\uff1f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8981\u6e05\u9664\u5168\u90e8\u5feb\u53d6\u55ce\uff1f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    const-string v1, "Cache location"

    const-string v2, "\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    const-string v1, "Cache location"

    const-string v2, "\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Cache destination"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    const-string v1, "Cache location"

    const-string v2, "\u5feb\u53d6\u5132\u5b58\u4f4d\u7f6e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7de9\u5b58\u76ee\u7684\u5730"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    const-string v1, "Hide cached videos from galleries"

    const-string v2, "\u5728\u76f8\u7c3f\u4e2d\u96b1\u85cf\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30d5\u30a9\u30eb\u30c0\u975e\u8868\u793a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    const-string v1, "Prevent gallery apps from displaying cached video files"

    const-string v2, "\u907f\u514d\u76f8\u7c3f\u61c9\u7528\u7a0b\u5f0f\u986f\u793a\u5feb\u53d6\u7684\u5f71\u7247\u6a94\u6848"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30a2\u30eb\u30d0\u30e0\u306a\u3069\u304b\u3089\u30ad\u30e3\u30c3\u30b7\u30e5\u3057\u305f\u52d5\u753b\u30d5\u30a1\u30a4\u30eb\u3092\u95b2\u89a7\u3067\u304d\u306a\u3044\u3088\u3046\u306b\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    const-string v1, "Caching is available during normal playback only. The white seek-bar segment shows caching progress."

    const-string v2, "\u5feb\u53d6\u50c5\u9069\u7528\u65bc\u4e00\u822c\u64ad\u653e\u3002\u9032\u5ea6\u5217\u7684\u767d\u8272\u90e8\u5206\u8868\u793a\u5feb\u53d6\u9032\u5ea6\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u901a\u5e38\u518d\u751f\u306e\u307f\u5b9f\u884c\u3055\u308c\u307e\u3059\uff08\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3001nicoidcast\u3067\u306f\u5b9f\u884c\u3055\u308c\u307e\u305b\u3093\uff09\n\u30b7\u30fc\u30af\u30d0\u30fc\u306e\u767d\u306e\u30b2\u30fc\u30b8\u304c\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u9032\u884c\u5ea6\u306b\u306a\u308a\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    const-string v1, "Caching is available during normal playback only. The white seek-bar segment shows caching progress."

    const-string v2, "\u5feb\u53d6\u50c5\u9069\u7528\u65bc\u4e00\u822c\u64ad\u653e\u3002\u9032\u5ea6\u5217\u7684\u767d\u8272\u90e8\u5206\u8868\u793a\u5feb\u53d6\u9032\u5ea6\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Normal playback is executed only for the cache. (Pop-up, it does not run on nicoidcast)\nGauge of white seek bar is the progress of the cache"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    const-string v1, "Caching is available during normal playback only. The white seek-bar segment shows caching progress."

    const-string v2, "\u5feb\u53d6\u50c5\u9069\u7528\u65bc\u4e00\u822c\u64ad\u653e\u3002\u9032\u5ea6\u5217\u7684\u767d\u8272\u90e8\u5206\u8868\u793a\u5feb\u53d6\u9032\u5ea6\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5feb\u53d6\u53ea\u4f7f\u7528\u65bc\u4e00\u822c\u64ad\u653e\uff08Popup\u3001nicoidcast\u4e0d\u4f7f\u7528\uff09\n\u5728\u6642\u9593\u8ef8\u4ee5\u767d\u8272\u9577\u689d\u986f\u793a\u5feb\u53d6\u9032\u884c\u5ea6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    const-string v1, "Cache size limit"

    const-string v2, "\u5feb\u53d6\u5bb9\u91cf\u4e0a\u9650"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u5bb9\u91cf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    const-string v1, "Cache size limit"

    const-string v2, "\u5feb\u53d6\u5bb9\u91cf\u4e0a\u9650"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Cache capacity"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    const-string v1, "Cache size limit"

    const-string v2, "\u5feb\u53d6\u5bb9\u91cf\u4e0a\u9650"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5feb\u53d6\u5bb9\u91cf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    const-string v1, "Set the maximum storage space used by cached files"

    const-string v2, "\u8a2d\u5b9a\u5feb\u53d6\u6a94\u6848\u53ef\u4f7f\u7528\u7684\u6700\u5927\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306b\u4f7f\u7528\u3059\u308b\u6700\u5927\u5bb9\u91cf\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    const-string v1, "Set the maximum storage space used by cached files"

    const-string v2, "\u8a2d\u5b9a\u5feb\u53d6\u6a94\u6848\u53ef\u4f7f\u7528\u7684\u6700\u5927\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "You can set the maximum capacity to be used for cache"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    const-string v1, "Set the maximum storage space used by cached files"

    const-string v2, "\u8a2d\u5b9a\u5feb\u53d6\u6a94\u6848\u53ef\u4f7f\u7528\u7684\u6700\u5927\u5132\u5b58\u7a7a\u9593"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8a2d\u5b9a\u5feb\u53d6\u4f7f\u7528\u7684\u6700\u5927\u5bb9\u91cf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    const-string v1, "For fully cached videos, also use cached video details and comments to play without network access"

    const-string v2, "\u64ad\u653e\u5df2\u5b8c\u6574\u5feb\u53d6\u7684\u5f71\u7247\u6642\uff0c\u4e5f\u4f7f\u7528\u5feb\u53d6\u7684\u5f71\u7247\u8cc7\u8a0a\u8207\u7559\u8a00\uff0c\u4e0d\u9023\u7dda\u81f3\u7db2\u8def"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u6e08\u307f(100\uff05)\u306e\u52d5\u753b\u3092\u518d\u751f\u3059\u308b\u3068\u304d\u3001\u52d5\u753b\u3060\u3051\u3067\u306a\u304f\u52d5\u753b\u60c5\u5831\u3084\u30b3\u30e1\u30f3\u30c8\u3082\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u4f7f\u7528\u3057\u30c7\u30fc\u30bf\u901a\u4fe1\u3092\u884c\u308f\u305a\u306b\u518d\u751f\u3057\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    const-string v1, "Fast cache download (not recommended)"

    const-string v2, "\u5feb\u901f\u4e0b\u8f09\u5feb\u53d6\uff08\u4e0d\u5efa\u8b70\uff09"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u9ad8\u901f\u53d6\u5f97\u30e2\u30fc\u30c9(\u975e\u63a8\u5968)"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    const-string v1, "Use fast download for all playback (not recommended)"

    const-string v2, "\u6240\u6709\u64ad\u653e\u65b9\u5f0f\u7686\u4f7f\u7528\u5feb\u901f\u4e0b\u8f09\uff08\u4e0d\u5efa\u8b70\uff09"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u3059\u3079\u3066\u9ad8\u901f\u53d6\u5f97\u30e2\u30fc\u30c9(\u975e\u63a8\u5968)"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    const-string v1, "Download faster at reduced quality. Applies only to caching and overrides the quality setting. Future service changes may make this option unavailable."

    const-string v2, "\u964d\u4f4e\u756b\u8cea\u4ee5\u52a0\u5feb\u4e0b\u8f09\u3002\u50c5\u9069\u7528\u65bc\u5feb\u53d6\uff0c\u4e26\u5ffd\u7565\u756b\u8cea\u8a2d\u5b9a\u3002\u672a\u4f86\u670d\u52d9\u8b8a\u66f4\u53ef\u80fd\u5c0e\u81f4\u6b64\u9078\u9805\u5931\u6548\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30aa\u30ea\u30b8\u30ca\u30eb\u753b\u8cea\u3088\u308a\u52a3\u5316\u3057\u307e\u3059\u304c\u9ad8\u901f\u306b\u53d6\u5f97\u53ef\u80fd\u306a\u30aa\u30d7\u30b7\u30e7\u30f3\u3067\u3059\u3002\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u307f\u306b\u9069\u5fdc\u3055\u308c\u753b\u8cea\u8a2d\u5b9a\u306f\u7121\u8996\u3055\u308c\u307e\u3059\u3002\u4eca\u5f8c\u306e\u4ed5\u69d8\u5909\u66f4\u3067\u52d5\u4f5c\u3057\u306a\u304f\u306a\u308b\u53ef\u80fd\u6027\u304c\u3042\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    const-string v1, "Use the fast download method for all playback modes. This does not reduce startup or seek-loading time."

    const-string v2, "\u5728\u6240\u6709\u64ad\u653e\u6a21\u5f0f\u4f7f\u7528\u5feb\u901f\u4e0b\u8f09\u65b9\u5f0f\u3002\u9019\u4e0d\u6703\u7e2e\u77ed\u958b\u59cb\u64ad\u653e\u6216\u62d6\u66f3\u9032\u5ea6\u5f8c\u7684\u8f09\u5165\u6642\u9593\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3060\u3051\u3067\u306f\u306a\u304f\u3059\u3079\u3066\u306e\u518d\u751f\u65b9\u6cd5\u3067\u9ad8\u901f\u53d6\u5f97\u306e\u65b9\u6cd5\u3092\u4f7f\u7528\u3057\u307e\u3059\u3002\u518d\u751f\u958b\u59cb\u307e\u3067\u306e\u6642\u9593\u3084\u30b7\u30fc\u30af\u5f8c\u306e\u8aad\u307f\u8fbc\u307f\u304c\u77ed\u304f\u306a\u308b\u308f\u3051\u3067\u306f\u3042\u308a\u307e\u305b\u3093\u3002"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    const-string v1, "Comments"

    const-string v2, "\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    const-string v1, "Comments"

    const-string v2, "\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Comment"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    const-string v1, "Comments"

    const-string v2, "\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8a55\u8ad6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    const-string v1, "Comment opacity"

    const-string v2, "\u7559\u8a00\u4e0d\u900f\u660e\u5ea6"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u306e\u4e0d\u900f\u660e\u5ea6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    const-string v1, "Adjust how transparent comments appear"

    const-string v2, "\u8abf\u6574\u7559\u8a00\u986f\u793a\u7684\u900f\u660e\u7a0b\u5ea6"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u306e\u8868\u793a\u3092\u900f\u904e\u3059\u308b\u3053\u3068\u304c\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    const-string v1, "Reduce comments while casting"

    const-string v2, "\u6295\u653e\u6642\u6e1b\u5c11\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30b9\u30c8\u518d\u751f\u6642\u30b3\u30e1\u30f3\u30c8\u3092\u6e1b\u3089\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    const-string v1, "Reduce comments and frame rate for smoother casting. Turn this off if the receiving device can handle normal comment rendering."

    const-string v2, "\u6e1b\u5c11\u7559\u8a00\u8207\u5e40\u7387\u4ee5\u6539\u5584\u6295\u653e\u7a69\u5b9a\u6027\u3002\u63a5\u6536\u88dd\u7f6e\u6548\u80fd\u8db3\u5920\u6642\u53ef\u95dc\u9589\uff0c\u4ee5\u6b63\u5e38\u6578\u91cf\u8207\u5e40\u7387\u986f\u793a\u7559\u8a00\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u52d5\u4f5c\u3092\u5b89\u5b9a\u3055\u305b\u308b\u305f\u3081\u8868\u793a\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u91cf\u3092\u5c11\u306a\u304f\u3057\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3092\u4f4e\u304f\u5236\u9650\u3057\u307e\u3059\u3002\u518d\u751f\u5074\u306e\u30b9\u30da\u30c3\u30af\u306b\u4f59\u88d5\u304c\u3042\u308b\u5834\u5408\u3001\u7121\u52b9\u306b\u3059\u308b\u3068\u901a\u5e38\u306e\u30b3\u30e1\u30f3\u30c8\u91cf\u30fb\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3067\u8868\u793a\u3059\u308b\u3053\u3068\u304c\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    const-string v1, "AMOLED dark mode"

    const-string v2, "AMOLED \u6df1\u8272\u6a21\u5f0f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "AMOLED\u30c0\u30fc\u30af\u30e2\u30fc\u30c9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    const-string v1, "Comment frame rate"

    const-string v2, "\u7559\u8a00\u7e6a\u88fd\u5e40\u7387"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    const-string v1, "Comment frame rate"

    const-string v2, "\u7559\u8a00\u7e6a\u88fd\u5e40\u7387"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Drawing frame rate"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    const-string v1, "Comment frame rate"

    const-string v2, "\u7559\u8a00\u7e6a\u88fd\u5e40\u7387"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u7e6a\u88fd\u5e40\u7387"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    const-string v1, "Set the maximum frame rate for comment rendering"

    const-string v2, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u6700\u9ad8\u5e40\u7387"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u4e0a\u9650\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    const-string v1, "Set the maximum frame rate for comment rendering"

    const-string v2, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u6700\u9ad8\u5e40\u7387"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I set the comment drawing frame rate limit."

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    const-string v1, "Set the maximum frame rate for comment rendering"

    const-string v2, "\u8a2d\u5b9a\u7559\u8a00\u7e6a\u88fd\u7684\u6700\u9ad8\u5e40\u7387"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u6211\u8a2d\u7f6e\u7684\u8a3b\u91cb\u7e6a\u5716\u5e40\u901f\u7387\u9650\u5236\u3002"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    const-string v1, "Hide comments by default"

    const-string v2, "\u9810\u8a2d\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u3092\u8868\u793a\u3057\u306a\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    const-string v1, "Hide comments by default"

    const-string v2, "\u9810\u8a2d\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Do not show comment"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    const-string v1, "Hide comments by default"

    const-string v2, "\u9810\u8a2d\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u4e0d\u986f\u793a\u8a55\u8ad6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    const-string v1, "Start playback with comments hidden"

    const-string v2, "\u958b\u59cb\u64ad\u653e\u6642\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u3092\u30c7\u30d5\u30a9\u30eb\u30c8\u3067\u975e\u8868\u793a\u3057\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    const-string v1, "Start playback with comments hidden"

    const-string v2, "\u958b\u59cb\u64ad\u653e\u6642\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I can hide by default comment"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    const-string v1, "Start playback with comments hidden"

    const-string v2, "\u958b\u59cb\u64ad\u653e\u6642\u96b1\u85cf\u7559\u8a00"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8a55\u8ad6\u9810\u8a2d\u70ba\u4e0d\u986f\u793a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    const-string v1, "Comment shadow"

    const-string v2, "\u7559\u8a00\u9670\u5f71"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u306e\u30c9\u30ed\u30c3\u30d7\u30b7\u30e3\u30c9\u30a6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    const-string v1, "Choose the shadow style for comments"

    const-string v2, "\u9078\u64c7\u7559\u8a00\u7684\u9670\u5f71\u6a23\u5f0f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30b3\u30e1\u30f3\u30c8\u306e\u30c9\u30ed\u30c3\u30d7\u30b7\u30e3\u30c9\u30a6\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    const-string v1, "Choose a layout suited to a phone or tablet"

    const-string v2, "\u9078\u64c7\u9069\u5408\u624b\u6a5f\u6216\u5e73\u677f\u96fb\u8166\u7684\u7248\u9762\u914d\u7f6e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30bf\u30d6\u30ec\u30c3\u30c8\u30fb\u30b9\u30de\u30fc\u30c8\u30d5\u30a9\u30f3\u305d\u308c\u305e\u308c\u306b\u9069\u3057\u305f\u8868\u793a\u65b9\u6cd5\u306b\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    const-string v1, "Choose a layout suited to a phone or tablet"

    const-string v2, "\u9078\u64c7\u9069\u5408\u624b\u6a5f\u6216\u5e73\u677f\u96fb\u8166\u7684\u7248\u9762\u914d\u7f6e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I will change the display method suitable for each tablet, smartphone"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    const-string v1, "Choose a layout suited to a phone or tablet"

    const-string v2, "\u9078\u64c7\u9069\u5408\u624b\u6a5f\u6216\u5e73\u677f\u96fb\u8166\u7684\u7248\u9762\u914d\u7f6e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8b8a\u66f4\u9069\u61c9\u5e73\u677f\u96fb\u8166\u30fb\u667a\u6167\u578b\u624b\u6a5f\u7b49\u8868\u793a\u65b9\u6cd5"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    const-string v1, "Available on tablets only"

    const-string v2, "\u50c5\u9069\u7528\u65bc\u5e73\u677f\u96fb\u8166"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30bf\u30d6\u30ec\u30c3\u30c8\u7aef\u672b\u306e\u307f\u5909\u66f4\u53ef\u80fd\u3067\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    const-string v1, "Available on tablets only"

    const-string v2, "\u50c5\u9069\u7528\u65bc\u5e73\u677f\u96fb\u8166"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Can be changed only tablets"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    const-string v1, "Available on tablets only"

    const-string v2, "\u50c5\u9069\u7528\u65bc\u5e73\u677f\u96fb\u8166"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u50c5\u5e73\u677f\u96fb\u8166\u9069\u7528\u8b8a\u66f4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    const-string v1, "Action when opening a video link"

    const-string v2, "\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ea\u30f3\u30af\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    const-string v1, "Action when opening a video link"

    const-string v2, "\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Operation of the link-time"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    const-string v1, "Action when opening a video link"

    const-string v2, "\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u9023\u7d50\u6642\u7684\u52d5\u4f5c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    const-string v1, "Choose what happens when another app opens a video link"

    const-string v2, "\u9078\u64c7\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5916\u90e8\u30a2\u30d7\u30ea\u304b\u3089\u306e\u547c\u3073\u51fa\u3057\u6642\u306e\u52d5\u4f5c\u3092\u9078\u629e\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    const-string v1, "Choose what happens when another app opens a video link"

    const-string v2, "\u9078\u64c7\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I want the behavior of the call from the external application"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    const-string v1, "Choose what happens when another app opens a video link"

    const-string v2, "\u9078\u64c7\u5f9e\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u958b\u555f\u5f71\u7247\u9023\u7d50\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u9078\u64c7\u5f9e\u5916\u90e8\u61c9\u7528\u7a0b\u5f0f\u53eb\u51fa\u6642\u7684\u52d5\u4f5c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    const-string v1, "Experimental features"

    const-string v2, "\u5be6\u9a57\u6027\u529f\u80fd"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5b9f\u9a13\u7684\u6a5f\u80fd"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    const-string v1, "About experimental features"

    const-string v2, "\u95dc\u65bc\u5be6\u9a57\u6027\u529f\u80fd"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5b9f\u9a13\u7684\u6a5f\u80fd\u306b\u3064\u3044\u3066"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    const-string v1, "Leave these options off for normal use. They may not work correctly and may be removed without notice."

    const-string v2, "\u4e00\u822c\u4f7f\u7528\u6642\u8acb\u4fdd\u6301\u95dc\u9589\u3002\u9019\u4e9b\u9078\u9805\u53ef\u80fd\u7121\u6cd5\u6b63\u5e38\u904b\u4f5c\uff0c\u4e14\u53ef\u80fd\u4e0d\u53e6\u884c\u901a\u77e5\u5c31\u79fb\u9664\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u901a\u5e38\u306f\u8a2d\u5b9a\u3057\u306a\u3044\u3067\u304f\u3060\u3055\u3044\u3002\u3053\u3061\u3089\u306e\u30aa\u30d7\u30b7\u30e7\u30f3\u306f\u6b63\u3057\u304f\u52d5\u4f5c\u3057\u306a\u304b\u3063\u305f\u308a\u4e88\u544a\u306a\u304f\u5ec3\u6b62\u3059\u308b\u53ef\u80fd\u6027\u304c\u3042\u308a\u307e\u3059\u3002"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    const-string v1, "\u8a9e"

    filled-new-array {v3, v11}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    const-string v1, "Signing in\u2026"

    const-string v2, "\u6b63\u5728\u767b\u5165\u2026"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u4e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    const-string v1, "Signing in\u2026"

    const-string v2, "\u6b63\u5728\u767b\u5165\u2026"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Log in"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    const-string v1, "Signing in\u2026"

    const-string v2, "\u6b63\u5728\u767b\u5165\u2026"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u767b\u5165\u4e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    const-string v1, "Sign in with your NicoNico account"

    const-string v2, "\u4f7f\u7528 Niconico \u5e33\u865f\u767b\u5165"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306e\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u30fb\u30d1\u30b9\u30ef\u30fc\u30c9\u3092\u8a2d\u5b9a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    const-string v1, "Sign in with your NicoNico account"

    const-string v2, "\u4f7f\u7528 Niconico \u5e33\u865f\u767b\u5165"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Set the e-mail address password of Nico Nico Douga"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    const-string v1, "Sign in with your NicoNico account"

    const-string v2, "\u4f7f\u7528 Niconico \u5e33\u865f\u767b\u5165"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8a2d\u5b9aNICONICO\u52d5\u756b\u7684\u96fb\u90f5\u5730\u5740\u30fb\u5bc6\u78bc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    const-string v1, "\u30ed\u30b0\u30a4\u30f3\u306b\u6210\u529f\u3057\u307e\u3057\u305f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    const-string v1, "I have successfully logged"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    const-string v1, "Sign-in failed. Check your email address and password."

    const-string v2, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u8207\u5bc6\u78bc\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u306b\u5931\u6557\u3057\u307e\u3057\u305f\n\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u3068\u30d1\u30b9\u30ef\u30fc\u30c9\u3092\u304a\u78ba\u304b\u3081\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    const-string v1, "Sign-in failed. Check your email address and password."

    const-string v2, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u8207\u5bc6\u78bc\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I failed to login"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    const-string v1, "Sign-in failed. Check your email address and password."

    const-string v2, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u8207\u5bc6\u78bc\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u767b\u5165\u5931\u6557"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    const-string v1, "Sign-in failed. Check your verification code."

    const-string v2, "\u767b\u5165\u5931\u6557\u3002\u8acb\u78ba\u8a8d\u9a57\u8b49\u78bc\u3002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u306b\u5931\u6557\u3057\u307e\u3057\u305f\n\u78ba\u8a8d\u30b3\u30fc\u30c9\u304c\u9593\u9055\u3063\u3066\u3044\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    const-string v1, "App screen orientation"

    const-string v2, "\u4e00\u822c\u756b\u9762\u65b9\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u901a\u5e38\u753b\u9762\u306e\u5411\u304d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    const-string v1, "App screen orientation"

    const-string v2, "\u4e00\u822c\u756b\u9762\u65b9\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "The orientation of the screen"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    const-string v1, "App screen orientation"

    const-string v2, "\u4e00\u822c\u756b\u9762\u65b9\u5411"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u756b\u9762\u65b9\u5411"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    const-string v1, "Choose how the app screen rotates"

    const-string v2, "\u9078\u64c7\u4e00\u822c\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u901a\u5e38\u753b\u9762\u306e\u5411\u304d\u306e\u56fa\u5b9a\u30fb\u5909\u66f4\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    const-string v1, "Choose how the app screen rotates"

    const-string v2, "\u9078\u64c7\u4e00\u822c\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "I set the fixed and how to change the orientation of the normal screen"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    const-string v1, "Choose how the app screen rotates"

    const-string v2, "\u9078\u64c7\u4e00\u822c\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u8a2d\u5b9a\u4e00\u822c\u756b\u9762\u65b9\u5411\u7684\u56fa\u5b9a\u30fb\u8b8a\u66f4\u65b9\u6cd5"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    const-string v1, "Low quality on mobile data"

    const-string v2, "\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642\u964d\u4f4e\u756b\u8cea"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u4f4e\u753b\u8cea\u518d\u751f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    const-string v1, "Use low quality on mobile data, regardless of the quality setting"

    const-string v2, "\u4f7f\u7528\u884c\u52d5\u7db2\u8def\u6642\u4e00\u5f8b\u4f7f\u7528\u4f4e\u756b\u8cea\uff0c\u4e0d\u53d7\u756b\u8cea\u8a2d\u5b9a\u5f71\u97ff"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u6642\u3001\u753b\u8cea\u8a2d\u5b9a\u306b\u304b\u304b\u308f\u3089\u305a\u4f4e\u753b\u8cea\u3067\u53d6\u5f97\u3057\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    const-string v1, "\u30ed\u30b0\u30a4\u30f3\u305b\u305a\u306b\u4f7f\u7528"

    move-object/from16 v3, v21

    move-object/from16 v2, v23

    filled-new-array {v3, v2}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    const-string v1, "The use without logging"

    filled-new-array {v3, v2}, [Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    const-string v1, "Use nicoid without a NicoNico account"

    const-string v3, "\u4e0d\u767b\u5165 Niconico \u5e33\u865f\u5373\u53ef\u4f7f\u7528 nicoid"

    filled-new-array {v1, v3}, [Ljava/lang/String;

    move-result-object v1

    const-string v3, "\u30ed\u30b0\u30a4\u30f3\u305b\u305a\u306bnicoid\u3092\u4f7f\u7528\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    const-string v1, "Use nicoid without a NicoNico account"

    const-string v3, "\u4e0d\u767b\u5165 Niconico \u5e33\u865f\u5373\u53ef\u4f7f\u7528 nicoid"

    filled-new-array {v1, v3}, [Ljava/lang/String;

    move-result-object v1

    const-string v3, "Use nicoid without logging"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    const-string v1, "Use nicoid without a NicoNico account"

    const-string v3, "\u4e0d\u767b\u5165 Niconico \u5e33\u865f\u5373\u53ef\u4f7f\u7528 nicoid"

    filled-new-array {v1, v3}, [Ljava/lang/String;

    move-result-object v1

    const-string v3, "\u4e0d\u767b\u5165\u4f7f\u7528nicoid"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    const-string v1, "\u518d\u751f\u30e2\u30fc\u30c9"

    move-object/from16 v5, v19

    move-object/from16 v3, v20

    filled-new-array {v5, v3}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    const-string v1, "Play mode"

    filled-new-array {v5, v3}, [Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    const-string v1, "Choose streaming or cached playback"

    const-string v5, "\u9078\u64c7\u4e32\u6d41\u6216\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u52d5\u753b\u306e\u518d\u751f\u65b9\u6cd5\uff08\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\u30fb\u30ad\u30e3\u30c3\u30b7\u30e5\uff09\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    const-string v1, "Choose streaming or cached playback"

    const-string v5, "\u9078\u64c7\u4e32\u6d41\u6216\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "I will change the method of playing videos (streaming / cache)"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    const-string v1, "Choose streaming or cached playback"

    const-string v5, "\u9078\u64c7\u4e32\u6d41\u6216\u5feb\u53d6\u64ad\u653e"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u52d5\u756b\u64ad\u653e\u65b9\u6cd5\uff08\u4e32\u6d41\u30fb\u5feb\u53d6\uff09\u8b8a\u66f4"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    const-string v1, "Comment and video details language"

    const-string v5, "\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    const-string v1, "Comment and video details language"

    const-string v5, "\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "Language of the comment and video information"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    const-string v1, "Comment and video details language"

    const-string v5, "\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    const-string v1, "Choose the language for comments and video details. By default, this follows the app language."

    const-string v5, "\u9078\u64c7\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00\u3002\u9810\u8a2d\u4f7f\u7528\u61c9\u7528\u7a0b\u5f0f\u7684\u8a9e\u8a00\u3002"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u30fb\u52d5\u753b\u60c5\u5831\u306e\u8a00\u8a9e\u3092\u5909\u66f4\u3067\u304d\u307e\u3059\uff08\u30c7\u30d5\u30a9\u30eb\u30c8\u306f\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e\u306b\u5f93\u3044\u307e\u3059\uff09"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    const-string v1, "Choose the language for comments and video details. By default, this follows the app language."

    const-string v5, "\u9078\u64c7\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00\u3002\u9810\u8a2d\u4f7f\u7528\u61c9\u7528\u7a0b\u5f0f\u7684\u8a9e\u8a00\u3002"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "I will change the language of the comment and video information. (The default is subject to the language of the entire application.)"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    const-string v1, "Choose the language for comments and video details. By default, this follows the app language."

    const-string v5, "\u9078\u64c7\u7559\u8a00\u8207\u5f71\u7247\u8cc7\u8a0a\u7684\u8a9e\u8a00\u3002\u9810\u8a2d\u4f7f\u7528\u61c9\u7528\u7a0b\u5f0f\u7684\u8a9e\u8a00\u3002"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u8b8a\u66f4\u8a55\u8ad6\u30fb\u52d5\u756b\u60c5\u5831\u7684\u8a9e\u8a00"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    const-string v1, "Player screen orientation"

    const-string v5, "\u64ad\u653e\u756b\u9762\u65b9\u5411"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u518d\u751f\u753b\u9762\u306e\u5411\u304d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    const-string v1, "Choose how the player screen rotates"

    const-string v5, "\u9078\u64c7\u64ad\u653e\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u518d\u751f\u753b\u9762\uff08\u30d7\u30ec\u30a4\u30e4\u30fc\uff09\u306e\u5411\u304d\u306e\u56fa\u5b9a\u30fb\u5909\u66f4\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    const-string v1, "Choose how the player screen rotates"

    const-string v5, "\u9078\u64c7\u64ad\u653e\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "I set the fixed and how to change the screen orientation in player"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    const-string v1, "Choose how the player screen rotates"

    const-string v5, "\u9078\u64c7\u64ad\u653e\u756b\u9762\u7684\u65cb\u8f49\u65b9\u5f0f"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u8a2d\u5b9a\u64ad\u653e\u5668\u756b\u9762\u65b9\u5411\u7684\u56fa\u5b9a\u30fb\u8b8a\u66f4\u65b9\u6cd5"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    const-string v1, "Start before comments finish loading"

    const-string v5, "\u7559\u8a00\u8f09\u5165\u5b8c\u6210\u524d\u958b\u59cb\u64ad\u653e"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u5148\u884c\u518d\u751f"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    const-string v1, "Start before comments finish loading"

    const-string v5, "\u7559\u8a00\u8f09\u5165\u5b8c\u6210\u524d\u958b\u59cb\u64ad\u653e"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "Preceding Play"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    const-string v1, "Start before comments finish loading"

    const-string v5, "\u7559\u8a00\u8f09\u5165\u5b8c\u6210\u524d\u958b\u59cb\u64ad\u653e"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u5148\u884c\u64ad\u653e"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    const-string v1, "Start playback as soon as the video is ready, even if comments are still loading"

    const-string v5, "\u5f71\u7247\u6e96\u5099\u597d\u5f8c\u7acb\u5373\u64ad\u653e\uff0c\u5373\u4f7f\u7559\u8a00\u4ecd\u5728\u8f09\u5165"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u52d5\u753b\u306e\u53d6\u5f97\u304c\u5b8c\u4e86\u3057\u305f\u6642\u70b9\u3067\u30b3\u30e1\u30f3\u30c8\u306e\u53d6\u5f97\u304c\u5b8c\u4e86\u3057\u3066\u3044\u306a\u304f\u3066\u3082\u52d5\u753b\u306e\u518d\u751f\u3092\u958b\u59cb\u3057\u307e\u3059"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    const-string v1, "Start playback as soon as the video is ready, even if comments are still loading"

    const-string v5, "\u5f71\u7247\u6e96\u5099\u597d\u5f8c\u7acb\u5373\u64ad\u653e\uff0c\u5373\u4f7f\u7559\u8a00\u4ecd\u5728\u8f09\u5165"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "I will start playing the video acquisition of comment even if not completed at the time of acquisition of the video was completed"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 506
    const-string v1, "Start playback as soon as the video is ready, even if comments are still loading"

    const-string v5, "\u5f71\u7247\u6e96\u5099\u597d\u5f8c\u7acb\u5373\u64ad\u653e\uff0c\u5373\u4f7f\u7559\u8a00\u4ecd\u5728\u8f09\u5165"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u52d5\u756b\u53d6\u5f97\u5f8c\u5c1a\u672a\u53d6\u5f97\u8a55\u8ad6\u6642\u76f4\u63a5\u64ad\u653e"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    const-string v1, "Stable cached playback (temporary workaround)"

    const-string v5, "\u7a69\u5b9a\u5feb\u53d6\u64ad\u653e\uff08\u66ab\u6642\u89e3\u6c7a\u65b9\u6848\uff09"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u30ad\u30e3\u30c3\u30b7\u30e5\u5b89\u5b9a\u518d\u751f\uff08\u66ab\u5b9a\u5bfe\u5fdc\uff09"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    const-string v1, "Reduce stuttering when playing cached videos from external storage. Leave this off if playback works normally. This temporary workaround may be removed."

    const-string v5, "\u6e1b\u5c11\u64ad\u653e\u5916\u90e8\u5132\u5b58\u7a7a\u9593\u5feb\u53d6\u5f71\u7247\u6642\u7684\u5361\u9813\u3002\u64ad\u653e\u6b63\u5e38\u6642\u8acb\u4fdd\u6301\u95dc\u9589\uff0c\u6b64\u66ab\u6642\u89e3\u6c7a\u65b9\u6848\u672a\u4f86\u53ef\u80fd\u79fb\u9664\u3002"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u4e00\u90e8\u74b0\u5883\u4e0b\u3067\u5916\u90e8\u30e1\u30e2\u30ea\u306b\u30ad\u30e3\u30c3\u30b7\u30e5\u3055\u308c\u305f\u52d5\u753b\u3092\u518d\u751f\u6642\u306b\u30d7\u30c4\u30d7\u30c4\u9014\u5207\u308c\u308b\u73fe\u8c61\u3092\u89e3\u6d88\u51fa\u6765\u307e\u3059\uff08\u518d\u751f\u306b\u554f\u984c\u304c\u306a\u3044\u5834\u5408\u8a2d\u5b9a\u3057\u306a\u3044\u3067\u4e0b\u3055\u3044\u3002\u66ab\u5b9a\u5bfe\u5fdc\u306e\u305f\u3081\u524a\u9664\u3055\u308c\u308b\u53ef\u80fd\u6027\u304c\u3042\u308a\u307e\u3059\uff09"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    const-string v1, "Video quality"

    const-string v5, "\u5f71\u7247\u756b\u8cea"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "Image quality"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    const-string v1, "Video quality"

    const-string v5, "\u5f71\u7247\u756b\u8cea"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    move-object/from16 v5, v22

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    const-string v1, "Choose the video quality to download or stream"

    const-string v5, "\u9078\u64c7\u4e0b\u8f09\u6216\u4e32\u6d41\u7684\u5f71\u7247\u756b\u8cea"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u53d6\u5f97\u3059\u308b\u52d5\u753b\u306e\u753b\u8cea\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    const-string v1, "Choose the video quality to download or stream"

    const-string v5, "\u9078\u64c7\u4e0b\u8f09\u6216\u4e32\u6d41\u7684\u5f71\u7247\u756b\u8cea"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "I can change the quality of the video to get"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    const-string v1, "Choose the video quality to download or stream"

    const-string v5, "\u9078\u64c7\u4e0b\u8f09\u6216\u4e32\u6d41\u7684\u5f71\u7247\u756b\u8cea"

    filled-new-array {v1, v5}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "\u80fd\u8b8a\u66f4\u53d6\u5f97\u52d5\u756b\u7684\u756b\u8cea"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    const-string v1, "\u8a2d\u5b9a\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    move-object/from16 v6, v17

    move-object/from16 v5, v18

    filled-new-array {v6, v5}, [Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    const-string v1, "I have to save the settings"

    filled-new-array {v6, v5}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    const-string v1, "Shared comment filter strength"

    const-string v6, "\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5f37\u5ea6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5171\u6709NG\u30ec\u30d9\u30eb"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    const-string v1, "Shared comment filter strength"

    const-string v6, "\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5f37\u5ea6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "NG share level"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    const-string v1, "Shared comment filter strength"

    const-string v6, "\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5f37\u5ea6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5206\u4eabNG\u7b49\u7d1a"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    const-string v1, "Adjust the strength of the shared comment filter"

    const-string v6, "\u8abf\u6574\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5668\u7684\u5f37\u5ea6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5171\u6709NG\u30ec\u30d9\u30eb\u3092\u5909\u66f4\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    const-string v1, "Adjust the strength of the shared comment filter"

    const-string v6, "\u8abf\u6574\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5668\u7684\u5f37\u5ea6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "I will modify the share NG level"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    const-string v1, "Adjust the strength of the shared comment filter"

    const-string v6, "\u8abf\u6574\u5171\u7528\u7559\u8a00\u904e\u6ffe\u5668\u7684\u5f37\u5ea6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u8b8a\u66f4\u5206\u4eabNG\u7b49\u7d1a"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    const-string v1, "Keep playing with the screen off"

    const-string v6, "\u87a2\u5e55\u95dc\u9589\u6642\u7e7c\u7e8c\u64ad\u653e"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30b9\u30ea\u30fc\u30d7\u518d\u751f"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    const-string v1, "Continue normal playback when the screen turns off"

    const-string v6, "\u87a2\u5e55\u95dc\u9589\u5f8c\u4ecd\u7e7c\u7e8c\u4e00\u822c\u64ad\u653e"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u901a\u5e38\u518d\u751f\u72b6\u614b\u3067\u30b9\u30ea\u30fc\u30d7\uff08\u753b\u9762\u30aa\u30d5\uff09\u306b\u3057\u3066\u3082\u518d\u751f\u3092\u7d9a\u3051\u307e\u3059"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    const-string v1, "Hide status bar"

    const-string v6, "\u96b1\u85cf\u72c0\u614b\u5217"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30b9\u30c6\u30fc\u30bf\u30b9\u30d0\u30fc\u975e\u8868\u793a"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    const-string v1, "Hide the status bar in full screen"

    const-string v6, "\u5168\u87a2\u5e55\u6642\u96b1\u85cf\u72c0\u614b\u5217"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30d5\u30eb\u30b9\u30af\u30ea\u30fc\u30f3\u6642\u30b9\u30c6\u30fc\u30bf\u30b9\u30d0\u30fc\u3092\u975e\u8868\u793a\u306b\u3057\u307e\u3059"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    const-string v1, "Action when tapping a video"

    const-string v6, "\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    const-string v1, "Action when tapping a video"

    const-string v6, "\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Operation of the tap when"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    const-string v1, "Action when tapping a video"

    const-string v6, "\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u8f15\u89f8\u6642\u52d5\u4f5c"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 530
    const-string v1, "Choose what happens when tapping a video. Use the triangle at the bottom right for other actions."

    const-string v6, "\u9078\u64c7\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba\u3002\u5176\u4ed6\u64cd\u4f5c\u53ef\u7531\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\u958b\u555f\u3002"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u52d5\u753b\u3092\u30bf\u30c3\u30d7\u3057\u305f\u6642\u306e\u52d5\u4f5c\u3092\u9078\u629e\u3067\u304d\u307e\u3059\uff08\u8a2d\u5b9a\u3057\u305f\u9805\u76ee\u4ee5\u5916\u306f\u53f3\u4e0b\u306e\u4e09\u89d2\u5f62\u3092\u30bf\u30c3\u30d7\u3059\u308b\u3053\u3068\u3067\u8868\u793a\u3055\u308c\u307e\u3059\uff09"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    const-string v1, "Choose what happens when tapping a video. Use the triangle at the bottom right for other actions."

    const-string v6, "\u9078\u64c7\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba\u3002\u5176\u4ed6\u64cd\u4f5c\u53ef\u7531\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\u958b\u555f\u3002"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "And what to do when you tap the video list. (Item other than that you set will be displayed by tapping the triangle in the bottom right-hand corner.)"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    const-string v1, "Choose what happens when tapping a video. Use the triangle at the bottom right for other actions."

    const-string v6, "\u9078\u64c7\u8f15\u89f8\u5f71\u7247\u6642\u7684\u884c\u70ba\u3002\u5176\u4ed6\u64cd\u4f5c\u53ef\u7531\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\u958b\u555f\u3002"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u9078\u64c7\u8f15\u89f8\u6642\u7684\u52d5\u4f5c\uff08\u5df2\u8a2d\u5b9a\u9805\u76ee\u4ee5\u5916\u8acb\u8f15\u89f8\u53f3\u4e0b\u89d2\u7684\u4e09\u89d2\u5f62\uff09"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    const-string v1, "General"

    const-string v6, "\u4e00\u822c"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5168\u822c"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    const-string v1, "General"

    const-string v6, "\u4e00\u822c"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Whole"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    const-string v1, "General"

    const-string v6, "\u4e00\u822c"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5168\u9ad4"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    const-string v1, "Followed users"

    const-string v6, "\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30e6\u30fc\u30b6\u30fc"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    const-string v1, "Followed users"

    const-string v6, "\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "User favorite"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    const-string v1, "Followed users"

    const-string v6, "\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u7528\u6236\u559c\u611b"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    const-string v1, "Users you follow"

    const-string v6, "\u4f60\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "User list of favorite"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    const-string v1, "Users you follow"

    const-string v6, "\u4f60\u8ffd\u8e64\u7684\u4f7f\u7528\u8005"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u559c\u6b61\u7684\u7528\u6236\u5217\u8868"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    const-string v1, "Your account\'s playlists"

    const-string v6, "\u5e33\u865f\u7684\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30a2\u30ab\u30a6\u30f3\u30c8\u306e\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    const-string v1, "Your account\'s playlists"

    const-string v6, "\u5e33\u865f\u7684\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "My List list of accounts"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    const-string v1, "Your account\'s playlists"

    const-string v6, "\u5e33\u865f\u7684\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5e33\u6236\u7684\u6211\u7684\u6e05\u55ae\u4e00\u89bd"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    const-string v1, "Watch later"

    const-string v6, "\u7a0d\u5f8c\u89c0\u770b"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    const-string v1, "Watch later"

    const-string v6, "\u7a0d\u5f8c\u89c0\u770b"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "My List for the time being"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    const-string v1, "Watch later"

    const-string v6, "\u7a0d\u5f8c\u89c0\u770b"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u4e00\u79d2\u6e05\u55ae"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    const-string v1, "Your Watch later playlist"

    const-string v6, "\u7a0d\u5f8c\u89c0\u770b\u6e05\u55ae"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30a2\u30ab\u30a6\u30f3\u30c8\u306e\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    const-string v1, "Your Watch later playlist"

    const-string v6, "\u7a0d\u5f8c\u89c0\u770b\u6e05\u55ae"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "My List list for the time being of the account"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    const-string v1, "Your Watch later playlist"

    const-string v6, "\u7a0d\u5f8c\u89c0\u770b\u6e05\u55ae"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u5e33\u6236\u7684\u4e00\u79d2\u6e05\u55ae\u4e00\u89bd"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 550
    const-string v1, "Bookmarks saved on this device"

    const-string v6, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u66f8\u7c64"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u672c\u4f53\u306b\u767b\u9332\u3057\u305f\u30d6\u30c3\u30af\u30de\u30fc\u30af"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    const-string v1, "Bookmarks saved on this device"

    const-string v6, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u66f8\u7c64"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "A list of bookmarks that it has registered with the body"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    const-string v1, "Bookmarks saved on this device"

    const-string v6, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u66f8\u7c64"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u88dd\u7f6e\u672c\u9ad4\u4e0a\u7684\u66f8\u7c64\u4e00\u89bd"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 553
    const-string v1, "Cached videos"

    const-string v6, "\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 554
    const-string v1, "Cached videos"

    const-string v6, "\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Cache list"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 555
    const-string v1, "Cached videos"

    const-string v6, "\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u7de9\u5b58\u5217\u8868"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 556
    const-string v1, "Cached videos available offline"

    const-string v6, "\u53ef\u96e2\u7dda\u89c0\u770b\u7684\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\uff08\u30aa\u30d5\u30e9\u30a4\u30f3\u8996\u8074\u53ef\u80fd\uff09"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    const-string v1, "Cached videos available offline"

    const-string v6, "\u53ef\u96e2\u7dda\u89c0\u770b\u7684\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Video List of cached (Viewable offline)"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    const-string v1, "Cached videos available offline"

    const-string v6, "\u53ef\u96e2\u7dda\u89c0\u770b\u7684\u5feb\u53d6\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u7de9\u5b58\u7684\u8996\u983b\u5217\u8868\uff08\u96e2\u7dda\u700f\u89bd\uff09"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    const-string v1, "On this device"

    const-string v6, "\u6b64\u88dd\u7f6e"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u672c\u4f53"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    const-string v1, "On this device"

    const-string v6, "\u6b64\u88dd\u7f6e"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Body"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    const-string v1, "On this device"

    const-string v6, "\u6b64\u88dd\u7f6e"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u88dd\u7f6e\u672c\u9ad4"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    const-string v1, "Cache download started"

    const-string v6, "\u5df2\u958b\u59cb\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u3092\u958b\u59cb\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    const-string v1, "Watch history on this device"

    const-string v6, "\u6b64\u88dd\u7f6e\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u672c\u4f53\u306e\u8996\u8074\u5c65\u6b74"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    const-string v1, "Watch history on this device"

    const-string v6, "\u6b64\u88dd\u7f6e\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Viewing history of the body"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    const-string v1, "Watch history on this device"

    const-string v6, "\u6b64\u88dd\u7f6e\u7684\u89c0\u770b\u7d00\u9304"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u88dd\u7f6e\u672c\u9ad4\u7684\u8996\u807d\u7d00\u9304"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    const-string v1, "Enter video ID"

    const-string v6, "\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u52d5\u753bID\u5165\u529b"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    const-string v1, "Enter video ID"

    const-string v6, "\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Video ID input"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    const-string v1, "Enter video ID"

    const-string v6, "\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u8f38\u5165\u52d5\u756bID"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    const-string v1, "Open a video by its ID"

    const-string v6, "\u4ee5\u5f71\u7247 ID \u958b\u555f\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u52d5\u753bID\u3092\u76f4\u63a5\u6307\u5b9a\u3057\u30a2\u30af\u30bb\u30b9"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 570
    const-string v1, "Open a video by its ID"

    const-string v6, "\u4ee5\u5f71\u7247 ID \u958b\u555f\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Accessed directly specify the video ID"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    const-string v1, "Open a video by its ID"

    const-string v6, "\u4ee5\u5f71\u7247 ID \u958b\u555f\u5f71\u7247"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u7d93\u7531\u76f4\u63a5\u6307\u5b9a\u52d5\u756bID\u9032\u5165"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    const-string v1, "Enter a video ID"

    const-string v6, "\u8acb\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "ID\u304c\u5165\u529b\u3055\u308c\u3066\u3044\u307e\u305b\u3093"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    const-string v1, "Enter a video ID"

    const-string v6, "\u8acb\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "ID has not been entered"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    const-string v1, "Enter a video ID"

    const-string v6, "\u8acb\u8f38\u5165\u5f71\u7247 ID"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u672a\u8f38\u5165ID"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 575
    const-string v1, "nicoid settings"

    const-string v6, "nicoid \u8a2d\u5b9a"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "nicoid\u306e\u8a2d\u5b9a"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    const-string v1, "nicoid settings"

    const-string v6, "nicoid \u8a2d\u5b9a"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Setting nicoid"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    const-string v1, "Search by keyword or tag"

    const-string v6, "\u4ee5\u95dc\u9375\u5b57\u6216\u6a19\u7c64\u641c\u5c0b"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u52d5\u753b\u306e\u30ad\u30fc\u30ef\u30fc\u30c9\u3001\u30bf\u30b0\u691c\u7d22"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    const-string v1, "Search by keyword or tag"

    const-string v6, "\u4ee5\u95dc\u9375\u5b57\u6216\u6a19\u7c64\u641c\u5c0b"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "Keywords video, tag search"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    const-string v1, "Search by keyword or tag"

    const-string v6, "\u4ee5\u95dc\u9375\u5b57\u6216\u6a19\u7c64\u641c\u5c0b"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "\u52d5\u756b\u7684\u95dc\u9375\u5b57\u3001\u6a19\u7c64\u641c\u5c0b"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    const-string v1, "Pop up\u64ad\u653e"

    filled-new-array {v4, v12}, [Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    const-string v1, "Download the video cache in the background?"

    const-string v4, "\u8981\u5728\u80cc\u666f\u4e0b\u8f09\u5f71\u7247\u5feb\u53d6\u55ce\uff1f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u3067\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u53d6\u5f97\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    const-string v1, "Play continuously"

    const-string v4, "\u9023\u7e8c\u64ad\u653e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u9023\u7d9a\u518d\u751f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 583
    const-string v1, "Download cache again"

    const-string v4, "\u91cd\u65b0\u4e0b\u8f09\u5feb\u53d6"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u518d\u53d6\u5f97"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    const-string v1, "Delete saved video data and download it again."

    const-string v4, "\u522a\u9664\u5df2\u5132\u5b58\u7684\u5f71\u7247\u8cc7\u6599\u4e26\u91cd\u65b0\u4e0b\u8f09\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4fdd\u5b58\u6e08\u307f\u306e\u52d5\u753b\u30c7\u30fc\u30bf\u3092\u524a\u9664\u3057\u3066\u518d\u53d6\u5f97\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    const-string v1, "Download again"

    const-string v4, "\u91cd\u65b0\u4e0b\u8f09"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u518d\u53d6\u5f97"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    const-string v1, "Unable to download again. If a download is active, retry after it finishes."

    const-string v4, "\u7121\u6cd5\u91cd\u65b0\u4e0b\u8f09\u3002\u5982\u6709\u4e0b\u8f09\u6b63\u5728\u9032\u884c\uff0c\u8acb\u65bc\u5b8c\u6210\u5f8c\u91cd\u8a66\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u518d\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u53d6\u5f97\u4e2d\u306e\u5834\u5408\u306f\u5b8c\u4e86\u5f8c\u306b\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    const-string v1, "Streaming: Play videos over the network. Reuse completed caches when available."

    const-string v4, "\u4e32\u6d41\uff1a\u900f\u904e\u7db2\u8def\u64ad\u653e\u5f71\u7247\u3002\u6709\u5df2\u5b8c\u6210\u7684\u5feb\u53d6\u6642\u6703\u91cd\u8907\u4f7f\u7528\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\uff1a\u901a\u4fe1\u3057\u306a\u304c\u3089\u52d5\u753b\u3092\u518d\u751f\u3057\u307e\u3059\u3002\u53d6\u5f97\u6e08\u307f\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u304c\u3042\u308c\u3070\u518d\u5229\u7528\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    const-string v1, "Cache: Save videos before playback. Reuse completed downloads."

    const-string v4, "\u5feb\u53d6\uff1a\u5148\u5132\u5b58\u5f71\u7247\u518d\u64ad\u653e\u3002\u5df2\u4e0b\u8f09\u7684\u5f71\u7247\u6703\u91cd\u8907\u4f7f\u7528\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\uff1a\u52d5\u753b\u3092\u4fdd\u5b58\u3057\u3066\u304b\u3089\u518d\u751f\u3057\u307e\u3059\u3002\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\u306f\u4fdd\u5b58\u3057\u305f\u30c7\u30fc\u30bf\u3092\u518d\u5229\u7528\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    const-string v1, "Add older comments to the standard response. Availability depends on the video and server response."

    const-string v4, "\u5728\u6a19\u6e96\u53d6\u5f97\u7d50\u679c\u4e2d\u52a0\u5165\u8f03\u65e9\u7684\u7559\u8a00\u3002\u53ef\u53d6\u5f97\u6578\u91cf\u53d6\u6c7a\u65bc\u5f71\u7247\u53ca\u4f3a\u670d\u5668\u56de\u61c9\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6a19\u6e96\u306e\u53d6\u5f97\u7d50\u679c\u306b\u904e\u53bb\u306e\u30b3\u30e1\u30f3\u30c8\u3092\u8ffd\u52a0\u3057\u307e\u3059\u3002\u53d6\u5f97\u53ef\u80fd\u306a\u4ef6\u6570\u306f\u52d5\u753b\u3068\u30b5\u30fc\u30d0\u30fc\u306e\u5fdc\u7b54\u306b\u4f9d\u5b58\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 590
    const-string v1, "Sort"

    const-string v4, "\u6392\u5e8f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4e26\u3079\u66ff\u3048"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    const-string v1, "Newest first"

    const-string v4, "\u7531\u65b0\u5230\u820a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u65b0\u3057\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    const-string v1, "Oldest first"

    const-string v4, "\u7531\u820a\u5230\u65b0"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u53e4\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    const-string v1, "Title ascending"

    const-string v4, "\u6a19\u984c\u5347\u51aa"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30bf\u30a4\u30c8\u30eb\u6607\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    const-string v1, "Title descending"

    const-string v4, "\u6a19\u984c\u964d\u51aa"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30bf\u30a4\u30c8\u30eb\u964d\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    const-string v1, "Fewest views"

    const-string v4, "\u89c0\u770b\u6b21\u6578\u6700\u5c11"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u518d\u751f\u6570\u304c\u5c11\u306a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    const-string v1, "Most comments"

    const-string v4, "\u7559\u8a00\u6578\u6700\u591a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u591a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 597
    const-string v1, "Fewest comments"

    const-string v4, "\u7559\u8a00\u6578\u6700\u5c11"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u5c11\u306a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 598
    const-string v1, "Most mylists"

    const-string v4, "\u64ad\u653e\u6e05\u55ae\u6578\u6700\u591a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30de\u30a4\u30ea\u30b9\u30c8\u6570\u304c\u591a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    const-string v1, "Fewest mylists"

    const-string v4, "\u64ad\u653e\u6e05\u55ae\u6578\u6700\u5c11"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30de\u30a4\u30ea\u30b9\u30c8\u6570\u304c\u5c11\u306a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    const-string v1, "Longest duration"

    const-string v4, "\u5f71\u7247\u6642\u9593\u6700\u9577"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u518d\u751f\u6642\u9593\u304c\u9577\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    const-string v1, "Shortest duration"

    const-string v4, "\u5f71\u7247\u6642\u9593\u6700\u77ed"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u518d\u751f\u6642\u9593\u304c\u77ed\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 602
    const-string v1, "Most recently watched"

    const-string v4, "\u6700\u8fd1\u89c0\u770b\u512a\u5148"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8996\u8074\u65e5\u6642\u304c\u65b0\u3057\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    const-string v1, "Oldest watched first"

    const-string v4, "\u8f03\u65e9\u89c0\u770b\u512a\u5148"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8996\u8074\u65e5\u6642\u304c\u53e4\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 604
    const-string v1, "Title"

    const-string v4, "\u6a19\u984c"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30bf\u30a4\u30c8\u30eb\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 605
    const-string v1, "Newest uploaded first"

    const-string v4, "\u6700\u65b0\u6295\u7a3f\u512a\u5148"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u65e5\u6642\u304c\u65b0\u3057\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 606
    const-string v1, "Oldest uploaded first"

    const-string v4, "\u8f03\u65e9\u6295\u7a3f\u512a\u5148"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u65e5\u6642\u304c\u53e4\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 607
    const-string v1, "Most watched on this device"

    const-string v4, "\u672c\u6a5f\u89c0\u770b\u6b21\u6578\u6700\u591a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8996\u8074\u56de\u6570\u304c\u591a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    const-string v1, "Least watched on this device"

    const-string v4, "\u672c\u6a5f\u89c0\u770b\u6b21\u6578\u6700\u5c11"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8996\u8074\u56de\u6570\u304c\u5c11\u306a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 609
    const-string v1, "Most viewed"

    const-string v4, "\u89c0\u770b\u6b21\u6578\u6700\u591a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u518d\u751f\u6570\u304c\u591a\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    const-string v1, "Shortest duration"

    const-string v4, "\u5f71\u7247\u6642\u9593\u6700\u77ed"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u52d5\u753b\u6642\u9593\u304c\u77ed\u3044\u9806"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    const-string v1, "Cache: play while downloading in the background. Reuse saved data for completed videos."

    const-string v4, "\u5feb\u53d6\uff1a\u908a\u64ad\u653e\u908a\u5728\u80cc\u666f\u4e0b\u8f09\u5f71\u7247\u3002\u5df2\u5b8c\u6210\u7684\u5f71\u7247\u6703\u91cd\u8907\u4f7f\u7528\u5132\u5b58\u8cc7\u6599\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\uff1a\u901a\u4fe1\u3057\u306a\u304c\u3089\u518d\u751f\u3057\u3001\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u3067\u52d5\u753b\u3092\u4fdd\u5b58\u3057\u307e\u3059\u3002\u53d6\u5f97\u6e08\u307f\u306e\u52d5\u753b\u306f\u4fdd\u5b58\u3057\u305f\u30c7\u30fc\u30bf\u3092\u518d\u5229\u7528\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    const-string v1, "Shuffle play"

    const-string v4, "\u96a8\u6a5f\u64ad\u653e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 613
    const-string v1, "Delete folder"

    const-string v4, "\u522a\u9664\u8cc7\u6599\u593e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u524a\u9664"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 614
    const-string v1, "Delete this folder?"

    const-string v4, "\u8981\u522a\u9664\u6b64\u8cc7\u6599\u593e\u55ce\uff1f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 615
    const-string v1, "Videos in this folder will move to Unfiled."

    const-string v4, "\u8cc7\u6599\u593e\u4e2d\u7684\u5f71\u7247\u6703\u79fb\u81f3\u672a\u5206\u985e\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u5185\u306e\u52d5\u753b\u306f\u672a\u5206\u985e\u306b\u79fb\u52d5\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 616
    const-string v1, "Could not switch to background playback"

    const-string v4, "\u7121\u6cd5\u5207\u63db\u81f3\u80cc\u666f\u64ad\u653e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u306b\u5207\u308a\u66ff\u3048\u3089\u308c\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 617
    const-string v1, "Reorder"

    const-string v4, "\u8abf\u6574\u9806\u5e8f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4e26\u3073\u66ff\u3048"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    const-string v1, "Customize player controls"

    const-string v4, "\u81ea\u8a02\u64ad\u653e\u5668\u6309\u9215"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u64cd\u4f5c\u30dc\u30bf\u30f3\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    const-string v1, "Delete all cached videos?"

    const-string v4, "\u8981\u522a\u9664\u6240\u6709\u5feb\u53d6\u5f71\u7247\u55ce\uff1f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u3059\u3079\u3066\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    const-string v1, "Deleted"

    const-string v4, "\u5df2\u522a\u9664"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u524a\u9664\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    const-string v1, "Could not delete"

    const-string v4, "\u7121\u6cd5\u522a\u9664"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u524a\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 622
    const-string v1, "Comment display duration"

    const-string v4, "\u5f48\u5e55\u986f\u793a\u6642\u9593"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u6642\u9593"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 623
    const-string v1, "Maximum comment rows"

    const-string v4, "\u5f48\u5e55\u6700\u5927\u884c\u6578"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6700\u5927\u30b3\u30e1\u30f3\u30c8\u884c\u6570"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 624
    const-string v1, "Text size"

    const-string v4, "\u6587\u5b57\u5927\u5c0f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6587\u5b57\u30b5\u30a4\u30ba"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    const-string v1, "Font weight"

    const-string v4, "\u5b57\u578b\u7c97\u7d30"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 626
    const-string v1, "Shadow size"

    const-string v4, "\u9670\u5f71\u5927\u5c0f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u5f71\u306e\u5927\u304d\u3055"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    const-string v1, "Comment display settings"

    const-string v4, "\u5f48\u5e55\u986f\u793a\u8a2d\u5b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u8a2d\u5b9a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 628
    const-string v1, "Animate preview comments"

    const-string v4, "\u64ad\u653e\u9810\u89bd\u5f48\u5e55"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u3092\u6d41\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 629
    const-string v1, "Light"

    const-string v4, "\u6dfa\u8272"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u660e\u308b\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    const-string v1, "Dark"

    const-string v4, "\u6df1\u8272"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6697\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    const-string v1, "Font"

    const-string v4, "\u5b57\u578b"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30f3\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 632
    const-string v1, "Default font"

    const-string v4, "\u9810\u8a2d\u5b57\u578b"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6a19\u6e96\u30d5\u30a9\u30f3\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    const-string v1, "Custom font"

    const-string v4, "\u81ea\u8a02\u5b57\u578b"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ab\u30b9\u30bf\u30e0\u30d5\u30a9\u30f3\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 634
    const-string v1, "Choose file"

    const-string v4, "\u9078\u64c7\u6a94\u6848"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a1\u30a4\u30eb\u3092\u9078\u629e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    const-string v1, "Reset to default"

    const-string v4, "\u9084\u539f\u9810\u8a2d\u503c"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    const-string v1, "Shadow style"

    const-string v4, "\u9670\u5f71\u6a23\u5f0f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u5f71\u306e\u7a2e\u985e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    const-string v1, "None"

    const-string v4, "\u7121"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u306a\u3057"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    const-string v1, "Loading font\u2026"

    const-string v4, "\u6b63\u5728\u8f09\u5165\u5b57\u578b\u2026"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u3092\u8aad\u307f\u8fbc\u307f\u4e2d"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 639
    const-string v1, "When enabled, preview comments animate at 30 fps. Turn off to stop continuous rendering."

    const-string v4, "\u555f\u7528\u6642\uff0c\u9810\u89bd\u5f48\u5e55\u6703\u4ee5 30 fps \u64ad\u653e\uff1b\u95dc\u9589\u5f8c\u505c\u6b62\u9023\u7e8c\u7e6a\u88fd\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "ON\u306e\u5834\u5408\u3001\u30d7\u30ec\u30d3\u30e5\u30fc\u306e\u30b3\u30e1\u30f3\u30c8\u309230fps\u3067\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u8868\u793a\u3057\u307e\u3059\u3002OFF\u306e\u5834\u5408\u306f\u9023\u7d9a\u63cf\u753b\u3092\u505c\u6b62\u3057\u307e\u3059\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 640
    const-string v1, "Wait for loading to finish before applying"

    const-string v4, "\u8acb\u5728\u8f09\u5165\u5b8c\u6210\u5f8c\u5957\u7528"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8aad\u307f\u8fbc\u307f\u5b8c\u4e86\u5f8c\u306b\u9069\u7528\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 641
    const-string v1, "Some fonts may look the same at different weights. Available weights and appearance depend on the font and Android version. Check the preview."

    const-string v4, "\u90e8\u5206\u5b57\u578b\u5728\u4e0d\u540c\u7c97\u7d30\u8a2d\u5b9a\u4e0b\u53ef\u80fd\u770b\u8d77\u4f86\u76f8\u540c\u3002\u53ef\u7528\u7684\u7c97\u7d30\u8207\u5916\u89c0\u53d6\u6c7a\u65bc\u5b57\u578b\u53ca Android \u7248\u672c\uff0c\u8acb\u4ee5\u9810\u89bd\u78ba\u8a8d\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u306b\u3088\u3063\u3066\u306f\u592a\u3055\u3092\u5909\u66f4\u3057\u3066\u3082\u898b\u305f\u76ee\u304c\u5909\u308f\u3089\u306a\u3044\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u5bfe\u5fdc\u3059\u308b\u30a6\u30a7\u30a4\u30c8\u3084Android\u306e\u30d0\u30fc\u30b8\u30e7\u30f3\u306b\u3088\u3063\u3066\u8868\u793a\u304c\u7570\u306a\u308b\u305f\u3081\u3001\u30d7\u30ec\u30d3\u30e5\u30fc\u3067\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 642
    const-string v1, "Reset to default?"

    const-string v4, "\u8981\u9084\u539f\u9810\u8a2d\u503c\u55ce\uff1f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u521d\u671f\u5024\u306b\u623b\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    const-string v1, "Changes are saved only when you apply them"

    const-string v4, "\u6309\u4e0b\u5957\u7528\u5f8c\u624d\u6703\u5132\u5b58\u8b8a\u66f4"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u9069\u7528\u3059\u308b\u307e\u3067\u306f\u4fdd\u5b58\u3055\u308c\u307e\u305b\u3093"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 644
    const-string v1, "Reset"

    const-string v4, "\u9084\u539f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u623b\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 645
    const-string v1, " \u2014 decrease"

    const-string v4, "\uff1a\u6e1b\u5c11"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u3092\u6e1b\u3089\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 646
    const-string v1, " \u2014 increase"

    const-string v4, "\uff1a\u589e\u52a0"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u3092\u5897\u3084\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 647
    const-string v1, "Streaming"

    const-string v4, "\u4e32\u6d41\u64ad\u653e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    const-string v1, "Cache"

    const-string v4, "\u5feb\u53d6"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    const-string v1, "Comment preview"

    const-string v4, "\u5f48\u5e55\u9810\u89bd"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    const-string v1, "Use minutes:seconds and keep the minimum at or below the maximum"

    const-string v4, "\u8acb\u4ee5\u5206:\u79d2\u8f38\u5165\uff0c\u4e14\u6700\u77ed\u6642\u9593\u4e0d\u53ef\u8d85\u904e\u6700\u9577\u6642\u9593"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u5206:\u79d2\u3067\u3001\u6700\u77ed \u2266 \u6700\u9577\u306b\u306a\u308b\u3088\u3046\u6307\u5b9a\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    const-string v1, "Show more"

    const-string v4, "\u986f\u793a\u66f4\u591a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u3082\u3063\u3068\u898b\u308b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    const-string v1, "Show less"

    const-string v4, "\u6536\u5408"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6298\u308a\u305f\u305f\u3080"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 653
    const-string v1, "Could not return to normal playback"

    const-string v4, "\u7121\u6cd5\u8fd4\u56de\u4e00\u822c\u64ad\u653e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u901a\u5e38\u518d\u751f\u306b\u623b\u308c\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    const-string v1, "Some tags could not be loaded. Only videos with available tag information are shown."

    const-string v4, "\u90e8\u5206\u6a19\u7c64\u7121\u6cd5\u8f09\u5165\uff0c\u76ee\u524d\u50c5\u986f\u793a\u5df2\u53d6\u5f97\u6a19\u7c64\u8cc7\u8a0a\u7684\u5f71\u7247\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4e00\u90e8\u306e\u30bf\u30b0\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u306a\u304b\u3063\u305f\u305f\u3081\u3001\u53d6\u5f97\u3067\u304d\u305f\u52d5\u753b\u306e\u307f\u8868\u793a\u3057\u3066\u3044\u307e\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 655
    const-string v1, "Available weights and appearance depend on the font and Android version. Adjacent weights may look the same. Check the preview."

    const-string v4, "\u53ef\u7528\u7684\u7c97\u7d30\u8207\u5916\u89c0\u53d6\u6c7a\u65bc\u5b57\u578b\u53ca Android \u7248\u672c\u3002\u76f8\u9130\u7c97\u7d30\u53ef\u80fd\u770b\u8d77\u4f86\u76f8\u540c\uff0c\u8acb\u4ee5\u9810\u89bd\u78ba\u8a8d\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u306e\u7a2e\u985e\u3084Android\u306e\u30d0\u30fc\u30b8\u30e7\u30f3\u306b\u3088\u3063\u3066\u3001\u9078\u629e\u3067\u304d\u308b\u592a\u3055\u3084\u898b\u305f\u76ee\u304c\u7570\u306a\u308a\u307e\u3059\u3002\u96a3\u308a\u5408\u3046\u6bb5\u968e\u3067\u9055\u3044\u304c\u51fa\u306a\u3044\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u30d7\u30ec\u30d3\u30e5\u30fc\u3067\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 656
    const-string v1, "About font weight"

    const-string v4, "\u5b57\u578b\u7c97\u7d30\u8aaa\u660e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055\u306e\u8aac\u660e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    const-string v1, "No filter rules saved"

    const-string v4, "\u5c1a\u672a\u5132\u5b58\u5c01\u9396\u898f\u5247"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u767b\u9332\u6e08\u307f\u306eNG\u8a2d\u5b9a\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 658
    const-string v1, "Could not undo Nicoru"

    const-string v4, "\u7121\u6cd5\u53d6\u6d88 Nico \u8b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30cb\u30b3\u308b\u306e\u89e3\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    const-string v1, "Sign in to use Nicoru"

    const-string v4, "\u8acb\u767b\u5165\u4ee5\u4f7f\u7528 Nico \u8b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30cb\u30b3\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 660
    const-string v1, "Player controls"

    const-string v4, "\u64ad\u653e\u5668\u64cd\u4f5c"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d7\u30ec\u30a4\u30e4\u30fc\u64cd\u4f5c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    const-string v1, "Long press for player controls"

    const-string v4, "\u9577\u6309\u4ee5\u958b\u555f\u64ad\u653e\u5668\u64cd\u4f5c"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u9577\u62bc\u3057\u3067\u30d7\u30ec\u30a4\u30e4\u30fc\u64cd\u4f5c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 662
    const-string v1, "Could not load the creator name"

    const-string v4, "\u7121\u6cd5\u8f09\u5165\u6295\u7a3f\u8005\u540d\u7a31"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u8005\u540d\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    const-string v1, "Saved to the filter list"

    const-string v4, "\u5df2\u5132\u5b58\u81f3\u5c01\u9396\u6e05\u55ae"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "NG\u30ea\u30b9\u30c8\u306b\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    const-string v1, "Some statistics could not be refreshed"

    const-string v4, "\u90e8\u5206\u7d71\u8a08\u8cc7\u8a0a\u7121\u6cd5\u66f4\u65b0"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4e00\u90e8\u306e\u7d71\u8a08\u60c5\u5831\u3092\u66f4\u65b0\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 665
    const-string v1, "Mini player"

    const-string v4, "\u8ff7\u4f60\u64ad\u653e\u5668"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30df\u30cb\u30d7\u30ec\u30a4\u30e4\u30fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    const-string v1, "Mute"

    const-string v4, "\u975c\u97f3"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30df\u30e5\u30fc\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    const-string v1, "Restore defaults"

    const-string v4, "\u9084\u539f\u9810\u8a2d\u8a2d\u5b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u521d\u671f\u72b6\u614b\u306b\u623b\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    const-string v1, "Keep player controls visible"

    const-string v4, "\u6301\u7e8c\u986f\u793a\u64ad\u653e\u5668\u64cd\u4f5c\u5217"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u64cd\u4f5c\u90e8\u306e\u5e38\u6642\u8868\u793a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 669
    const-string v1, "Normal playback only"

    const-string v4, "\u50c5\u4e00\u822c\u64ad\u653e\u6642"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u901a\u5e38\u518d\u751f\u6642\u306e\u307f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 670
    const-string v1, "Pop-up playback only"

    const-string v4, "\u50c5\u61f8\u6d6e\u8996\u7a97\u64ad\u653e\u6642"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u6642\u306e\u307f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    const-string v1, "Back"

    const-string v4, "\u8fd4\u56de"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u623b\u308b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    const-string v1, "Search refresh timed out. Check your connection."

    const-string v4, "\u641c\u5c0b\u66f4\u65b0\u903e\u6642\uff0c\u8acb\u78ba\u8a8d\u7db2\u8def\u9023\u7dda\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u691c\u7d22\u306e\u66f4\u65b0\u304c\u30bf\u30a4\u30e0\u30a2\u30a6\u30c8\u3057\u307e\u3057\u305f\u3002\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    const-string v1, "Could not delete the filter rule"

    const-string v4, "\u7121\u6cd5\u522a\u9664\u5c01\u9396\u898f\u5247"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "NG\u8a2d\u5b9a\u306e\u524a\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    const-string v1, "Delete this filter rule?"

    const-string v4, "\u8981\u522a\u9664\u6b64\u5c01\u9396\u898f\u5247\u55ce\uff1f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "NG\u8a2d\u5b9a\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 675
    const-string v1, "Upload date range"

    const-string v4, "\u6295\u7a3f\u65e5\u671f\u7bc4\u570d"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u65e5\u306e\u7bc4\u56f2"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    const-string v1, "Any"

    const-string v4, "\u4e0d\u9650"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6307\u5b9a\u306a\u3057"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    const-string v1, "\u25c0 Previous period"

    const-string v4, "\u25c0 \u4e0a\u4e00\u671f\u9593"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u25c0 \u524d\u306e\u671f\u9593"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    const-string v1, "Next period \u25b6"

    const-string v4, "\u4e0b\u4e00\u671f\u9593 \u25b6"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6b21\u306e\u671f\u9593 \u25b6"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    const-string v1, "No upper limit"

    const-string v4, "\u7121\u4e0a\u9650"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4e0a\u9650\u306a\u3057"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    const-string v1, "Video duration range"

    const-string v4, "\u5f71\u7247\u9577\u5ea6\u7bc4\u570d"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u52d5\u753b\u6642\u9593\u306e\u7bc4\u56f2"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    const-string v1, "Could not load creator information"

    const-string v4, "\u7121\u6cd5\u8f09\u5165\u6295\u7a3f\u8005\u8cc7\u8a0a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u8005\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 682
    const-string v1, "Jump to comment time"

    const-string v4, "\u8df3\u81f3\u7559\u8a00\u6642\u9593"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u306e\u6642\u9593\u306b\u79fb\u52d5"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    const-string v1, "Could not add Nicoru. Check your sign-in status and connection."

    const-string v4, "\u7121\u6cd5\u65b0\u589e Nico \u8b9a\uff0c\u8acb\u78ba\u8a8d\u767b\u5165\u72c0\u614b\u53ca\u7db2\u8def\u9023\u7dda\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30cb\u30b3\u308b\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u30a4\u30f3\u3068\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 684
    const-string v1, "Nicoru"

    const-string v4, "Nico \u8b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30cb\u30b3\u308b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    const-string v1, "Nicoru added"

    const-string v4, "\u5df2\u6309 Nico \u8b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30cb\u30b3\u308b\u6e08\u307f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 686
    const-string v1, "Adjust text, shadows, duration and maximum rows using the preview"

    const-string v4, "\u4f7f\u7528\u9810\u89bd\u8abf\u6574\u6587\u5b57\u3001\u9670\u5f71\u3001\u986f\u793a\u6642\u9593\u53ca\u6700\u5927\u884c\u6578"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d7\u30ec\u30d3\u30e5\u30fc\u3092\u898b\u306a\u304c\u3089\u6587\u5b57\u3068\u5f71\u3001\u8868\u793a\u6642\u9593\u3001\u6700\u5927\u884c\u6570\u3092\u8abf\u6574\u3057\u307e\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    const-string v1, "This is the last video"

    const-string v4, "\u9019\u662f\u6700\u5f8c\u4e00\u90e8\u5f71\u7247"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6700\u5f8c\u306e\u52d5\u753b\u3067\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    const-string v1, "Could not update your like. Check your sign-in status and connection."

    const-string v4, "\u7121\u6cd5\u8b8a\u66f4\u6309\u8b9a\u72c0\u614b\uff0c\u8acb\u78ba\u8a8d\u767b\u5165\u72c0\u614b\u53ca\u7db2\u8def\u9023\u7dda\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u3044\u3044\u306d\u306e\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u30a4\u30f3\u3068\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    const-string v1, "Sign in to like videos"

    const-string v4, "\u8acb\u767b\u5165\u4ee5\u5c0d\u5f71\u7247\u6309\u8b9a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u3044\u3044\u306d\u3059\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 690
    const-string v1, "Could not load series information"

    const-string v4, "\u7121\u6cd5\u8f09\u5165\u7cfb\u5217\u8cc7\u8a0a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b7\u30ea\u30fc\u30ba\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    const-string v1, "Sign in required"

    const-string v4, "\u9700\u8981\u767b\u5165"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    const-string v1, "Could not update your follow status"

    const-string v4, "\u7121\u6cd5\u8b8a\u66f4\u8ffd\u8e64\u72c0\u614b"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d5\u30a9\u30ed\u30fc\u306e\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    const-string v1, "Could not load video information"

    const-string v4, "\u7121\u6cd5\u8f09\u5165\u5f71\u7247\u8cc7\u8a0a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    const-string v1, "Could not open the page"

    const-string v4, "\u7121\u6cd5\u958b\u555f\u9801\u9762"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30da\u30fc\u30b8\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    const-string v1, "Series"

    const-string v4, "\u7cfb\u5217"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b7\u30ea\u30fc\u30ba"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    const-string v1, "Not part of a series"

    const-string v4, "\u672a\u52a0\u5165\u4efb\u4f55\u7cfb\u5217"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b7\u30ea\u30fc\u30ba\u306b\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u305b\u3093"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 697
    const-string v1, "Parent and child works"

    const-string v4, "\u7236\u4f5c\u54c1\u8207\u5b50\u4f5c\u54c1"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u89aa\u4f5c\u54c1\u30fb\u5b50\u4f5c\u54c1"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    const-string v1, "Open in normal player"

    const-string v4, "\u4f7f\u7528\u4e00\u822c\u64ad\u653e\u5668\u958b\u555f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u901a\u5e38\u518d\u751f\u3067\u958b\u304f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    const-string v1, "Loading\u2026"

    const-string v4, "\u6b63\u5728\u8f09\u5165\u2026"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    const-string v1, "Not set (choose a folder)"

    const-string v4, "\u672a\u8a2d\u5b9a\uff08\u8acb\u9078\u64c7\u8cc7\u6599\u593e\uff09"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u672a\u6307\u5b9a\uff08\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044\uff09"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    const-string v1, "Show comments"

    const-string v4, "\u986f\u793a\u5f48\u5e55"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    const-string v1, "Repeat"

    const-string v4, "\u91cd\u8907\u64ad\u653e"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ea\u30d4\u30fc\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    const-string v1, "Tag filters"

    const-string v4, "\u6a19\u7c64\u689d\u4ef6"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30bf\u30b0\u6761\u4ef6"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    const-string v1, "Video details buttons"

    const-string v4, "\u5f71\u7247\u8cc7\u8a0a\u6309\u9215"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    const-string v1, "Rename"

    const-string v4, "\u91cd\u65b0\u547d\u540d"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u540d\u524d\u3092\u5909\u66f4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 706
    const-string v1, "Delete cache"

    const-string v4, "\u522a\u9664\u5feb\u53d6"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    const-string v1, "Delete viewing history"

    const-string v4, "\u522a\u9664\u89c0\u770b\u7d00\u9304"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8996\u8074\u5c65\u6b74\u3092\u524a\u9664"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    const-string v1, "Add to playlist"

    const-string v4, "\u52a0\u5165\u64ad\u653e\u6e05\u55ae"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    const-string v1, "Block creator"

    const-string v4, "\u5c01\u9396\u6295\u7a3f\u8005"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u8005\u3092NG"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    const-string v1, "Tags could not be loaded for some videos"

    const-string v4, "\u90e8\u5206\u5f71\u7247\u7684\u6a19\u7c64\u7121\u6cd5\u8f09\u5165"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u4e00\u90e8\u306e\u52d5\u753b\u306e\u30bf\u30b0\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    const-string v1, "Close pop-up player"

    const-string v4, "\u95dc\u9589\u61f8\u6d6e\u64ad\u653e\u5668"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u3092\u7d42\u4e86"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    const-string v1, "Minimum and maximum duration. You can also enter an exact time in seconds."

    const-string v4, "\u5f71\u7247\u9577\u5ea6\u4e0b\u9650\u53ca\u4e0a\u9650\uff0c\u4e5f\u53ef\u5728\u8f38\u5165\u6b04\u6307\u5b9a\u7cbe\u78ba\u79d2\u6578\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u52d5\u753b\u6642\u9593\u306e\u4e0b\u9650\u30fb\u4e0a\u9650\u3002\u5165\u529b\u6b04\u304b\u3089\u79d2\u5358\u4f4d\u3067\u3082\u6307\u5b9a\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    const-string v1, "Check your email address and password"

    const-string v4, "\u8acb\u78ba\u8a8d\u96fb\u5b50\u90f5\u4ef6\u5730\u5740\u53ca\u5bc6\u78bc"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u30fb\u30d1\u30b9\u30ef\u30fc\u30c9\u3092\u78ba\u8a8d\u3057\u3066\u4e0b\u3055\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    const-string v1, "Anime, games and art"

    const-string v4, "\u52d5\u756b\u3001\u904a\u6232\u8207\u7e6a\u756b"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30a2\u30cb\u30e1\u30fb\u30b2\u30fc\u30e0\u30fb\u7d75"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    const-string v1, "Entertainment and music"

    const-string v4, "\u5a1b\u6a02\u8207\u97f3\u6a02"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u30a8\u30f3\u30bf\u30e1\u30fb\u97f3\u697d"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    const-string v1, "Lifestyle, general and sports"

    const-string v4, "\u751f\u6d3b\u3001\u7d9c\u5408\u8207\u904b\u52d5"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u751f\u6d3b\u30fb\u4e00\u822c\u30fb\u30b9\u30dd"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 717
    const-string v1, "Science and technology"

    const-string v4, "\u79d1\u5b78\u8207\u6280\u8853"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u79d1\u5b66\u30fb\u6280\u8853"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 718
    const-string v1, "View details"

    const-string v4, "\u67e5\u770b\u8a73\u60c5"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u8a73\u7d30\u3092\u307f\u308b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 719
    const-string v1, "Full-screen ad timing"

    const-string v4, "\u5168\u87a2\u5e55\u5ee3\u544a\u6642\u6a5f"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u5168\u753b\u9762\u5e83\u544a\u306e\u30bf\u30a4\u30df\u30f3\u30b0"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    const-string v1, "Choose when full-screen ads appear. Showing them before playback avoids interrupting repeats."

    const-string v4, "\u8a2d\u5b9a\u5168\u87a2\u5e55\u5ee3\u544a\u7684\u986f\u793a\u6642\u6a5f\uff1b\u8a2d\u70ba\u64ad\u653e\u524d\u986f\u793a\u53ef\u907f\u514d\u5f71\u97ff\u91cd\u8907\u64ad\u653e\u3002"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u5168\u753b\u9762\u5e83\u544a\u306e\u8868\u793a\u30bf\u30a4\u30df\u30f3\u30b0\u3092\u8a2d\u5b9a\u3057\u307e\u3059\uff08\u518d\u751f\u958b\u59cb\u524d\u306b\u8a2d\u5b9a\u3059\u308b\u3068\u30eb\u30fc\u30d7\u306b\u5f71\u97ff\u3057\u306a\u304f\u306a\u308a\u307e\u3059\uff09"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 721
    const-string v1, "Remove ads option"

    const-string v4, "\u79fb\u9664\u5ee3\u544a\u9078\u9805"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "\u5e83\u544a\u975e\u8868\u793a\u30aa\u30d7\u30b7\u30e7\u30f3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 722
    const-string v1, "Purchase the option to remove all ads in nicoid"

    const-string v4, "\u8cfc\u8cb7\u9078\u9805\u4ee5\u79fb\u9664 nicoid \u5167\u7684\u6240\u6709\u5ee3\u544a"

    filled-new-array {v1, v4}, [Ljava/lang/String;

    move-result-object v1

    const-string v4, "nicoid\u5185\u306e\u5168\u3066\u306e\u5e83\u544a\u3092\u975e\u8868\u793a\u306b\u3067\u304d\u308b\u30aa\u30d7\u30b7\u30e7\u30f3\u3092\u8cfc\u5165\u3067\u304d\u307e\u3059"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    const-string v0, "\u30ed\u30b0\u30a4\u30f3\u305b\u305a\u306b\u4f7f\u7528"

    move-object/from16 v1, v16

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    const-string v0, "\u518d\u751f\u30e2\u30fc\u30c9"

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    const-string v0, "\u8a2d\u5b9a\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-interface {v1, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    const-string v0, "\u30ed\u30b0\u30a4\u30f3\u306b\u6210\u529f\u3057\u307e\u3057\u305f"

    invoke-interface {v1, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 727
    invoke-static {}, Le/e/a/UiStrings;->buildJapaneseLookup()V

    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    invoke-static {v0}, Le/e/a/Words119;->install(Ljava/util/Map;)V

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 758
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildJapaneseLookup()V
    .registers 8

    .line 737
    const-string v0, "[A-Za-z][A-Za-z0-9 \u2019\'/-]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 738
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 739
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

    if-nez v3, :cond_78

    .line 743
    sget-object v2, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 744
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

    .line 751
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    sget-object v1, Le/e/a/UiStrings;->JAPANESE_ALIASES:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-void

    .line 744
    :cond_39
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 745
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 746
    sget-object v6, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2b

    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_2b

    if-eqz v2, :cond_2b

    array-length v7, v2

    if-lez v7, :cond_2b

    aget-object v7, v2, v4

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2b

    .line 747
    aget-object v2, v2, v4

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_2b

    .line 748
    invoke-interface {v6, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2b

    .line 739
    :cond_78
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 740
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 741
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
    .registers 7

    .line 730
    sget-object v0, Le/e/a/UiStrings;->TEXT:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    if-eqz v0, :cond_b

    return-object v0

    .line 732
    :cond_b
    const-string v0, "[0-9]+\u884c"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "1"

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_55

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    new-array v0, v2, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    const-string v1, " row"

    goto :goto_37

    :cond_35
    const-string v1, " rows"

    :goto_37
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " \u884c"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v3

    return-object v0

    .line 733
    :cond_55
    const-string v0, "[0-9]+\u79d2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    new-array v0, v2, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7a

    const-string v1, " second"

    goto :goto_7c

    :cond_7a
    const-string v1, " seconds"

    :goto_7c
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " \u79d2"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v3

    return-object v0

    :cond_9a
    const/4 p0, 0x0

    return-object p0
.end method

.method public static selectLanguage(Ljava/lang/String;)V
    .registers 4

    const/4 v0, -0x1

    if-nez p0, :cond_6

    .line 760
    sput v0, Le/e/a/UiStrings;->selectedLanguage:I

    return-void

    .line 761
    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x5f

    const/16 v2, 0x2d

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 762
    const-string v1, "0"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_86

    const-string v1, "ja"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_86

    const-string v1, "ja-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_86

    const-string v1, "japanese"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_39

    goto :goto_86

    .line 763
    :cond_39
    const-string v1, "1"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_82

    const-string v1, "en"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_82

    const-string v1, "en-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_82

    const-string v1, "english"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5a

    goto :goto_82

    .line 764
    :cond_5a
    const-string v1, "2"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7e

    const-string v1, "zh"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7e

    const-string v1, "zh-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7e

    const-string v1, "chinese"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7b

    goto :goto_7e

    .line 765
    :cond_7b
    sput v0, Le/e/a/UiStrings;->selectedLanguage:I

    goto :goto_89

    :cond_7e
    :goto_7e
    const/4 p0, 0x2

    .line 764
    sput p0, Le/e/a/UiStrings;->selectedLanguage:I

    goto :goto_89

    :cond_82
    :goto_82
    const/4 p0, 0x1

    .line 763
    sput p0, Le/e/a/UiStrings;->selectedLanguage:I

    goto :goto_89

    :cond_86
    :goto_86
    const/4 p0, 0x0

    .line 762
    sput p0, Le/e/a/UiStrings;->selectedLanguage:I

    :goto_89
    return-void
.end method

.method private static toJapanese(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 755
    :cond_4
    sget-object v0, Le/e/a/UiStrings;->JAPANESE_LOOKUP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_f

    goto :goto_10

    :cond_f
    move-object p0, v0

    :goto_10
    return-object p0
.end method

.method public static translate(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 768
    const-string v0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string p0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    .line 769
    :cond_a
    const-string v0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const-string p0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    .line 770
    :cond_14
    sget v0, Le/e/a/UiStrings;->selectedLanguage:I

    if-gez v0, :cond_25

    .line 771
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_25
    if-nez p0, :cond_2d

    const/4 p0, 0x0

    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2d
    if-nez v0, :cond_38

    .line 773
    invoke-static {p0}, Le/e/a/UiStrings;->toJapanese(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 774
    :cond_38
    invoke-static {p0}, Le/e/a/UiStrings;->lookup(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3f

    goto :goto_43

    :cond_3f
    add-int/lit8 v0, v0, -0x1

    .line 775
    aget-object p0, v1, v0

    :goto_43
    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static translate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    .line 778
    const-string v0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string p0, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    .line 779
    :cond_a
    const-string v0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092\u9001\u308b"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const-string p0, "\u518d\u751f\u72b6\u6cc1\u3068\u901a\u4fe1\u7d50\u679c\u3092Download\u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58"

    :cond_14
    if-nez p0, :cond_1c

    const/4 p0, 0x0

    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 781
    :cond_1c
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    .line 782
    const-string v0, "en"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    const-string v1, "zh"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    invoke-static {p0}, Le/e/a/UiStrings;->toJapanese(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 783
    :cond_39
    invoke-static {p0}, Le/e/a/UiStrings;->lookup(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_40

    goto :goto_48

    .line 784
    :cond_40
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    aget-object p0, v1, p0

    :goto_48
    invoke-static {p0}, Le/e/a/CastSettings219;->text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
