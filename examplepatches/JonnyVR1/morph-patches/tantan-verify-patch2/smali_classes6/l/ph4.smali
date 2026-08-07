.class public Ll/ph4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final card:Ll/uxr;

.field private volatile isPlaying:Z


# direct methods
.method public constructor <init>(Ll/uxr;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(",
            "Ll/uxr;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ph4;->card:Ll/uxr;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()F
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ph4;->card:Ll/uxr;

    .line 2
    .line 3
    instance-of v0, p0, Ll/gpl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/gpl;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/gpl;->a()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public b(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(TV;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Ll/gj1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Ll/ph4;->card:Ll/uxr;

    .line 7
    .line 8
    instance-of v2, v0, Ll/gpl;

    .line 9
    .line 10
    if-eqz v2, :cond_2

    .line 11
    .line 12
    check-cast v0, Ll/gpl;

    .line 13
    .line 14
    iget-boolean v2, p0, Ll/ph4;->isPlaying:Z

    .line 15
    .line 16
    check-cast p2, Ll/gj1;

    .line 17
    .line 18
    iget-boolean p2, p2, Ll/gj1;->a:Z

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    if-ne v2, p2, :cond_0

    .line 22
    .line 23
    return v3

    .line 24
    :cond_0
    iput-boolean p2, p0, Ll/ph4;->isPlaying:Z

    .line 25
    .line 26
    iget-boolean p0, p0, Ll/ph4;->isPlaying:Z

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {v0}, Ll/gpl;->f()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    invoke-interface {v0, p1, v3}, Ll/gpl;->g(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-interface {v0, p1, v1}, Ll/gpl;->g(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :goto_0
    return v3

    .line 48
    :cond_2
    return v1
.end method

.method public c(Landroid/view/View;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(TV;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ph4;->isPlaying:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ph4;->isPlaying:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/ph4;->card:Ll/uxr;

    .line 9
    .line 10
    instance-of v1, p0, Ll/gpl;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    check-cast p0, Ll/gpl;

    .line 15
    .line 16
    invoke-interface {p0, p1, v0}, Ll/gpl;->g(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ph4;->isPlaying:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ph4;->card:Ll/uxr;

    .line 2
    .line 3
    instance-of v0, p0, Ll/gpl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/gpl;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/gpl;->f()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method
