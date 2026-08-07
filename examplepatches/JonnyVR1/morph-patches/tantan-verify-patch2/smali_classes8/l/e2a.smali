.class public Ll/e2a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e2a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/v1a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/GridView;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Ll/v1a;

.field public m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

.field public n:Ll/e2a$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 5
    .line 6
    new-instance p1, Ll/e2a$a;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/e2a$a;-><init>(Ll/e2a;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/e2a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2a;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/e2a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2a;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/e2a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2a;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/e2a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2a;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/e2a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2a;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/e2a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2a;->v(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/e2a;)Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/e2a;)Ll/v1a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a;->l:Ll/v1a;

    return-object p0
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/e2a$a;->t(Ll/e2a$a;)Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/16 v0, 0x12c

    .line 14
    .line 15
    if-lt p1, v0, :cond_0

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 24
    .line 25
    invoke-static {p0}, Ll/tcz;->J(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/e2a;->l:Ll/v1a;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/v1a;->o0()[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "stickers_id_new"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_stickers_delete"

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/e2a;->l:Ll/v1a;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/v1a;->l0()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/e2a;->l:Ll/v1a;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/v1a;->o0()[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "stickers_id_new"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_stickers_move_to_front"

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/e2a;->l:Ll/v1a;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/v1a;->y0()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e2a;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e2a;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;->onBackPressed()V

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
    iget-object p0, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v1a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2a;->l(Ll/v1a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e2a;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f2a;->b(Ll/e2a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/v1a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e2a;->l:Ll/v1a;

    .line 2
    .line 3
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2a;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/e2a;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/e2a;->g:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/e2a;->i:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ll/e2a$a;->C(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/e2a;->l:Ll/v1a;

    .line 29
    .line 30
    iget-object v0, v0, Ll/v1a;->a:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2a;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/e2a;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/e2a;->g:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/e2a;->i:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ll/e2a$a;->C(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public o()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/e2a$a;->y()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/e2a;->m()V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e2a;->f:Landroid/widget/GridView;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/e2a;->f:Landroid/widget/GridView;

    .line 8
    .line 9
    iget-object v1, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/e2a;->c:Lv/VText;

    .line 15
    .line 16
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/e2a;->e:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/e2a;->d:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/e2a;->j:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/e2a;->k:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/e2a;->h:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/e2a;->h:Lv/VText;

    .line 47
    .line 48
    new-instance v1, Ll/w1a;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/w1a;-><init>(Ll/e2a;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/e2a;->k:Lv/VText;

    .line 57
    .line 58
    new-instance v1, Ll/x1a;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/x1a;-><init>(Ll/e2a;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/e2a;->j:Lv/VText;

    .line 67
    .line 68
    new-instance v1, Ll/y1a;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/y1a;-><init>(Ll/e2a;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/e2a;->d:Lv/VText;

    .line 77
    .line 78
    new-instance v1, Ll/z1a;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/z1a;-><init>(Ll/e2a;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/e2a;->e:Lv/VText;

    .line 87
    .line 88
    new-instance v1, Ll/a2a;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/a2a;-><init>(Ll/e2a;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/e2a;->b:Lv/VImage;

    .line 97
    .line 98
    new-instance v1, Ll/b2a;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/b2a;-><init>(Ll/e2a;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 107
    .line 108
    invoke-static {v0}, Ll/e2a$a;->t(Ll/e2a$a;)Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 115
    .line 116
    invoke-static {v0}, Ll/e2a$a;->t(Ll/e2a$a;)Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 121
    .line 122
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_0

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    return-void

    .line 130
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/e2a;->d:Lv/VText;

    .line 131
    .line 132
    const/4 v0, 0x0

    .line 133
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/data/StickerPackage;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2a;->n:Ll/e2a$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/e2a$a;->B(Lcom/p1/mobile/putong/core/data/StickerPackage;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/e2a;->e:Lv/VText;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v2, p0, Ll/e2a;->c:Lv/VText;

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 28
    .line 29
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->n6:I

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, "("

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, ")"

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/e2a;->d:Lv/VText;

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    iget-object p1, p0, Ll/e2a;->m:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 72
    .line 73
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->n6:I

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/e2a;->d:Lv/VText;

    .line 83
    .line 84
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
