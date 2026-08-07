.class public Ll/rl1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ll1;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public c:Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Lv/VLinear;

.field public j:Lv/VCheckBox;

.field public k:Lv/VText_NoTopPadding;

.field public l:Ll/bm5;

.field public m:Ll/ll1;

.field public n:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rl1;->n:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/rl1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rl1;->p()V

    return-void
.end method

.method public static synthetic b(Ll/rl1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rl1;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/rl1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rl1;->q()V

    return-void
.end method

.method public static synthetic d(Ll/rl1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rl1;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/rl1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rl1;->u(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/rl1;)Ll/bm5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rl1;->l:Ll/bm5;

    return-object p0
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rl1;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rl1;->n:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rl1;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    iget-object p0, p0, Ll/rl1;->m:Ll/ll1;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ll1;->o0()Ljava/lang/String;

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

.method private l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rl1;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->Jh:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rl1;->b:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 9
    .line 10
    const-string v1, "#000000"

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/rl1;->d:Lv/VText;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/rl1;->e:Lv/VText;

    .line 29
    .line 30
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/rl1;->f:Lv/VText;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/rl1;->d:Lv/VText;

    .line 47
    .line 48
    sget v1, Ll/dbc0;->w0:I

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {v0, v2, v1, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/rl1;->e:Lv/VText;

    .line 55
    .line 56
    sget v1, Ll/dbc0;->x0:I

    .line 57
    .line 58
    invoke-virtual {v0, v2, v1, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/rl1;->f:Lv/VText;

    .line 62
    .line 63
    sget v1, Ll/dbc0;->y0:I

    .line 64
    .line 65
    invoke-virtual {v0, v2, v1, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/rl1;->j:Lv/VCheckBox;

    .line 69
    .line 70
    sget v1, Ll/dbc0;->z:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatCheckBox;->setBackgroundResource(I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/rl1;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 76
    .line 77
    sget v0, Ll/dbc0;->Kh:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rl1;->n:Lcom/p1/mobile/android/app/Act;

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
    invoke-static {p0, p1, p2}, Ll/sl1;->b(Ll/rl1;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    check-cast p1, Ll/ll1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rl1;->j(Ll/ll1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rl1;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/ll1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rl1;->m:Ll/ll1;

    .line 2
    .line 3
    return-void
.end method

.method public m()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/rl1;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rl1;->k:Lv/VText_NoTopPadding;

    .line 5
    .line 6
    const-string v1, "\u6211\u540c\u610f\u817e\u8baf\u3001\u963f\u91cc\u3001\u706b\u5c71\u91c7\u96c6\u6211\u7684\u9762\u90e8\u4fe1\u606f\u5e76\u4e0e\u5934\u50cf\u6bd4\u5bf9\uff0c\u8be6\u89c1\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/rl1;->k:Lv/VText_NoTopPadding;

    .line 12
    .line 13
    new-instance v1, Ll/ml1;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ml1;-><init>(Ll/rl1;)V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    const-string v3, "\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 20
    .line 21
    const/high16 v4, 0x33000000

    .line 22
    .line 23
    invoke-static {v0, v3, v4, v1, v2}, Ll/fsj0;->b(Landroid/widget/TextView;Ljava/lang/String;ILl/x20;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/rl1;->j:Lv/VCheckBox;

    .line 27
    .line 28
    new-instance v1, Ll/nl1;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/nl1;-><init>(Ll/rl1;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/rl1;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 37
    .line 38
    new-instance v1, Ll/ol1;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/ol1;-><init>(Ll/rl1;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/rl1;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 47
    .line 48
    new-instance v1, Ll/pl1;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/pl1;-><init>(Ll/rl1;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/rl1;->m:Ll/ll1;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/ll1;->p0()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v1, 0x2

    .line 63
    if-ne v0, v1, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Ll/rl1;->i:Lv/VLinear;

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    invoke-direct {p0}, Ll/rl1;->l()V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rl1;->j:Lv/VCheckBox;

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

.method public final synthetic p()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rl1;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rl1;->j:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "is_selected"

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "e_verify_privacy_agreement"

    .line 22
    .line 23
    const-string v1, "p_photo_confirmation_verification"

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ql1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ql1;-><init>(Ll/rl1;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rl1;->m:Ll/ll1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ll1;->q0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rl1;->m:Ll/ll1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ll1;->n0()V

    .line 4
    .line 5
    .line 6
    const-string p0, "e_change_photo_verification"

    .line 7
    .line 8
    const-string p1, "p_photo_confirmation_verification"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public w(Ll/p0k0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rl1;->c:Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/remind/view/SimpleUpdateAvatarView;->v(Ll/p0k0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Z)V
    .locals 2

    .line 1
    const/high16 v0, 0x66000000

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/rl1;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/rl1;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/rl1;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 17
    .line 18
    sget v0, Ll/dbc0;->Kh:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/rl1;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 24
    .line 25
    sget p1, Ll/dbc0;->Hq:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p1, p0, Ll/rl1;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/rl1;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/rl1;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 42
    .line 43
    sget v0, Ll/dbc0;->Kh:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/rl1;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 49
    .line 50
    sget p1, Ll/dbc0;->Hq:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final y()V
    .locals 3

    .line 1
    new-instance v0, Ll/bm5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/rl1;->l:Ll/bm5;

    .line 12
    .line 13
    new-instance v1, Ll/rl1$a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/rl1$a;-><init>(Ll/rl1;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/rl1;->l:Ll/bm5;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/bm5;->show()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
