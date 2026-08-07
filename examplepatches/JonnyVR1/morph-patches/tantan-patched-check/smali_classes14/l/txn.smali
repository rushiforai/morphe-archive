.class public Ll/txn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/fxn;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;


# direct methods
.method public constructor <init>(Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/txn;->b:Lv/VDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Ll/txn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/txn;->e(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic e(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "context_square"

    .line 2
    .line 3
    iget-object p0, p0, Ll/txn;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
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
    iget-object p0, p0, Ll/txn;->c:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

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

.method public c(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/txn;->c:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txn;->a:Ll/fxn;

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/txn;->a:Ll/fxn;

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
    iget-object p0, p0, Ll/txn;->a:Ll/fxn;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ll/fxn;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/txn;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1, p2}, Ll/fxn;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/txn;->a:Ll/fxn;

    .line 27
    .line 28
    new-instance p2, Ll/sxn;

    .line 29
    .line 30
    invoke-direct {p2, p1}, Ll/sxn;-><init>(Landroid/view/View;)V

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
    iget-object p1, p0, Ll/txn;->a:Ll/fxn;

    .line 41
    .line 42
    iget-object p0, p0, Ll/txn;->b:Lv/VDraweeView;

    .line 43
    .line 44
    sget p2, Ll/qa00;->e:I

    .line 45
    .line 46
    const/16 v0, 0x50

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-static {p1, p0, v1, p2, v0}, Ll/kl80;->c(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txn;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/txn;->c(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

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

.method public j(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rxn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rxn;-><init>(Ll/txn;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
