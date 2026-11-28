.class public final Le/e/a/PlaybackChoiceOrder270;
.super Ljava/lang/Object;
.source "PlaybackChoiceOrder270.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static kind(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I
    .registers 4

    .line 14
    const-string v0, ""

    if-nez p0, :cond_0

    move-object p0, v0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    if-eqz p1, :cond_1

    .line 15
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 16
    :cond_1
    const-string p1, "popup"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "popout"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "floating"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 17
    const-string v1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 18
    const-string/jumbo p1, "\u61f8\u6d6e"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string/jumbo p1, "\u60ac\u6d6e"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string/jumbo p1, "\u6d6e\u52d5"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 19
    const-string p1, "background"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "bg"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 20
    const-string p0, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 21
    const-string/jumbo p0, "\u80cc\u666f\u64ad\u653e"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    const-string/jumbo p0, "\u80cc\u666f"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    const/4 p0, 0x0

    return p0

    :cond_2
    const/4 p0, 0x2

    return p0

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public static ordered([Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Z
    .registers 9

    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    .line 43
    array-length v1, p0

    array-length v2, p1

    if-ne v1, v2, :cond_6

    const/4 v1, -0x1

    move v3, v0

    move v2, v1

    .line 45
    :goto_0
    array-length v4, p1

    const/4 v5, 0x1

    if-lt v3, v4, :cond_1

    if-ltz v1, :cond_0

    if-ltz v2, :cond_0

    if-lt v1, v2, :cond_0

    return v0

    :cond_0
    return v5

    .line 46
    :cond_1
    aget-object v4, p1, v3

    aget-object v6, p0, v3

    invoke-static {v4, v6}, Le/e/a/PlaybackChoiceOrder270;->kind(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v4

    if-ne v4, v5, :cond_3

    if-ltz v1, :cond_2

    return v0

    :cond_2
    move v1, v3

    :cond_3
    const/4 v5, 0x2

    if-ne v4, v5, :cond_5

    if-ltz v2, :cond_4

    return v0

    :cond_4
    move v2, v3

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method

.method public static reorder([Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Z
    .registers 9

    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    .line 26
    array-length v1, p0

    array-length v2, p1

    if-ne v1, v2, :cond_6

    const/4 v1, -0x1

    move v3, v0

    move v2, v1

    .line 28
    :goto_0
    array-length v4, p1

    const/4 v5, 0x1

    if-lt v3, v4, :cond_1

    if-ltz v1, :cond_0

    if-ltz v2, :cond_0

    if-lt v1, v2, :cond_0

    .line 34
    aget-object v0, p0, v1

    .line 35
    aget-object v3, p0, v2

    aput-object v3, p0, v1

    aput-object v0, p0, v2

    .line 36
    aget-object p0, p1, v1

    .line 37
    aget-object v0, p1, v2

    aput-object v0, p1, v1

    aput-object p0, p1, v2

    return v5

    :cond_0
    return v0

    .line 29
    :cond_1
    aget-object v4, p1, v3

    aget-object v6, p0, v3

    invoke-static {v4, v6}, Le/e/a/PlaybackChoiceOrder270;->kind(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v4

    if-ne v4, v5, :cond_3

    if-ltz v1, :cond_2

    return v0

    :cond_2
    move v1, v3

    :cond_3
    const/4 v5, 0x2

    if-ne v4, v5, :cond_5

    if-ltz v2, :cond_4

    return v0

    :cond_4
    move v2, v3

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method
