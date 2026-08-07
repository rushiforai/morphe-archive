.class public Ll/ocd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lcd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;

.field public d:Lv/VButton;

.field public e:Lv/VText;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/lcd0;

.field public h:Ll/kr40;

.field public final i:Ll/dcd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ocd0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ocd0$a;-><init>(Ll/ocd0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ocd0;->i:Ll/dcd0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ocd0;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/ocd0;Ll/kr40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ocd0;->m(Ll/kr40;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/ocd0;)Ll/kr40;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ocd0;->h:Ll/kr40;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/ocd0;)Ll/lcd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ocd0;->g:Ll/lcd0;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/ocd0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocd0;->n(I)V

    return-void
.end method

.method public static bridge synthetic e(Ll/ocd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ocd0;->w()V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ocd0;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pcd0;->b(Ll/ocd0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/lcd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ocd0;->g:Ll/lcd0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lcd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ocd0;->i(Ll/lcd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ocd0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ocd0;->h:Ll/kr40;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kr40;->f()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ocd0;->h:Ll/kr40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/kr40;->b()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/ocd0;->e:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ocd0;->k(I)Landroid/text/SpannableStringBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ocd0;->c:Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;->o0(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Ll/ocd0;->u(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public k(I)Landroid/text/SpannableStringBuilder;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ocd0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->g0:I

    .line 6
    .line 7
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Ll/vuf0;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Ll/m9c0;->f:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, " "

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/vuf0$a;->a(Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p1, Ll/m9c0;->p:I

    .line 47
    .line 48
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p0, p1}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->f0:I

    .line 57
    .line 58
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ll/vuf0$a;->a(Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget p1, Ll/m9c0;->f:I

    .line 67
    .line 68
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-virtual {p0, p1}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/vuf0$a;->b()Landroid/text/SpannableStringBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public l(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ocd0;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ocd0;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ocd0;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ocd0;->C0()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->getManageTitle(Landroid/content/Context;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic m(Ll/kr40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/kr40;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/kr40;->a()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ocd0;->g:Ll/lcd0;

    .line 14
    .line 15
    iget-object p2, p0, Ll/ocd0;->c:Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;->getSelectNumber()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-object p0, p0, Ll/ocd0;->c:Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;->p0()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {p1, p2, p0}, Ll/lcd0;->i0(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->j0:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/ocd0;->w()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final n(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/ocd0;->d:Lv/VButton;

    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->k:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x3

    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/ocd0;->d:Lv/VButton;

    .line 16
    .line 17
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->d0:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/ocd0;->d:Lv/VButton;

    .line 23
    .line 24
    sget v0, Ll/nbc0;->o:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/ocd0;->d:Lv/VButton;

    .line 30
    .line 31
    sget p1, Ll/m9c0;->y:I

    .line 32
    .line 33
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/ocd0;->u(Z)V

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->qualified:Z

    .line 6
    .line 7
    iget-object v1, p0, Ll/ocd0;->e:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->remainTimes:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/ocd0;->k(I)Landroid/text/SpannableStringBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->h0:I

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ocd0;->c:Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ocd0;->i:Ll/dcd0;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;Ll/dcd0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ocd0;->c:Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/view/RightNiceNumberView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Ll/ocd0;->u(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final u(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/ocd0;->d:Lv/VButton;

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->k:I

    .line 6
    .line 7
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ll/ocd0;->d:Lv/VButton;

    .line 15
    .line 16
    sget v0, Ll/nbc0;->h:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/ocd0;->d:Lv/VButton;

    .line 22
    .line 23
    sget p1, Ll/m9c0;->g:I

    .line 24
    .line 25
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public v(Ll/kr40;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ocd0;->h:Ll/kr40;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/kr40;->c()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/kr40;->c()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ocd0;->q(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/kr40;->c()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ocd0;->p(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/kr40;->d()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/kr40;->d()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {p0, v0, v1}, Ll/ocd0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Ll/ocd0;->d:Lv/VButton;

    .line 38
    .line 39
    new-instance v1, Ll/ncd0;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/ncd0;-><init>(Ll/ocd0;Ll/kr40;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final w()V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->i0:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
