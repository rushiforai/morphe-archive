.class public Ll/i120;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b120;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/b120;

.field public c:Lv/VRecyclerView;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public f:Landroid/widget/Button;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/view/View;

.field public i:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/i120;->g:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/i120;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/w020;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(Ll/i120;ZLl/w020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/i120;->s(ZLl/w020;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/i120;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i120;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/i120;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i120;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/i120;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i120;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/i120;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i120;->u(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    return-void
.end method

.method private l(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/ldc0;->d1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/bnl0;->F0()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/ldc0;->x:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/f120;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/f120;-><init>(Ll/i120;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private m(Landroid/view/View;)V
    .locals 4

    .line 1
    sget v0, Ll/ldc0;->N0:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VRecyclerView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/i120;->c:Lv/VRecyclerView;

    .line 10
    .line 11
    sget v0, Ll/ldc0;->v1:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Ll/i120;->d:Lv/VText;

    .line 20
    .line 21
    sget v0, Ll/ldc0;->J0:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/Button;

    .line 28
    .line 29
    iput-object v0, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 30
    .line 31
    sget v0, Ll/ldc0;->f0:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/i120;->h:Landroid/view/View;

    .line 38
    .line 39
    sget v0, Ll/ldc0;->O:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/i120;->i:Landroid/view/View;

    .line 46
    .line 47
    iget-object v0, p0, Ll/i120;->d:Lv/VText;

    .line 48
    .line 49
    new-instance v1, Ll/c120;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/c120;-><init>(Ll/i120;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/4 v2, 0x1

    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-direct {v0, v1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/i120;->c:Lv/VRecyclerView;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 74
    .line 75
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ll/i120;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 79
    .line 80
    iget-object v1, p0, Ll/i120;->c:Lv/VRecyclerView;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 86
    .line 87
    new-instance v1, Ll/d120;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/d120;-><init>(Ll/i120;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    invoke-direct {p0, p1}, Ll/i120;->l(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/i120;->k()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/i120;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i120;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i120;->b:Ll/b120;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b120;->y2()V

    .line 4
    .line 5
    .line 6
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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    const-string v0, "e_intl_local_music_play_add_music"

    .line 2
    .line 3
    const-string v1, "p_intl_local_music_play_main"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/i120;->g:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Ll/xz10;->c1(Ljava/util/List;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/i120;->a:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b120;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i120;->j(Ll/b120;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget p2, Ll/xec0;->N:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {p0, p1}, Ll/i120;->m(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public j(Ll/b120;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i120;->b:Ll/b120;

    .line 2
    .line 3
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i120;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 16
    .line 17
    const-string v2, "#66FFFFFF"

    .line 18
    .line 19
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 27
    .line 28
    const-string v1, "#7F4F2D"

    .line 29
    .line 30
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/high16 v2, 0x41200000    # 10.0f

    .line 35
    .line 36
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    invoke-static {v1, v2, v0}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 v0, 0x1

    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 54
    .line 55
    const-string v1, "#E5FFFFFF"

    .line 56
    .line 57
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/i120;->f:Landroid/widget/Button;

    .line 65
    .line 66
    sget v0, Ll/nbc0;->l:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i120;->b:Ll/b120;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b120;->w2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic s(ZLl/w020;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-boolean p1, p2, Ll/w020;->b:Z

    .line 5
    .line 6
    xor-int/lit8 p3, p1, 0x1

    .line 7
    .line 8
    iput-boolean p3, p2, Ll/w020;->b:Z

    .line 9
    .line 10
    iget-object p3, p0, Ll/i120;->g:Ljava/util/List;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p2, Ll/w020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 15
    .line 16
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    new-instance p1, Ll/h120;

    .line 21
    .line 22
    invoke-direct {p1, p2}, Ll/h120;-><init>(Ll/w020;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p3, p1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0}, Ll/i120;->k()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/i120;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic u(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 2

    .line 1
    new-instance v0, Ll/w020;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/w020;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, p2}, Ll/xz10;->k1(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    xor-int/lit8 v1, p2, 0x1

    .line 17
    .line 18
    iput-boolean v1, v0, Ll/w020;->c:Z

    .line 19
    .line 20
    new-instance v1, Ll/g120;

    .line 21
    .line 22
    invoke-direct {v1, p0, p2, v0}, Ll/g120;-><init>(Ll/i120;ZLl/w020;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public w(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i120;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Ll/i120;->h:Landroid/view/View;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/i120;->i:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/i120;->i:Landroid/view/View;

    .line 29
    .line 30
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/e120;

    .line 39
    .line 40
    invoke-direct {v1, p0, v0}, Ll/e120;-><init>(Ll/i120;Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/ufs;

    .line 47
    .line 48
    const/high16 v1, 0x42900000    # 72.0f

    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-direct {p1, v1}, Ll/ufs;-><init>(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/i120;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
