.class public Ll/nlm;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nlm$b;,
        Ll/nlm$a;
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
.field public a:Ll/bh4;


# direct methods
.method public constructor <init>(Ll/bh4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nlm;->a:Ll/bh4;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic A(Ll/nlm;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/nlm;->J(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic C(Ll/nlm;Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nlm;->N(Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic D(Landroidx/recyclerview/widget/RecyclerView$e0;Lv/VDraweeView;Lcom/p1/mobile/putong/data/Video;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    check-cast v0, Ll/nlm$a;

    .line 23
    .line 24
    iget-object v3, v0, Ll/nlm$a;->b:Lv/VImage;

    .line 25
    .line 26
    invoke-static {v3, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, v0, Ll/nlm$a;->c:Landroid/view/View;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p1, p2}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move-object p1, p0

    .line 45
    check-cast p1, Ll/nlm$a;

    .line 46
    .line 47
    iget-object p2, p1, Ll/nlm$a;->b:Lv/VImage;

    .line 48
    .line 49
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p1, Ll/nlm$a;->c:Landroid/view/View;

    .line 53
    .line 54
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    :goto_0
    check-cast p0, Ll/nlm$a;

    .line 58
    .line 59
    iget-object p0, p0, Ll/nlm$a;->b:Lv/VImage;

    .line 60
    .line 61
    sget p1, Ll/lbc0;->S1:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic E(Ljava/lang/Object;Ll/gcg0;)V
    .locals 3

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/wel0;

    .line 7
    .line 8
    new-instance v1, Ll/vel0;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v1, v2}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v0, v1, v2, v2}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/wel0;->k()[I

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-direct {v2, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 61
    .line 62
    .line 63
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    const-string v1, "image/jpeg"

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 70
    .line 71
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic G(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
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

.method public static synthetic I(Ll/nlm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nlm;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/nlm;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/nlm;->L(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic z(Ll/nlm;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nlm;->M(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic J(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 p2, 0x1

    .line 3
    if-eqz p3, :cond_1

    .line 4
    .line 5
    if-eq p3, p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1, p2, p2, p1}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object p3, p0, Ll/nlm;->a:Ll/bh4;

    .line 19
    .line 20
    invoke-virtual {p3}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    rsub-int/lit8 p0, p0, 0x9

    .line 37
    .line 38
    invoke-virtual {p3, p0, p2, p1, p1}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/nlm;->a:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bh4;->J()Ll/rg4;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/nlm;->a:Ll/bh4;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    rsub-int/lit8 p0, p0, 0x9

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {p1, p0, v0, v1, v1}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string v0, "p_moment_type_selection_pop"

    .line 48
    .line 49
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Ll/nlm;->a:Ll/bh4;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->T4:I

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object v2, p0, Ll/nlm;->a:Ll/bh4;

    .line 79
    .line 80
    invoke-virtual {v2}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->U4:I

    .line 85
    .line 86
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/llm;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/llm;-><init>(Ll/nlm;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance v0, Ll/mlm;

    .line 112
    .line 113
    invoke-direct {v0, p1}, Ll/mlm;-><init>(Ll/l4g0;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final synthetic L(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/nlm;->a:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/bh4;->J()Ll/rg4;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Ll/rg4;->a:Ljava/util/ArrayList;

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
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bh4;->O()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic M(ILandroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/nlm;->a:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

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
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f:I

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
    new-instance v0, Ll/klm;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1}, Ll/klm;-><init>(Ll/nlm;I)V

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

.method public final synthetic N(Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->s4:I

    .line 2
    .line 3
    invoke-static {p3}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    check-cast p1, Ll/nlm$a;

    .line 7
    .line 8
    iget-object p3, p1, Ll/nlm$a;->b:Lv/VImage;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p3, p1, Ll/nlm$a;->c:Landroid/view/View;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Ll/nlm$a;->b:Lv/VImage;

    .line 21
    .line 22
    sget p3, Ll/lbc0;->g6:I

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/nlm;->a:Ll/bh4;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/bh4;->J()Ll/rg4;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/bh4;->O()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public O(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/bh4;->J()Ll/rg4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bh4;->J()Ll/rg4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/rg4;->a:Ljava/util/ArrayList;

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
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bh4;->J()Ll/rg4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/rg4;->a:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/bh4;->J()Ll/rg4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/16 v1, 0x9

    .line 26
    .line 27
    if-ge v0, v1, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/bh4;->J()Ll/rg4;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 36
    .line 37
    new-instance v1, Ll/dlm;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/dlm;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/bh4;->J()Ll/rg4;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 55
    .line 56
    new-instance v1, Ll/elm;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/elm;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    add-int/lit8 p0, p0, 0x1

    .line 81
    .line 82
    return p0

    .line 83
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/nlm;->a:Ll/bh4;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    return p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/nlm;->getItem(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "add image"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Ll/nlm;->getItem(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x2

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 4

    .line 1
    instance-of v0, p1, Ll/nlm$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/nlm$b;

    .line 6
    .line 7
    iget-object p1, p1, Ll/nlm$b;->a:Landroid/view/View;

    .line 8
    .line 9
    new-instance p2, Ll/flm;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/flm;-><init>(Ll/nlm;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    move-object v0, p1

    .line 19
    check-cast v0, Ll/nlm$a;

    .line 20
    .line 21
    iget-object v0, v0, Ll/nlm$a;->a:Lv/VDraweeView;

    .line 22
    .line 23
    new-instance v1, Ll/glm;

    .line 24
    .line 25
    invoke-direct {v1, p0, p2}, Ll/glm;-><init>(Ll/nlm;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/nlm;->getItem(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    instance-of v1, p2, Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    instance-of v1, p2, Lcom/p1/mobile/putong/data/Video;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Ll/nlm;->a:Ll/bh4;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/hlm;

    .line 55
    .line 56
    invoke-direct {v2, p2}, Ll/hlm;-><init>(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v2}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {}, Ll/psd0;->P()Lrx/c$d;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v2, v3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const/4 v3, 0x0

    .line 72
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    new-instance v2, Ll/ilm;

    .line 85
    .line 86
    invoke-direct {v2, p1, v0}, Ll/ilm;-><init>(Landroidx/recyclerview/widget/RecyclerView$e0;Lv/VDraweeView;)V

    .line 87
    .line 88
    .line 89
    new-instance v0, Ll/jlm;

    .line 90
    .line 91
    invoke-direct {v0, p0, p1, p2}, Ll/jlm;-><init>(Ll/nlm;Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 103
    .line 104
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 105
    .line 106
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/nlm;->a:Ll/bh4;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget v0, Ll/tec0;->k4:I

    .line 16
    .line 17
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ll/nlm$b;

    .line 22
    .line 23
    invoke-direct {p2, p0, p1}, Ll/nlm$b;-><init>(Ll/nlm;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    return-object p2

    .line 27
    :cond_0
    iget-object v0, p0, Ll/nlm;->a:Ll/bh4;

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    if-ne p2, v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    sget v0, Ll/tec0;->o4:I

    .line 41
    .line 42
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance p2, Ll/nlm$a;

    .line 47
    .line 48
    invoke-direct {p2, p0, p1}, Ll/nlm$a;-><init>(Ll/nlm;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    return-object p2

    .line 52
    :cond_1
    invoke-virtual {v0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    sget v0, Ll/tec0;->l4:I

    .line 61
    .line 62
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/nlm$a;

    .line 67
    .line 68
    invoke-direct {p2, p0, p1}, Ll/nlm$a;-><init>(Ll/nlm;Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    return-object p2
.end method
