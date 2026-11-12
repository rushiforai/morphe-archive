.class public Li4d;
.super Ljava/lang/Object;

# interfaces
.implements Lloo;
.implements Lhsd;
.implements Lebf;
.implements Lahf;
.implements Lcn;
.implements Lhpf;
.implements Ldkg;
.implements Lhtd;
.implements Lb5n;
.implements Ly7;
.implements Lpji;
.implements Ltif;
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x1

    iput-byte v0, p0, Li4d;->a:B

    .line 86
    const-class v0, Landroidx/camera/camera2/compat/quirk/ExtraCroppingQuirk;

    invoke-static {v0}, Ld77;->a(Ljava/lang/Class;)Ltgh;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/compat/quirk/ExtraCroppingQuirk;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object v0, p0, Li4d;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/core/widget/NestedScrollView;)V
    .registers 4

    const/16 v0, 0x17

    iput-byte v0, p0, Li4d;->a:B

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_15

    .line 91
    new-instance v0, Looi;

    invoke-direct {v0, p1}, Looi;-><init>(Landroidx/core/widget/NestedScrollView;)V

    iput-object v0, p0, Li4d;->b:Ljava/lang/Object;

    goto :goto_1c

    .line 92
    :cond_15
    new-instance p1, Lhr5;

    .line 93
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Li4d;->b:Ljava/lang/Object;

    :goto_1c
    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lxbf;)V
    .registers 9

    const/4 v0, 0x3

    iput-byte v0, p0, Li4d;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lkvk;

    const v2, 0x7f140e9f

    const v3, 0x7f040923

    const v4, 0x7f040922

    invoke-direct {v1, v4, v2, v3}, Lhvk;-><init>(III)V

    new-instance v2, Lnvk;

    new-instance v3, Ls6h;

    invoke-direct {v3, p0, v1}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v2, v0, v3}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance v0, Lflb;

    invoke-direct {v0, v2}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v1, Lzld;

    new-instance v3, Lz0c;

    const/16 v4, 0xe

    invoke-direct {v3, v2, v0, v4}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, p1, p3, v3}, Lzld;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lxbf;Lz0c;)V

    iput-object v1, p0, Li4d;->b:Ljava/lang/Object;

    new-instance p3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    iget-wide v2, p1, Landroidx/recyclerview/widget/e;->c:J

    iput-wide v2, p1, Landroidx/recyclerview/widget/e;->e:J

    invoke-virtual {v1}, Lzld;->G()V

    new-instance p1, Lamd;

    invoke-direct {p1, p0, p2}, Lamd;-><init>(Li4d;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/oauth2/OAuth2Account;Lza;)V
    .registers 4

    const/16 v0, 0xa

    iput-byte v0, p0, Li4d;->a:B

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Li4d;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 95
    iput-byte p2, p0, Li4d;->a:B

    iput-object p1, p0, Li4d;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljpo;)V
    .registers 2

    const/16 p1, 0x19

    iput-byte p1, p0, Li4d;->a:B

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    sget-object p1, Lf4j;->a:Lf4j;

    invoke-static {p1}, Lc26;->k(Ljava/lang/Object;)Lef2;

    move-result-object p1

    iput-object p1, p0, Li4d;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    const/16 v0, 0x1a

    iput-byte v0, p0, Li4d;->a:B

    .line 85
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, v1, v0}, Li4d;-><init>(Ljava/lang/Object;B)V

    return-void
.end method

.method public constructor <init>(Lqrh;Lhvc;)V
    .registers 3

    const/16 p1, 0x15

    iput-byte p1, p0, Li4d;->a:B

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Li4d;->b:Ljava/lang/Object;

    return-void
.end method

.method public static C(Lqfb;II[BI)I
    .registers 12

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-ge v0, p2, :cond_47

    add-int/lit8 v2, v1, 0x3

    if-gt v2, p4, :cond_47

    aget-byte v3, p3, v1

    and-int/lit16 v3, v3, 0xff

    int-to-short v3, v3

    add-int/lit8 v4, v1, 0x1

    aget-byte v4, p3, v4

    and-int/lit16 v4, v4, 0xff

    int-to-short v4, v4

    shl-int/lit8 v5, v4, 0x8

    or-int/2addr v3, v5

    and-int/lit16 v3, v3, 0xfff

    int-to-short v3, v3

    shr-int/lit8 v4, v4, 0x4

    add-int/lit8 v1, v1, 0x2

    aget-byte v1, p3, v1

    and-int/lit16 v1, v1, 0xff

    int-to-short v1, v1

    shl-int/lit8 v1, v1, 0x4

    or-int/2addr v4, v1

    and-int/lit16 v4, v4, 0xfff

    int-to-short v1, v4

    const/16 v4, 0xd01

    if-ge v3, v4, :cond_37

    add-int v5, p1, v0

    iget-object v6, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v6, [S

    aput-short v3, v6, v5

    add-int/lit8 v0, v0, 0x1

    :cond_37
    if-ge v0, p2, :cond_45

    if-ge v1, v4, :cond_45

    add-int v3, p1, v0

    iget-object v4, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast v4, [S

    aput-short v1, v4, v3

    add-int/lit8 v0, v0, 0x1

    :cond_45
    move v1, v2

    goto :goto_2

    :cond_47
    return v0
.end method


# virtual methods
.method public final A(Landroid/view/View;)I
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Llph;

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->getDecoratedBottom(Landroid/view/View;)I

    move-result p0

    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr p0, p1

    return p0
.end method

.method public final B(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lg4j;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lg4j;

    iget v1, v0, Lg4j;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lg4j;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lg4j;

    invoke-direct {v0, p0, p1}, Lg4j;-><init>(Li4d;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lg4j;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v0, v0, Lg4j;->v:I

    const/4 v1, 0x0

    if-eqz v0, :cond_3f

    const/4 v2, 0x1

    if-ne v0, v2, :cond_39

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lef2;

    sget-object p1, Lf4j;->a:Lf4j;

    sget-object v0, Lf4j;->b:Lf4j;

    invoke-virtual {p0, p1, v0}, Lef2;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_38

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_38
    throw v1

    :cond_39
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :cond_3f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    throw v1
.end method

.method public final D()V
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lef2;

    sget-object v0, Lf4j;->c:Lf4j;

    invoke-virtual {p0, v0}, Lef2;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Lf4j;->b:Lf4j;

    if-eq p0, v0, :cond_f

    return-void

    :cond_f
    const/4 p0, 0x0

    throw p0
.end method

.method public final I(Lfpf;)V
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lkcg;

    invoke-virtual {p0, p1}, Lkcg;->a(Lipf;)V

    return-void
.end method

.method public final T()V
    .registers 1

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lgii;

    invoke-virtual {p0}, Lgii;->e()V

    return-void
.end method

.method public final V(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 4

    new-instance v0, Li42;

    iget-object v1, p0, Li4d;->b:Ljava/lang/Object;

    check-cast v1, Lza;

    invoke-direct {v0, p0, p1, v1}, Li42;-><init>(Li4d;Lcom/opera/android/oauth2/OperaAccessToken;Lza;)V

    invoke-virtual {v0}, Lyi2;->k()V

    return-void
.end method

.method public final a()V
    .registers 1

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lcie;

    iget-object p0, p0, Lbzo;->b:Lbn;

    invoke-interface {p0}, Lbn;->I()V

    return-void
.end method

.method public final b()V
    .registers 3

    iget-byte v0, p0, Li4d;->a:B

    packed-switch v0, :pswitch_data_26

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Ln1;

    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    const v1, 0x7f14120f

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_1c
    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lza;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lza;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0xa
        :pswitch_1c
    .end packed-switch
.end method

.method public final d(Landroid/view/View;)I
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Llph;

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->getDecoratedTop(Landroid/view/View;)I

    move-result p0

    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr p0, p1

    return p0
.end method

.method public final e(Lcie;)V
    .registers 4

    new-instance v0, Lt8p;

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Ljsd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lt8p;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Ljsd;->a(Laoo;)V

    iget-object p0, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcie;->w0:Laoo;

    invoke-static {v0, p1}, Ljsd;->c(Laoo;Lcie;)V

    iget-object p0, p1, Lcie;->u:Lxho;

    iput-object p0, v0, Lt8p;->z:Lxho;

    iget-object p0, v0, Lt8p;->u:Leuo;

    invoke-virtual {v0, p0}, Laoo;->v(Landroid/view/View;)V

    iget-object p0, v0, Lt8p;->x:Lwtm;

    iget-object v1, v0, Laoo;->o:Lsc;

    iput-object v1, p0, Lwtm;->c:Ljava/lang/Object;

    iget p0, p1, Lcie;->z0:I

    iput p0, v0, Lt8p;->B:I

    iget-object p0, p1, Lcie;->o:Ljava/lang/String;

    iput-object p0, v0, Lt8p;->y:Ljava/lang/String;

    invoke-virtual {v0}, Lt8p;->y()V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lt8p;->x(Z)V

    return-void
.end method

.method public final f([Landroid/print/PageRange;)V
    .registers 6

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lgii;

    invoke-virtual {p0}, Lgii;->f()Ldd7;

    move-result-object p1

    iget-object v0, p0, Lgii;->b:Lumi;

    new-instance v1, Lfii;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lfii;-><init>(Lgii;B)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v1

    new-instance v2, Lfii;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lfii;-><init>(Lgii;B)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v1, v0}, Lnml;->b(Lnml;)V

    invoke-virtual {v1, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    iget-object p1, p0, Lgii;->l:Landroid/os/ParcelFileDescriptor;

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    iget-object p0, p0, Lgii;->d:Lqji;

    invoke-virtual {p0}, Lqji;->b()V

    return-void
.end method

.method public final g(Lcm;)V
    .registers 4

    iget-byte v0, p0, Li4d;->a:B

    const-string v1, "loadAd: onAdFailedToLoad, error="

    packed-switch v0, :pswitch_data_52

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lp8f;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lqpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqpf;->b(Ljava/lang/String;)V

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :pswitch_2c
    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lp8f;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lopf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iget-object p0, p0, Lopf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    nop

    :pswitch_data_52
    .packed-switch 0xb
        :pswitch_2c
    .end packed-switch
.end method

.method public final h(Lcpf;)V
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lkcg;

    invoke-virtual {p0, p1}, Lkcg;->a(Lipf;)V

    return-void
.end method

.method public final i()I
    .registers 1

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->getPaddingTop()I

    move-result p0

    return p0
.end method

.method public final j(Landroid/view/ViewStub;Labf;)V
    .registers 5

    new-instance v0, Ligi;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lbbf;

    invoke-direct {v1, p2}, Lbbf;-><init>(Labf;)V

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object p2, p0, Lgbf;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lgbf;->f:Lydn;

    invoke-direct {v0, p1, v1, p2, p0}, Ligi;-><init>(Landroid/view/ViewStub;Lbbf;Lcom/opera/android/settings/SettingsManager;Lydn;)V

    return-void
.end method

.method public final k(Lgk9;)Landroid/app/PendingIntent;
    .registers 4

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/PlayerService;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_NOTIFICATION"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, 0x0

    const/high16 v1, 0x4000000

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public final l()V
    .registers 1

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lhvc;

    invoke-virtual {p0}, Lhvc;->run()V

    return-void
.end method

.method public final m()I
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/f;->getPaddingBottom()I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public final n(Lepf;)V
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lkcg;

    invoke-virtual {p0, p1}, Lkcg;->a(Lipf;)V

    return-void
.end method

.method public final o(Lgk9;)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/PlayerService;

    iget-object p0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgig;

    invoke-interface {p0}, Lgig;->g()Lqjd;

    move-result-object p0

    if-eqz p0, :cond_19

    iget-object p0, p0, Lqjd;->e:Lvjd;

    goto :goto_1b

    :cond_19
    sget-object p0, Lvjd;->K:Lvjd;

    :goto_1b
    iget-object p0, p0, Lvjd;->f:Ljava/lang/CharSequence;

    invoke-static {p0}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lcie;

    iget-object p0, p0, Lbzo;->b:Lbn;

    invoke-interface {p0}, Lbn;->onAdClicked()V

    return-void
.end method

.method public final onAdLoaded(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Li4d;->a:B

    const-string v1, "loadAd: onAdLoaded"

    packed-switch v0, :pswitch_data_3c

    check-cast p1, Ll2i;

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lp8f;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lqpf;

    invoke-virtual {p0, v1}, Lqpf;->b(Ljava/lang/String;)V

    iput-object p1, p0, Lqpf;->e:Lm4b;

    iget-object p1, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p1, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onSuccess(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    iput-object p1, p0, Lqpf;->d:Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;

    return-void

    :pswitch_21
    check-cast p1, Ldhb;

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lp8f;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lopf;

    invoke-virtual {p0, v1}, Lopf;->a(Ljava/lang/String;)V

    iput-object p1, p0, Lopf;->d:Ldhb;

    iget-object p1, p0, Lopf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p1, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onSuccess(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    iput-object p1, p0, Lopf;->c:Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0xb
        :pswitch_21
    .end packed-switch
.end method

.method public final q(Lgk9;)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/PlayerService;

    iget-object p0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgig;

    invoke-interface {p0}, Lgig;->g()Lqjd;

    move-result-object p0

    if-eqz p0, :cond_19

    iget-object p0, p0, Lqjd;->e:Lvjd;

    goto :goto_1b

    :cond_19
    sget-object p0, Lvjd;->K:Lvjd;

    :goto_1b
    iget-object p0, p0, Lvjd;->a:Ljava/lang/CharSequence;

    invoke-static {p0}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lkcg;

    invoke-virtual {p0, p1}, Lkcg;->a(Lipf;)V

    return-void
.end method

.method public final s(Litd;)V
    .registers 2

    return-void
.end method

.method public final t(Lgk9;)Landroid/graphics/Bitmap;
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/PlayerService;

    iget-object p1, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object p1, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgig;

    invoke-interface {p1}, Lgig;->g()Lqjd;

    move-result-object p1

    if-eqz p1, :cond_29

    iget-object p0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->k:Lokg;

    iget-object p0, p0, Lokg;->d:Ljava/util/HashMap;

    iget-object p1, p1, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    return-object p0

    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lwzj;

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.plus_button"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final v(Ltvh;)V
    .registers 4

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Ln1;

    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ldb;

    const/4 v1, 0x0

    iput-object v1, v0, Ldb;->f:Ln1;

    iget-object v1, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Ldb;->g:Ljava/lang/String;

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final w(I)Landroid/view/View;
    .registers 2

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/f;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final x(Litd;Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Ltxi;

    if-eqz p0, :cond_f

    invoke-virtual {p0, p2}, Ltxi;->onMenuItemClick(Landroid/view/MenuItem;)Z

    const/4 p0, 0x1

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final y(Lvi2;)V
    .registers 14

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Ln1;

    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-boolean v0, p1, Lvi2;->b:Z

    iget-object v1, p1, Lvi2;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p1, Lvi2;->a:Ljava/lang/String;

    const/4 v3, 0x0

    if-eqz v0, :cond_88

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ldb;

    iput-object v3, v0, Ldb;->f:Ln1;

    iget-object v0, v0, Ldb;->e:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_1f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1f

    :cond_2f
    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Landroid/app/Activity;

    iget-object v0, p1, Lvi2;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p1, p1, Lvi2;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    new-instance v3, Lpj2;

    invoke-direct {v3, v1}, Lpj2;-><init>(Ldb;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v4, "3"

    const-string v5, "google"

    invoke-virtual {v1, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "0"

    invoke-virtual {v1, v4, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "1"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string v0, "2"

    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ln6h;

    new-instance v5, Lwzg;

    const-class v0, Lpj2;

    const/4 v1, 0x4

    invoke-direct {v5, v3, v0, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lzhj;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, -0x1

    const-string v9, "confirm"

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v11}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v4, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :cond_88
    iget v0, p1, Lvi2;->c:I

    const/4 v4, -0x1

    if-eq v0, v4, :cond_9b

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_97

    invoke-virtual {p0, v1}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_97
    invoke-virtual {p0, v3}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void

    :cond_9b
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b4

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Landroid/app/Activity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    invoke-static {p0, p1}, Ljpo;->Q(Ldb;Lvi2;)V

    :cond_b4
    return-void
.end method

.method public final z(Ljava/lang/String;Z)V
    .registers 3

    return-void
.end method
