.class public abstract Ll/p510;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/q510$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract b()V
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p510;->a:Ll/q510$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, v0, Ll/q510$a;->b:Landroid/view/ViewGroup;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q510$a;->d:Landroid/view/SurfaceView;

    .line 9
    .line 10
    iget-object v0, v0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/p510;->a:Ll/q510$a;

    .line 18
    .line 19
    iget-object v0, v0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/p510;->a:Ll/q510$a;

    .line 26
    .line 27
    iput-object v1, p0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public d(Ll/q510$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p510;->a:Ll/q510$a;

    .line 2
    .line 3
    return-void
.end method
