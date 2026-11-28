.class public final Le/e/a/LocalePatch215;
.super Ljava/lang/Object;
.source "LocalePatch215.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isActivePlaylist(Landroid/app/Activity;)Z
    .registers 3

    .line 78
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 79
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    .line 80
    if-eqz p0, :cond_1

    const-string v1, "nicoid_local_playlists"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public static label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 55
    invoke-static {p0}, Le/e/a/LocalePatch215;->language(Landroid/content/Context;)I

    move-result p0

    .line 56
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    move-object p1, p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x2

    if-ne p0, p2, :cond_1

    move-object p1, p3

    :cond_1
    :goto_0
    return-object p1
.end method

.method public static language(Landroid/content/Context;)I
    .registers 9

    .line 41
    const-string/jumbo v0, "\u66f4\u65b0"

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    const-string v4, "e.e.a.UiStrings"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 42
    const-string v5, "translate"

    new-array v6, v3, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 43
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 44
    const-string v5, "Refresh"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    return v3

    .line 45
    :cond_0
    const-string/jumbo v5, "\u91cd\u65b0\u6574\u7406"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    return v1

    .line 46
    :cond_1
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_2

    return v2

    .line 47
    :catch_0
    move-exception v0

    :cond_2
    nop

    .line 48
    if-nez p0, :cond_3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    goto :goto_0

    .line 49
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 50
    :goto_0
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 51
    const-string v0, "en"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    move v1, v3

    goto :goto_1

    :cond_4
    const-string v0, "zh"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_1

    :cond_5
    move v1, v2

    :goto_1
    return v1
.end method

.method public static lookup(Ljava/lang/String;)[Ljava/lang/String;
    .registers 4

    .line 18
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 19
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const-string/jumbo v2, "\u79fb\u52d5"

    sparse-switch v1, :sswitch_data_0

    :cond_1
    goto/16 :goto_0

    :sswitch_0
    const-string v1, "\u518d\u751f\u5f85\u3061\u306e\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_1

    :sswitch_1
    const-string/jumbo v1, "\u8907\u6570\u9078\u629e"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x3

    goto :goto_1

    :sswitch_2
    const-string v1, "\u4e00\u62ec\u767b\u9332"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x4

    goto :goto_1

    :sswitch_3
    const-string v1, "\u5168\u9078\u629e"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x5

    goto :goto_1

    :sswitch_4
    const-string v1, "\u5168\u89e3\u9664"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x6

    goto :goto_1

    :sswitch_5
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x7

    goto :goto_1

    :sswitch_6
    const-string/jumbo v1, "\u767b\u9332"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/16 p0, 0x9

    goto :goto_1

    :sswitch_7
    const-string v1, "\u5b8c\u4e86"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/16 p0, 0x8

    goto :goto_1

    :sswitch_8
    const-string v1, "\u518d\u751f\u30ad\u30e5\u30fc"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x0

    goto :goto_1

    :sswitch_9
    const-string v1, "\u518d\u751f\u30ad\u30e5\u30fc\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x2

    goto :goto_1

    :goto_0
    const/4 p0, -0x1

    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 30
    return-object v0

    .line 29
    :pswitch_0
    const-string p0, "Add"

    const-string v0, "\u52a0\u5165"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 28
    :pswitch_1
    const-string p0, "Done"

    const-string v0, "\u5b8c\u6210"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 27
    :pswitch_2
    const-string p0, "Move"

    invoke-static {p0, v2}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 26
    :pswitch_3
    const-string p0, "Deselect all"

    const-string v0, "\u53d6\u6d88\u5168\u9078"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 25
    :pswitch_4
    const-string p0, "Select all"

    const-string v0, "\u5168\u9078"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 24
    :pswitch_5
    const-string p0, "Add selected videos"

    const-string/jumbo v0, "\u6279\u6b21\u52a0\u5165\u5f71\u7247"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 23
    :pswitch_6
    const-string p0, "Select multiple"

    const-string v0, "\u591a\u9078"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 22
    :pswitch_7
    const-string p0, "Remove from playback queue?"

    const-string/jumbo v0, "\u8981\u5f9e\u64ad\u653e\u4f47\u5217\u79fb\u9664\u55ce\uff1f"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 21
    :pswitch_8
    const-string p0, "No videos in the playback queue"

    const-string/jumbo v0, "\u64ad\u653e\u4f47\u5217\u4e2d\u6c92\u6709\u5f71\u7247"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 20
    :pswitch_9
    const-string p0, "Playback queue"

    const-string/jumbo v0, "\u64ad\u653e\u4f47\u5217"

    invoke-static {p0, v0}, Le/e/a/LocalePatch215;->pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x56b33604 -> :sswitch_9
        -0x4cd2e44e -> :sswitch_8
        0xb647a -> :sswitch_7
        0xeec17 -> :sswitch_6
        0xf183a -> :sswitch_5
        0x142e049 -> :sswitch_4
        0x143788e -> :sswitch_3
        0x24f73603 -> :sswitch_2
        0x3fd8b02f -> :sswitch_1
        0x6875a085 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static pair(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 2

    .line 35
    filled-new-array {p0, p1}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static shouldSkipTabRefresh(Landroid/view/Menu;)Z
    .registers 4

    .line 84
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    invoke-interface {p0}, Landroid/view/Menu;->size()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 85
    :cond_0
    invoke-interface {p0, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object p0

    .line 86
    invoke-interface {p0}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    if-nez v1, :cond_4

    invoke-interface {p0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 87
    :cond_1
    invoke-interface {p0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    .line 88
    const-string/jumbo v1, "\u66f4\u65b0"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "Refresh"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "\u91cd\u65b0\u6574\u7406"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    move v0, v2

    :cond_3
    return v0

    .line 86
    :cond_4
    :goto_0
    return v0

    .line 84
    :cond_5
    :goto_1
    return v0
.end method

.method public static title(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 6

    .line 61
    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 62
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 63
    nop

    .line 64
    const-string v1, "\u306e\u6295\u7a3f\u52d5\u753b"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v2, v3, :cond_1

    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v2, v1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 66
    const-string v1, "Refresh"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\'s uploaded videos"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 67
    :cond_2
    const-string/jumbo v1, "\u91cd\u65b0\u6574\u7406"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " \u7684\u6295\u7a3f\u5f71\u7247"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 68
    :cond_3
    return-object p0

    .line 64
    :cond_4
    :goto_0
    return-object p0
.end method
