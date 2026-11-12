.class public final Lwtm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnmn;
.implements Landroidx/webkit/WebViewStartUpResult;
.implements Lcom/google/android/gms/internal/play_billing/zzdd;
.implements Ljtp;


# static fields
.field public static volatile d:Lwtm;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 10

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_78

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "X.509"

    invoke-static {p1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object p1

    iput-object p1, p0, Lwtm;->a:Ljava/lang/Object;

    :try_start_f
    const-string p1, "AndroidCAStore"

    invoke-static {p1}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object p1

    iput-object p1, p0, Lwtm;->b:Ljava/lang/Object;
    :try_end_17
    .catch Ljava/security/KeyStoreException; {:try_start_f .. :try_end_17} :catch_38

    :try_start_17
    invoke-virtual {p1, v0}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1a} :catch_1a
    .catch Ljava/security/KeyStoreException; {:try_start_17 .. :try_end_1a} :catch_38

    :catch_1a
    :try_start_1a
    new-instance p1, Ljava/io/File;

    const-string v0, "ANDROID_ROOT"

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/etc/security/cacerts"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lwtm;->c:Ljava/lang/Object;
    :try_end_38
    .catch Ljava/security/KeyStoreException; {:try_start_1a .. :try_end_38} :catch_38

    :catch_38
    new-instance p0, Lanf;

    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lanf;-><init>(B)V

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.security.action.KEYCHAIN_CHANGED"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.security.action.KEY_ACCESS_CHANGED"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.security.action.TRUST_STORE_CHANGED"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0, p0, p1}, Lt8;->Q(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    :pswitch_58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lwtm;->b:Ljava/lang/Object;

    iput-object v0, p0, Lwtm;->c:Ljava/lang/Object;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v3, 0x1

    const-wide/16 v4, 0x1

    const/4 v2, 0x1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lwtm;->a:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_78
    .packed-switch 0x8
        :pswitch_58
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lqro;Lvdp;)V
    .registers 4

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lwtm;->a:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    iput-object p3, p0, Lwtm;->b:Ljava/lang/Object;

    new-instance p3, Lurj;

    invoke-direct {p3, p2}, Lurj;-><init>(Lqro;)V

    new-instance p3, Lrgh;

    invoke-direct {p3, p1, p2}, Lrgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p3, p0, Lwtm;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/UrlFieldEditText;)V
    .registers 4

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p1, p0, Lwtm;->a:Ljava/lang/Object;

    .line 124
    iput-object p2, p0, Lwtm;->b:Ljava/lang/Object;

    .line 125
    new-instance p2, Lm2n;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lm2n;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lwtm;->c:Ljava/lang/Object;

    .line 126
    new-instance p2, Lz22;

    const/16 v0, 0x12

    invoke-direct {p2, p0, v0}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 127
    iput-object p1, p0, Lwtm;->a:Ljava/lang/Object;

    iput-object p2, p0, Lwtm;->b:Ljava/lang/Object;

    iput-object p3, p0, Lwtm;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 120
    iput-object p3, p0, Lwtm;->a:Ljava/lang/Object;

    iput-object p4, p0, Lwtm;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwtm;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static b()Lwtm;
    .registers 3

    sget-object v0, Lwtm;->d:Lwtm;

    if-nez v0, :cond_1b

    invoke-static {}, Lorg/chromium/net/X509Util;->d()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_9
    sget-object v1, Lwtm;->d:Lwtm;

    if-nez v1, :cond_15

    new-instance v1, Lwtm;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lwtm;-><init>(B)V

    sput-object v1, Lwtm;->d:Lwtm;

    :cond_15
    monitor-exit v0

    goto :goto_1b

    :goto_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_9 .. :try_end_18} :catchall_19

    throw v1

    :catchall_19
    move-exception v1

    goto :goto_17

    :cond_1b
    :goto_1b
    sget-object v0, Lwtm;->d:Lwtm;

    return-object v0
.end method


# virtual methods
.method public final a(I)V
    .registers 11

    sget-object v0, Lh8p;->a:[I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_d0

    goto/16 :goto_cf

    :pswitch_d
    const/16 p1, 0xf

    goto :goto_41

    :pswitch_10
    const/16 p1, 0xe

    goto :goto_41

    :pswitch_13
    const/16 p1, 0xd

    goto :goto_41

    :pswitch_16
    const/16 p1, 0x12

    goto :goto_41

    :pswitch_19
    const/16 p1, 0x11

    goto :goto_41

    :pswitch_1c
    const/16 p1, 0x14

    goto :goto_41

    :pswitch_1f
    const/16 p1, 0x13

    goto :goto_41

    :pswitch_22
    const/16 p1, 0x16

    goto :goto_41

    :pswitch_25
    const/16 p1, 0x15

    goto :goto_41

    :pswitch_28
    const/4 p1, 0x7

    goto :goto_41

    :pswitch_2a
    const/16 p1, 0x18

    goto :goto_41

    :pswitch_2d
    const/16 p1, 0x17

    goto :goto_41

    :pswitch_30
    const/16 p1, 0x10

    goto :goto_41

    :pswitch_33
    const/16 p1, 0xb

    goto :goto_41

    :pswitch_36
    const/16 p1, 0xa

    goto :goto_41

    :pswitch_39
    const/16 p1, 0x9

    goto :goto_41

    :pswitch_3c
    const/16 p1, 0xc

    goto :goto_41

    :pswitch_3f
    const/16 p1, 0x8

    :goto_41
    iget-object v0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_71

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_71

    iget-object v0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :cond_58
    if-ge v4, v3, :cond_71

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lpho;

    iget v6, v5, Lpho;->a:I

    if-ne v6, p1, :cond_58

    iget-object v5, v5, Lpho;->b:Ljava/util/ArrayList;

    if-eqz v5, :cond_58

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_58

    goto :goto_72

    :cond_71
    move-object v5, v1

    :goto_72
    if-eqz v5, :cond_c6

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c6

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_7e
    :goto_7e
    if-ge v2, v0, :cond_c6

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast v4, Leuo;

    if-eqz v4, :cond_7e

    new-instance v6, Lcom/opera/ad/entity/Macros;

    sget-boolean v7, Lt8p;->J:Z

    if-eqz v7, :cond_97

    const-string v7, "auto"

    goto :goto_99

    :cond_97
    const-string v7, "manual"

    :goto_99
    iget v4, v4, Leuo;->I:I

    const/4 v8, 0x1

    if-eq v4, v8, :cond_ab

    const/4 v8, 0x2

    if-eq v4, v8, :cond_a8

    const/4 v8, 0x3

    if-ne v4, v8, :cond_a7

    const/16 v4, 0x384

    goto :goto_ad

    :cond_a7
    throw v1

    :cond_a8
    const/16 v4, 0x191

    goto :goto_ad

    :cond_ab
    const/16 v4, 0x190

    :goto_ad
    invoke-direct {v6, v7, v4}, Lcom/opera/ad/entity/Macros;-><init>(Ljava/lang/String;I)V

    invoke-static {v3, v6}, Llno;->a(Ljava/lang/String;Lcom/opera/ad/entity/Macros;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lf1p;->a()Lf1p;

    move-result-object v4

    invoke-virtual {v4, v3}, Lf1p;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_7e

    invoke-static {v3, p1}, Lphj;->t(Ljava/lang/String;I)V

    goto :goto_7e

    :cond_c6
    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Lsc;

    if-eqz p0, :cond_cf

    invoke-virtual {p0, p1}, Lsc;->b(I)V

    :cond_cf
    :goto_cf
    return-void

    :pswitch_data_d0
    .packed-switch 0x1
        :pswitch_3f
        :pswitch_3c
        :pswitch_39
        :pswitch_36
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_28
        :pswitch_25
        :pswitch_22
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
    .end packed-switch
.end method

.method public final c(Lotp;Ljava/io/File;Z)V
    .registers 6

    iget-object v0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    if-nez p3, :cond_65

    iget-object p3, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p3, Leqp;

    iget-object v0, p3, Leqp;->b:Ljava/lang/String;

    iget-object p1, p1, Lotp;->b:Ljava/util/zip/ZipEntry;

    iget-object p3, p3, Leqp;->a:Ljava/io/File;

    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/zip/ZipFile;

    const/16 p3, 0x1000

    new-array p3, p3, [B

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    :cond_2d
    invoke-virtual {p0, p1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p0

    :try_start_31
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_36
    .catchall {:try_start_31 .. :try_end_36} :catchall_59

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_38
    invoke-virtual {p2, v1, v0}, Ljava/io/File;->setWritable(ZZ)Z

    invoke-virtual {p2, v1, v1}, Ljava/io/File;->setWritable(ZZ)Z

    :goto_3e
    invoke-virtual {p0, p3}, Ljava/io/InputStream;->read([B)I

    move-result p2

    if-lez p2, :cond_48

    invoke-virtual {p1, p3, v1, p2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_47
    .catchall {:try_start_38 .. :try_end_47} :catchall_4f

    goto :goto_3e

    :cond_48
    :try_start_48
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_59

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-void

    :catchall_4f
    move-exception p2

    :try_start_50
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_53
    .catchall {:try_start_50 .. :try_end_53} :catchall_54

    goto :goto_58

    :catchall_54
    move-exception p1

    :try_start_55
    invoke-static {p2, p1}, Lw1h;->B(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_58
    throw p2
    :try_end_59
    .catchall {:try_start_55 .. :try_end_59} :catchall_59

    :catchall_59
    move-exception p1

    if-eqz p0, :cond_64

    :try_start_5c
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5f
    .catchall {:try_start_5c .. :try_end_5f} :catchall_60

    goto :goto_64

    :catchall_60
    move-exception p0

    invoke-static {p1, p0}, Lw1h;->B(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_64
    :goto_64
    throw p1

    :cond_65
    return-void
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Ll45;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llmn;

    invoke-interface {p0}, Llmn;->c()V

    return-void
.end method

.method public final e()V
    .registers 1

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Ll45;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llmn;

    invoke-interface {p0}, Llmn;->f()V

    return-void
.end method

.method public final f(Lvb0;)V
    .registers 12

    iget-object v0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loen;

    iget-object p0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-object v1, v0, Loen;->a:Ljava/lang/Integer;

    iget-object v0, v0, Loen;->b:Ljava/lang/CharSequence;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Ltt0;

    const/16 v5, 0x98b

    const/4 v6, -0x1

    const/4 v7, 0x3

    invoke-direct {v4, v5, v6, v7}, Ljf0;-><init>(III)V

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v1, :cond_38

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long v8, p1

    invoke-virtual {v4, v6, v6, v8, v9}, Ljf0;->p(IIJ)V

    :cond_38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_45

    if-eqz v0, :cond_41

    move v5, v6

    :cond_41
    const/4 p1, 0x2

    invoke-virtual {v4, p1, v5, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_45
    invoke-virtual {v3, v2}, Lx56;->C(Lzpa;)Lde0;

    move-result-object p1

    invoke-virtual {p1, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_5d

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5d

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v7, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_6a

    :cond_5d
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v7, v6, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v7, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_6a
    invoke-virtual {v1, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final g(Lomn;)V
    .registers 6

    iget-object p1, p1, Lomn;->a:Laln;

    iget-object v0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast v0, Ll45;

    iget-object v1, v0, Ll45;->b:Ljava/lang/Object;

    check-cast v1, Lo2c;

    iget-object v2, v0, Ll45;->c:Ljava/lang/Object;

    check-cast v2, Llmn;

    sget-object v3, Ll45;->g:Ldpj;

    if-ne v2, v3, :cond_13

    return-void

    :cond_13
    invoke-interface {v2, p1}, Llmn;->e(Laln;)V

    iget-object v2, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-interface {p1, v2, v1}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object p1

    iget-object v0, v0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v0, v0, Lqln;->g:Lagm;

    iget-object p0, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    new-instance v2, Lqjn;

    invoke-direct {v2, v0, p1, p0, v1}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    return-void
.end method

.method public final getMaxTimePerTaskInUiThreadMillis()Ljava/lang/Long;
    .registers 1

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/support_lib_boundary/WebViewStartUpResultBoundaryInterface;

    invoke-interface {p0}, Lorg/chromium/support_lib_boundary/WebViewStartUpResultBoundaryInterface;->getMaxTimePerTaskInUiThreadMillis()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public final getNonUiThreadBlockingStartUpLocations()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public final getTotalTimeInUiThreadMillis()Ljava/lang/Long;
    .registers 1

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/support_lib_boundary/WebViewStartUpResultBoundaryInterface;

    invoke-interface {p0}, Lorg/chromium/support_lib_boundary/WebViewStartUpResultBoundaryInterface;->getTotalTimeInUiThreadMillis()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public final getUiThreadBlockingStartUpLocations()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public final h()Z
    .registers 2

    iget-object p0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p0, p0, 0x30

    const/16 v0, 0x20

    if-ne p0, v0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final zza(Ljava/lang/Throwable;)V
    .registers 7

    instance-of v0, p1, Ljava/util/concurrent/TimeoutException;

    iget-object v1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast v1, Lmrp;

    const/16 v2, 0x1c

    const-string v3, "BillingClientTesting"

    if-eqz v0, :cond_19

    sget-object v0, Lcom/google/android/gms/internal/play_billing/zzjn;->zzaX:Lcom/google/android/gms/internal/play_billing/zzjn;

    sget-object v4, Lxrp;->q:Lmf3;

    invoke-virtual {v1, v2, v4, v0}, Lmrp;->G(ILmf3;Lcom/google/android/gms/internal/play_billing/zzjn;)V

    const-string v0, "Asynchronous call to Billing Override Service timed out."

    invoke-static {v3, v0, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_25

    :cond_19
    sget-object v0, Lcom/google/android/gms/internal/play_billing/zzjn;->zzaQ:Lcom/google/android/gms/internal/play_billing/zzjn;

    sget-object v4, Lxrp;->q:Lmf3;

    invoke-virtual {v1, v2, v4, v0}, Lmrp;->G(ILmf3;Lcom/google/android/gms/internal/play_billing/zzjn;)V

    const-string v0, "An error occurred while retrieving billing override."

    invoke-static {v3, v0, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_25
    iget-object p0, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p0, Liv;

    invoke-virtual {p0}, Liv;->run()V

    return-void
.end method

.method public final zzb(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast v1, Lmrp;

    if-lez v0, :cond_24

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const-string v0, "Billing override value was set by a license tester."

    invoke-static {p1, v0}, Lxrp;->a(ILjava/lang/String;)Lmf3;

    move-result-object p1

    sget-object v0, Lcom/google/android/gms/internal/play_billing/zzjn;->zzaO:Lcom/google/android/gms/internal/play_billing/zzjn;

    const/4 v2, 0x7

    invoke-virtual {v1, v2, p1, v0}, Lmrp;->G(ILmf3;Lcom/google/android/gms/internal/play_billing/zzjn;)V

    iget-object p0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast p0, Lms7;

    invoke-virtual {p0, p1}, Lms7;->accept(Ljava/lang/Object;)V

    return-void

    :cond_24
    iget-object p0, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p0, Liv;

    invoke-virtual {p0}, Liv;->run()V

    return-void
.end method
