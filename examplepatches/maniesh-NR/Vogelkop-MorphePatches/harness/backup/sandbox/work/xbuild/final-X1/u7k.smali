.class public final Lu7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Lpsm;
.implements La5a;
.implements Lssk;
.implements Lw7e;
.implements Lbpm;
.implements Lqen;
.implements Ld94;
.implements Lm1p;
.implements Lf94;
.implements Lph;


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Litl;

    .line 90
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x1

    .line 91
    iput-boolean v1, v0, Litl;->h:Z

    const/4 v2, 0x2

    .line 92
    iput v2, v0, Litl;->i:I

    .line 93
    iput v1, v0, Litl;->j:I

    .line 94
    sget-object v1, Litl;->m:Lsa2;

    iput-object v1, v0, Litl;->l:Lsa2;

    .line 95
    iput-object v0, p0, Lu7k;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfee;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu7k;->a:Ljava/lang/Object;

    sget-object v0, Lfcl;->Dp:Lan2;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    const-class v3, Lfgk;

    if-eqz v2, :cond_20

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_20

    const-string p1, "Invalid target class configuration for "

    const-string v0, ": "

    invoke-static {p1, p0, v0, v2}, Lkp5;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    throw v1

    :cond_20
    sget-object p0, Lssm;->e:Lssm;

    sget-object v2, Lqsm;->Sp:Lan2;

    invoke-virtual {p1, v2, p0}, Lfee;->s(Lan2;Ljava/lang/Object;)V

    invoke-virtual {p1, v0, v3}, Lfee;->s(Lan2;Ljava/lang/Object;)V

    sget-object p0, Lfcl;->Cp:Lan2;

    invoke-virtual {p1, p0, v1}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_51

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lfee;->s(Lan2;Ljava/lang/Object;)V

    :cond_51
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 87
    iput-object p1, p0, Lu7k;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ln0c;)V
    .registers 6

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Luto;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Luto;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lppp;

    invoke-direct {p1, v0}, Lppp;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Lzop;->a(Lcpp;)Lcpp;

    move-result-object p1

    new-instance v1, Lwci;

    const/16 v2, 0xe

    invoke-direct {v1, v0, p1, v2}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 83
    invoke-static {v1}, Lzop;->a(Lcpp;)Lcpp;

    move-result-object p1

    new-instance v1, Luto;

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Luto;-><init>(Ljava/lang/Object;B)V

    .line 84
    invoke-static {v1}, Lzop;->a(Lcpp;)Lcpp;

    move-result-object v1

    new-instance v2, Lagm;

    const/16 v3, 0xd

    invoke-direct {v2, p1, v1, v0, v3}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 85
    invoke-static {v2}, Lzop;->a(Lcpp;)Lcpp;

    move-result-object p1

    new-instance v0, Lz4k;

    const/16 v1, 0x19

    invoke-direct {v0, p1, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    .line 86
    invoke-static {v0}, Lzop;->a(Lcpp;)Lcpp;

    move-result-object p1

    iput-object p1, p0, Lu7k;->a:Ljava/lang/Object;

    return-void
.end method

.method public static e()Lu7k;
    .registers 3

    new-instance v0, Lu7k;

    invoke-direct {v0}, Lu7k;-><init>()V

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x2

    iput v2, v1, Litl;->j:I

    sget v2, Lfki;->a:I

    iput v2, v1, Litl;->i:I

    return-object v0
.end method

.method public static f(I)Lu7k;
    .registers 4

    new-instance v0, Lu7k;

    invoke-direct {v0}, Lu7k;-><init>()V

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput v2, v1, Litl;->j:I

    iput p0, v1, Litl;->i:I

    return-object v0
.end method

.method public static j(I)Lu7k;
    .registers 6

    new-instance v0, Lu7k;

    invoke-direct {v0}, Lu7k;-><init>()V

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    new-instance v2, Lsa2;

    const/16 v3, 0x13

    const/4 v4, 0x0

    invoke-direct {v2, v3, p0, v4}, Lsa2;-><init>(BIZ)V

    iput-object v2, v1, Litl;->l:Lsa2;

    const/4 p0, 0x1

    iput p0, v1, Litl;->i:I

    return-object v0
.end method

.method public static r(Lgqk;)Z
    .registers 4

    iget v0, p0, Lgqk;->a:I

    const/4 v1, 0x6

    const/4 v2, 0x0

    if-eq v0, v1, :cond_16

    const/16 v1, 0x14

    if-eq v0, v1, :cond_16

    iget-object p0, p0, Lgqk;->b:Lxpk;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_1a

    invoke-static {}, Lh9o;->p()V

    :cond_16
    :pswitch_16
    return v2

    :pswitch_17
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_17
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_17
        :pswitch_17
        :pswitch_16
    .end packed-switch
.end method


# virtual methods
.method public final Q(I)Z
    .registers 3

    const/4 v0, -0x1

    if-ne p1, v0, :cond_5

    const/4 p0, 0x0

    return p0

    :cond_5
    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lhqk;

    iget-object p0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgqk;

    invoke-static {p0}, Lu7k;->r(Lgqk;)Z

    move-result p0

    return p0
.end method

.method public final a()V
    .registers 2

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lcko;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcko;->b:Z

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lwqn;

    iget-object v0, p0, Lwqn;->e:Lioh;

    instance-of v0, v0, Luqn;

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    iput-boolean v0, p0, Lwqn;->f:Z

    sget-object v0, Luqn;->a:Luqn;

    invoke-virtual {p0, v0}, Lwqn;->X(Lioh;)V

    :cond_12
    return-void
.end method

.method public final c(Landroid/net/Uri;)Lyb6;
    .registers 4

    new-instance v0, Lagk;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/ContentResolver;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1, p0}, Lzb2;-><init>(BLjava/lang/Comparable;Ljava/lang/Object;)V

    return-object v0
.end method

.method public final d(Landroid/view/View;)Lorg/json/JSONObject;
    .registers 5

    const/4 p0, 0x0

    invoke-static {p0, p0, p0, p0}, Lyqo;->a(IIII)Lorg/json/JSONObject;

    move-result-object p1

    sget-object v0, Lynh;->b:Landroid/app/UiModeManager;

    const/4 v1, 0x1

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Landroid/app/UiModeManager;->getCurrentModeType()I

    move-result v0

    if-eq v0, v1, :cond_16

    const/4 v2, 0x4

    if-ne v0, v2, :cond_16

    sget v0, Lj7h;->a:I

    goto :goto_17

    :cond_16
    const/4 v0, 0x2

    :goto_17
    sget-object v2, Lhqo;->a:[I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    aget v0, v2, v0

    if-ne v0, v1, :cond_22

    move p0, v1

    :cond_22
    :try_start_22
    const-string v0, "noOutputDevice"

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_27} :catch_27

    :catch_27
    return-object p1
.end method

.method public final g(Landroid/webkit/WebView;)V
    .registers 5

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lcko;

    iget-object v0, p0, Lcko;->c:Lylp;

    iget-object v1, p0, Lcko;->c:Lylp;

    iget-object v0, v0, Lvoo;->q:Lmzo;

    if-eqz v0, :cond_36

    iget-object v0, p0, Lcko;->e:Ldpo;

    if-nez v0, :cond_36

    iget-object v0, p0, Lcko;->a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

    sget-object v2, Lc26;->q:Ll5b;

    iget-boolean v2, v2, Ll5b;->b:Z

    if-nez v2, :cond_1b

    invoke-static {v0}, Lc26;->f(Landroid/content/Context;)V

    :cond_1b
    iget-object v0, v1, Lvoo;->o:Ljava/lang/String;

    iget-object v2, v1, Lvoo;->p:Ljava/lang/String;

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v2, Ldpo;

    iget-object v1, v1, Lvoo;->q:Lmzo;

    invoke-direct {v2, p1, v0, v1}, Ldpo;-><init>(Landroid/webkit/WebView;Ljava/lang/String;Lmzo;)V

    iput-object v2, p0, Lcko;->e:Ldpo;

    :cond_36
    return-void
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lvsk;

    iget-object p0, p0, Lwsk;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final i()Lfee;
    .registers 1

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lfee;

    return-object p0
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 7

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;

    check-cast p1, Loh;

    iget-object v0, p1, Loh;->b:Landroid/content/Intent;

    iget p1, p1, Loh;->a:I

    if-nez v0, :cond_e

    const/4 v1, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    :goto_12
    const/4 v2, -0x1

    const-string v3, "ProxyBillingActivityV2"

    if-eq p1, v2, :cond_4d

    if-nez v1, :cond_1e

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    :cond_1e
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Launch external link flow finished with resultCode: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/google/android/gms/internal/play_billing/zzjn;->zzbv:Lcom/google/android/gms/internal/play_billing/zzjn;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/play_billing/zzjn;->zza()I

    move-result v2

    const-string v4, "INTERNAL_LOG_ERROR_REASON"

    invoke-virtual {v1, v4, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Launch external link flow finished with error resultCode: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS"

    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4d
    invoke-static {v0, v3}, Lcom/google/android/gms/internal/play_billing/zzc;->zzi(Landroid/content/Intent;Ljava/lang/String;)Lmf3;

    move-result-object p1

    iget p1, p1, Lmf3;->a:I

    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->j:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_5b

    invoke-virtual {v0, p1, v1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    goto :goto_60

    :cond_5b
    const-string v0, "Launch external link flow result receiver is null"

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :goto_60
    if-eqz p1, :cond_73

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Launch external link flow finished with billing responseCode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :cond_73
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final l(Lrsk;)V
    .registers 7

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lvsk;

    iget-object v0, p0, Lvsk;->d:[I

    array-length v0, v0

    const/4 v1, 0x1

    move v2, v1

    :goto_9
    if-ge v2, v0, :cond_43

    iget-object v3, p0, Lvsk;->d:[I

    aget v3, v3, v2

    if-eq v3, v1, :cond_39

    const/4 v4, 0x2

    if-eq v3, v4, :cond_31

    const/4 v4, 0x3

    if-eq v3, v4, :cond_29

    const/4 v4, 0x4

    if-eq v3, v4, :cond_21

    const/4 v4, 0x5

    if-ne v3, v4, :cond_40

    invoke-interface {p1, v2}, Lrsk;->j1(I)V

    goto :goto_40

    :cond_21
    iget-object v3, p0, Lvsk;->h:[[B

    aget-object v3, v3, v2

    invoke-interface {p1, v2, v3}, Lrsk;->Z0(I[B)V

    goto :goto_40

    :cond_29
    iget-object v3, p0, Lvsk;->g:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-interface {p1, v2, v3}, Lrsk;->w(ILjava/lang/String;)V

    goto :goto_40

    :cond_31
    iget-object v3, p0, Lvsk;->f:[D

    aget-wide v3, v3, v2

    invoke-interface {p1, v2, v3, v4}, Lrsk;->B(ID)V

    goto :goto_40

    :cond_39
    iget-object v3, p0, Lvsk;->e:[J

    aget-wide v3, v3, v2

    invoke-interface {p1, v2, v3, v4}, Lrsk;->T0(IJ)V

    :cond_40
    :goto_40
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_43
    return-void
.end method

.method public final m(IIZ)Z
    .registers 5

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;

    sget-object v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->P:Lr1j;

    invoke-virtual {p0, p1, p2, p3}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->L(IIZ)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object p3

    if-nez p3, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    invoke-virtual {p0, p1}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->clearNodeInfoCacheForGivenId(I)V

    invoke-virtual {p0, p3, p1}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->Z(Landroid/view/accessibility/AccessibilityEvent;I)V

    const/16 p3, 0x80

    const/4 v0, 0x1

    if-ne p2, p3, :cond_32

    iget p2, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->g:I

    const/16 p3, 0x100

    invoke-virtual {p0, p2, p3, v0}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->L(IIZ)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object p2

    const/4 p3, -0x1

    if-eqz p2, :cond_2a

    invoke-virtual {p0, p2, p3}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->Z(Landroid/view/accessibility/AccessibilityEvent;I)V

    iput p1, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->g:I

    return v0

    :cond_2a
    if-eq p1, p3, :cond_32

    iget p2, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->g:I

    if-eq p2, p1, :cond_32

    iput p1, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->g:I

    :cond_32
    return v0
.end method

.method public final n(Lb2l;Lu3l;)Lb2l;
    .registers 4

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object v0, p0, Lk6l;->m:Lz6l;

    invoke-static {p0, p2, v0}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_25

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_27

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x1

    if-le p1, p2, :cond_25

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    return-object p0

    :cond_25
    const/4 p0, 0x0

    return-object p0

    :cond_27
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    return-object p0
.end method

.method public final o(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Ly0l;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ly0l;

    iget v1, v0, Ly0l;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ly0l;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Ly0l;

    invoke-direct {v0, p0, p2}, Ly0l;-><init>(Lu7k;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ly0l;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ly0l;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p0, v0, Ly0l;->t:Lu7k;

    :try_start_25
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_4b

    goto :goto_42

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_33
    iget-object p2, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p2, Lg1l;

    iput-object p0, v0, Ly0l;->t:Lu7k;

    iput v3, v0, Ly0l;->w:I

    invoke-virtual {p2, p1, v0}, Lg1l;->a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_42

    return-object v1

    :cond_42
    :goto_42
    sget-object p1, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lg1l;

    iget-object p0, p0, Lg1l;->d:Lcom/usercentrics/tcf/core/model/gvl/Declarations;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_4a} :catch_4b

    return-object p0

    :catch_4b
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lhwm;

    const-string p2, "Unable to initialise due to poor or no network connection while fetching the TCF data."

    invoke-direct {p1, p2, p0}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Lq0i;

    invoke-direct {p0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p0
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 17

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    move-object/from16 v0, p2

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Licp;

    new-instance v4, Lcfn;

    const/4 v12, 0x0

    const/16 v13, 0x15

    const/4 v7, 0x0

    const-class v9, Lv84;

    const-string v10, "isCanceled"

    const-string v11, "isCanceled()Z"

    move-object v8, p1

    move-object v6, v4

    invoke-direct/range {v6 .. v13}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lky;

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lky;-><init>(Ljava/lang/Object;Le9a;Lkotlin/jvm/functions/Function0;Licp;I)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 24

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-object v0, v1, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Licp;

    const/4 v3, 0x0

    :try_start_9
    sget-object v4, Lt0i;->b:Lp0i;

    iget-boolean v4, v2, Lpzh;->q:Z

    if-eqz v4, :cond_14

    invoke-interface {v0, v2}, Lcdp;->s(Lpzh;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_25

    :cond_14
    new-instance v0, Lvjo;

    const/16 v4, 0x64

    invoke-direct {v0, v4, v3}, Lvjo;-><init>(ILjava/lang/String;)V

    throw v0
    :try_end_1c
    .catchall {:try_start_9 .. :try_end_1c} :catchall_1c

    :catchall_1c
    move-exception v0

    :try_start_1d
    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v4

    :goto_25
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    if-nez v4, :cond_33

    iget v4, v2, Lpzh;->d:I

    iget-object v5, v2, Lpzh;->f:Le9a;

    move-object v8, v0

    move v12, v4

    :goto_31
    move-object v9, v5

    goto :goto_3f

    :cond_33
    iget v0, v2, Lpzh;->d:I

    iget-object v5, v2, Lpzh;->f:Le9a;

    new-instance v6, Lq0i;

    invoke-direct {v6, v4}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move v12, v0

    move-object v8, v6

    goto :goto_31

    :goto_3f
    iget-object v0, v1, Lu7k;->a:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Licp;

    new-instance v13, Lcfn;

    const-class v16, Lv84;

    const-string v17, "isCanceled"

    const-string v18, "isCanceled()Z"

    const/16 v19, 0x0

    const/16 v20, 0x15

    const/4 v14, 0x0

    move-object/from16 v15, p1

    invoke-direct/range {v13 .. v20}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v7, Lky;

    move-object v10, v13

    invoke-direct/range {v7 .. v12}, Lky;-><init>(Ljava/lang/Object;Le9a;Lkotlin/jvm/functions/Function0;Licp;I)V

    invoke-static {v7}, Lpfp;->a(Ljava/lang/Runnable;)V
    :try_end_5f
    .catchall {:try_start_1d .. :try_end_5f} :catchall_65

    invoke-static {v2, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :goto_63
    move-object v1, v0

    goto :goto_67

    :catchall_65
    move-exception v0

    goto :goto_63

    :goto_67
    :try_start_67
    throw v1
    :try_end_68
    .catchall {:try_start_67 .. :try_end_68} :catchall_68

    :catchall_68
    move-exception v0

    invoke-static {v2, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final onSuccess()V
    .registers 1

    return-void
.end method

.method public final p(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lz0l;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lz0l;

    iget v1, v0, Lz0l;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lz0l;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lz0l;

    invoke-direct {v0, p0, p1}, Lz0l;-><init>(Lu7k;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lz0l;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lz0l;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p0, v0, Lz0l;->t:Lu7k;

    :try_start_25
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_4b

    goto :goto_42

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_33
    iget-object p1, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Lg1l;

    iput-object p0, v0, Lz0l;->t:Lu7k;

    iput v3, v0, Lz0l;->w:I

    invoke-virtual {p1, v0}, Lg1l;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_42

    return-object v1

    :cond_42
    :goto_42
    sget-object p1, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lg1l;

    iget-object p0, p0, Lg1l;->c:Lcom/usercentrics/tcf/core/model/gvl/VendorList;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_4a} :catch_4b

    return-object p0

    :catch_4b
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lhwm;

    const-string v0, "Unable to initialise due to poor or no network connection while fetching the TCF data."

    invoke-direct {p1, v0, p0}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Lq0i;

    invoke-direct {p0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p0
.end method

.method public final q(I)Lz4a;
    .registers 6

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lhqk;

    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgqk;

    iget-object v0, v0, Lgqk;->b:Lxpk;

    iget-object v1, p0, Lhqk;->y:Ljava/util/List;

    add-int/lit8 v2, p1, -0x1

    invoke-static {v2, v1}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgqk;

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    invoke-static {v1}, Lu7k;->r(Lgqk;)Z

    move-result v3

    if-nez v3, :cond_22

    move-object v1, v2

    :cond_22
    if-eqz v1, :cond_27

    iget-object v1, v1, Lgqk;->b:Lxpk;

    goto :goto_28

    :cond_27
    move-object v1, v2

    :goto_28
    iget-object p0, p0, Lhqk;->y:Ljava/util/List;

    add-int/lit8 p1, p1, 0x1

    invoke-static {p1, p0}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgqk;

    if-eqz p0, :cond_3f

    invoke-static {p0}, Lu7k;->r(Lgqk;)Z

    move-result p1

    if-nez p1, :cond_3b

    move-object p0, v2

    :cond_3b
    if-eqz p0, :cond_3f

    iget-object v2, p0, Lgqk;->b:Lxpk;

    :cond_3f
    if-ne v0, v1, :cond_49

    if-ne v0, v2, :cond_46

    sget-object p0, Lz4a;->c:Lz4a;

    return-object p0

    :cond_46
    sget-object p0, Lz4a;->b:Lz4a;

    return-object p0

    :cond_49
    if-ne v0, v2, :cond_4e

    sget-object p0, Lz4a;->a:Lz4a;

    return-object p0

    :cond_4e
    sget-object p0, Lz4a;->d:Lz4a;

    return-object p0
.end method

.method public final s(I)V
    .registers 3

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Litl;

    if-nez p1, :cond_8

    const/4 p1, 0x0

    goto :goto_e

    :cond_8
    new-instance v0, Lrxh;

    invoke-direct {v0, p1}, Lrxh;-><init>(I)V

    move-object p1, v0

    :goto_e
    iput-object p1, p0, Litl;->a:Lpxh;

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final v()Lqsm;
    .registers 2

    new-instance v0, Lggk;

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lfee;

    invoke-static {p0}, Lwrf;->f(Ltj5;)Lwrf;

    move-result-object p0

    invoke-direct {v0, p0}, Lggk;-><init>(Lwrf;)V

    return-object v0
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 2

    new-instance p1, Lcpm;

    invoke-direct {p1, p0}, Lcpm;-><init>(Lbpm;)V

    return-object p1
.end method
