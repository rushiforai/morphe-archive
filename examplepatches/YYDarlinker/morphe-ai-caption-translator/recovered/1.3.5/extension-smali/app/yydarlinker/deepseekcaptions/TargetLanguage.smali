.class final Lapp/yydarlinker/deepseekcaptions/TargetLanguage;
.super Ljava/lang/Object;
.source "TargetLanguage.java"


# static fields
.field private static final CHINESE_NAMES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final SIMPLIFIED_CHINESE:Lapp/yydarlinker/deepseekcaptions/TargetLanguage;


# instance fields
.field final code:Ljava/lang/String;

.field final displayName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 11
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    const-string v1, "zh-Hans"

    const-string v2, "\u7b80\u4f53\u4e2d\u6587"

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->SIMPLIFIED_CHINESE:Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    .line 14
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->CHINESE_NAMES:Ljava/util/Map;

    .line 17
    const-string v1, "af"

    const-string v3, "\u5357\u975e\u8377\u5170\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    const-string v1, "ar"

    const-string v3, "\u963f\u62c9\u4f2f\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    const-string v1, "bg"

    const-string v3, "\u4fdd\u52a0\u5229\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    const-string v1, "bn"

    const-string v3, "\u5b5f\u52a0\u62c9\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    const-string v1, "ca"

    const-string v3, "\u52a0\u6cf0\u7f57\u5c3c\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    const-string v1, "cs"

    const-string v3, "\u6377\u514b\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    const-string v1, "da"

    const-string v3, "\u4e39\u9ea6\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    const-string v1, "de"

    const-string v3, "\u5fb7\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    const-string v1, "el"

    const-string v3, "\u5e0c\u814a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    const-string v1, "en"

    const-string v3, "\u82f1\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    const-string v1, "es"

    const-string v3, "\u897f\u73ed\u7259\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    const-string v1, "et"

    const-string v3, "\u7231\u6c99\u5c3c\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    const-string v1, "fa"

    const-string v3, "\u6ce2\u65af\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    const-string v1, "fi"

    const-string v3, "\u82ac\u5170\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    const-string v1, "fil"

    const-string v3, "\u83f2\u5f8b\u5bbe\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    const-string v1, "fr"

    const-string v3, "\u6cd5\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    const-string v1, "he"

    const-string v3, "\u5e0c\u4f2f\u6765\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    const-string v1, "hi"

    const-string v3, "\u5370\u5730\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    const-string v1, "hr"

    const-string v3, "\u514b\u7f57\u5730\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    const-string v1, "hu"

    const-string v3, "\u5308\u7259\u5229\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const-string v1, "id"

    const-string v3, "\u5370\u5ea6\u5c3c\u897f\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    const-string v1, "it"

    const-string v3, "\u610f\u5927\u5229\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    const-string v1, "ja"

    const-string v3, "\u65e5\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    const-string v1, "ko"

    const-string v3, "\u97e9\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    const-string v1, "lt"

    const-string v3, "\u7acb\u9676\u5b9b\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    const-string v1, "lv"

    const-string v3, "\u62c9\u8131\u7ef4\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    const-string v1, "ms"

    const-string v3, "\u9a6c\u6765\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    const-string v1, "nl"

    const-string v3, "\u8377\u5170\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    const-string v1, "no"

    const-string v3, "\u632a\u5a01\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v1, "pl"

    const-string v3, "\u6ce2\u5170\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v1, "pt"

    const-string v3, "\u8461\u8404\u7259\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    const-string v1, "ro"

    const-string v3, "\u7f57\u9a6c\u5c3c\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    const-string v1, "ru"

    const-string v3, "\u4fc4\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    const-string v1, "sk"

    const-string v3, "\u65af\u6d1b\u4f10\u514b\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v1, "sl"

    const-string v3, "\u65af\u6d1b\u6587\u5c3c\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const-string v1, "sr"

    const-string v3, "\u585e\u5c14\u7ef4\u4e9a\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-string v1, "sv"

    const-string v3, "\u745e\u5178\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const-string v1, "sw"

    const-string v3, "\u65af\u74e6\u5e0c\u91cc\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string v1, "ta"

    const-string v3, "\u6cf0\u7c73\u5c14\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v1, "te"

    const-string v3, "\u6cf0\u5362\u56fa\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v1, "th"

    const-string v3, "\u6cf0\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v1, "tr"

    const-string v3, "\u571f\u8033\u5176\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string v1, "uk"

    const-string v3, "\u4e4c\u514b\u5170\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    const-string v1, "ur"

    const-string v3, "\u4e4c\u5c14\u90fd\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v1, "vi"

    const-string v3, "\u8d8a\u5357\u8bed"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v1, "zh"

    const-string v3, "\u4e2d\u6587"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v1, "zh-hans"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v1, "zh-cn"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v1, "zh-sg"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v1, "zh-hant"

    const-string v2, "\u7e41\u4f53\u4e2d\u6587"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v1, "zh-tw"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-string v1, "zh-hk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    .line 76
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->displayName:Ljava/lang/String;

    return-void
.end method

.method static fromCode(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;
    .registers 4

    .line 91
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object p0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->SIMPLIFIED_CHINESE:Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    return-object p0

    .line 93
    :cond_d
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 94
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->CHINESE_NAMES:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_28

    .line 95
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->primary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    :cond_28
    if-eqz v2, :cond_34

    .line 96
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 98
    :cond_34
    :try_start_34
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->toModernTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    .line 99
    sget-object v1, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2
    :try_end_42
    .catchall {:try_start_34 .. :try_end_42} :catchall_43

    goto :goto_45

    .line 101
    :catchall_43
    const-string v2, ""

    :cond_45
    :goto_45
    if-eqz v2, :cond_51

    .line 104
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_52

    :cond_51
    move-object v2, p0

    .line 105
    :cond_52
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method static fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;
    .registers 3

    .line 80
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 83
    :cond_8
    :try_start_8
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v0, "tlang"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_13

    goto :goto_14

    :catchall_13
    move-object p0, v1

    :goto_14
    if-eqz p0, :cond_26

    .line 86
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_21

    goto :goto_26

    .line 87
    :cond_21
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromCode(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p0

    return-object p0

    :cond_26
    :goto_26
    return-object v1
.end method

.method private static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 152
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 153
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x5f

    const/16 v2, 0x2d

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_18

    return-object v0

    .line 155
    :cond_18
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 156
    const-string v1, "iw"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    const-string p0, "he"

    return-object p0

    .line 157
    :cond_29
    const-string v1, "in"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    const-string p0, "id"

    return-object p0

    .line 158
    :cond_34
    const-string v1, "ji"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const-string p0, "yi"

    return-object p0

    .line 159
    :cond_3f
    const-string v1, "zh-hans"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_75

    const-string v1, "zh-cn"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_75

    const-string v1, "zh-sg"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_58

    goto :goto_75

    .line 162
    :cond_58
    const-string v1, "zh-hant"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_72

    const-string v1, "zh-tw"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_72

    const-string v1, "zh-hk"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_71

    goto :goto_72

    :cond_71
    return-object p0

    .line 163
    :cond_72
    :goto_72
    const-string p0, "zh-Hant"

    return-object p0

    .line 160
    :cond_75
    :goto_75
    const-string p0, "zh-Hans"

    return-object p0
.end method

.method private static primary(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const/16 v0, 0x2d

    .line 169
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_9

    return-object p0

    :cond_9
    const/4 v1, 0x0

    .line 170
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static toModernTag(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 174
    const-string v0, "iw"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p0, "he"

    return-object p0

    .line 175
    :cond_b
    const-string v0, "in"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string p0, "id"

    return-object p0

    .line 176
    :cond_16
    const-string v0, "ji"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    const-string p0, "yi"

    :cond_20
    return-object p0
.end method

.method static withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 15

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 115
    :cond_4
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromCode(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p1

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    const/16 v0, 0x23

    .line 116
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 117
    const-string v1, ""

    if-ltz v0, :cond_19

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1a

    :cond_19
    move-object v2, v1

    :goto_1a
    const/4 v3, 0x0

    if-ltz v0, :cond_21

    .line 118
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_21
    const/16 v0, 0x3f

    .line 119
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_39

    .line 120
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3f

    :cond_39
    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_3f
    const/4 v5, 0x1

    if-gez v4, :cond_43

    goto :goto_48

    :cond_43
    add-int/2addr v4, v5

    .line 121
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 123
    :goto_48
    const-string p0, "&"

    const/4 v4, -0x1

    invoke-virtual {v1, p0, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    array-length v4, p0

    move v6, v3

    move v7, v6

    :goto_57
    const/16 v8, 0x26

    if-ge v6, v4, :cond_9e

    aget-object v9, p0, v6

    .line 127
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_64

    goto :goto_9b

    .line 128
    :cond_64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    if-lez v10, :cond_6d

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_6d
    const/16 v8, 0x3d

    .line 129
    invoke-virtual {v9, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    if-gez v10, :cond_77

    move-object v10, v9

    goto :goto_7b

    .line 130
    :cond_77
    invoke-virtual {v9, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 133
    :goto_7b
    :try_start_7b
    invoke-static {v10}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11
    :try_end_7f
    .catchall {:try_start_7b .. :try_end_7f} :catchall_80

    goto :goto_81

    :catchall_80
    move-object v11, v10

    .line 137
    :goto_81
    const-string v12, "tlang"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_98

    .line 138
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v7, v5

    goto :goto_9b

    .line 141
    :cond_98
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_9b
    add-int/lit8 v6, v6, 0x1

    goto :goto_57

    :cond_9e
    if-nez v7, :cond_b5

    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_a9

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    :cond_a9
    const-string p0, "tlang="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    :cond_b5
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method promptLabel()Ljava/lang/String;
    .registers 3

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\uff08\u8bed\u8a00\u4ee3\u7801 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\uff09"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
