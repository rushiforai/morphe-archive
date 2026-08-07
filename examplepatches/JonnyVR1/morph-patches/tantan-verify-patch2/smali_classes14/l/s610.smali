.class public Ll/s610;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/i0m;


# static fields
.field public static final d:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;


# instance fields
.field public final a:Ll/v1f;

.field public b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/a;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/s610;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ll/v1f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s610;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/s610;->a:Ll/v1f;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "videoChat"

    .line 6
    .line 7
    const-string v0, "currentMotion is null  "

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/s610;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/s610;->i()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/s610;->a:Ll/v1f;

    .line 5
    .line 6
    iget-object p0, p0, Ll/v1f;->h:Ll/q510;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/q510;->f()V

    .line 9
    .line 10
    .line 11
    const-string p0, "videoChat"

    .line 12
    .line 13
    const-string v0, "stop motion push "

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/s610;->d(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/nob0;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/s610;->a:Ll/v1f;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->X0(Ll/v1f;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "videoChat"

    .line 22
    .line 23
    const-string v1, "[start]"

    .line 24
    .line 25
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p1, v0}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b1()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    const-string p0, "pusher motion create Error"

    .line 40
    .line 41
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public final d(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 2
    .line 3
    const-string v1, "videoChat"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "currentMotion is null return"

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v2, "[clear_old]"

    .line 18
    .line 19
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->V0()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-ne v0, p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/s610;->i()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Ll/s610;->j()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s610;->b()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object v1, p0, Ll/s610;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/q610;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/q610;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/s610;->c:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 25
    .line 26
    .line 27
    const-string p0, "videoChat"

    .line 28
    .line 29
    const-string v0, "end all motion "

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s610;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s610;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 2
    .line 3
    const-string v1, "videoChat"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->W0()V

    .line 8
    .line 9
    .line 10
    const-string v0, " oldMotionEndNow gotoEnd \u8c03\u7528\u5b8c\u6210 ,\u5f00\u59cb end()"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->U0()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 22
    .line 23
    :cond_0
    const-string p0, "set currentMotion  null  "

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->W0()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 10
    .line 11
    :cond_0
    const-string p0, "videoChat"

    .line 12
    .line 13
    const-string v0, "set currentMotion  null  "

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s610;->a:Ll/v1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q410;->V0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->Z0()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s610;->a:Ll/v1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q410;->W0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/s610;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->a1()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s610;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
