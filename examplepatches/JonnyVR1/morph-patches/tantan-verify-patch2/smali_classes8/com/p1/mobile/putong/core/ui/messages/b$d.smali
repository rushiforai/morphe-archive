.class public Lcom/p1/mobile/putong/core/ui/messages/b$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Z

.field public c:[J


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->b:Z

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    new-array v0, v0, [J

    .line 9
    .line 10
    fill-array-data v0, :array_0

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->c:[J

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->a:Landroid/view/View;

    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
    :array_0
    .array-data 8
        0x0
        0x12c
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/b$d;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/b$d;->c()V

    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic c()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/b;->b()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->a:Landroid/view/View;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->b:Z

    .line 12
    .line 13
    return-void
.end method

.method public d()V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->b:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->a:Landroid/view/View;

    .line 5
    .line 6
    new-instance v7, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 7
    .line 8
    invoke-direct {v7}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x5

    .line 12
    new-array v8, v0, [F

    .line 13
    .line 14
    fill-array-data v8, :array_0

    .line 15
    .line 16
    .line 17
    const-string v2, "rotation"

    .line 18
    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    const-wide/16 v5, 0x12c

    .line 22
    .line 23
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/z600;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/z600;-><init>(Lcom/p1/mobile/putong/core/ui/messages/b$d;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->a:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "vibrator"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Landroid/os/Vibrator;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$d;->c:[J

    .line 62
    .line 63
    const/4 v2, -0x1

    .line 64
    const/16 v3, 0x1a

    .line 65
    .line 66
    if-lt v1, v3, :cond_0

    .line 67
    .line 68
    invoke-static {p0, v2}, Ll/r27;->a([JI)Landroid/os/VibrationEffect;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {v0, p0}, Ll/dm3;->a(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    invoke-virtual {v0, p0, v2}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 4
        0x0
        -0x3e900000    # -15.0f
        0x0
        0x41700000    # 15.0f
        0x0
    .end array-data
.end method
