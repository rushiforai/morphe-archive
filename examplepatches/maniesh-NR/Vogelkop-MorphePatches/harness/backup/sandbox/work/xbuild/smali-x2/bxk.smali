.class public final Lbxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvc3;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;
.implements Luam;
.implements Lw7e;
.implements Lbpm;
.implements Lhti;
.implements Lnj8;
.implements Lorg/chromium/support_lib_boundary/WebViewStartUpConfigBoundaryInterface;
.implements Lylo;
.implements Lfqp;
.implements Ljrp;
.implements Lph;
.implements Levp;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lbxk;->a:B

    sparse-switch p1, :sswitch_data_2c

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance p1, Lthk;

    invoke-direct {p1, p0}, Lthk;-><init>(Lbxk;)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lbxk;->b:Ljava/lang/Object;

    return-void

    .line 75
    :sswitch_14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lbxk;->b:Ljava/lang/Object;

    return-void

    .line 76
    :sswitch_20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance p1, Lqq8;

    invoke-direct {p1}, Lqq8;-><init>()V

    .line 78
    iput-object p1, p0, Lbxk;->b:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_2c
    .sparse-switch
        0x8 -> :sswitch_20
        0x11 -> :sswitch_14
    .end sparse-switch
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Lbxk;->a:B

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Leu4;

    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, v1}, Leu4;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lbxk;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 71
    iput-byte p2, p0, Lbxk;->a:B

    iput-object p1, p0, Lbxk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 3

    const/16 v0, 0x13

    iput-byte v0, p0, Lbxk;->a:B

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lbxk;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk8n;[[B)V
    .registers 7

    const/16 v0, 0xb

    iput-byte v0, p0, Lbxk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p1, :cond_41

    const/4 v1, 0x0

    move v2, v1

    :goto_c
    array-length v3, p2

    if-ge v2, v3, :cond_1c

    aget-object v3, p2, v2

    if-eqz v3, :cond_16

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_16
    const-string p0, "publicKey byte array == null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0

    :cond_1c
    array-length v2, p2

    iget v3, p1, Lk8n;->c:I

    if-ne v2, v3, :cond_3b

    :goto_21
    array-length v2, p2

    if-ge v1, v2, :cond_34

    aget-object v2, p2, v1

    array-length v2, v2

    iget v3, p1, Lk8n;->a:I

    if-ne v2, v3, :cond_2e

    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    :cond_2e
    const-string p0, "wrong publicKey format"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    throw v0

    :cond_34
    invoke-static {p2}, Ldbh;->m([[B)[[B

    move-result-object p1

    iput-object p1, p0, Lbxk;->b:Ljava/lang/Object;

    return-void

    :cond_3b
    const-string p0, "wrong publicKey size"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    throw v0

    :cond_41
    const-string p0, "params == null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final F()V
    .registers 1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lmqn;

    invoke-virtual {p0}, Llqn;->g0()V

    return-void
.end method

.method public final K()V
    .registers 1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lmqn;

    iget-object p0, p0, Lmqn;->S:Ly83;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Ly83;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final U(F)V
    .registers 3

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    rsub-int p1, p1, 0xff

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lmqn;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_15
    return-void
.end method

.method public final W()V
    .registers 1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lmqn;

    iget-object p0, p0, Lmqn;->S:Ly83;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Ly83;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final bridge synthetic a()Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lvlo;

    invoke-virtual {p0}, Lvlo;->a()Ljava/lang/Object;

    move-result-object p0

    new-instance v0, Ldlo;

    check-cast p0, Lolo;

    invoke-direct {v0, p0}, Ldlo;-><init>(Lolo;)V

    return-object v0
.end method

.method public final b([Ljava/security/MessageDigest;JI)V
    .registers 7

    iget-object v0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    long-to-int p2, p2

    invoke-virtual {v1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p3, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p3, Ljava/nio/ByteBuffer;

    add-int/2addr p2, p4

    invoke-virtual {p3, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p0

    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_31

    array-length p2, p1

    const/4 p3, 0x0

    move p4, p3

    :goto_21
    if-ge p4, p2, :cond_2e

    aget-object v0, p1, p4

    invoke-virtual {p0, p3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_21

    :cond_2e
    return-void

    :goto_2f
    :try_start_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_31

    throw p0

    :catchall_31
    move-exception p0

    goto :goto_2f
.end method

.method public final c(Landroid/net/Uri;)Lyb6;
    .registers 4

    new-instance v0, Lmb2;

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/ContentResolver;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lmb2;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;B)V

    return-object v0
.end method

.method public final d(I)Z
    .registers 2

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object p0, p0, Lz5l;->v:Lx2l;

    invoke-virtual {p0, p1}, Ldt1;->H(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm2l;

    if-eqz p0, :cond_16

    instance-of p1, p0, Lu2l;

    if-nez p1, :cond_18

    instance-of p0, p0, Lg2l;

    if-nez p0, :cond_18

    :cond_16
    const/4 p0, 0x0

    return p0

    :cond_18
    const/4 p0, 0x1

    return p0
.end method

.method public final e(ILjava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/hype/image/editor/TextBoxEditText;

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Lyq1;->setTypeface(Landroid/graphics/Typeface;I)V

    return-void
.end method

.method public final f(J)J
    .registers 5

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-static {p1, p2}, Li1n;->b(J)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_15

    invoke-static {p1, p2}, Li1n;->c(J)F

    move-result v0

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_22

    :cond_15
    invoke-static {p1, p2}, Li1n;->g(J)Ljava/lang/String;

    move-result-object v0

    const-string v1, "maximumVelocity should be a positive value. You specified="

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_22
    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Lk1n;

    invoke-static {p1, p2}, Li1n;->b(J)F

    move-result v1

    invoke-virtual {v0, v1}, Lk1n;->c(F)F

    move-result v0

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lk1n;

    invoke-static {p1, p2}, Li1n;->c(J)F

    move-result p1

    invoke-virtual {p0, p1}, Lk1n;->c(F)F

    move-result p0

    invoke-static {v0, p0}, Lw0h;->a(FF)J

    move-result-wide p0

    return-wide p0
.end method

.method public final g()I
    .registers 3

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v0, "default_webpage_zoom"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    const/16 v0, 0x32

    const/16 v1, 0x12c

    invoke-static {p0, v0, v1}, Lcs5;->t(III)I

    move-result p0

    return p0
.end method

.method public final getBackgroundExecutor()Ljava/util/concurrent/Executor;
    .registers 1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/webkit/WebViewStartUpConfig;

    invoke-virtual {p0}, Landroidx/webkit/WebViewStartUpConfig;->getBackgroundExecutor()Ljava/util/concurrent/Executor;

    move-result-object p0

    return-object p0
.end method

.method public final getProfileNamesToLoad()Ljava/util/Set;
    .registers 1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/webkit/WebViewStartUpConfig;

    invoke-virtual {p0}, Landroidx/webkit/WebViewStartUpConfig;->getProfilesToLoadDuringStartup()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public final h(I)V
    .registers 4

    const/16 v0, 0x32

    const/16 v1, 0x12c

    invoke-static {p1, v0, v1}, Lcs5;->t(III)I

    move-result p1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v0, "default_webpage_zoom"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-static {p1}, Loup;->n0(I)D

    move-result-wide p0

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v0, p0, p1}, LJ/N;->MNh9C30M(Ljava/lang/Object;D)V

    invoke-static {}, LJ/N;->MGWafL4o()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v0, p0, p1}, LJ/N;->MNh9C30M(Ljava/lang/Object;D)V

    return-void
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 7

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

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

    const-string v4, "External offer flow finished with resultCode: "

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

    const-string v4, "External offer flow finished with error resultCode: "

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

    iget-object v0, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->i:Landroid/os/ResultReceiver;

    if-eqz v0, :cond_5b

    invoke-virtual {v0, p1, v1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    goto :goto_60

    :cond_5b
    const-string v0, "External offer flow result receiver is null"

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :goto_60
    if-eqz p1, :cond_73

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "External offer flow finished with billing responseCode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :cond_73
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final n0(F)V
    .registers 2

    return-void
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 11

    iget-byte v0, p0, Lbxk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f4

    check-cast p0, Lha6;

    iget-object v0, p0, Lha6;->m:Ljava/lang/Object;

    check-cast v0, Lcom/google/ads/interactivemedia/v3/internal/zzfa;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;

    iget-boolean v2, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->enableInstrumentation:Z

    iget-object v3, p0, Lha6;->p:Ljava/lang/Object;

    check-cast v3, Lcom/google/ads/interactivemedia/v3/internal/zzeg;

    iget-object v4, v3, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    if-eqz v2, :cond_35

    const/4 v2, 0x2

    iput-byte v2, v3, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->c:B

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwmb;

    :goto_27
    if-eqz v2, :cond_3b

    iget-object v5, v3, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->b:Lwpp;

    invoke-virtual {v5, v2}, Lwpp;->a(Lwmb;)V

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwmb;

    goto :goto_27

    :cond_35
    const/4 v2, 0x3

    iput-byte v2, v3, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->c:B

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    :cond_3b
    iget-object v2, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->espAdapterTimeoutMs:Ljava/lang/Integer;

    if-eqz v2, :cond_76

    iget-object v4, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->espAdapters:Ljava/util/List;

    if-eqz v4, :cond_76

    invoke-virtual {v0, v4, v2}, Lcom/google/ads/interactivemedia/v3/internal/zzfa;->a(Ljava/util/List;Ljava/lang/Integer;)V

    iget-object v2, v0, Lcom/google/ads/interactivemedia/v3/internal/zzfa;->b:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v4, Lcom/google/ads/interactivemedia/v3/internal/zzex;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iget-object v5, v0, Lcom/google/ads/interactivemedia/v3/internal/zzfa;->e:Lcom/google/ads/interactivemedia/v3/internal/zzsx;

    invoke-virtual {v2, v5, v4}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v4, Lcom/google/ads/interactivemedia/v3/internal/zzet;

    invoke-direct {v4, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzet;-><init>(Lcom/google/ads/interactivemedia/v3/internal/zzfa;)V

    invoke-virtual {v2, v5, v4}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v4, Lcom/google/ads/interactivemedia/v3/internal/zzeu;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v5, v4}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v4, Lcom/google/ads/interactivemedia/v3/internal/zzey;

    invoke-direct {v4, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzey;-><init>(Lcom/google/ads/interactivemedia/v3/internal/zzfa;)V

    invoke-virtual {v2, v5, v4}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    iget-object v0, v0, Lcom/google/ads/interactivemedia/v3/internal/zzfa;->c:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    :cond_76
    iget-object v0, p0, Lha6;->l:Ljava/lang/Object;

    check-cast v0, Lcom/google/ads/interactivemedia/v3/internal/zzem;

    iget-object v2, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->platformSignalCollectorTimeoutMs:Ljava/lang/Integer;

    iget-object v4, v0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->e:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v5, v0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->c:La36;

    if-eqz v5, :cond_b6

    if-eqz v2, :cond_b6

    iget-object v1, v0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->a:Lmbi;

    iget-object v5, v0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->b:Lcom/google/ads/interactivemedia/v3/internal/zzsx;

    new-instance v6, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v6}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v7, Lypp;

    const/4 v8, 0x4

    invoke-direct {v7, v6, v1, v8}, Lypp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v5, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v5, v2

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v1, v5, v6, v2}, Lcom/google/android/gms/tasks/Tasks;->withTimeout(Lcom/google/android/gms/tasks/Task;JLjava/util/concurrent/TimeUnit;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/google/ads/interactivemedia/v3/internal/zzek;

    invoke-direct {v2, v4}, Lcom/google/ads/interactivemedia/v3/internal/zzek;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    new-instance v2, Lcom/google/ads/interactivemedia/v3/internal/zzel;

    invoke-direct {v2, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzel;-><init>(Lcom/google/ads/interactivemedia/v3/internal/zzem;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    goto :goto_b9

    :cond_b6
    invoke-virtual {v4, v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    :goto_b9
    iget-object v0, p0, Lha6;->a:Ljava/lang/Object;

    check-cast v0, Lmbi;

    new-instance v1, Lcom/google/ads/interactivemedia/v3/internal/zzdv;

    invoke-direct {v1, v0, p1, v3}, Lcom/google/ads/interactivemedia/v3/internal/zzdv;-><init>(Lmbi;Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;Lcom/google/ads/interactivemedia/v3/internal/zzeg;)V

    iput-object v1, p0, Lha6;->r:Ljava/lang/Object;

    iget-object p0, p0, Lha6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/ads/interactivemedia/v3/internal/zztd;

    invoke-virtual {p0, p1}, Lcom/google/ads/interactivemedia/v3/internal/zzrh;->e(Ljava/lang/Object;)Z

    return-void

    :pswitch_cc
    check-cast p0, Lnh4;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    if-nez v0, :cond_e8

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_de

    invoke-virtual {p0, v1}, Lnh4;->d(Ljava/lang/Throwable;)Z

    goto :goto_f2

    :cond_de
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    goto :goto_f2

    :cond_e8
    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :goto_f2
    return-void

    nop

    :pswitch_data_f4
    .packed-switch 0x3
        :pswitch_cc
    .end packed-switch
.end method

.method public final p(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lndn;

    iget-object p0, p0, Lndn;->f:Lqdn;

    invoke-virtual {p0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final shouldRunUiThreadStartUpTasks()Z
    .registers 1

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/webkit/WebViewStartUpConfig;

    invoke-virtual {p0}, Landroidx/webkit/WebViewStartUpConfig;->shouldRunUiThreadStartUpTasks()Z

    move-result p0

    return p0
.end method

.method public final v(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lndn;

    iget-object p0, p0, Lndn;->f:Lqdn;

    invoke-virtual {p0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 2

    new-instance p1, Lcpm;

    invoke-direct {p1, p0}, Lcpm;-><init>(Lbpm;)V

    return-object p1
.end method

.method public final zza()J
    .registers 3

    .line 20
    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public final zza()Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lh61;

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    new-instance v0, Ljqp;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljqp;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public final zza()V
    .registers 3

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ltop;

    .line 21
    new-instance v0, Ldcl;

    invoke-direct {v0, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    const-string v1, "split-install-errors"

    invoke-virtual {p0, v1, v0}, Ltop;->a(Ljava/lang/String;Levp;)V

    return-void
.end method
