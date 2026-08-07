.class public Ll/krp;
.super Ll/g4s;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public B:Landroid/widget/ImageView;

.field public x:Landroid/view/View;

.field public y:Landroid/widget/FrameLayout;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Ll/rrp;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->g9:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, p1, v0}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/krp;->o0(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic m0(Ll/krp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/krp;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/krp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/krp;->p0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/krp;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lrp;->a(Ll/krp;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/krp;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/krp;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 5

    .line 1
    const-string v0, "svga"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->picType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 17
    .line 18
    const/high16 v2, 0x42800000    # 64.0f

    .line 19
    .line 20
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    sub-int/2addr v1, v2

    .line 25
    const v2, 0x3fbc170c

    .line 26
    .line 27
    .line 28
    int-to-float v3, v1

    .line 29
    mul-float/2addr v3, v2

    .line 30
    float-to-int v2, v3

    .line 31
    iget-object v3, p0, Ll/krp;->y:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-static {v3, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/krp;->y:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    new-array v3, v3, [Landroid/view/View;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    aput-object v2, v3, v4

    .line 43
    .line 44
    invoke-static {v1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/krp;->y:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    const/high16 v2, 0x41700000    # 15.0f

    .line 50
    .line 51
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {v1, v2}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/krp;->z:Lv/VDraweeView;

    .line 59
    .line 60
    xor-int/lit8 v2, v0, 0x1

    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/krp;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/krp;->B:Landroid/widget/ImageView;

    .line 71
    .line 72
    new-instance v2, Ll/irp;

    .line 73
    .line 74
    invoke-direct {v2, p0}, Ll/irp;-><init>(Ll/krp;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/krp;->x:Landroid/view/View;

    .line 81
    .line 82
    new-instance v2, Ll/jrp;

    .line 83
    .line 84
    invoke-direct {v2, p0}, Ll/jrp;-><init>(Ll/krp;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    iget-object p0, p0, Ll/krp;->A:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->url:Ljava/lang/String;

    .line 95
    .line 96
    const/4 v0, -0x1

    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    iget-object p0, p0, Ll/krp;->z:Lv/VDraweeView;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->url:Ljava/lang/String;

    .line 105
    .line 106
    const-string v0, "context_single_room"

    .line 107
    .line 108
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method
