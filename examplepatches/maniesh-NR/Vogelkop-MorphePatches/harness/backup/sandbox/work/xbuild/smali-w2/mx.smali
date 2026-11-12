.class public final Lmx;
.super Lxv8;
.source "SourceFile"


# static fields
.field public static final synthetic G:I

.field public static final synthetic H:I


# instance fields
.field public final synthetic D:B

.field public final E:Landroid/widget/FrameLayout;

.field public final F:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/View;Lkze;B)V
    .registers 6

    iput-byte p3, p0, Lmx;->D:B

    packed-switch p3, :pswitch_data_84

    new-instance p3, Lnx;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p3, v0}, Lnx;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p3, p2}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    const p2, 0x7f0a042b

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdView;

    iput-object p2, p0, Lmx;->E:Landroid/widget/FrameLayout;

    iget-object p3, p0, Lxv8;->n:Landroid/widget/TextView;

    iget-object v0, p2, Lf43;->a:Lads_mobile_sdk/ew1;

    const-string v1, "3001"

    invoke-virtual {v0, p3, v1}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    iget-object p3, p0, Lxv8;->o:Landroid/widget/TextView;

    iget-object p2, p2, Lf43;->a:Lads_mobile_sdk/ew1;

    const-string v0, "3004"

    invoke-virtual {p2, p3, v0}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    iget-object p3, p0, Lxv8;->u:Lcom/opera/android/ads/AdStarRatingView;

    const-string v0, "3009"

    invoke-virtual {p2, p3, v0}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    iget-object p3, p0, Lxv8;->t:Landroid/widget/TextView;

    const-string v0, "3006"

    invoke-virtual {p2, p3, v0}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    iget-object p3, p0, Lxv8;->x:Landroid/widget/TextView;

    const-string v0, "3002"

    invoke-virtual {p2, p3, v0}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    iget-object p3, p0, Lxv8;->r:Landroid/widget/ImageView;

    const-string v0, "3003"

    invoke-virtual {p2, p3, v0}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    new-instance p2, Lmsd;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/google/android/gms/ads/nativead/MediaView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lmx;->F:Landroid/view/ViewGroup;

    invoke-virtual {p0, p2}, Lxv8;->h0(Landroid/view/View;)V

    return-void

    :pswitch_5d
    new-instance p3, Lvv8;

    const/4 v0, 0x1

    invoke-direct {p3, v0}, Lvv8;-><init>(B)V

    invoke-direct {p0, p1, p3, p2}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    const p2, 0x7f0a0438

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/FrameLayout;

    iput-object p2, p0, Lmx;->E:Landroid/widget/FrameLayout;

    new-instance p2, Lksd;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lksd;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lmx;->F:Landroid/view/ViewGroup;

    invoke-virtual {p0, p2}, Lxv8;->h0(Landroid/view/View;)V

    return-void

    :pswitch_data_84
    .packed-switch 0x1
        :pswitch_5d
    .end packed-switch
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 14

    iget-byte v0, p0, Lmx;->D:B

    iget-object v1, p0, Lmx;->E:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lmx;->F:Landroid/view/ViewGroup;

    packed-switch v0, :pswitch_data_46

    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-nez p2, :cond_2e

    move-object v4, v2

    check-cast v4, Lksd;

    new-instance v3, Ligi;

    const/16 v10, 0x1d

    iget-object v5, p0, Lxv8;->n:Landroid/widget/TextView;

    iget-object v6, p0, Lxv8;->o:Landroid/widget/TextView;

    iget-object v7, p0, Lxv8;->x:Landroid/widget/TextView;

    iget-object v8, p0, Lxv8;->r:Landroid/widget/ImageView;

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v10}, Ligi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lgnf;

    iget-object p0, p0, Lgnf;->u:Lbie;

    invoke-virtual {p0, v1, v3}, Lbie;->e(Landroid/widget/FrameLayout;Ligi;)V

    :cond_2e
    return-void

    :pswitch_2f
    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-nez p2, :cond_45

    check-cast v1, Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdView;

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lio;

    iget-object p0, p0, Lio;->w:Lads_mobile_sdk/bu1;

    check-cast v2, Lmsd;

    invoke-virtual {v1, p0, v2}, Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdView;->a(Lads_mobile_sdk/bu1;Lmsd;)V

    :cond_45
    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method

.method public final X(Z)V
    .registers 4

    iget-byte p1, p0, Lmx;->D:B

    packed-switch p1, :pswitch_data_18

    return-void

    :pswitch_6
    iget-object p1, p0, Lmx;->E:Landroid/widget/FrameLayout;

    check-cast p1, Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdView;

    new-instance v0, Lbi;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lbi;-><init>(Ljava/lang/Object;B)V

    const-class p0, Landroid/widget/RelativeLayout;

    invoke-static {p1, p0, v0}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final Y()V
    .registers 2

    iget-byte v0, p0, Lmx;->D:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0}, Lo43;->Y()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lo43;->Y()V

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lgnf;

    iget-object p0, p0, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->g()V

    return-void

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final f0()Lyz;
    .registers 2

    iget-byte v0, p0, Lmx;->D:B

    packed-switch v0, :pswitch_data_18

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lgnf;

    return-object p0

    :pswitch_e
    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lio;

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final g0(Landroid/view/View;)Z
    .registers 4

    iget-byte v0, p0, Lmx;->D:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lxv8;->g0(Landroid/view/View;)Z

    move-result p0

    return p0

    :pswitch_a
    invoke-super {p0, p1}, Lxv8;->g0(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_18

    iget-object p0, p0, Lo43;->d:Landroid/view/ViewGroup;

    invoke-static {p0, p1}, Lq9n;->w(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result p0

    xor-int/2addr v1, p0

    :cond_18
    return v1

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
