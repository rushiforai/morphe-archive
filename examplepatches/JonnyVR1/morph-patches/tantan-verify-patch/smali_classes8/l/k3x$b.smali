.class public Ll/k3x$b;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/k3x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/k3x$c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public b:[I

.field public c:I

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Ll/k3x;


# direct methods
.method public constructor <init>(Ll/k3x;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/k3x$b;->e:Ll/k3x;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/k3x$b;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->y0()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/high16 v0, 0x42a00000    # 80.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sub-int/2addr p1, v0

    .line 24
    div-int/lit8 p1, p1, 0x3

    .line 25
    .line 26
    invoke-static {}, Ll/bnl0;->y0()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/high16 v1, 0x42c80000    # 100.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    sub-int/2addr v0, v1

    .line 37
    div-int/lit8 v0, v0, 0x3

    .line 38
    .line 39
    iput v0, p0, Ll/k3x$b;->c:I

    .line 40
    .line 41
    const/high16 v0, 0x41200000    # 10.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget v1, p0, Ll/k3x$b;->c:I

    .line 48
    .line 49
    sub-int v2, p1, v1

    .line 50
    .line 51
    sub-int/2addr v0, v2

    .line 52
    sub-int/2addr p1, v1

    .line 53
    const/4 v1, 0x0

    .line 54
    filled-new-array {v1, v0, p1}, [I

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/k3x$b;->b:[I

    .line 59
    .line 60
    new-instance p1, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Ll/k3x$b;->d:Ljava/util/List;

    .line 66
    .line 67
    return-void
.end method

.method public static synthetic y(Ll/k3x$b;ILl/k3x$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/k3x$b;->C(ILl/k3x$c;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic z(Ll/k3x$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k3x$b;->d:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/data/Media;Ll/k3x$c;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/k3x$b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-nez v0, :cond_4

    .line 29
    .line 30
    iget-object v1, p0, Ll/k3x$b;->e:Ll/k3x;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/k3x;->x()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const-string p0, "\u6709\u6b63\u5728\u4e0a\u4f20\u7684\u56fe\u7247"

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-object v1, p0, Ll/k3x$b;->e:Ll/k3x;

    .line 45
    .line 46
    iget-object v2, v1, Ll/k3x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 47
    .line 48
    sget-object v3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 49
    .line 50
    const/4 v4, 0x6

    .line 51
    if-ne v2, v3, :cond_3

    .line 52
    .line 53
    invoke-static {v1}, Ll/k3x;->n(Ll/k3x;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-lt v1, v4, :cond_4

    .line 62
    .line 63
    const-string p0, "\u6700\u591a\u53ef\u4ee5\u4e0a\u4f206\u5f20\u7167\u7247"

    .line 64
    .line 65
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    invoke-virtual {v1}, Ll/k3x;->u()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-lt v1, v4, :cond_4

    .line 78
    .line 79
    const-string p0, "\u6700\u591a\u53ef\u4ee5\u4e0a\u4f206\u5f20\u751f\u6d3b\u77ac\u95f4"

    .line 80
    .line 81
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    iget-object p0, p0, Ll/k3x$b;->d:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :goto_1
    iget-object p0, p2, Ll/k3x$c;->b:Lv/VImage;

    .line 97
    .line 98
    if-nez v0, :cond_6

    .line 99
    .line 100
    sget p1, Ll/kbc0;->w0:I

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_6
    sget p1, Ll/kbc0;->x0:I

    .line 104
    .line 105
    :goto_2
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final synthetic C(ILl/k3x$c;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/k3x$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/k3x$b;->A(Lcom/p1/mobile/putong/data/Media;Ll/k3x$c;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D(Ll/k3x$c;I)V
    .locals 3
    .param p1    # Ll/k3x$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/k3x$c;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Ll/k3x$b;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p1, Ll/k3x$c;->c:Lv/VFrame;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 35
    .line 36
    iget-object v1, p0, Ll/k3x$b;->b:[I

    .line 37
    .line 38
    rem-int/lit8 v2, p2, 0x3

    .line 39
    .line 40
    aget v1, v1, v2

    .line 41
    .line 42
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 43
    .line 44
    iget v1, p0, Ll/k3x$b;->c:I

    .line 45
    .line 46
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 47
    .line 48
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 49
    .line 50
    iget-object v1, p1, Ll/k3x$c;->c:Lv/VFrame;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 56
    .line 57
    new-instance v1, Ll/l3x;

    .line 58
    .line 59
    invoke-direct {v1, p0, p2, p1}, Ll/l3x;-><init>(Ll/k3x$b;ILl/k3x$c;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public E(Landroid/view/ViewGroup;I)Ll/k3x$c;
    .locals 3
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p2, p0, Ll/k3x$b;->e:Ll/k3x;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget v0, Ll/sec0;->f0:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p2, Ll/k3x$c;

    .line 19
    .line 20
    iget-object p0, p0, Ll/k3x$b;->e:Ll/k3x;

    .line 21
    .line 22
    invoke-direct {p2, p0, p1}, Ll/k3x$c;-><init>(Ll/k3x;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Ll/bnl0;->y0()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/high16 v1, 0x42a00000    # 80.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    sub-int/2addr v0, v1

    .line 40
    div-int/lit8 v0, v0, 0x3

    .line 41
    .line 42
    invoke-static {}, Ll/bnl0;->y0()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/high16 v2, 0x42c80000    # 100.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    sub-int/2addr v1, v2

    .line 53
    div-int/lit8 v1, v1, 0x3

    .line 54
    .line 55
    const/high16 v2, 0x41200000    # 10.0f

    .line 56
    .line 57
    if-nez p0, :cond_0

    .line 58
    .line 59
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    add-int/2addr v1, v2

    .line 66
    invoke-direct {p0, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    add-int/2addr v1, v2

    .line 75
    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 76
    .line 77
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 78
    .line 79
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    return-object p2
.end method

.method public F(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k3x$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/k3x$b;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k3x$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/k3x$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/k3x$b;->D(Ll/k3x$c;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k3x$b;->E(Landroid/view/ViewGroup;I)Ll/k3x$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
