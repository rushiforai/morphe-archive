.class public Ll/j9h;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/NotifyUser;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    invoke-static {p0, v0, p2, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "robotname"

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NotifyUser;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "e_at_robot"

    .line 25
    .line 26
    invoke-static {p1, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUser;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/view/HighlightData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/feed/data/NotifyUser;

    .line 21
    .line 22
    new-instance v2, Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v4, "@"

    .line 27
    .line 28
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/NotifyUser;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    new-instance v4, Ll/i9h;

    .line 41
    .line 42
    invoke-direct {v4, p0, v1, p2, p1}, Ll/i9h;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/NotifyUser;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-direct {v2, v3, v1, v1, v4}, Lcom/p1/mobile/putong/newui/view/HighlightData;-><init>(Ljava/lang/String;ZZLl/x20;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lv/VText;Ljava/lang/CharSequence;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    .line 10
    .line 11
    invoke-virtual {p1, p2, p0}, Lv/VText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0, p5, p4, p3}, Ll/j9h;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance p3, Ll/a5l;

    .line 27
    .line 28
    invoke-direct {p3}, Ll/a5l;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, p1, p2, p0}, Ll/a5l;->b(Lv/VText;Ljava/lang/CharSequence;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/feed/data/NotifyUser;

    .line 26
    .line 27
    const-string v1, "robotname"

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/NotifyUser;->name:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_at_robot"

    .line 40
    .line 41
    invoke-static {v1, p1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method
