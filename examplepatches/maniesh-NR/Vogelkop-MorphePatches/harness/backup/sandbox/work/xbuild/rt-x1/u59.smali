.class public final Lu59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkud;
.implements Ls37;
.implements La5a;
.implements Ltyi;
.implements Lbcf;
.implements Ljzh;
.implements Lgk8;
.implements Llnk;
.implements Ljak;
.implements Ljz4;
.implements Ljh4;


# static fields
.field public static c:Lu59;

.field public static final d:Ljava/lang/Object;

.field public static final e:Lu59;

.field public static final f:Lwu9;

.field public static g:Lqt;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lu59;->d:Ljava/lang/Object;

    const/16 v0, 0x9

    new-array v0, v0, [F

    fill-array-data v0, :array_1e

    new-instance v1, Lu59;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lu59;-><init>(Ljava/lang/Object;B)V

    sput-object v1, Lu59;->e:Lu59;

    new-instance v0, Lwu9;

    invoke-direct {v0, v2}, Lwu9;-><init>(B)V

    sput-object v0, Lu59;->f:Lwu9;

    return-void

    :array_1e
    .array-data 4
        0x3f652546    # 0.8951f
        -0x40bff2e5    # -0.7502f
        0x3d1f559b    # 0.0389f
        0x3e886595    # 0.2664f
        0x3fdb53f8    # 1.7135f
        -0x4273b646    # -0.0685f
        -0x41dab9f5    # -0.1614f
        0x3d1652bd    # 0.0367f
        0x3f83c9ef    # 1.0296f
    .end array-data
.end method

.method public constructor <init>(B)V
    .registers 6

    iput-byte p1, p0, Lu59;->a:B

    sparse-switch p1, :sswitch_data_6a

    new-instance p1, Lh9d;

    sget-object v0, Lv6h;->c:Lv6h;

    :try_start_9
    const-string v0, "com.google.crypto.tink.shaded.protobuf.DescriptorMessageInfoFactory"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getInstance"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnvd;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_1c} :catch_1d

    goto :goto_1f

    :catch_1d
    sget-object v0, Lu59;->f:Lwu9;

    :goto_1f
    const/4 v1, 0x2

    new-array v1, v1, [Lnvd;

    sget-object v2, Lwu9;->b:Lwu9;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p1, Lh9d;->a:[Lnvd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lhfb;->a:Ljava/nio/charset/Charset;

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    return-void

    :sswitch_37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class p1, Landroidx/camera/camera2/compat/quirk/CloseCameraDeviceOnCameraGraphCloseQuirk;

    invoke-static {p1}, Ld77;->a(Ljava/lang/Class;)Ltgh;

    move-result-object p1

    check-cast p1, Landroidx/camera/camera2/compat/quirk/CloseCameraDeviceOnCameraGraphCloseQuirk;

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    return-void

    :sswitch_45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lfee;->k()Lfee;

    move-result-object p1

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    return-void

    :sswitch_4f
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lwa;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lwa;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lauj;

    const/16 v0, 0x8

    invoke-direct {p1, v0}, Lauj;-><init>(B)V

    invoke-static {p1}, Luup;->m(Ljava/lang/Object;)Lb7f;

    move-result-object p1

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_6a
    .sparse-switch
        0xb -> :sswitch_53
        0xf -> :sswitch_4f
        0x14 -> :sswitch_45
        0x1a -> :sswitch_37
    .end sparse-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 107
    iput-byte p2, p0, Lu59;->a:B

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lmbi;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lu59;->a:B

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    new-instance p0, Lcom/google/android/gms/internal/atv_ads_framework/zzd;

    invoke-direct {p0}, Lcom/google/android/gms/internal/atv_ads_framework/zzd;-><init>()V

    return-void
.end method

.method public constructor <init>(Lqy4;)V
    .registers 3

    const/16 v0, 0x18

    iput-byte v0, p0, Lu59;->a:B

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lu59;->b:Ljava/lang/Object;

    return-void
.end method

.method public static C(Landroid/content/Context;)Lu59;
    .registers 5

    sget-object v0, Lu59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lu59;->c:Lu59;

    if-nez v1, :cond_16

    new-instance v1, Lu59;

    new-instance v2, Lnv6;

    const/16 v3, 0x9

    invoke-direct {v2, p0, v3}, Lnv6;-><init>(Landroid/content/Context;B)V

    const/4 p0, 0x0

    invoke-direct {v1, v2, p0}, Lu59;-><init>(Ljava/lang/Object;B)V

    sput-object v1, Lu59;->c:Lu59;

    :cond_16
    monitor-exit v0

    return-object v1

    :goto_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1a

    throw p0

    :catchall_1a
    move-exception p0

    goto :goto_18
.end method

.method private final J(Lnzi;)Z
    .registers 6

    iget v0, p1, Lnzi;->e:I

    sget v1, Lahh;->select_action_menu_passkey_entry:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_17

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/autofill/AutofillProvider;

    iget-wide p0, p0, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-eqz v0, :cond_5c

    invoke-static {p0, p1}, LJ/N;->MviFxyDZ(J)V

    return v2

    :cond_17
    iget p1, p1, Lnzi;->e:I

    const v0, 0x1020043

    if-ne p1, v0, :cond_5d

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/autofill/AutofillProvider;

    invoke-virtual {p0}, Lorg/chromium/components/autofill/AutofillProvider;->j()Z

    move-result p1

    if-eqz p1, :cond_5c

    iget-object p1, p0, Lorg/chromium/components/autofill/AutofillProvider;->e:Ll45;

    iget-object p1, p1, Ll45;->b:Ljava/lang/Object;

    check-cast p1, Lwu2;

    iget-object v0, p1, Lwu2;->b:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Lorg/chromium/components/autofill/AutofillProvider;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v0

    if-eqz v0, :cond_5c

    invoke-virtual {p0}, Lorg/chromium/components/autofill/AutofillProvider;->b()Lht2;

    move-result-object v1

    iget-object v3, p0, Lorg/chromium/components/autofill/AutofillProvider;->c:Lxr5;

    iget-object p0, p0, Lorg/chromium/components/autofill/AutofillProvider;->e:Ll45;

    iget-short p1, p1, Lwu2;->a:S

    invoke-virtual {p0, p1}, Ll45;->F(S)I

    move-result p0

    invoke-virtual {v1}, Lht2;->c()Z

    move-result p1

    if-nez p1, :cond_5c

    invoke-virtual {v1}, Lht2;->a()Z

    move-result p1

    if-nez p1, :cond_5c

    :try_start_50
    iget-object p1, v1, Lht2;->b:Landroid/view/autofill/AutofillManager;

    invoke-virtual {p1, v3, p0, v0}, Landroid/view/autofill/AutofillManager;->requestAutofill(Landroid/view/View;ILandroid/graphics/Rect;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_55} :catch_56

    return v2

    :catch_56
    move-exception p0

    const/16 p1, 0xc

    invoke-static {p1, p0}, Luu2;->b(ILjava/lang/Exception;)V

    :cond_5c
    return v2

    :cond_5d
    const/4 p0, 0x0

    return p0
.end method

.method public static M(IIIZ)Lu59;
    .registers 5

    new-instance v0, Lu59;

    invoke-static {p0, p1, p3, p2}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZI)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    move-result-object p0

    const/4 p1, 0x4

    invoke-direct {v0, p0, p1}, Lu59;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method


# virtual methods
.method public final A(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    return-void
.end method

.method public final B()Ljava/util/ArrayList;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lu59;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/components/autofill/AutofillProvider;

    iget-wide v1, v1, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    const/16 v4, 0x64

    if-eqz v3, :cond_37

    invoke-static {v1, v2}, LJ/N;->MK_7GdD0(J)Z

    move-result v1

    if-eqz v1, :cond_37

    new-instance v1, Lmzi;

    const v2, 0x7f1402b1

    invoke-direct {v1, v2}, Lmzi;-><init>(I)V

    sget v2, Lahh;->select_action_menu_passkey_entry:I

    iput v2, v1, Lmzi;->c:I

    sget v2, Lahh;->select_action_menu_delegate_items:I

    iput v2, v1, Lmzi;->d:I

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v4}, Lmzi;->b(II)V

    const/4 v2, 0x6

    iput-byte v2, v1, Lmzi;->i:B

    invoke-virtual {v1}, Lmzi;->a()Lnzi;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_37
    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/autofill/AutofillProvider;

    invoke-virtual {p0}, Lorg/chromium/components/autofill/AutofillProvider;->j()Z

    move-result p0

    if-eqz p0, :cond_61

    new-instance p0, Lmzi;

    const v1, 0x104001a

    invoke-direct {p0, v1}, Lmzi;-><init>(I)V

    const v1, 0x1020043

    iput v1, p0, Lmzi;->c:I

    sget v1, Lahh;->select_action_menu_delegate_items:I

    iput v1, p0, Lmzi;->d:I

    const/high16 v1, 0x30000

    invoke-virtual {p0, v1, v4}, Lmzi;->b(II)V

    const/4 v1, 0x4

    iput-byte v1, p0, Lmzi;->i:B

    invoke-virtual {p0}, Lmzi;->a()Lnzi;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_61
    return-object v0
.end method

.method public final D()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final E(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lrz4;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 p1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lorg/chromium/ui/base/EventForwarder;->a(JZ)V

    return-void
.end method

.method public final F()Lb2l;
    .registers 2

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-virtual {v0, p0}, Ldx3;->V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final G(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    invoke-virtual {p0, p1}, Lu59;->E(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lrz4;

    iget-object p1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    iget p1, p1, Lhuh;->a:F

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-float p1, v0

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/chromium/ui/base/EventForwarder;->g(FF)V

    return-void
.end method

.method public final H()Lt59;
    .registers 1

    invoke-virtual {p0}, Lu59;->L()Lt59;

    move-result-object p0

    if-eqz p0, :cond_7

    return-object p0

    :cond_7
    sget-object p0, Lt59;->d:Lt59;

    return-object p0
.end method

.method public final I(Lmsp;)V
    .registers 7

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lmbi;

    iget-object v0, p1, Lmsp;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lprp;

    iget-object v3, v2, Lprp;->e:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v4, "atvatc"

    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_a

    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    iget-object v1, v2, Lprp;->e:Ljava/lang/String;

    goto :goto_30

    :cond_2f
    const/4 v1, 0x0

    :goto_30
    const-string v2, "render_error_message"

    const-class v3, Lcom/google/android/tv/ads/controls/FallbackImageActivity;

    const/4 v4, 0x1

    if-eqz v1, :cond_9c

    :try_start_37
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.google.android.tv.ads.intent.action.LAUNCH_ATC_MENU"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "extra_atc_uri"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "extra_publisher_package"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    sget-object v0, Lcom/google/android/gms/internal/atv_ads_framework/zza;->zza:Lcom/google/android/gms/internal/atv_ads_framework/zza;

    invoke-static {p0}, Lcom/google/android/gms/internal/atv_ads_framework/zzd;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/atv_ads_framework/zza;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_79

    if-eq v0, v4, :cond_6f

    const/4 v1, 0x2

    if-eq v0, v1, :cond_79

    const/4 p1, 0x3

    if-eq v0, p1, :cond_67

    return-void

    :cond_67
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "AdsControlsManager should only be used on the Android TV platform."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6f
    const-string v0, "com.google.android.apps.tv.launcherx"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmbi;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_79
    const-string v0, "com.google.android.tvrecommendations"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmbi;->startActivity(Landroid/content/Intent;)V
    :try_end_82
    .catch Landroid/content/ActivityNotFoundException; {:try_start_37 .. :try_end_82} :catch_83

    return-void

    :catch_83
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmbi;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_9c
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_bb

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmbi;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_bb
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "icon_click_fallback_images"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmbi;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final K(Ltj5;)V
    .registers 7

    invoke-interface {p1}, Ltj5;->d()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lan2;

    iget-object v2, p0, Lu59;->b:Ljava/lang/Object;

    check-cast v2, Lfee;

    invoke-interface {p1, v1}, Ltj5;->h(Lan2;)Lsj5;

    move-result-object v3

    invoke-interface {p1, v1}, Ltj5;->i(Lan2;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Lfee;->q(Lan2;Lsj5;Ljava/lang/Object;)V

    goto :goto_8

    :cond_24
    return-void
.end method

.method public final L()Lt59;
    .registers 9

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lnv6;

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "persistent.installTime"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_33

    :try_start_15
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v3

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v5

    const/4 p0, 0x2

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v2, Lt59;

    invoke-direct/range {v2 .. v7}, Lt59;-><init>(JJLjava/lang/String;)V
    :try_end_32
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_32} :catch_33

    return-object v2

    :catch_33
    :cond_33
    return-object v1
.end method

.method public final N(I)V
    .registers 5

    iget-byte v0, p0, Lu59;->a:B

    packed-switch v0, :pswitch_data_42

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Ls62;

    iget-object p0, p0, Ls62;->v:Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lzz1;

    if-eqz p0, :cond_1d

    iget-object p0, p0, Lzz1;->d:Lmlj;

    new-instance v0, Lrxh;

    invoke-direct {v0, p1}, Lrxh;-><init>(I)V

    const/16 p1, 0x9c4

    invoke-virtual {p0, v0, p1}, Lmlj;->a(Lrxh;I)V

    :cond_1d
    return-void

    :pswitch_1e
    sget-object v0, Lu59;->g:Lqt;

    if-eqz v0, :cond_28

    sget-object v1, Lhjm;->b:Lhjm;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lo93;->b(Lhjm;I)V

    :cond_28
    new-instance v0, Lqt;

    new-instance v1, Lrxh;

    invoke-direct {v1, p1}, Lrxh;-><init>(I)V

    const/4 p1, 0x0

    invoke-direct {v0, v1, p1}, Lqt;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    sput-object v0, Lu59;->g:Lqt;

    return-void

    :pswitch_data_42
    .packed-switch 0x6
        :pswitch_1e
    .end packed-switch
.end method

.method public final Q(I)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final a()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b()Leb4;
    .registers 2

    new-instance v0, Leb4;

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lfee;

    invoke-static {p0}, Lwrf;->f(Ltj5;)Lwrf;

    move-result-object p0

    invoke-direct {v0, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d(Ljava/util/List;)Ljava/util/List;
    .registers 2

    return-object p1
.end method

.method public final destroy()V
    .registers 1

    return-void
.end method

.method public final e(Lnzi;)Z
    .registers 3

    iget-byte v0, p0, Lu59;->a:B

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lu59;

    if-eqz p0, :cond_13

    invoke-virtual {p0, p1}, Lu59;->e(Lnzi;)Z

    move-result p0

    if-eqz p0, :cond_13

    const/4 p0, 0x1

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    return p0

    :pswitch_15
    invoke-direct {p0, p1}, Lu59;->J(Lnzi;)Z

    move-result p0

    return p0

    :pswitch_data_1a
    .packed-switch 0x2
        :pswitch_15
    .end packed-switch
.end method

.method public final f(Litd;Z)V
    .registers 3

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lxp1;

    invoke-virtual {p0, p1}, Lxp1;->q(Litd;)V

    return-void
.end method

.method public final g()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getCues(J)Ljava/util/List;
    .registers 5

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-ltz p1, :cond_b

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    return-object p0

    :cond_b
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public final getEventTime(I)J
    .registers 2

    if-nez p1, :cond_4

    const/4 p0, 0x1

    goto :goto_5

    :cond_4
    const/4 p0, 0x0

    :goto_5
    invoke-static {p0}, Lz4o;->w(Z)V

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public final getEventTimeCount()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getNextEventTimeIndex(J)I
    .registers 5

    const-wide/16 v0, 0x0

    cmp-long p0, p1, v0

    if-gez p0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    const/4 p0, -0x1

    return p0
.end method

.method public final h()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final i()Lfee;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final k()Ls6j;
    .registers 1

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lcx4;

    return-object p0
.end method

.method public final l()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 4

    iget-byte p1, p0, Lu59;->a:B

    packed-switch p1, :pswitch_data_4e

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Ltq3;

    iget-object p1, p0, Ltq3;->n:Lsq3;

    if-eqz p1, :cond_14

    iget-object v0, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a0:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_14
    new-instance p1, Lsq3;

    iget-object v0, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    invoke-direct {p1, v0, p2}, Lsq3;-><init>(Landroid/view/View;Lg3o;)V

    iput-object p1, p0, Ltq3;->n:Lsq3;

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {p1, v0}, Lsq3;->e(Landroid/view/Window;)V

    iget-object p1, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object p0, p0, Ltq3;->n:Lsq3;

    iget-object p1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a0:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_33
    return-object p2

    :pswitch_34
    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lna3;

    invoke-virtual {p2}, Lg3o;->a()I

    move-result p1

    iput p1, p0, Lna3;->n:I

    invoke-virtual {p2}, Lg3o;->b()I

    move-result p1

    iput p1, p0, Lna3;->o:I

    invoke-virtual {p2}, Lg3o;->c()I

    move-result p1

    iput p1, p0, Lna3;->p:I

    invoke-virtual {p0}, Lna3;->h()V

    return-object p2

    :pswitch_data_4e
    .packed-switch 0x10
        :pswitch_34
    .end packed-switch
.end method

.method public final n(Lcom/opera/android/browser/chromium/ChromiumContent;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final o(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    return-void
.end method

.method public final p(Litd;)Z
    .registers 3

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lxp1;

    iget-object p0, p0, Lxp1;->l:Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object p0

    if-eqz p0, :cond_11

    const/16 v0, 0x6c

    invoke-interface {p0, v0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    :cond_11
    const/4 p0, 0x1

    return p0
.end method

.method public final q(I)Lz4a;
    .registers 3

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lmq2;

    iget-object p0, p0, Lmq2;->i:Ldt1;

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_14

    sget-object p0, Lz4a;->d:Lz4a;

    return-object p0

    :cond_14
    if-nez p1, :cond_19

    sget-object p0, Lz4a;->a:Lz4a;

    return-object p0

    :cond_19
    sub-int/2addr p0, v0

    if-ne p1, p0, :cond_1f

    sget-object p0, Lz4a;->b:Lz4a;

    return-object p0

    :cond_1f
    sget-object p0, Lz4a;->c:Lz4a;

    return-object p0
.end method

.method public final r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)Z
    .registers 3

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lrz4;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object p0

    iget-boolean p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D:Z

    if-eqz p1, :cond_1f

    const/4 p1, 0x1

    if-eqz p2, :cond_19

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->r()V

    return p1

    :cond_19
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D()Z

    move-result p2

    if-nez p2, :cond_21

    :cond_1f
    const/4 p0, 0x0

    return p0

    :cond_21
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->hidePopupsAndPreserveSelection()V

    return p1
.end method

.method public final s(Lkyh;Ltrf;)Lkyh;
    .registers 3

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/Resources;

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance p2, Lah3;

    invoke-direct {p2, p0, p1}, Lah3;-><init>(Landroid/content/res/Resources;Lkyh;)V

    return-object p2
.end method

.method public final t(Z)V
    .registers 2

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lrz4;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    if-eqz p0, :cond_c

    invoke-virtual {p0, p1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->d(Z)V

    return-void

    :cond_c
    invoke-static {}, Lh9o;->e()V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lu59;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const-string p0, "Bradford"

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final u(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V
    .registers 3

    return-void
.end method

.method public final w(Landroid/graphics/Typeface;)V
    .registers 2

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lv85;

    invoke-virtual {p0, p1}, Lv85;->w(Landroid/graphics/Typeface;)Z

    move-result p1

    if-eqz p1, :cond_e

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lv85;->l(Z)V

    :cond_e
    return-void
.end method

.method public final x(Ljava/lang/String;)Ljava/util/List;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lu59;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lu59;->B()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :cond_11
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public final y(Ljava/lang/Object;)V
    .registers 5

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lcx4;

    iget-object v0, p0, Lcx4;->g:Lkak;

    iget-object v1, p0, Lex4;->d:Lekc;

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr6j;

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    iget-object v2, p0, Lex4;->d:Lekc;

    if-eqz v2, :cond_27

    if-eqz v1, :cond_27

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-char v0, p0, Lv6j;->a:C

    invoke-virtual {p0, v1, p1, v0}, Lcx4;->h(Lr6j;Ljava/lang/Object;I)Lr6j;

    move-result-object p1

    iget-object p0, p0, Lv6j;->b:Lhx5;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void

    :cond_27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
