.class public Ll/jy0;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jy0$a;,
        Ll/jy0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/wy0;


# direct methods
.method public constructor <init>(Ll/wy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jy0;->a:Ll/wy0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic A(Ll/jy0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jy0;->D(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->isFromShoot()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic y(Ll/jy0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jy0;->F(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/jy0;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/jy0;->E(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final synthetic D(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/jy0;->a:Ll/wy0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wy0;->i()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Ll/jy0;->a:Ll/wy0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wy0;->l()Ll/py0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sub-int/2addr v0, p0

    .line 26
    const/4 p0, 0x1

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v0, p0, v1, v1}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic E(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/jy0;->a:Ll/wy0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/wy0;->l()Ll/py0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Ll/py0;->f:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F(ILandroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/jy0;->a:Ll/wy0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v0, Ll/iy0;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1}, Ll/iy0;-><init>(Ll/jy0;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wy0;->l()Ll/py0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    const-string p0, "add image"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/jy0;->a:Ll/wy0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/wy0;->l()Ll/py0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public getItemCount()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wy0;->l()Ll/py0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/wy0;->l()Ll/py0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/jy0;->a:Ll/wy0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/wy0;->i()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-ge v0, v1, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/wy0;->l()Ll/py0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 40
    .line 41
    new-instance v1, Ll/fy0;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/fy0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object p0, p0, Ll/jy0;->a:Ll/wy0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/wy0;->l()Ll/py0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget-object p0, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    add-int/lit8 p0, p0, 0x1

    .line 66
    .line 67
    return p0

    .line 68
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/jy0;->a:Ll/wy0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/wy0;->l()Ll/py0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p0, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jy0;->getItem(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "add image"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Ll/jy0$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/jy0$b;

    .line 6
    .line 7
    iget-object p1, p1, Ll/jy0$b;->a:Landroid/view/View;

    .line 8
    .line 9
    new-instance p2, Ll/gy0;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/gy0;-><init>(Ll/jy0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    instance-of v0, p1, Ll/jy0$a;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p1, Ll/jy0$a;

    .line 23
    .line 24
    iget-object p1, p1, Ll/jy0$a;->a:Lv/VDraweeView;

    .line 25
    .line 26
    new-instance v0, Ll/hy0;

    .line 27
    .line 28
    invoke-direct {v0, p0, p2}, Ll/hy0;-><init>(Ll/jy0;I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/jy0;->getItem(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    instance-of p2, p0, Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p2, p1, p0}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jy0;->a:Ll/wy0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget v0, Ll/kec0;->I:I

    .line 15
    .line 16
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/jy0$a;

    .line 21
    .line 22
    invoke-direct {p2, p0, p1}, Ll/jy0$a;-><init>(Ll/jy0;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-object p2

    .line 26
    :cond_0
    invoke-virtual {v0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    sget v0, Ll/kec0;->H:I

    .line 35
    .line 36
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Ll/jy0$b;

    .line 41
    .line 42
    invoke-direct {p2, p0, p1}, Ll/jy0$b;-><init>(Ll/jy0;Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    return-object p2
.end method
