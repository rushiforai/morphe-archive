.class public Ll/lm1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dm1;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VText_NoTopPadding;

.field public c:Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;

.field public d:Lv/VLinear;

.field public e:Lv/VLinear;

.field public f:Lv/VText_NoTopPadding;

.field public g:Lv/VLinear;

.field public h:Lv/VFrame;

.field public i:Lv/VDraweeView;

.field public j:Landroid/view/View;

.field public k:Lv/VFrame;

.field public l:Lv/VDraweeView;

.field public m:Landroid/view/View;

.field public n:Lv/VFrame;

.field public o:Lv/VDraweeView;

.field public p:Landroid/view/View;

.field public q:Lv/VText_NoTopPadding;

.field public r:Lv/VLinear;

.field public s:Lv/VCheckBox;

.field public t:Lv/VText_NoTopPadding;

.field public u:Ll/dm1;

.field public final v:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/lm1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lm1;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/lm1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lm1;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/lm1;Ll/bm5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lm1;->s(Ll/bm5;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/lm1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lm1;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/lm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lm1;->u()V

    return-void
.end method

.method public static synthetic f(Ll/lm1;Ljava/util/List;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/lm1;->q(Ljava/util/List;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/lm1;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lm1;->v(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lm1;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/lm1;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    iget-object p0, p0, Ll/lm1;->u:Ll/dm1;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dm1;->q0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lm1;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->Jh:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/lm1;->b:Lv/VText_NoTopPadding;

    .line 9
    .line 10
    const-string v1, "#000000"

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/lm1;->s:Lv/VCheckBox;

    .line 20
    .line 21
    sget v0, Ll/dbc0;->z:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatCheckBox;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic u()V
    .locals 3

    .line 1
    new-instance v0, Ll/bm5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {v0, v1, v2}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/km1;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/km1;-><init>(Ll/lm1;Ll/bm5;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ll/bm5;->show()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/lm1;->s:Lv/VCheckBox;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "is_selected"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "e_verify_privacy_agreement"

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/lm1;->u:Ll/dm1;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/dm1;->o0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "e_album_upload_photos_verify"

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lm1;->u:Ll/dm1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dm1;->r0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lm1;->j:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lm1;->m:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Ll/lm1;->p:Landroid/view/View;

    .line 6
    .line 7
    filled-new-array {v0, v1, p0}, [Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    aget-object p0, p0, p1

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/gra;->z()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    sget p1, Ll/dbc0;->C:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget p1, Ll/dbc0;->Uu:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    sget p1, Ll/dbc0;->Tu:I

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

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
    check-cast p1, Ll/dm1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lm1;->k(Ll/dm1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lm1;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/mm1;->b(Ll/lm1;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/dm1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lm1;->u:Ll/dm1;

    .line 2
    .line 3
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lm1;->q:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/gra;->z()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/dbc0;->t:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p1, Ll/dbc0;->Kh:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget p1, Ll/dbc0;->Hq:I

    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lm1;->s:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic q(Ljava/util/List;ILandroid/view/View;)V
    .locals 1

    .line 1
    new-instance p3, Ll/p0k0$b;

    .line 2
    .line 3
    invoke-direct {p3}, Ll/p0k0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 7
    .line 8
    iput-object v0, p3, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 9
    .line 10
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    iput-object p1, p3, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p3, Ll/p0k0$b;->f:Z

    .line 20
    .line 21
    iget-object p1, p0, Ll/lm1;->u:Ll/dm1;

    .line 22
    .line 23
    iget-object p1, p1, Ll/dm1;->d:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {p1, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_select_recommended_photos_verify"

    .line 35
    .line 36
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public r()V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "fake_risk_audit_default_"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget-object p0, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-direct {p0}, Ll/lm1;->m()V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/bnl0;->y0()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/high16 v2, 0x42ac0000    # 86.0f

    .line 66
    .line 67
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    sub-int/2addr v0, v2

    .line 72
    const/4 v2, 0x3

    .line 73
    div-int/2addr v0, v2

    .line 74
    mul-int/lit8 v3, v0, 0x78

    .line 75
    .line 76
    div-int/lit8 v3, v3, 0x60

    .line 77
    .line 78
    iget-object v4, p0, Ll/lm1;->h:Lv/VFrame;

    .line 79
    .line 80
    iget-object v5, p0, Ll/lm1;->k:Lv/VFrame;

    .line 81
    .line 82
    iget-object v6, p0, Ll/lm1;->n:Lv/VFrame;

    .line 83
    .line 84
    new-array v2, v2, [Landroid/view/View;

    .line 85
    .line 86
    aput-object v4, v2, v1

    .line 87
    .line 88
    const/4 v4, 0x1

    .line 89
    aput-object v5, v2, v4

    .line 90
    .line 91
    const/4 v5, 0x2

    .line 92
    aput-object v6, v2, v5

    .line 93
    .line 94
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/lm1;->h:Lv/VFrame;

    .line 98
    .line 99
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/lm1;->k:Lv/VFrame;

    .line 103
    .line 104
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/lm1;->n:Lv/VFrame;

    .line 108
    .line 109
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/lm1;->u:Ll/dm1;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/dm1;->p0()Ljava/util/List;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iget-object v3, p0, Ll/lm1;->d:Lv/VLinear;

    .line 123
    .line 124
    if-eqz v2, :cond_1

    .line 125
    .line 126
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/lm1;->g:Lv/VLinear;

    .line 130
    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_1
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ll/lm1;->g:Lv/VLinear;

    .line 139
    .line 140
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Ll/lm1;->h:Lv/VFrame;

    .line 144
    .line 145
    iget-object v3, p0, Ll/lm1;->k:Lv/VFrame;

    .line 146
    .line 147
    iget-object v6, p0, Ll/lm1;->n:Lv/VFrame;

    .line 148
    .line 149
    filled-new-array {v2, v3, v6}, [Lv/VFrame;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iget-object v3, p0, Ll/lm1;->i:Lv/VDraweeView;

    .line 158
    .line 159
    iget-object v6, p0, Ll/lm1;->l:Lv/VDraweeView;

    .line 160
    .line 161
    iget-object v7, p0, Ll/lm1;->o:Lv/VDraweeView;

    .line 162
    .line 163
    filled-new-array {v3, v6, v7}, [Lv/VDraweeView;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    move v6, v1

    .line 172
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 173
    .line 174
    .line 175
    move-result v7

    .line 176
    if-ge v6, v7, :cond_2

    .line 177
    .line 178
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    check-cast v7, Lcom/p1/mobile/putong/data/Media;

    .line 183
    .line 184
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v8

    .line 188
    check-cast v8, Landroid/view/View;

    .line 189
    .line 190
    invoke-static {v8, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 194
    .line 195
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v9

    .line 199
    check-cast v9, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 200
    .line 201
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 206
    .line 207
    .line 208
    move-result-object v7

    .line 209
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    invoke-virtual {v8, v9, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v7

    .line 220
    check-cast v7, Landroid/view/View;

    .line 221
    .line 222
    new-instance v8, Ll/em1;

    .line 223
    .line 224
    invoke-direct {v8, p0, v0, v6}, Ll/em1;-><init>(Ll/lm1;Ljava/util/List;I)V

    .line 225
    .line 226
    .line 227
    invoke-static {v7, v8}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 228
    .line 229
    .line 230
    add-int/lit8 v6, v6, 0x1

    .line 231
    .line 232
    goto :goto_0

    .line 233
    :cond_2
    iget-object v0, p0, Ll/lm1;->v:Lcom/p1/mobile/android/app/Act;

    .line 234
    .line 235
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    const-string v2, "e_select_recommended_photos_verify"

    .line 240
    .line 241
    invoke-static {v2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :goto_1
    iget-object v0, p0, Ll/lm1;->t:Lv/VText_NoTopPadding;

    .line 245
    .line 246
    new-instance v2, Ll/fm1;

    .line 247
    .line 248
    invoke-direct {v2, p0}, Ll/fm1;-><init>(Ll/lm1;)V

    .line 249
    .line 250
    .line 251
    const-string v3, "\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 252
    .line 253
    const/high16 v6, 0x33000000

    .line 254
    .line 255
    invoke-static {v0, v3, v6, v2, v4}, Ll/fsj0;->b(Landroid/widget/TextView;Ljava/lang/String;ILl/x20;Z)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Ll/lm1;->s:Lv/VCheckBox;

    .line 259
    .line 260
    new-instance v2, Ll/gm1;

    .line 261
    .line 262
    invoke-direct {v2, p0}, Ll/gm1;-><init>(Ll/lm1;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Ll/lm1;->s:Lv/VCheckBox;

    .line 269
    .line 270
    new-instance v2, Ll/hm1;

    .line 271
    .line 272
    invoke-direct {v2, p0}, Ll/hm1;-><init>(Ll/lm1;)V

    .line 273
    .line 274
    .line 275
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Ll/lm1;->e:Lv/VLinear;

    .line 279
    .line 280
    new-instance v2, Ll/im1;

    .line 281
    .line 282
    invoke-direct {v2, p0}, Ll/im1;-><init>(Ll/lm1;)V

    .line 283
    .line 284
    .line 285
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Ll/lm1;->q:Lv/VText_NoTopPadding;

    .line 289
    .line 290
    new-instance v2, Ll/jm1;

    .line 291
    .line 292
    invoke-direct {v2, p0}, Ll/jm1;-><init>(Ll/lm1;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 296
    .line 297
    .line 298
    iget-object v0, p0, Ll/lm1;->u:Ll/dm1;

    .line 299
    .line 300
    iget v0, v0, Ll/dm1;->b:I

    .line 301
    .line 302
    if-ne v0, v5, :cond_3

    .line 303
    .line 304
    iget-object v0, p0, Ll/lm1;->r:Lv/VLinear;

    .line 305
    .line 306
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 307
    .line 308
    .line 309
    :cond_3
    invoke-static {}, Ll/gra;->z()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_4

    .line 314
    .line 315
    invoke-direct {p0}, Ll/lm1;->n()V

    .line 316
    .line 317
    .line 318
    :cond_4
    return-void
.end method

.method public final synthetic s(Ll/bm5;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/lm1;->s:Lv/VCheckBox;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p2, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ll/bm5;->dismiss()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/lm1;->u:Ll/dm1;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dm1;->G0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic v(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lm1;->u:Ll/dm1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dm1;->G0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Ll/p0k0$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lm1;->c:Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->v(Ll/p0k0$b;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOADING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 9
    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 13
    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 17
    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/lm1;->u:Ll/dm1;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dm1;->G0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
