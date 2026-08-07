.class public final Ll/edp;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/kdp;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\r\u0010\u000e\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0015\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0013J\u0017\u0010\u0017\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u0019\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u0018R\u0016\u0010\u001d\u001a\u00020\u001a8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0016\u0010 \u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010\u000eR\u0016\u0010!\u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u000e\u00a8\u0006\""
    }
    d2 = {
        "Ll/edp;",
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;",
        "Ll/kdp;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "presenterIntl",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Ll/kdp;)V",
        "Landroid/view/View;",
        "view",
        "",
        "K",
        "(Landroid/view/View;)V",
        "m",
        "I",
        "()V",
        "",
        "renderFamilyShareBtn",
        "M",
        "(Z)V",
        "L",
        "Ll/adp;",
        "intlShareCardItemInfoDataWrapper",
        "H",
        "(Ll/adp;)V",
        "J",
        "Lorg/apmem/tools/layouts/FlowLayout;",
        "k",
        "Lorg/apmem/tools/layouts/FlowLayout;",
        "flowLayout",
        "",
        "l",
        "realWidth",
        "realMarginEnd",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public k:Lorg/apmem/tools/layouts/FlowLayout;

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/kdp;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/kdp;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget v0, Ll/yec0;->A2:I

    .line 8
    .line 9
    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static F(Ll/edp;Ll/adp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edp;->J(Ll/adp;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static G(Ll/edp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/edp;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final K(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/mdc0;->K1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast v0, Lorg/apmem/tools/layouts/FlowLayout;

    .line 11
    .line 12
    iput-object v0, p0, Ll/edp;->k:Lorg/apmem/tools/layouts/FlowLayout;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->M:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/cdp;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/cdp;-><init>(Ll/edp;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final H(Ll/adp;)V
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 v4, 0x6

    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 16
    .line 17
    check-cast v1, Ll/kdp;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ll/oo2;->Z0()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x0

    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;->getShareImage()Landroid/widget/ImageView;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/high16 v4, 0x42700000    # 60.0f

    .line 39
    .line 40
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    invoke-static {v1, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;->getShareName()Landroid/widget/TextView;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    new-array v6, v3, [Landroid/view/View;

    .line 56
    .line 57
    aput-object v5, v6, v2

    .line 58
    .line 59
    invoke-static {v1, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;->getShareImage()Landroid/widget/ImageView;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const/high16 v4, 0x420c0000    # 35.0f

    .line 72
    .line 73
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-static {v1, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    const/high16 v1, 0x425c0000    # 55.0f

    .line 81
    .line 82
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;->getShareName()Landroid/widget/TextView;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    new-array v6, v3, [Landroid/view/View;

    .line 91
    .line 92
    aput-object v5, v6, v2

    .line 93
    .line 94
    invoke-static {v4, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    :goto_0
    iput v1, p0, Ll/edp;->l:I

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;->getShareImage()Landroid/widget/ImageView;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1}, Ll/adp;->b()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/share/IntlShareCardItemView;->getShareName()Landroid/widget/TextView;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p1}, Ll/adp;->a()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 126
    .line 127
    .line 128
    new-instance v1, Ll/ddp;

    .line 129
    .line 130
    invoke-direct {v1, p0, p1}, Ll/ddp;-><init>(Ll/edp;Ll/adp;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 137
    .line 138
    const/4 v2, -0x2

    .line 139
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 140
    .line 141
    .line 142
    iget-object v2, p0, Ll/edp;->k:Lorg/apmem/tools/layouts/FlowLayout;

    .line 143
    .line 144
    if-nez v2, :cond_1

    .line 145
    .line 146
    const-string v2, "flowLayout"

    .line 147
    .line 148
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    const/4 v2, 0x0

    .line 152
    :cond_1
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1}, Ll/adp;->d()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_2

    .line 160
    .line 161
    iget p0, p0, Ll/edp;->m:I

    .line 162
    .line 163
    invoke-static {v0, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 164
    .line 165
    .line 166
    :cond_2
    return-void
.end method

.method public final I()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final J(Ll/adp;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/adp;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "tt_friend"

    .line 6
    .line 7
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast p0, Ll/kdp;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/kdp;->a4()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v0, "tt_family"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 30
    .line 31
    check-cast p0, Ll/kdp;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/kdp;->Z3()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final L(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/edp;->k:Lorg/apmem/tools/layouts/FlowLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "flowLayout"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/high16 v1, 0x42200000    # 40.0f

    .line 19
    .line 20
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-int/2addr v0, v1

    .line 25
    int-to-float v0, v0

    .line 26
    const/high16 v1, 0x42040000    # 33.0f

    .line 27
    .line 28
    div-float/2addr v0, v1

    .line 29
    const/high16 v1, 0x40a00000    # 5.0f

    .line 30
    .line 31
    mul-float/2addr v1, v0

    .line 32
    float-to-int v1, v1

    .line 33
    iput v1, p0, Ll/edp;->l:I

    .line 34
    .line 35
    const/high16 v1, 0x40000000    # 2.0f

    .line 36
    .line 37
    mul-float/2addr v0, v1

    .line 38
    float-to-int v0, v0

    .line 39
    iput v0, p0, Ll/edp;->m:I

    .line 40
    .line 41
    new-instance v0, Ll/adp;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 44
    .line 45
    check-cast v1, Ll/kdp;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ll/oo2;->Z0()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    sget v1, Ll/obc0;->m3:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget v1, Ll/obc0;->g3:I

    .line 64
    .line 65
    :goto_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->wj:I

    .line 66
    .line 67
    invoke-static {v2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    const-string v3, "tt_friend"

    .line 75
    .line 76
    const/4 v4, 0x1

    .line 77
    invoke-direct {v0, v3, v1, v2, v4}, Ll/adp;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/edp;->H(Ll/adp;)V

    .line 81
    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    new-instance p1, Ll/adp;

    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 88
    .line 89
    check-cast v0, Ll/kdp;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ll/oo2;->Z0()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    sget v0, Ll/obc0;->l3:I

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    sget v0, Ll/obc0;->f3:I

    .line 108
    .line 109
    :goto_1
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->wc:I

    .line 110
    .line 111
    invoke-static {v1}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    const-string v2, "tt_family"

    .line 119
    .line 120
    invoke-direct {p1, v2, v0, v1, v4}, Ll/adp;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ll/edp;->H(Ll/adp;)V

    .line 124
    .line 125
    .line 126
    :cond_3
    return-void
.end method

.method public final M(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/edp;->L(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/edp;->K(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
