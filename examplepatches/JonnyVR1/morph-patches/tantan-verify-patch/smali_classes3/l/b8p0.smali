.class public Ll/b8p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/j8p0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/d2o0;

.field public b:Ll/c0s;

.field public c:Ll/j8p0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/j8p0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/b8p0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/b8p0$a;-><init>(Ll/b8p0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/b8p0;->d:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/b8p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8p0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/b8p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8p0;->f(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/b8p0;)Ll/j8p0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8p0;->c:Ll/j8p0;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Ll/j8p0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/j8p0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/b8p0;->c:Ll/j8p0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/b8p0;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j8p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b8p0;->d(Ll/j8p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

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
    iget-object p0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public j(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

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
    iget-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/b8p0;->c:Ll/j8p0;

    .line 12
    .line 13
    iget-object v2, v1, Ll/j8p0;->m:Ll/nsv;

    .line 14
    .line 15
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Ll/b8p0;->d:Ll/y20;

    .line 22
    .line 23
    invoke-virtual {v0, p1, v1, v2, p0}, Ll/d2o0;->h(Ljava/util/List;Ll/atm0;Ljava/lang/String;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/d2o0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/b8p0;->c:Ll/j8p0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ll/d2o0;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

    .line 17
    .line 18
    new-instance v0, Ll/c0s;

    .line 19
    .line 20
    iget-object v1, p0, Ll/b8p0;->c:Ll/j8p0;

    .line 21
    .line 22
    iget-object v2, p0, Ll/b8p0;->a:Ll/d2o0;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/d2o0;->d()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v0, v1, v2}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 32
    .line 33
    iget-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/d2o0;->a:Landroid/view/View;

    .line 36
    .line 37
    new-instance v1, Ll/z7p0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/z7p0;-><init>(Ll/b8p0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

    .line 46
    .line 47
    iget-object v0, v0, Ll/d2o0;->d:Landroid/widget/TextView;

    .line 48
    .line 49
    new-instance v1, Ll/a8p0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/a8p0;-><init>(Ll/b8p0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Ll/b8p0;->a:Ll/d2o0;

    .line 58
    .line 59
    iget-object v1, p0, Ll/b8p0;->c:Ll/j8p0;

    .line 60
    .line 61
    iget-object v2, v1, Ll/j8p0;->m:Ll/nsv;

    .line 62
    .line 63
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p0, Ll/b8p0;->d:Ll/y20;

    .line 70
    .line 71
    invoke-virtual {v0, p1, v1, v2, v3}, Ll/d2o0;->h(Ljava/util/List;Ll/atm0;Ljava/lang/String;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/b8p0;->b:Ll/c0s;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 77
    .line 78
    .line 79
    return-void
.end method
