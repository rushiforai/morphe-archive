.class public Ll/cvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zus;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/pus;

.field public b:Lv/VDraweeView;

.field public c:Ll/zus;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lv/VDraweeView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/cvs;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/cvs;->e:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/cvs;->b:Lv/VDraweeView;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/zus$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/zus$b;->c()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setSelected(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ll/cvs;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cvs;->f(Ljava/lang/String;)V

    return-void
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

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cvs;->c:Ll/zus;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/zus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cvs;->c:Ll/zus;

    .line 2
    .line 3
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/cvs;->d:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p0, Ll/cvs;->b:Lv/VDraweeView;

    .line 9
    .line 10
    iget-boolean p0, p0, Ll/cvs;->e:Z

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cvs;->b:Lv/VDraweeView;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvs;->a:Ll/pus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic f(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "context_square"

    .line 2
    .line 3
    iget-object p0, p0, Ll/cvs;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i(Landroid/view/View;Ljava/util/List;Ll/zus$b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;",
            "Ll/zus$b;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cvs;->a:Ll/pus;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cvs;->a:Ll/pus;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ll/pus;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/cvs;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1, p2}, Ll/pus;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/cvs;->a:Ll/pus;

    .line 27
    .line 28
    new-instance p2, Ll/bvs;

    .line 29
    .line 30
    invoke-direct {p2, p3, p1}, Ll/bvs;-><init>(Ll/zus$b;Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 34
    .line 35
    .line 36
    const/4 p2, 0x1

    .line 37
    invoke-virtual {p1, p2}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/cvs;->a:Ll/pus;

    .line 41
    .line 42
    iget-object p0, p0, Ll/cvs;->b:Lv/VDraweeView;

    .line 43
    .line 44
    sget p2, Ll/qa00;->e:I

    .line 45
    .line 46
    const/16 p3, 0x50

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-static {p1, p0, v0, p2, p3}, Ll/kl80;->c(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zus;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cvs;->c(Ll/zus;)V

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

.method public j(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cvs;->d:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/cvs;->b:Lv/VDraweeView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/avs;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/avs;-><init>(Ll/cvs;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
