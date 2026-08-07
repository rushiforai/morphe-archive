.class public Ll/cxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bxc0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

.field public d:Lv/VText;

.field public e:Ll/bxc0;

.field public f:Lcom/p1/mobile/putong/app/PutongAct;

.field public g:Ll/xi40;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cxc0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/cxc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxc0;->h:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/cxc0;)Ll/bxc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxc0;->e:Ll/bxc0;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/cxc0;)Ll/xi40;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxc0;->g:Ll/xi40;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/cxc0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxc0;->h:Ljava/lang/String;

    return-void
.end method

.method private j()V
    .locals 4

    .line 1
    new-instance v0, Ll/xi40;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xi40;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/cxc0;->g:Ll/xi40;

    .line 7
    .line 8
    new-instance v1, Ll/cxc0$b;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/cxc0$b;-><init>(Ll/cxc0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/o1i0;->m(Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cxc0;->g:Ll/xi40;

    .line 17
    .line 18
    new-instance v1, Ll/cxc0$c;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/cxc0$c;-><init>(Ll/cxc0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/o1i0;->n(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cxc0;->c:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setCanAdjustChildHeight(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/cxc0;->c:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 33
    .line 34
    iget-object v1, p0, Ll/cxc0;->g:Ll/xi40;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setAdapter(Ll/j1i0;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/cxc0;->g:Ll/xi40;

    .line 40
    .line 41
    sget-object v1, Ll/xve0;->i:[Ll/qi40;

    .line 42
    .line 43
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ll/xi40;->r(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/cxc0;->g:Ll/xi40;

    .line 51
    .line 52
    iget-object v0, v0, Ll/xi40;->g:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Ll/qi40;

    .line 69
    .line 70
    iget-object v2, v1, Ll/qi40;->d:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v3, p0, Ll/cxc0;->h:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_0

    .line 79
    .line 80
    iget-object v2, p0, Ll/cxc0;->g:Ll/xi40;

    .line 81
    .line 82
    invoke-virtual {v2, v1}, Ll/o1i0;->o(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/cxc0;->h:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p0, Ll/cxc0;->b:Lv/navigationbar/VNavigationBar;

    .line 4
    .line 5
    iget-object v0, p0, Ll/cxc0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/cxc0;->j()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/cxc0;->d:Lv/VText;

    .line 14
    .line 15
    new-instance v0, Ll/cxc0$a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/cxc0$a;-><init>(Ll/cxc0;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cxc0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cxc0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dxc0;->b(Ll/cxc0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cxc0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/bxc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxc0;->e:Ll/bxc0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bxc0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cxc0;->i(Ll/bxc0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cxc0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
