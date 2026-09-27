.class final Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;
.super Ljava/lang/Object;
.source "CaptionIntentPolicy.java"


# static fields
.field static final OFF:I = 0x0

.field static final ON:I = 0x1

.field static final UNKNOWN:I = -0x1


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs containsAny(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 7

    .line 43
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_3
    if-ge v2, v0, :cond_1e

    aget-object v3, p1, v2

    .line 44
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1b

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_1e
    return v1
.end method

.method static fromDescription(Ljava/lang/String;)I
    .registers 15

    if-nez p0, :cond_5

    .line 25
    const-string p0, ""

    goto :goto_f

    .line 26
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 27
    :goto_f
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_17

    return v1

    .line 29
    :cond_17
    const-string v12, "\u5b57\u5e55\u3092\u30aa\u30d5"

    const-string v13, "\uc790\ub9c9 \uc0ac\uc6a9 \uc911\uc9c0"

    const-string v2, "turn off"

    const-string v3, "disable captions"

    const-string v4, "captions on"

    const-string v5, "captions enabled"

    const-string v6, "\u5173\u95ed\u5b57\u5e55"

    const-string v7, "\u95dc\u9589\u5b57\u5e55"

    const-string v8, "\u5b57\u5e55\u5df2\u5f00\u542f"

    const-string v9, "\u5b57\u5e55\u5df2\u958b\u555f"

    const-string v10, "\u5b57\u5e55\u5f00\u542f"

    const-string v11, "\u5b57\u5e55\u958b\u555f"

    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;->containsAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3b

    const/4 p0, 0x1

    return p0

    .line 34
    :cond_3b
    const-string v12, "\u6253\u5f00\u5b57\u5e55"

    const-string v13, "\u5b57\u5e55\u3092\u30aa\u30f3"

    const-string v2, "turn on"

    const-string v3, "enable captions"

    const-string v4, "captions off"

    const-string v5, "captions disabled"

    const-string v6, "\u5b57\u5e55\u5df2\u5173\u95ed"

    const-string v7, "\u5b57\u5e55\u5df2\u95dc\u9589"

    const-string v8, "\u5b57\u5e55\u5173\u95ed"

    const-string v9, "\u5b57\u5e55\u95dc\u9589"

    const-string v10, "\u5f00\u542f\u5b57\u5e55"

    const-string v11, "\u958b\u555f\u5b57\u5e55"

    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;->containsAny(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5f

    const/4 p0, 0x0

    return p0

    :cond_5f
    return v1
.end method

.method static mayActivate(IJJ)Z
    .registers 6

    const/4 v0, 0x1

    if-eq p0, v0, :cond_a

    cmp-long p0, p1, p3

    if-gtz p0, :cond_8

    goto :goto_a

    :cond_8
    const/4 p0, 0x0

    return p0

    :cond_a
    :goto_a
    return v0
.end method

.method static shouldTurnOff(ZII)Z
    .registers 4

    const/4 v0, 0x1

    if-nez p0, :cond_d

    if-eq p1, v0, :cond_d

    const/4 p0, -0x1

    if-ne p1, p0, :cond_b

    if-ne p2, v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 p0, 0x0

    return p0

    :cond_d
    :goto_d
    return v0
.end method
