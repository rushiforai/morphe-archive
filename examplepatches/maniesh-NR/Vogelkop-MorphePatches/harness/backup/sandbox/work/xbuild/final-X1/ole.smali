.class public Lole;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7e;
.implements Lec2;
.implements Ltif;
.implements Lhpf;
.implements Lez4;


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    sparse-switch p1, :sswitch_data_30

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Le9;

    invoke-direct {p1, p0}, Le9;-><init>(Lole;)V

    iput-object p1, p0, Lole;->a:Ljava/lang/Object;

    return-void

    :sswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Lole;->a:Ljava/lang/Object;

    return-void

    :sswitch_19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object p1, p0, Lole;->a:Ljava/lang/Object;

    return-void

    :sswitch_24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lole;->a:Ljava/lang/Object;

    return-void

    :sswitch_data_30
    .sparse-switch
        0x8 -> :sswitch_24
        0x16 -> :sswitch_19
        0x18 -> :sswitch_e
    .end sparse-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 53
    iput-object p1, p0, Lole;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lxd5;)V
    .registers 4

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lpde;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 50
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 51
    iput-object v0, p0, Lole;->a:Ljava/lang/Object;

    .line 52
    new-instance v0, Ljg4;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Ljg4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lxd5;->addOnConfigurationChangedListener(Lqp5;)V

    return-void
.end method

.method public static p(Ljava/lang/String;Lf19;Z)Ljava/lang/String;
    .registers 6

    iget-object p1, p1, Lf19;->a:Ljava/lang/String;

    if-eqz p2, :cond_a

    const-string p2, ".temp"

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_a
    const-string p2, "\\W+"

    const-string v0, ""

    invoke-virtual {p0, p2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    rsub-int p2, p2, 0xf2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p2, :cond_54

    const/4 v0, 0x0

    :try_start_1f
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p2
    :try_end_25
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1f .. :try_end_25} :catch_50

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_32
    array-length v1, p0

    if-ge v0, v1, :cond_4b

    aget-byte v1, p0, v0

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%02x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_32

    :cond_4b
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_54

    :catch_50
    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_54
    :goto_54
    const-string p2, "lottie_cache_"

    invoke-static {p2, p0, p1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A()Ljava/io/File;
    .registers 3

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lkw0;

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "lottie_network_cache"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_1a

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_1a
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_23

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_23
    return-object v0
.end method

.method public B(IILandroid/os/Bundle;)Z
    .registers 4

    const/4 p0, 0x0

    return p0
.end method

.method public final C(Lb3g;)V
    .registers 9

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Losf;

    invoke-virtual {p1}, Lb3g;->b()Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p1, Lb3g;->b:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1c

    new-instance v2, Lgv;

    const/4 v3, 0x3

    invoke-direct {v2, v1, v0, v3}, Lgv;-><init>(ILjava/util/Collection;B)V

    invoke-virtual {p0, v2}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    :cond_1c
    invoke-virtual {p1}, Lb3g;->b()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_26
    if-ge v2, v0, :cond_4f

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, La3g;

    iget-wide v3, v3, La3g;->c:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_26

    iget-object p1, p0, Losf;->a:Lumi;

    new-instance v0, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v2, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lmsf;

    invoke-direct {p1, p0, v1}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Losf;->d:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    :cond_4f
    return-void
.end method

.method public final D()Z
    .registers 3

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lue;

    iget-object p0, p0, Lue;->h:Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    instance-of v0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    const/4 v1, 0x1

    if-eqz v0, :cond_11

    iget-boolean p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->s:Z

    if-eqz p0, :cond_11

    move p0, v1

    goto :goto_12

    :cond_11
    const/4 p0, 0x0

    :goto_12
    xor-int/2addr p0, v1

    return p0
.end method

.method public final E(Ljava/lang/String;)Z
    .registers 3

    iget-object v0, p0, Lole;->a:Ljava/lang/Object;

    check-cast v0, Lue;

    iget-object v0, v0, Lue;->h:Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-boolean v0, v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->r:Z

    if-nez v0, :cond_1c

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1c

    invoke-virtual {p0}, Lole;->D()Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final F(I)V
    .registers 3

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ljava/io/ByteArrayOutputStream;

    ushr-int/lit8 v0, p1, 0x18

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    ushr-int/lit8 v0, p1, 0x10

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    ushr-int/lit8 v0, p1, 0x8

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    int-to-byte p1, p1

    invoke-virtual {p0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    return-void
.end method

.method public final G(Landroid/content/res/AssetManager;Ljava/lang/String;)Lyb6;
    .registers 4

    new-instance p0, Le19;

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Le19;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;B)V

    return-object p0
.end method

.method public final H(ILjava/lang/Object;Lzmi;)V
    .registers 5

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lw75;

    check-cast p2, Lv5;

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lw75;->s(II)V

    iget-object v0, p0, Lw75;->a:Lole;

    invoke-interface {p3, p2, v0}, Lzmi;->e(Ljava/lang/Object;Lole;)V

    const/4 p2, 0x4

    invoke-virtual {p0, p1, p2}, Lw75;->s(II)V

    return-void
.end method

.method public final I(Lfpf;)V
    .registers 2

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ly53;

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->l:Lx5f;

    iget-object p1, p1, Lfpf;->d:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_13

    sget-object p1, Lkh0;->d:Lkh0;

    goto :goto_15

    :cond_13
    sget-object p1, Lkh0;->e:Lkh0;

    :goto_15
    invoke-virtual {p0, p1}, Lx5f;->d0(Lkh0;)V

    return-void
.end method

.method public final J(ILjava/lang/Object;Lzmi;)V
    .registers 6

    check-cast p2, Lv5;

    iget-object v0, p0, Lole;->a:Ljava/lang/Object;

    check-cast v0, Lw75;

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Lw75;->s(II)V

    invoke-virtual {p2, p3}, Lv5;->a(Lzmi;)I

    move-result p1

    invoke-virtual {v0, p1}, Lw75;->u(I)V

    invoke-interface {p3, p2, p0}, Lzmi;->e(Ljava/lang/Object;Lole;)V

    return-void
.end method

.method public final K(Ljava/lang/String;Ljava/io/InputStream;Lf19;)Ljava/io/File;
    .registers 6

    const/4 v0, 0x1

    invoke-static {p1, p3, v0}, Lole;->p(Ljava/lang/String;Lf19;Z)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Ljava/io/File;

    invoke-virtual {p0}, Lole;->A()Ljava/io/File;

    move-result-object p0

    invoke-direct {p3, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_e
    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_32

    const/16 p1, 0x400

    :try_start_15
    new-array p1, p1, [B

    :goto_17
    invoke-virtual {p2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_23

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_17

    :cond_23
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V
    :try_end_26
    .catchall {:try_start_15 .. :try_end_26} :catchall_2d

    :try_start_26
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_29
    .catchall {:try_start_26 .. :try_end_29} :catchall_32

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    return-object p3

    :catchall_2d
    move-exception p1

    :try_start_2e
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    throw p1
    :try_end_32
    .catchall {:try_start_2e .. :try_end_32} :catchall_32

    :catchall_32
    move-exception p0

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    throw p0
.end method

.method public final b()V
    .registers 4

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lpj2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lpj2;->G0(Z)V

    const v1, 0x7f14120f

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final close()V
    .registers 3

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->c:Lz4k;

    if-eqz p0, :cond_20

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    iget-object v0, p0, Ld7l;->d:Ltw2;

    iget-object v0, v0, Ltw2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/BrowserFragment;

    iget-object v1, v0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-virtual {v1, p0}, Lk6l;->r(I)Lb2l;

    move-result-object p0

    if-nez p0, :cond_21

    :cond_20
    return-void

    :cond_21
    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-virtual {v0, p0}, Lk6l;->k(Lb2l;)V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->c:Lz4k;

    if-eqz p0, :cond_20

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    iget-object v0, p0, Ld7l;->d:Ltw2;

    iget-object v0, v0, Ltw2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/BrowserFragment;

    iget-object v1, v0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-virtual {v1, p0}, Lk6l;->r(I)Lb2l;

    move-result-object p0

    if-nez p0, :cond_21

    :cond_20
    return-void

    :cond_21
    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    const/4 v1, 0x3

    invoke-virtual {v0, p0, v1}, Lk6l;->C(Lb2l;I)V

    return-void
.end method

.method public e(ILandroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 5

    return-void
.end method

.method public final g(Ln18;)V
    .registers 2

    :try_start_0
    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ljava/io/ByteArrayOutputStream;

    invoke-interface {p1}, Ln18;->getEncoded()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_c

    return-void

    :catch_c
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lh9o;->s(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 2

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ly53;

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->l:Lx5f;

    sget-object p1, Lkh0;->c:Lkh0;

    invoke-virtual {p0, p1}, Lx5f;->d0(Lkh0;)V

    return-void
.end method

.method public final m([B)V
    .registers 2

    :try_start_0
    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_8

    return-void

    :catch_8
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lh9o;->s(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    return-void
.end method

.method public o(I)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public q()Ljava/util/List;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ly53;

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->l:Lx5f;

    sget-object p1, Lkh0;->b:Lkh0;

    invoke-virtual {p0, p1}, Lx5f;->d0(Lkh0;)V

    return-void
.end method

.method public s(I)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final t()Lf99;
    .registers 1

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lg77;

    iget-object p0, p0, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf99;

    return-object p0
.end method

.method public final v(Ltvh;)V
    .registers 2

    invoke-virtual {p0}, Lole;->b()V

    return-void
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 4

    new-instance p1, Lfc2;

    iget-object v0, p0, Lole;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/AssetManager;

    const/4 v1, 0x0

    invoke-direct {p1, v0, p0, v1}, Lfc2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final x(La12;Lesk;Lqca;Lnt5;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v3, p0

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    instance-of v2, v1, Lkx1;

    if-eqz v2, :cond_19

    move-object v2, v1

    check-cast v2, Lkx1;

    iget v4, v2, Lkx1;->I:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_19

    sub-int/2addr v4, v5

    iput v4, v2, Lkx1;->I:I

    goto :goto_1e

    :cond_19
    new-instance v2, Lkx1;

    invoke-direct {v2, v3, v1}, Lkx1;-><init>(Lole;Lnt5;)V

    :goto_1e
    iget-object v1, v2, Lkx1;->G:Ljava/lang/Object;

    sget-object v7, Lpx5;->a:Lpx5;

    iget v4, v2, Lkx1;->I:I

    const/4 v8, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v4, :cond_92

    if-eq v4, v9, :cond_83

    if-eq v4, v6, :cond_74

    if-eq v4, v5, :cond_46

    if-ne v4, v8, :cond_40

    iget-object v0, v2, Lkx1;->x:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    iget-object v0, v2, Lkx1;->w:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1fb

    :cond_40
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v10

    :cond_46
    iget-object v0, v2, Lkx1;->F:Ljava/util/Iterator;

    iget-object v4, v2, Lkx1;->E:Lehc;

    iget-object v6, v2, Lkx1;->D:Lehc;

    iget-object v9, v2, Lkx1;->C:Ljava/lang/Long;

    iget-object v11, v2, Lkx1;->B:Ljava/util/LinkedHashMap;

    iget-object v12, v2, Lkx1;->A:Lsfb;

    iget-object v13, v2, Lkx1;->z:Ljava/util/Iterator;

    iget-object v14, v2, Lkx1;->y:Ljava/util/LinkedHashMap;

    iget-object v15, v2, Lkx1;->x:Ljava/util/List;

    check-cast v15, Ljava/util/List;

    iget-object v5, v2, Lkx1;->w:Ljava/util/List;

    check-cast v5, Ljava/util/List;

    iget-object v5, v2, Lkx1;->v:Lwth;

    iget-object v10, v2, Lkx1;->u:Lqca;

    iget-object v8, v2, Lkx1;->t:Lesk;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v16, v9

    move-object v9, v5

    move-object/from16 v5, v16

    move-object/from16 v16, v15

    move-object v15, v11

    move-object v11, v14

    move-object v14, v10

    move-object v10, v13

    goto/16 :goto_19f

    :cond_74
    iget-object v0, v2, Lkx1;->w:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    iget-object v0, v2, Lkx1;->v:Lwth;

    iget-object v4, v2, Lkx1;->u:Lqca;

    iget-object v5, v2, Lkx1;->t:Lesk;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_f7

    :cond_83
    iget-object v0, v2, Lkx1;->v:Lwth;

    iget-object v4, v2, Lkx1;->u:Lqca;

    iget-object v5, v2, Lkx1;->t:Lesk;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v19, v5

    move-object v5, v4

    move-object/from16 v4, v19

    goto :goto_ca

    :cond_92
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v1, Lwth;

    const/16 v4, 0xa

    invoke-direct {v1, v0, v4}, Lwth;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v4, p2

    iput-object v4, v2, Lkx1;->t:Lesk;

    move-object/from16 v5, p3

    iput-object v5, v2, Lkx1;->u:Lqca;

    iput-object v1, v2, Lkx1;->v:Lwth;

    iput v9, v2, Lkx1;->I:I

    new-instance v8, Lbhi;

    invoke-static {v2}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v10

    invoke-direct {v8, v10}, Lbhi;-><init>(Lmt5;)V

    new-instance v10, Llx1;

    invoke-direct {v10, v8, v9}, Llx1;-><init>(Lbhi;B)V

    new-instance v9, Lra;

    const/4 v11, 0x4

    invoke-direct {v9, v10, v11}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {v0, v9}, Ld12;->c(Lra;)V

    invoke-virtual {v8}, Lbhi;->a()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v7, :cond_1fa

    move-object/from16 v19, v1

    move-object v1, v0

    move-object/from16 v0, v19

    :goto_ca
    check-cast v1, Ljava/util/List;

    iput-object v4, v2, Lkx1;->t:Lesk;

    iput-object v5, v2, Lkx1;->u:Lqca;

    iput-object v0, v2, Lkx1;->v:Lwth;

    move-object v8, v1

    check-cast v8, Ljava/util/List;

    iput-object v8, v2, Lkx1;->w:Ljava/util/List;

    iput v6, v2, Lkx1;->I:I

    new-instance v8, Lbhi;

    invoke-static {v2}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v9

    invoke-direct {v8, v9}, Lbhi;-><init>(Lmt5;)V

    check-cast v1, Ljava/util/Collection;

    new-instance v9, Llx1;

    invoke-direct {v9, v8, v6}, Llx1;-><init>(Lbhi;B)V

    invoke-virtual {v0, v1, v9}, Lwth;->A(Ljava/util/Collection;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v8}, Lbhi;->a()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v7, :cond_1fa

    move-object/from16 v19, v5

    move-object v5, v4

    move-object/from16 v4, v19

    :goto_f7
    check-cast v1, Ljava/util/List;

    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v8, v1

    check-cast v8, Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move-object/from16 v19, v2

    move-object v2, v1

    move-object v1, v5

    move-object v5, v4

    move-object v4, v6

    move-object v6, v8

    move-object/from16 v8, v19

    :cond_10e
    :goto_10e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1c2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lsfb;

    if-eqz v9, :cond_10e

    iget-wide v10, v9, Lsfb;->a:J

    new-instance v12, Ljava/lang/Long;

    invoke-direct {v12, v10, v11}, Ljava/lang/Long;-><init>(J)V

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v10

    iget-object v11, v9, Lsfb;->h:Ljava/util/ArrayList;

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move-object/from16 v16, v2

    move-object v15, v4

    move-object v14, v5

    move-object v2, v8

    move-object v5, v12

    move-object v8, v0

    move-object v4, v10

    move-object v0, v11

    move-object v11, v15

    move-object v10, v6

    move-object v6, v4

    :goto_139
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1aa

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Number;

    invoke-virtual {v12}, Ljava/lang/Number;->longValue()J

    move-result-wide v12

    iput-object v1, v2, Lkx1;->t:Lesk;

    iput-object v14, v2, Lkx1;->u:Lqca;

    iput-object v8, v2, Lkx1;->v:Lwth;

    move-object/from16 p1, v1

    const/4 v1, 0x0

    iput-object v1, v2, Lkx1;->w:Ljava/util/List;

    move-object/from16 v1, v16

    check-cast v1, Ljava/util/List;

    iput-object v1, v2, Lkx1;->x:Ljava/util/List;

    iput-object v11, v2, Lkx1;->y:Ljava/util/LinkedHashMap;

    iput-object v10, v2, Lkx1;->z:Ljava/util/Iterator;

    iput-object v9, v2, Lkx1;->A:Lsfb;

    iput-object v15, v2, Lkx1;->B:Ljava/util/LinkedHashMap;

    iput-object v5, v2, Lkx1;->C:Ljava/lang/Long;

    iput-object v6, v2, Lkx1;->D:Lehc;

    iput-object v4, v2, Lkx1;->E:Lehc;

    iput-object v0, v2, Lkx1;->F:Ljava/util/Iterator;

    const/4 v1, 0x3

    iput v1, v2, Lkx1;->I:I

    new-instance v1, Lbhi;

    move-object/from16 p2, v0

    invoke-static {v2}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v0

    invoke-direct {v1, v0}, Lbhi;-><init>(Lmt5;)V

    move-object v0, v9

    move-object/from16 p3, v10

    iget-wide v9, v0, Lsfb;->a:J

    move-object/from16 v17, v11

    move-wide v11, v12

    new-instance v13, Llx1;

    move-object/from16 v18, v0

    const/4 v0, 0x0

    invoke-direct {v13, v1, v0}, Llx1;-><init>(Lbhi;B)V

    move-object/from16 v0, p3

    invoke-virtual/range {v8 .. v13}, Lwth;->z(JJLkotlin/jvm/functions/Function1;)V

    invoke-virtual {v1}, Lbhi;->a()Ljava/lang/Object;

    move-result-object v1

    sget-object v9, Lpx5;->a:Lpx5;

    if-eq v1, v7, :cond_1fa

    move-object v10, v0

    move-object v9, v8

    move-object/from16 v11, v17

    move-object/from16 v12, v18

    move-object/from16 v8, p1

    move-object/from16 v0, p2

    :goto_19f
    check-cast v1, Ltfb;

    if-eqz v1, :cond_1a6

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1a6
    move-object v1, v8

    move-object v8, v9

    move-object v9, v12

    goto :goto_139

    :cond_1aa
    move-object/from16 p1, v1

    move-object v0, v10

    move-object/from16 v17, v11

    invoke-static {v6}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v1

    invoke-interface {v15, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, p1

    move-object v6, v0

    move-object v0, v8

    move-object v5, v14

    move-object/from16 v4, v17

    move-object v8, v2

    move-object/from16 v2, v16

    goto/16 :goto_10e

    :cond_1c2
    move-object v0, v2

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1fb

    iget-object v0, v3, Lole;->a:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ljg8;

    new-instance v0, Lmx1;

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lmx1;-><init>(Lesk;Ljava/util/List;Lole;Ljava/util/LinkedHashMap;Lqca;Lmt5;)V

    const/4 v1, 0x0

    iput-object v1, v8, Lkx1;->t:Lesk;

    iput-object v1, v8, Lkx1;->u:Lqca;

    iput-object v1, v8, Lkx1;->v:Lwth;

    iput-object v1, v8, Lkx1;->w:Ljava/util/List;

    iput-object v1, v8, Lkx1;->x:Ljava/util/List;

    iput-object v1, v8, Lkx1;->y:Ljava/util/LinkedHashMap;

    iput-object v1, v8, Lkx1;->z:Ljava/util/Iterator;

    iput-object v1, v8, Lkx1;->A:Lsfb;

    iput-object v1, v8, Lkx1;->B:Ljava/util/LinkedHashMap;

    iput-object v1, v8, Lkx1;->C:Ljava/lang/Long;

    iput-object v1, v8, Lkx1;->D:Lehc;

    iput-object v1, v8, Lkx1;->E:Lehc;

    iput-object v1, v8, Lkx1;->F:Ljava/util/Iterator;

    const/4 v11, 0x4

    iput v11, v8, Lkx1;->I:I

    invoke-static {v9, v0, v8}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v7, :cond_1fb

    :cond_1fa
    return-object v7

    :cond_1fb
    :goto_1fb
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method

.method public final y(Lvi2;)V
    .registers 5

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lpj2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_47

    iget v0, p1, Lvi2;->c:I

    iget-object v1, p1, Lvi2;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const/4 v2, -0x1

    if-eq v0, v2, :cond_3a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lpj2;->G0(Z)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_28
    const v0, 0x7f14120f

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_3a
    iget-object v0, p1, Lvi2;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_47

    iget-object p0, p0, Lpj2;->y:Ldb;

    invoke-static {p0, p1}, Ljpo;->Q(Ldb;Lvi2;)V

    :cond_47
    return-void
.end method

.method public final z(Lnc3;)V
    .registers 8

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Ltn;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z

    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    new-instance v1, Ljava/util/ArrayList;

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v2, 0x0

    move v3, v2

    :cond_18
    :goto_18
    if-ge v3, p0, :cond_33

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lhc3;

    iput-object p1, v4, Lhc3;->c:Lnc3;

    iput-boolean v0, v4, Lhc3;->d:Z

    iget-object v5, v4, Lhc3;->b:Ln61;

    if-eqz v5, :cond_18

    invoke-virtual {v5, p1}, Ln61;->c(Lnc3;)V

    const/4 v5, 0x0

    iput-object v5, v4, Lhc3;->b:Ln61;

    iput-boolean v2, v4, Lhc3;->d:Z

    goto :goto_18

    :cond_33
    return-void
.end method
