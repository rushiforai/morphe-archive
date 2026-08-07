.class public Ll/q2n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/p1n0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VImage;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public final n:Lcom/p1/mobile/putong/app/PutongAct;

.field public o:Ll/p1n0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/q2n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q2n0;->q()V

    return-void
.end method

.method public static synthetic i(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/q2n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q2n0;->u(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p1n0;->O0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q2n0;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/p1n0;->s0()Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 30
    .line 31
    new-instance v0, Ll/p2n0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/p2n0;-><init>(Ll/q2n0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/p1n0;->H0(Ll/x20;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-virtual {p0}, Ll/q2n0;->n()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_voice_hang_up"

    .line 5
    .line 6
    const-string v1, "p_voice_call"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/p1n0;->q0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_voice_callme_no"

    .line 5
    .line 6
    const-string v1, "p_voice_callme"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/p1n0;->p0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_voice_talking_hangup"

    .line 5
    .line 6
    const-string v1, "p_voice_talking"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/p1n0;->r0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p1n0;->G0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p1n0;->u0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q2n0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/q2n0;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/q2n0;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/q2n0;->d:Lv/VText;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->I6:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q2n0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/q2n0;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/q2n0;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/q2n0;->b:Lv/VDraweeView;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/q2n0;->c:Lv/VText;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2n0;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q2n0;->m:Lv/VImage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    sget p1, Ll/ibc0;->L0:I

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    sget p1, Ll/ibc0;->M0:I

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public G(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q2n0;->k:Lv/VImage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    sget p1, Ll/ibc0;->N0:I

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    sget p1, Ll/ibc0;->O0:I

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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
    check-cast p1, Ll/p1n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q2n0;->m(Ll/p1n0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q2n0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-static {p0, p1, p2}, Ll/r2n0;->b(Ll/q2n0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2n0;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/p1n0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 2
    .line 3
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->j()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "channel"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_voice_callme_yes"

    .line 20
    .line 21
    const-string v2, "p_voice_callme"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/q2n0;->o:Ll/p1n0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/p1n0;->x0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q2n0;->a:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v1, Ll/i2n0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/i2n0;-><init>(Ll/q2n0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/q2n0;->i:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/j2n0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/j2n0;-><init>(Ll/q2n0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/q2n0;->f:Lv/VImage;

    .line 22
    .line 23
    new-instance v1, Ll/k2n0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/k2n0;-><init>(Ll/q2n0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/q2n0;->h:Lv/VImage;

    .line 32
    .line 33
    new-instance v1, Ll/l2n0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/l2n0;-><init>(Ll/q2n0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/q2n0;->l:Lv/VImage;

    .line 42
    .line 43
    new-instance v1, Ll/m2n0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/m2n0;-><init>(Ll/q2n0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/q2n0;->k:Lv/VImage;

    .line 52
    .line 53
    new-instance v1, Ll/n2n0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/n2n0;-><init>(Ll/q2n0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/q2n0;->m:Lv/VImage;

    .line 62
    .line 63
    new-instance v1, Ll/o2n0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/o2n0;-><init>(Ll/q2n0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q2n0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/q2n0;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/q2n0;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/q2n0;->d:Lv/VText;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->M6:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
