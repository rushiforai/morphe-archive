.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

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
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public onComplete()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onComplete()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "moment_id"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "owner_id"

    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {v0, p0}, [Ll/tfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "e_video_play_over"

    .line 37
    .line 38
    const-string v1, "p_user_moment_interactions_details_view"

    .line 39
    .line 40
    invoke-static {v0, v1, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "moment_id"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "owner_id"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    filled-new-array {v0, v1}, [Ll/tfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_video_play_start"

    .line 38
    .line 39
    const-string v2, "p_user_moment_interactions_details_view"

    .line 40
    .line 41
    invoke-static {v1, v2, v0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->a:Z

    .line 46
    .line 47
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "moment_id"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "owner_id"

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {v0, p0}, [Ll/tfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "e_video_play_start"

    .line 34
    .line 35
    const-string v1, "p_user_moment_interactions_details_view"

    .line 36
    .line 37
    invoke-static {v0, v1, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
