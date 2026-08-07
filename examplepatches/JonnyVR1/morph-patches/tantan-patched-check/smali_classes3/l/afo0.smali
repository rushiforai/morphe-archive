.class public Ll/afo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/itm0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroidx/constraintlayout/widget/Group;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/Button;

.field public h:Landroidx/constraintlayout/widget/Group;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Landroid/widget/Button;

.field public m:Ll/itm0;

.field public n:Landroid/view/View;

.field public o:Ll/x20;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/afo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/afo0;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/afo0;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/afo0;->m(Landroid/view/ViewGroup;)V

    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/afo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/afo0;->s()V

    return-void
.end method

.method public static synthetic f(Ll/afo0;Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/afo0;->n(Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/afo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/afo0;->q()V

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
    .locals 1

    .line 1
    iget-object p0, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/itm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/afo0;->k(Ll/itm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/afo0;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-static {p0, p1, p2}, Ll/bfo0;->b(Ll/afo0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/itm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/afo0;->m:Ll/itm0;

    .line 2
    .line 3
    return-void
.end method

.method public final l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/afo0;->o:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic m(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/afo0;->n:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ll/yeo0;

    .line 2
    .line 3
    invoke-direct {p2, p0, p1}, Ll/yeo0;-><init>(Ll/afo0;Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/afo0;->l()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/afo0;->n:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    iget-object v0, p0, Ll/afo0;->n:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/afo0;->l()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/afo0;->m:Ll/itm0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/itm0;->i0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    new-instance v0, Ll/xeo0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xeo0;-><init>(Ll/afo0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/afo0;->y(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u(Landroid/content/Context;Landroid/view/ViewGroup;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/afo0;->n:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1, p2}, Ll/afo0;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/afo0;->n:Landroid/view/View;

    .line 18
    .line 19
    iget-object p1, p0, Ll/afo0;->g:Landroid/widget/Button;

    .line 20
    .line 21
    new-instance v0, Ll/ueo0;

    .line 22
    .line 23
    invoke-direct {v0, p3}, Ll/ueo0;-><init>(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/afo0;->c:Landroid/widget/ImageView;

    .line 30
    .line 31
    new-instance p3, Ll/veo0;

    .line 32
    .line 33
    invoke-direct {p3, p0, p2}, Ll/veo0;-><init>(Ll/afo0;Landroid/view/ViewGroup;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object p1, p0, Ll/afo0;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 40
    .line 41
    new-instance p3, Ll/weo0;

    .line 42
    .line 43
    invoke-direct {p3}, Ll/weo0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/afo0;->f:Lv/VDraweeView;

    .line 50
    .line 51
    sget p3, Ll/obc0;->i9:I

    .line 52
    .line 53
    invoke-virtual {p1, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p3, p0, Ll/afo0;->n:Landroid/view/View;

    .line 61
    .line 62
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    sget v1, Ll/bnl0;->e:I

    .line 65
    .line 66
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, p3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/afo0;->f:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 78
    .line 79
    const/4 p3, 0x0

    .line 80
    invoke-static {p2, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Ll/afo0;->b:Landroidx/constraintlayout/widget/Group;

    .line 84
    .line 85
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Ll/afo0;->h:Landroidx/constraintlayout/widget/Group;

    .line 89
    .line 90
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/afo0;->g:Landroid/widget/Button;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/afo0;->g:Landroid/widget/Button;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->mi:I

    .line 8
    .line 9
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/afo0;->f:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public w(JLjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/afo0;->f:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/afo0;->b:Landroidx/constraintlayout/widget/Group;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/afo0;->h:Landroidx/constraintlayout/widget/Group;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/afo0;->k:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/afo0;->l:Landroid/widget/Button;

    .line 34
    .line 35
    new-instance v1, Ll/zeo0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/zeo0;-><init>(Ll/afo0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yf:I

    .line 44
    .line 45
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p2, p0, Ll/afo0;->i:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-ge v2, p1, :cond_1

    .line 63
    .line 64
    new-instance p1, Ll/ctm0;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/ctm0;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Ll/afo0;->k:Landroid/widget/LinearLayout;

    .line 70
    .line 71
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    const/4 v0, 0x0

    .line 80
    invoke-virtual {p1, p2, v0}, Ll/ctm0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGiftItem;

    .line 89
    .line 90
    invoke-virtual {p1, v1, v0}, Ll/ctm0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGiftItem;Landroid/graphics/Typeface;)V

    .line 91
    .line 92
    .line 93
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 94
    .line 95
    sget v0, Ll/bnl0;->f:I

    .line 96
    .line 97
    invoke-direct {p1, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    if-lez v2, :cond_0

    .line 104
    .line 105
    sget p1, Ll/qa00;->h:I

    .line 106
    .line 107
    invoke-static {p2, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 108
    .line 109
    .line 110
    :cond_0
    iget-object p1, p0, Ll/afo0;->k:Landroid/widget/LinearLayout;

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    add-int/lit8 v2, v2, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    return-void
.end method

.method public x(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;)V
    .locals 2

    .line 1
    new-instance v0, Ll/teo0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/teo0;-><init>(Ll/afo0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, v0}, Ll/afo0;->u(Landroid/content/Context;Landroid/view/ViewGroup;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->zf:I

    .line 10
    .line 11
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->description:Ljava/lang/String;

    .line 12
    .line 13
    iget-wide v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->attractUserNum:J

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p1, p2}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Ll/afo0;->d:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public y(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/afo0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    new-instance v2, Ll/afo0$a;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1}, Ll/afo0$a;-><init>(Ll/afo0;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "https://auto.tancdn.com/v1/raw/153d80ff-ac9f-4219-9776-ca60566a606010.so"

    .line 15
    .line 16
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/afo0;->g:Landroid/widget/Button;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
