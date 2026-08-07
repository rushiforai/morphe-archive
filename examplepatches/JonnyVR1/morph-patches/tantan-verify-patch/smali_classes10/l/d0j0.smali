.class public abstract Ll/d0j0;
.super Ll/puj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/ouj0;",
        ">",
        "Ll/puj0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public d:I

.field public e:I

.field public f:Z

.field public g:Landroid/os/Handler;

.field public h:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/puj0;-><init>(Lv/VFrame;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/d0j0$a;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, p0, v0}, Ll/d0j0$a;-><init>(Ll/d0j0;Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/d0j0;->g:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance p1, Ll/d0j0$b;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p1, p0, v0}, Ll/d0j0$b;-><init>(Ll/d0j0;Landroid/os/Looper;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/d0j0;->h:Landroid/os/Handler;

    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic k(Ll/d0j0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/d0j0;->f:Z

    return p0
.end method

.method public static bridge synthetic l(Ll/d0j0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0j0;->h:Landroid/os/Handler;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/d0j0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/d0j0;->e:I

    return p0
.end method

.method public static bridge synthetic n(Ll/d0j0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/d0j0;->e:I

    return-void
.end method


# virtual methods
.method public p()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/d0j0;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/d0j0;->g:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/d0j0;->h:Landroid/os/Handler;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q()I
    .locals 4

    .line 1
    iget v0, p0, Ll/d0j0;->e:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    iget p0, p0, Ll/d0j0;->d:I

    .line 5
    .line 6
    int-to-double v2, p0

    .line 7
    div-double/2addr v0, v2

    .line 8
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 9
    .line 10
    mul-double/2addr v0, v2

    .line 11
    double-to-int p0, v0

    .line 12
    return p0
.end method

.method public s()I
    .locals 0

    .line 1
    iget p0, p0, Ll/d0j0;->e:I

    .line 2
    .line 3
    div-int/lit16 p0, p0, 0x3e8

    .line 4
    .line 5
    return p0
.end method

.method public u()Ljava/lang/String;
    .locals 4

    .line 1
    iget p0, p0, Ll/d0j0;->e:I

    .line 2
    .line 3
    int-to-double v0, p0

    .line 4
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    div-double/2addr v0, v2

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    double-to-int p0, v0

    .line 15
    div-int/lit8 v0, p0, 0x3c

    .line 16
    .line 17
    rem-int/lit8 p0, p0, 0x3c

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "%02d:%02d"

    .line 32
    .line 33
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->c:Ll/ouj0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ouj0;->J3()Ll/jvj0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/puj0;->c:Ll/ouj0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ouj0;->J3()Ll/jvj0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/jvj0;->u4()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public w(II)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/d0j0;->f:Z

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
    iput-boolean v0, p0, Ll/d0j0;->f:Z

    .line 8
    .line 9
    mul-int/lit16 p2, p2, 0x3e8

    .line 10
    .line 11
    iput p2, p0, Ll/d0j0;->d:I

    .line 12
    .line 13
    mul-int/lit16 p1, p1, 0x3e8

    .line 14
    .line 15
    iput p1, p0, Ll/d0j0;->e:I

    .line 16
    .line 17
    iget-object p1, p0, Ll/d0j0;->h:Landroid/os/Handler;

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/d0j0;->x()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public x()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d0j0;->g:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/d0j0;->g:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const-wide/16 v1, 0x64

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
