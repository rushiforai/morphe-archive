.class public final Le/e/a/MenuVisible203;
.super Ljava/lang/Object;
.source "MenuVisible203.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static keyForAction(Le/e/a/ListActions$Action;)Ljava/lang/String;
    .registers 3

    .line 8
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 9
    :cond_0
    iget-object v1, p0, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v0, p0, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 10
    :cond_1
    const-string v1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "popup playback"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 11
    const-string v1, "\u61f8\u6d6e\u64ad\u653e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "\u6d6e\u52d5\u64ad\u653e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 13
    const-string v1, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 14
    const-string v1, "background playback"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "\u80cc\u666f\u64ad\u653e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "video_menu_visible_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Le/e/a/ListActions$Action;->id:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 15
    :cond_2
    const-string p0, "video_menu_visible_7"

    return-object p0

    .line 12
    :cond_3
    const-string p0, "video_menu_visible_9"

    return-object p0
.end method
