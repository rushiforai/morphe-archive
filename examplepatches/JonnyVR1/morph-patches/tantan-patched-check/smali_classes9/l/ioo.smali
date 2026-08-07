.class public Ll/ioo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hrl;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VRecyclerView;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ll/jic0;

.field public final e:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ioo;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ioo;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    return-void
.end method

.method private d(Ljava/util/List;Ll/z20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ioo;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/ioo;->c:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-static {v1, p1, p2}, Ll/rd5;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/z20;)Ll/jic0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/ioo;->d:Ll/jic0;

    .line 16
    .line 17
    iget-object p1, p0, Ll/ioo;->b:Lv/VRecyclerView;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ioo;->b:Lv/VRecyclerView;

    .line 23
    .line 24
    iget-object p0, p0, Ll/ioo;->d:Ll/jic0;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/ioo;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->o:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/ioo;->c(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/ioo;->a:Lv/VText;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ioo;->c:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->F8:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public b(Ljava/util/List;Ll/z20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ioo;->d(Ljava/util/List;Ll/z20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/joo;->a(Ll/ioo;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
