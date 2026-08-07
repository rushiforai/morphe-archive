.class public Ll/ncl0;
.super Ll/p510;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ncl0$a;
    }
.end annotation


# instance fields
.field public b:Ll/ncl0$a;

.field public c:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p510;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/ncl0;->c:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/p510;->a:Ll/q510$a;

    .line 7
    .line 8
    iget-object v0, v0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/p510;->a:Ll/q510$a;

    .line 14
    .line 15
    iget-object v0, v0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ncl0$a;->b:Landroid/view/SurfaceView;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p510;->a:Ll/q510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/p510;->a:Ll/q510$a;

    .line 11
    .line 12
    iget-object p0, p0, Ll/q510$a;->b:Landroid/view/ViewGroup;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public e(JLandroid/view/SurfaceView;)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/ncl0$a;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3}, Ll/ncl0$a;-><init>(JLandroid/view/SurfaceView;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 10
    .line 11
    iget-object p1, p0, Ll/p510;->a:Ll/q510$a;

    .line 12
    .line 13
    iget-object p1, p1, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ll/ncl0$a;->a(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ncl0;->a()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 3
    .line 4
    iget-object p0, p0, Ll/p510;->a:Ll/q510$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public g(Ljava/lang/Long;Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/ncl0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, v0, Ll/ncl0$a;->a:J

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 20
    .line 21
    iget-boolean v0, p1, Ll/ncl0$a;->c:Z

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ll/ncl0$a;->a(Z)V

    .line 24
    .line 25
    .line 26
    if-eq p2, v0, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Ll/p510;->a:Ll/q510$a;

    .line 29
    .line 30
    iget-object p1, p1, Ll/q510$a;->c:Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/ncl0;->b:Ll/ncl0$a;

    .line 36
    .line 37
    iget-object p0, p0, Ll/ncl0$a;->b:Landroid/view/SurfaceView;

    .line 38
    .line 39
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Ll/p510;->a:Ll/q510$a;

    .line 58
    .line 59
    iget-object p1, p1, Ll/q510$a;->b:Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/p510;->a:Ll/q510$a;

    .line 65
    .line 66
    iget-object p0, p0, Ll/q510$a;->d:Landroid/view/SurfaceView;

    .line 67
    .line 68
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method
