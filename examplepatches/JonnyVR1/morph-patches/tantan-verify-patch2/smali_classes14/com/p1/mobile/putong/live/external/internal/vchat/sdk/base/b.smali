.class public Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;
.super Ll/eas;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;

.field public b:Z

.field public c:I

.field public d:Ll/v1f;

.field public e:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->Y0()V

    return-void
.end method


# virtual methods
.method public T0()Ll/cgu;
    .locals 2

    .line 1
    new-instance v0, Ll/cgu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cgu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/vwt;->O4()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Ll/cgu;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->c:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Ll/cgu;->e:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->b:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Ll/cgu;->d:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->a:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p0, v0, Ll/cgu;->c:Ljava/lang/String;

    .line 29
    .line 30
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ll/xau;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v0, Ll/cgu;->b:Ljava/lang/String;

    .line 41
    .line 42
    return-object v0
.end method

.method public U0()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 10
    .line 11
    iget-object v0, v0, Ll/v1f;->g:Ll/s610;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/s610;->g(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 17
    .line 18
    iget-object v0, v0, Ll/v1f;->f:Ll/o210;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/o210;->d(Ll/w6m;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->e:Ljava/lang/Runnable;

    .line 24
    .line 25
    const-string v1, "videoChat"

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "end \u5b8c\u6210 \u79fb\u9664\u5ef6\u8fdf10\u79d2\u7684\u4efb\u52a1"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->e:Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b:Z

    .line 41
    .line 42
    const-string p0, "goToEndFlag = false "

    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public V0()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public W0()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 11
    .line 12
    iget-object v0, v0, Ll/v1f;->g:Ll/s610;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ll/s610;->h(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;)V

    .line 15
    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b:Z

    .line 18
    .line 19
    new-instance v0, Ll/qob0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/qob0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->e:Ljava/lang/Runnable;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 27
    .line 28
    iget-object p0, p0, Ll/v1f;->a:Landroid/content/Context;

    .line 29
    .line 30
    const-wide/16 v1, 0x2710

    .line 31
    .line 32
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public X0(Ll/v1f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 2
    .line 3
    iget-object p1, p1, Ll/v1f;->f:Ll/o210;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/o210;->b(Ll/w6m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "videoChat"

    .line 6
    .line 7
    const-string v1, " \u6267\u884c\u5ef6\u8fdf\u5341\u79d2\u7684end \u4efb\u52a1"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->U0()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Z0()V
    .locals 0

    .line 1
    return-void
.end method

.method public a1()V
    .locals 0

    .line 1
    return-void
.end method

.method public b1()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->c:I

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public g0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/eas;->g0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->U0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
