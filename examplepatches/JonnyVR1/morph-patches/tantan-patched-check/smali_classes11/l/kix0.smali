.class public abstract Ll/kix0;
.super Ll/v1v0;
.source "SourceFile"


# instance fields
.field public b:Z


# direct methods
.method public constructor <init>(Ll/atx0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v1v0;-><init>(Ll/atx0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yyx0;->a:Ll/atx0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/atx0;->i()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final p()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kix0;->t()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "Not initialized"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/kix0;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kix0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/yyx0;->a:Ll/atx0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/atx0;->M()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ll/kix0;->b:Z

    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    const-string p0, "Can\'t initialize twice"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/kix0;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kix0;->s()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/yyx0;->a:Ll/atx0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/atx0;->M()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/kix0;->b:Z

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "Can\'t initialize twice"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s()V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    return-void
.end method

.method public final t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kix0;->b:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public abstract u()Z
.end method
