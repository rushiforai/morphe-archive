.class public Ll/leh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/keh;


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


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    const/4 p2, 0x0

    .line 9
    const/16 p3, 0x9

    .line 10
    .line 11
    invoke-static {p1, p3, p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F2(Landroid/content/Context;IZZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p1, p3, p2}, Ll/cn40;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public b(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    const/4 p2, 0x0

    .line 9
    const/16 p3, 0x9

    .line 10
    .line 11
    invoke-static {p1, p3, p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F2(Landroid/content/Context;IZZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p7, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 22
    .line 23
    move-object p7, p6

    .line 24
    move-object p6, p5

    .line 25
    move-object p5, p4

    .line 26
    move p4, p3

    .line 27
    move-object p3, p2

    .line 28
    move-object p2, p1

    .line 29
    move-object p1, p0

    .line 30
    invoke-interface/range {p1 .. p8}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Nr(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;ILl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "I",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p1, p2, p0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F2(Landroid/content/Context;IZZ)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p1, p2}, Ll/cn40;->b0(Lcom/p1/mobile/android/app/Act;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Ll/leh;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    const/4 p2, 0x0

    .line 9
    const/16 p3, 0x9

    .line 10
    .line 11
    invoke-static {p1, p3, p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F2(Landroid/content/Context;IZZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p6, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 22
    .line 23
    move-object p6, p5

    .line 24
    move-object p5, p4

    .line 25
    move-object p4, p3

    .line 26
    move p3, p2

    .line 27
    move-object p2, p1

    .line 28
    move-object p1, p0

    .line 29
    invoke-interface/range {p1 .. p8}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->le(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    const/4 p2, 0x0

    .line 9
    const/16 v0, 0x9

    .line 10
    .line 11
    invoke-static {p1, v0, p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F2(Landroid/content/Context;IZZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p1, p2}, Ll/cn40;->N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;ILl/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "I",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p1, p2, p0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F2(Landroid/content/Context;IZZ)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 p0, 0x1

    .line 26
    invoke-static {p1, p2, p0, p3}, Ll/cn40;->d0(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
