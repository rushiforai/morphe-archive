.class public final Lqji;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Loji;

.field public final c:Lh7f;

.field public final d:Lb59;

.field public e:Landroid/print/PrintAttributes;

.field public f:Landroid/print/PrintAttributes;

.field public g:Landroid/os/CancellationSignal;

.field public h:Llji;

.field public i:Lmji;

.field public j:Landroid/print/PrintDocumentAdapter;

.field public k:Lpji;

.field public l:B

.field public m:Ljava/lang/String;

.field public n:Z

.field public o:J

.field public p:[Landroid/print/PageRange;


# direct methods
.method public constructor <init>(Ldx3;Lumi;Lb2l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Loji;

    invoke-direct {v0, p0}, Loji;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqji;->b:Loji;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lqji;->c:Lh7f;

    check-cast p3, Ld7l;

    iget-object v0, p3, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lqji;->a:Landroid/net/Uri;

    const/4 v0, 0x0

    iput-byte v0, p0, Lqji;->l:B

    invoke-virtual {p3}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-virtual {p3}, Ld7l;->k0()Ljava/lang/String;

    move-result-object v1

    :cond_30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_3d

    const p3, 0x7f140d4a

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_3d
    iput-object v1, p0, Lqji;->m:Ljava/lang/String;

    const-string p3, "save_to_pdf"

    new-array v0, v0, [Lbg1;

    invoke-static {p1, p2, p3, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lqji;->d:Lb59;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lqji;->i:Lmji;

    iput-object v0, p0, Lqji;->h:Llji;

    iput-object v0, p0, Lqji;->f:Landroid/print/PrintAttributes;

    iget-object v1, p0, Lqji;->g:Landroid/os/CancellationSignal;

    if-eqz v1, :cond_10

    invoke-virtual {v1}, Landroid/os/CancellationSignal;->cancel()V

    iput-object v0, p0, Lqji;->g:Landroid/os/CancellationSignal;

    :cond_10
    iget-object v1, p0, Lqji;->j:Landroid/print/PrintDocumentAdapter;

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Landroid/print/PrintDocumentAdapter;->onFinish()V

    iput-object v0, p0, Lqji;->j:Landroid/print/PrintDocumentAdapter;

    :cond_19
    iget-object v1, p0, Lqji;->k:Lpji;

    if-nez v1, :cond_1e

    return-void

    :cond_1e
    iput-object v0, p0, Lqji;->k:Lpji;

    invoke-interface {v1}, Lpji;->T()V

    return-void
.end method

.method public final b()V
    .registers 2

    invoke-virtual {p0}, Lqji;->a()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lqji;->f(I)V

    iget-object p0, p0, Lqji;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_d
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnji;

    invoke-virtual {v0}, Lnji;->a()V

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public final c()Landroid/print/PrintAttributes;
    .registers 12

    iget-object v0, p0, Lqji;->e:Landroid/print/PrintAttributes;

    if-nez v0, :cond_f8

    iget-object v0, p0, Lqji;->d:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "media_size"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x12c

    const-string v4, "PDF resolution"

    const/4 v5, 0x0

    if-eqz v1, :cond_83

    sget-object v6, Lhrd;->a:[Landroid/print/PrintAttributes$MediaSize;

    array-length v7, v6

    move v8, v5

    :goto_1e
    if-ge v8, v7, :cond_2f

    aget-object v9, v6, v8

    invoke-virtual {v9}, Landroid/print/PrintAttributes$MediaSize;->getId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_30

    add-int/lit8 v8, v8, 0x1

    goto :goto_1e

    :cond_2f
    move-object v9, v2

    :cond_30
    if-eqz v9, :cond_83

    const-string v1, "media_portrait"

    const/4 v6, 0x1

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-virtual {v9}, Landroid/print/PrintAttributes$MediaSize;->asPortrait()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v1

    goto :goto_44

    :cond_40
    invoke-virtual {v9}, Landroid/print/PrintAttributes$MediaSize;->asLandscape()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v1

    :goto_44
    sget-object v6, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    if-eq v1, v6, :cond_83

    sget-object v6, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    if-eq v1, v6, :cond_83

    new-instance v2, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v2}, Landroid/print/PrintAttributes$Builder;-><init>()V

    invoke-virtual {v2, v1}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    move-result-object v1

    new-instance v2, Landroid/print/PrintAttributes$Resolution;

    invoke-direct {v2, v4, v4, v3, v3}, Landroid/print/PrintAttributes$Resolution;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v1, v2}, Landroid/print/PrintAttributes$Builder;->setResolution(Landroid/print/PrintAttributes$Resolution;)Landroid/print/PrintAttributes$Builder;

    move-result-object v1

    new-instance v2, Landroid/print/PrintAttributes$Margins;

    const-string v6, "margin_left"

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "margin_top"

    invoke-interface {v0, v7, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    const-string v8, "margin_right"

    invoke-interface {v0, v8, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    const-string v9, "margin_bottom"

    invoke-interface {v0, v9, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {v2, v6, v7, v8, v0}, Landroid/print/PrintAttributes$Margins;-><init>(IIII)V

    invoke-virtual {v1, v2}, Landroid/print/PrintAttributes$Builder;->setMinMargins(Landroid/print/PrintAttributes$Margins;)Landroid/print/PrintAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v2

    :cond_83
    iput-object v2, p0, Lqji;->e:Landroid/print/PrintAttributes;

    if-nez v2, :cond_f7

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lsfe;->b0(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "ja"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bf

    const-string v0, "jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bf

    const-string v0, "us"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bc

    const-string v0, "ca"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bc

    sget-object v0, Landroid/print/PrintAttributes$MediaSize;->ISO_A4:Landroid/print/PrintAttributes$MediaSize;

    goto :goto_c1

    :cond_bc
    sget-object v0, Landroid/print/PrintAttributes$MediaSize;->NA_LETTER:Landroid/print/PrintAttributes$MediaSize;

    goto :goto_c1

    :cond_bf
    sget-object v0, Landroid/print/PrintAttributes$MediaSize;->JIS_B5:Landroid/print/PrintAttributes$MediaSize;

    :goto_c1
    new-instance v1, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v1}, Landroid/print/PrintAttributes$Builder;-><init>()V

    invoke-virtual {v1, v0}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    move-result-object v1

    new-instance v2, Landroid/print/PrintAttributes$Resolution;

    invoke-direct {v2, v4, v4, v3, v3}, Landroid/print/PrintAttributes$Resolution;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v1, v2}, Landroid/print/PrintAttributes$Builder;->setResolution(Landroid/print/PrintAttributes$Resolution;)Landroid/print/PrintAttributes$Builder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    move-result v2

    const/16 v3, 0x18a

    const/16 v4, 0x3e8

    if-ge v2, v4, :cond_df

    move v2, v5

    goto :goto_e0

    :cond_df
    move v2, v3

    :goto_e0
    invoke-virtual {v0}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    move-result v0

    if-lt v0, v4, :cond_e7

    move v5, v3

    :cond_e7
    new-instance v0, Landroid/print/PrintAttributes$Margins;

    invoke-direct {v0, v2, v5, v2, v5}, Landroid/print/PrintAttributes$Margins;-><init>(IIII)V

    invoke-virtual {v1, v0}, Landroid/print/PrintAttributes$Builder;->setMinMargins(Landroid/print/PrintAttributes$Margins;)Landroid/print/PrintAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v0

    iput-object v0, p0, Lqji;->e:Landroid/print/PrintAttributes;

    return-object v0

    :cond_f7
    return-object v2

    :cond_f8
    return-object v0
.end method

.method public final d(Ljava/lang/CharSequence;)V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Lqji;->i:Lmji;

    iget-boolean v1, p0, Lqji;->n:Z

    if-eqz v1, :cond_10

    const/4 p1, 0x0

    iput-boolean p1, p0, Lqji;->n:Z

    iget-object p1, p0, Lqji;->e:Landroid/print/PrintAttributes;

    invoke-virtual {p0, p1}, Lqji;->g(Landroid/print/PrintAttributes;)V

    return-void

    :cond_10
    iget-object v1, p0, Lqji;->k:Lpji;

    iput-object v0, p0, Lqji;->k:Lpji;

    if-eqz p1, :cond_2c

    iget-object p1, p0, Lqji;->c:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_1c
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnji;

    invoke-virtual {v0}, Lnji;->b()V

    goto :goto_1c

    :cond_2c
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lqji;->f(I)V

    if-eqz v1, :cond_35

    invoke-interface {v1}, Lpji;->T()V

    :cond_35
    return-void
.end method

.method public final e(Lnji;)V
    .registers 2

    iget-object p0, p0, Lqji;->c:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final f(I)V
    .registers 3

    iget-byte v0, p0, Lqji;->l:B

    if-eq v0, p1, :cond_1c

    iput-byte p1, p0, Lqji;->l:B

    iget-object p0, p0, Lqji;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnji;

    invoke-virtual {v0, p1}, Lnji;->c(I)V

    goto :goto_c

    :cond_1c
    return-void
.end method

.method public final g(Landroid/print/PrintAttributes;)V
    .registers 9

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lqji;->f(I)V

    new-instance v5, Llji;

    invoke-direct {v5, p0, p1}, Llji;-><init>(Lqji;Landroid/print/PrintAttributes;)V

    iput-object v5, p0, Lqji;->h:Llji;

    iget-object v1, p0, Lqji;->j:Landroid/print/PrintDocumentAdapter;

    iget-object v0, p0, Lqji;->f:Landroid/print/PrintAttributes;

    if-eqz v0, :cond_13

    move-object v2, v0

    goto :goto_14

    :cond_13
    move-object v2, p1

    :goto_14
    iget-object v4, p0, Lqji;->g:Landroid/os/CancellationSignal;

    const/4 v6, 0x0

    move-object v3, p1

    invoke-virtual/range {v1 .. v6}, Landroid/print/PrintDocumentAdapter;->onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V

    return-void
.end method

.method public final h(Landroid/os/ParcelFileDescriptor;[Landroid/print/PageRange;Lpji;)V
    .registers 6

    iget-byte v0, p0, Lqji;->l:B

    const/4 v1, 0x2

    if-eq v0, v1, :cond_9

    invoke-interface {p3}, Lpji;->T()V

    return-void

    :cond_9
    iput-object p3, p0, Lqji;->k:Lpji;

    const/4 p3, 0x3

    invoke-virtual {p0, p3}, Lqji;->f(I)V

    new-instance p3, Lmji;

    invoke-direct {p3, p0, p1}, Lmji;-><init>(Lqji;Landroid/os/ParcelFileDescriptor;)V

    iput-object p3, p0, Lqji;->i:Lmji;

    iget-object v0, p0, Lqji;->j:Landroid/print/PrintDocumentAdapter;

    iget-object p0, p0, Lqji;->g:Landroid/os/CancellationSignal;

    invoke-virtual {v0, p2, p1, p0, p3}, Landroid/print/PrintDocumentAdapter;->onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V

    return-void
.end method
