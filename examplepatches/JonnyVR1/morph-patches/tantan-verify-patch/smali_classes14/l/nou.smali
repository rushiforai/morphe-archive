.class public Ll/nou;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wou;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VRecyclerView;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public j:Ll/wou;

.field public k:Ll/rou;


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

.method public static synthetic a(Ll/nou;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nou;->i(Landroid/view/View;)V

    return-void
.end method

.method private j(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nou;->g:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/nou;->e:Lv/VImage;

    .line 13
    .line 14
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/nou;->f:Lv/VText;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/nou;->k:Ll/rou;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/rou;->G(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nou;->a:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nou;->j:Ll/wou;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oou;->a(Ll/nou;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/wou;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nou;->j:Ll/wou;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e()V
    .locals 5

    .line 1
    new-instance v0, Ll/rou;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nou;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/nou;->j:Ll/wou;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ll/rou;-><init>(Lcom/p1/mobile/android/app/Act;Ll/wou;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/nou;->k:Ll/rou;

    .line 13
    .line 14
    iget-object v1, p0, Ll/nou;->g:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/nou;->g:Lv/VRecyclerView;

    .line 20
    .line 21
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/nou;->C0()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/nou;->k:Ll/rou;

    .line 36
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/rou;->G(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nou;->h:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Ll/hgc0;->d:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 11
    .line 12
    iget-object v0, p0, Ll/nou;->h:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/xec0;->E1:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/nou;->b(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/nou;->b:Landroid/widget/ImageView;

    .line 34
    .line 35
    new-instance v1, Ll/mou;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/mou;-><init>(Ll/nou;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/nou;->k:Ll/rou;

    .line 44
    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/nou;->e()V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wou;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nou;->c(Ll/wou;)V

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

.method public k(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/nou;->h:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iget-object p1, p0, Ll/nou;->i:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/nou;->f()V

    .line 11
    .line 12
    .line 13
    :cond_1
    invoke-direct {p0, p2}, Ll/nou;->j(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
