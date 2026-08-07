.class public Ll/u0h;
.super Ll/i5e;
.source "SourceFile"


# instance fields
.field public j:Ll/wkl0;


# direct methods
.method public constructor <init>(Ll/zl50;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/i5e;-><init>(Ll/zl50;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wkl0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/wkl0;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/u0h;->j:Ll/wkl0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u0h;->j:Ll/wkl0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wkl0;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u0h;->j:Ll/wkl0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/wkl0;->a(Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Ll/i5e;->b(Landroid/view/MotionEvent;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public c(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/i5e;->c(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u0h;->j:Ll/wkl0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wkl0;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
