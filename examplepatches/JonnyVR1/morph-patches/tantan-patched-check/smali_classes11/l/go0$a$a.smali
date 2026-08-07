.class public Ll/go0$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/go0$a;-><init>(Landroid/view/Choreographer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/go0$a;


# direct methods
.method public constructor <init>(Ll/go0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/go0$a;->d(Ll/go0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 10
    .line 11
    iget-object p1, p1, Ll/hzf0;->a:Ll/sr2;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide p1

    .line 20
    iget-object v0, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 21
    .line 22
    iget-object v1, v0, Ll/hzf0;->a:Ll/sr2;

    .line 23
    .line 24
    invoke-static {v0}, Ll/go0$a;->e(Ll/go0$a;)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    sub-long v2, p1, v2

    .line 29
    .line 30
    long-to-double v2, v2

    .line 31
    invoke-virtual {v1, v2, v3}, Ll/sr2;->f(D)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 35
    .line 36
    invoke-static {v0, p1, p2}, Ll/go0$a;->f(Ll/go0$a;J)J

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 40
    .line 41
    invoke-static {p1}, Ll/go0$a;->h(Ll/go0$a;)Landroid/view/Choreographer;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/go0$a$a;->a:Ll/go0$a;

    .line 46
    .line 47
    invoke-static {p0}, Ll/go0$a;->g(Ll/go0$a;)Landroid/view/Choreographer$FrameCallback;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    return-void
.end method
