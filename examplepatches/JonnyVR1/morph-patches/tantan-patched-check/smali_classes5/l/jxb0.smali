.class public Ll/jxb0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/pzb0;

.field public static b:Ll/x20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ixb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ixb0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jxb0;->b:Ll/x20;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 3
    .line 4
    return-void
.end method

.method public static b()V
    .locals 1

    .line 1
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pzb0;->Y()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static c()Z
    .locals 1

    .line 1
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pzb0;->e0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static d()Z
    .locals 1

    .line 1
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pzb0;->e0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 2
    .param p2    # Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pzb0;->Y()V

    .line 12
    .line 13
    .line 14
    :cond_0
    if-eqz p0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance v0, Ll/pzb0;

    .line 30
    .line 31
    sget-object v1, Ll/jxb0;->b:Ll/x20;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1, p2, v1}, Ll/pzb0;-><init>(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Ll/jxb0;->a:Ll/pzb0;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    const p0, 0x9c40

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ll/fqe0;->y(I)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Ll/jxb0;->a:Ll/pzb0;

    .line 47
    .line 48
    const/4 p1, 0x3

    .line 49
    invoke-virtual {p0, p1}, Ll/jlb0;->r(I)V

    .line 50
    .line 51
    .line 52
    :cond_2
    sget-object p0, Ll/jxb0;->a:Ll/pzb0;

    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->AUDIO_QUICK_NOTIFY_BROADCAST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget-object p1, Ll/jxb0;->a:Ll/pzb0;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/llb0;->i(Ll/fqe0;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_0
    return-void
.end method
