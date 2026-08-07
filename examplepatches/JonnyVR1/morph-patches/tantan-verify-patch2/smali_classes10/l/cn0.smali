.class public Ll/cn0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/wm0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VImage;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VDraweeView;

.field public p:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ll/wm0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->t7:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/cn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cn0;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H(Ll/cn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cn0;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/cn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cn0;->N(Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/wm0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wm0;->V3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/wm0;

    .line 4
    .line 5
    sget-object p1, Ll/efv;->B:Ljava/lang/String;

    .line 6
    .line 7
    const/high16 v0, 0x440c0000    # 560.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x1b5d

    .line 14
    .line 15
    const/16 v2, 0x18

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dn0;->a(Ll/cn0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dn0;->b(Ll/cn0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cn0;->K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x50

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/cn0;->J(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/cn0;->k:Landroid/view/View;

    .line 13
    .line 14
    new-instance v0, Ll/ym0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/ym0;-><init>(Ll/cn0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/cn0;->l:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    new-instance v0, Ll/zm0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/zm0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/cn0;->p:Landroid/widget/TextView;

    .line 33
    .line 34
    new-instance v0, Ll/an0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/an0;-><init>(Ll/cn0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/cn0;->m:Lv/VImage;

    .line 43
    .line 44
    new-instance v0, Ll/bn0;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/bn0;-><init>(Ll/cn0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/cn0;->o:Lv/VDraweeView;

    .line 53
    .line 54
    sget-object v0, Ll/zft;->z:Ljava/lang/String;

    .line 55
    .line 56
    const v1, 0x43bb8000    # 375.0f

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/high16 v2, 0x42a20000    # 81.0f

    .line 64
    .line 65
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const-string v3, "context_livingAct"

    .line 70
    .line 71
    invoke-static {v3, p1, v0, v1, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/cn0;->n:Landroid/widget/TextView;

    .line 75
    .line 76
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 77
    .line 78
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ll/civ;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_0

    .line 89
    .line 90
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->r0:I

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q0:I

    .line 94
    .line 95
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
