.class public Ll/bvk0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field private popupConfig:Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/bvk0;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bvk0;->n(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/bvk0;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bvk0;->m(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bvk0;->popupConfig:Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;->title:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/bvk0;->popupConfig:Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Ll/bvk0;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VChatCouponChecker"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic m(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic n(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;)Ll/bvk0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bvk0;->popupConfig:Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/xec0;->V0:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/jl80$a;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/ldc0;->I:I

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v3, Ll/zuk0;

    .line 32
    .line 33
    invoke-direct {v3, p0, v1, p1}, Ll/zuk0;-><init>(Ll/bvk0;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    sget v2, Ll/ldc0;->G:I

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ll/avk0;

    .line 46
    .line 47
    invoke-direct {v3, p0, v1, p1}, Ll/avk0;-><init>(Ll/bvk0;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    sget p0, Ll/ldc0;->R1:I

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Landroid/widget/TextView;

    .line 60
    .line 61
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;->title:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    sget p0, Ll/ldc0;->N:I

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Landroid/widget/TextView;

    .line 73
    .line 74
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;->content:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    sget p0, Ll/ldc0;->I:I

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Landroid/widget/TextView;

    .line 86
    .line 87
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;->button:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    sget p0, Ll/ldc0;->u0:I

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    check-cast p0, Lv/VDraweeView;

    .line 99
    .line 100
    const-string p1, "context_square"

    .line 101
    .line 102
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;->picture:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p1, p0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const/4 p0, 0x0

    .line 108
    invoke-virtual {v1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 112
    .line 113
    .line 114
    const-string p0, "e_live_video_call_coupon_pop"

    .line 115
    .line 116
    const-string p1, "p_live_video_quickchat"

    .line 117
    .line 118
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method
