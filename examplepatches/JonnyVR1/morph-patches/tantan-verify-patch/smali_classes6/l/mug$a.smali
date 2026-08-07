.class public Ll/mug$a;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mug;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/mug;


# direct methods
.method public constructor <init>(Ll/mug;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mug$a;->b:Ll/mug;

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
    iput-boolean v0, p0, Ll/mug$a;->a:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/mug$a;->b:Ll/mug;

    .line 5
    .line 6
    iget-object v0, v0, Ll/mug;->z:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/mug$a;->b:Ll/mug;

    .line 13
    .line 14
    iget-object v1, v1, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "moment_id"

    .line 19
    .line 20
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object p0, p0, Ll/mug$a;->b:Ll/mug;

    .line 25
    .line 26
    iget-object p0, p0, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "owner_id"

    .line 31
    .line 32
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {v1, p0}, [Ll/tfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v1, "e_video_play_over"

    .line 41
    .line 42
    invoke-static {v1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onComplete()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mug$a;->b:Ll/mug;

    .line 5
    .line 6
    iget-object v0, v0, Ll/mug;->z:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/mug$a;->b:Ll/mug;

    .line 13
    .line 14
    iget-object v1, v1, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "moment_id"

    .line 19
    .line 20
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object p0, p0, Ll/mug$a;->b:Ll/mug;

    .line 25
    .line 26
    iget-object p0, p0, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "owner_id"

    .line 31
    .line 32
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {v1, p0}, [Ll/tfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v1, "e_video_play_over"

    .line 41
    .line 42
    invoke-static {v1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/mug$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/mug$a;->b:Ll/mug;

    .line 6
    .line 7
    iget-object v0, v0, Ll/mug;->z:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/mug$a;->b:Ll/mug;

    .line 14
    .line 15
    iget-object v1, v1, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

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
    iget-object v2, p0, Ll/mug$a;->b:Ll/mug;

    .line 26
    .line 27
    iget-object v2, v2, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 30
    .line 31
    const-string v3, "owner_id"

    .line 32
    .line 33
    invoke-static {v3, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    filled-new-array {v1, v2}, [Ll/tfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "e_video_play_start"

    .line 42
    .line 43
    invoke-static {v2, v0, v1}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Ll/mug$a;->a:Z

    .line 48
    .line 49
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mug$a;->b:Ll/mug;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mug;->z:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/mug$a;->b:Ll/mug;

    .line 10
    .line 11
    iget-object v1, v1, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "moment_id"

    .line 16
    .line 17
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Ll/mug$a;->b:Ll/mug;

    .line 22
    .line 23
    iget-object p0, p0, Ll/mug;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "owner_id"

    .line 28
    .line 29
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {v1, p0}, [Ll/tfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v1, "e_video_play_start"

    .line 38
    .line 39
    invoke-static {v1, v0, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
