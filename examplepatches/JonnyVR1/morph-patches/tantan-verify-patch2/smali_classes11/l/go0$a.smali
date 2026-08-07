.class public Ll/go0$a;
.super Ll/hzf0;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/go0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final b:Landroid/view/Choreographer;

.field public final c:Landroid/view/Choreographer$FrameCallback;

.field public d:Z

.field public e:J


# direct methods
.method public constructor <init>(Landroid/view/Choreographer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hzf0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/go0$a;->b:Landroid/view/Choreographer;

    .line 5
    .line 6
    new-instance p1, Ll/go0$a$a;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/go0$a$a;-><init>(Ll/go0$a;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/go0$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Ll/go0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/go0$a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/go0$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/go0$a;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Ll/go0$a;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/go0$a;->e:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic g(Ll/go0$a;)Landroid/view/Choreographer$FrameCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/go0$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/go0$a;)Landroid/view/Choreographer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/go0$a;->b:Landroid/view/Choreographer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static i()Ll/go0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/go0$a;

    .line 2
    .line 3
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/go0$a;-><init>(Landroid/view/Choreographer;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/go0$a;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/go0$a;->d:Z

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/go0$a;->e:J

    .line 14
    .line 15
    iget-object v0, p0, Ll/go0$a;->b:Landroid/view/Choreographer;

    .line 16
    .line 17
    iget-object v1, p0, Ll/go0$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/go0$a;->b:Landroid/view/Choreographer;

    .line 23
    .line 24
    iget-object p0, p0, Ll/go0$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/go0$a;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/go0$a;->b:Landroid/view/Choreographer;

    .line 5
    .line 6
    iget-object p0, p0, Ll/go0$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
