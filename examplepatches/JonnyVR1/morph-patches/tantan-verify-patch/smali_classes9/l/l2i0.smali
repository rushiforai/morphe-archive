.class public Ll/l2i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/d2i0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VButton;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VButton;

.field public final f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

.field public h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/l2i0;ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2i0;->s(ILcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Ll/l2i0;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2i0;->l(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/l2i0;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2i0;->p(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/l2i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l2i0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/l2i0;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2i0;->n(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/l2i0;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2i0;->q(ZLandroid/view/View;)V

    return-void
.end method

.method private j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e:I

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->x2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->y2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->P4(Lcom/p1/mobile/putong/data/User;)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Ll/l2i0;->e:Lv/VButton;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v0, 0x0

    .line 55
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m2i0;->b(Ll/l2i0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d2i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l2i0;->k(Ll/d2i0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2i0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/d2i0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic l(ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l2i0;->x(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(ZLandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->h5()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->TAG_MATCH_PIC:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    if-eq p2, v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PIC_MATCH_TAG:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 26
    .line 27
    if-ne p2, v0, :cond_1

    .line 28
    .line 29
    :cond_0
    new-instance p2, Ll/th0$a;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {p2, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "\u4fee\u6539\u672a\u4fdd\u5b58"

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-virtual {p2, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2, v0}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v0, "\u4fdd\u5b58\u540e\u9000\u51fa"

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    new-instance v0, Ll/h2i0;

    .line 60
    .line 61
    invoke-direct {v0, p0, p1}, Ll/h2i0;-><init>(Ll/l2i0;Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string p2, "\u662f\u5426\u4fdd\u5b58\u540e\u518d\u9000\u51fa\uff1f"

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string p2, "\u4e0d\u4fdd\u5b58"

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance p2, Ll/i2i0;

    .line 81
    .line 82
    invoke-direct {p2, p0}, Ll/i2i0;-><init>(Ll/l2i0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->finish()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic p(ZLandroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v1, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v2, "e_tag_add_photo_continue"

    .line 11
    .line 12
    invoke-static {v2, p2, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/gra;->z()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 20
    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-static {p0, v0, p1}, Ll/mkf;->M(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p0, v0, p1}, Ll/y1i0;->M(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic q(ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l2i0;->x(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/l2i0;->y()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "tag_save_data"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/l2i0;->b:Landroid/widget/ImageView;

    .line 18
    .line 19
    new-instance v3, Ll/e2i0;

    .line 20
    .line 21
    invoke-direct {v3, p0, v0}, Ll/e2i0;-><init>(Ll/l2i0;Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/l2i0;->c:Lv/VButton;

    .line 28
    .line 29
    iget-object v3, p0, Ll/l2i0;->e:Lv/VButton;

    .line 30
    .line 31
    invoke-static {}, Ll/gra;->x2()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-nez v4, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/gra;->y2()Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    :cond_0
    iget-object v4, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 44
    .line 45
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e2()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_1

    .line 50
    .line 51
    iget-object v1, p0, Ll/l2i0;->e:Lv/VButton;

    .line 52
    .line 53
    iget-object v4, p0, Ll/l2i0;->c:Lv/VButton;

    .line 54
    .line 55
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v4, p0, Ll/l2i0;->d:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    const/high16 v5, 0x42880000    # 68.0f

    .line 61
    .line 62
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-static {v4, v5}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 70
    .line 71
    .line 72
    :cond_1
    new-instance v4, Ll/f2i0;

    .line 73
    .line 74
    invoke-direct {v4, p0, v0}, Ll/f2i0;-><init>(Ll/l2i0;Z)V

    .line 75
    .line 76
    .line 77
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    new-instance v3, Ll/g2i0;

    .line 81
    .line 82
    invoke-direct {v3, p0, v0}, Ll/g2i0;-><init>(Ll/l2i0;Z)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/l2i0;->z()V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ll/gra;->z()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p0, Ll/l2i0;->b:Landroid/widget/ImageView;

    .line 98
    .line 99
    const/high16 v1, 0x42000000    # 32.0f

    .line 100
    .line 101
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 106
    .line 107
    .line 108
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iget-object v1, p0, Ll/l2i0;->b:Landroid/widget/ImageView;

    .line 113
    .line 114
    const/4 v3, 0x1

    .line 115
    new-array v3, v3, [Landroid/view/View;

    .line 116
    .line 117
    aput-object v1, v3, v2

    .line 118
    .line 119
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/l2i0;->b:Landroid/widget/ImageView;

    .line 123
    .line 124
    invoke-static {v0, v2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/l2i0;->b:Landroid/widget/ImageView;

    .line 128
    .line 129
    const/high16 v1, 0x41200000    # 10.0f

    .line 130
    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/l2i0;->b:Landroid/widget/ImageView;

    .line 139
    .line 140
    sget v0, Ll/dbc0;->zh:I

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 143
    .line 144
    .line 145
    :cond_2
    return-void
.end method

.method public final synthetic s(ILcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Ll/l2i0;->j()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e2()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    if-lez p1, :cond_2

    .line 28
    .line 29
    const-string v0, "\u4e0a\u4f20\u6210\u529f"

    .line 30
    .line 31
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "upload_photos_count"

    .line 41
    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    const/4 v0, 0x3

    .line 57
    if-lt p2, v0, :cond_1

    .line 58
    .line 59
    const-string p2, "unlock_all"

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const-string p2, "unlock_one"

    .line 63
    .line 64
    :goto_0
    const-string v0, "invisible_photo_unlock_status"

    .line 65
    .line 66
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string p2, "e_invisible_photo_upload_success"

    .line 75
    .line 76
    invoke-static {p2, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->j5()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/gra;->x2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/gra;->y2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e2()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/a2i0;->a()V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public v(Ljava/util/List;)V
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
    iget-object p0, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->Y4(Ljava/util/List;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->k5()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/l2i0;->z()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final x(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e:I

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->pageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-array v1, v1, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v2, "e_edit_lifestyle_save"

    .line 13
    .line 14
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->P4(Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    sub-int/2addr v1, v2

    .line 79
    iget-object v2, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 80
    .line 81
    new-instance v3, Ll/j2i0;

    .line 82
    .line 83
    invoke-direct {v3, p0, v1, v0}, Ll/j2i0;-><init>(Ll/l2i0;ILcom/p1/mobile/putong/data/User;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 87
    .line 88
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    new-instance v0, Ll/k2i0;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/k2i0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v2, p1, v3, v0}, Ll/tr90;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_0
    iget-object p1, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0}, Ll/l2i0;->j()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    invoke-direct {p0}, Ll/l2i0;->j()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final y()V
    .locals 10

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->a2()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GUIDE_UPLOAD_PIC_AND_TAG:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    iput-object v2, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v2, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->b2()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PIC_MATCH_TAG:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 35
    .line 36
    iput-object v2, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->TAG_MATCH_PIC:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 40
    .line 41
    iput-object v2, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->r0()Landroidx/fragment/app/e;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v2, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->fragmentClass:Ljava/lang/Class;

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->fragmentClass:Ljava/lang/Class;

    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/e;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 68
    .line 69
    iput-object v0, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object v2, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 74
    .line 75
    iget-object v3, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 76
    .line 77
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const-string v4, "tag_from_page"

    .line 84
    .line 85
    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    const-string v8, "edit_profile"

    .line 90
    .line 91
    const-string v9, ""

    .line 92
    .line 93
    const/4 v4, 0x0

    .line 94
    const/4 v5, 0x1

    .line 95
    const/4 v6, 0x1

    .line 96
    invoke-virtual/range {v2 .. v9}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;IIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    sget v0, Ll/adc0;->q6:I

    .line 100
    .line 101
    iget-object p0, p0, Ll/l2i0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 102
    .line 103
    const-string v2, "my_lift"

    .line 104
    .line 105
    invoke-virtual {v1, v0, p0, v2}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 106
    .line 107
    .line 108
    :try_start_0
    invoke-virtual {v1}, Landroidx/fragment/app/k;->j()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    :catch_0
    return-void
.end method

.method public final z()V
    .locals 7

    .line 1
    invoke-static {}, Ll/gra;->x2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/gra;->y2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e2()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/l2i0;->e:Lv/VButton;

    .line 23
    .line 24
    const-string v2, "\u5b8c\u6210"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eq v0, v2, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/l2i0;->e:Lv/VButton;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object p0, p0, Ll/l2i0;->e:Lv/VButton;

    .line 65
    .line 66
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2, v0}, Ll/gj40;->v(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object v3, p0, Ll/l2i0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 87
    .line 88
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->TAG_MATCH_PIC:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 89
    .line 90
    iget-object v5, p0, Ll/l2i0;->e:Lv/VButton;

    .line 91
    .line 92
    const/4 v6, 0x0

    .line 93
    if-ne v3, v4, :cond_4

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    const/16 v3, 0x9

    .line 102
    .line 103
    if-ge v0, v3, :cond_3

    .line 104
    .line 105
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_3

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    move v1, v6

    .line 113
    :goto_0
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    :goto_1
    iget-object v0, p0, Ll/l2i0;->e:Lv/VButton;

    .line 121
    .line 122
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    iget-object p0, p0, Ll/l2i0;->f:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->pageId()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    new-array v0, v6, [Ll/sfj0$a;

    .line 135
    .line 136
    const-string v1, "e_tag_add_photo_continue"

    .line 137
    .line 138
    invoke-static {v1, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 139
    .line 140
    .line 141
    :cond_5
    return-void
.end method
