.class public Ll/d15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d15$b;,
        Ll/d15$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/a15;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VImage;

.field public c:Lv/VRecyclerView;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerHistoryAct;

.field public f:Ll/a15;

.field public g:Ll/d15$b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerHistoryAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d15;->e:Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerHistoryAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/d15;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d15;->e(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/d15;)Ll/a15;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d15;->f:Ll/a15;

    return-object p0
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d15;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

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
    iget-object p0, p0, Ll/d15;->e:Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerHistoryAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d15;->e:Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerHistoryAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f15;->b(Ll/d15;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/a15;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d15;->f:Ll/a15;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d15;->d:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/d15;->g:Ll/d15$b;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/d15$b;->G(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a15;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d15;->d(Ll/a15;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d15;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d15;->b:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/b15;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/b15;-><init>(Ll/d15;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/d15$b;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, p0, v1}, Ll/d15$b;-><init>(Ll/d15;Ll/e15;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/d15;->g:Ll/d15$b;

    .line 18
    .line 19
    iget-object p0, p0, Ll/d15;->c:Lv/VRecyclerView;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
