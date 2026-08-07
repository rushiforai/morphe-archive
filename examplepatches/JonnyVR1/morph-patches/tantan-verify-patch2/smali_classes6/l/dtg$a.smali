.class public Ll/dtg$a;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dtg;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/dtg;


# direct methods
.method public constructor <init>(Ll/dtg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ie80$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/dtg$a;->a:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 15
    .line 16
    iget-object v1, v1, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "moment_id"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 29
    .line 30
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "owner_id"

    .line 37
    .line 38
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    filled-new-array {v1, p0}, [Ll/tfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "e_video_play_over"

    .line 47
    .line 48
    invoke-static {v1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onComplete()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 15
    .line 16
    iget-object v1, v1, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "moment_id"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 29
    .line 30
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "owner_id"

    .line 37
    .line 38
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    filled-new-array {v1, p0}, [Ll/tfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "e_video_play_over"

    .line 47
    .line 48
    invoke-static {v1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/dtg$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 6
    .line 7
    iget-object v0, v0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 16
    .line 17
    iget-object v1, v1, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "moment_id"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 30
    .line 31
    iget-object v2, v2, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 36
    .line 37
    const-string v3, "owner_id"

    .line 38
    .line 39
    invoke-static {v3, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    filled-new-array {v1, v2}, [Ll/tfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "e_video_play_start"

    .line 48
    .line 49
    invoke-static {v2, v0, v1}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Ll/dtg$a;->a:Z

    .line 54
    .line 55
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 12
    .line 13
    iget-object v1, v1, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "moment_id"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object p0, p0, Ll/dtg$a;->b:Ll/dtg;

    .line 26
    .line 27
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "owner_id"

    .line 34
    .line 35
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {v1, p0}, [Ll/tfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v1, "e_video_play_start"

    .line 44
    .line 45
    invoke-static {v1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
