.class public final Lorg/chromium/printing/PrintingContext;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llyg;

.field public final b:J


# direct methods
.method public constructor <init>(JLorg/chromium/ui/base/WindowAndroid;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p3}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object p3

    iput-object p3, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iput-wide p1, p0, Lorg/chromium/printing/PrintingContext;->b:J

    return-void
.end method

.method public static create(JLorg/chromium/ui/base/WindowAndroid;)Lorg/chromium/printing/PrintingContext;
    .registers 4

    new-instance v0, Lorg/chromium/printing/PrintingContext;

    invoke-direct {v0, p0, p1, p2}, Lorg/chromium/printing/PrintingContext;-><init>(JLorg/chromium/ui/base/WindowAndroid;)V

    return-object v0
.end method

.method public static pdfWritingDone(ILorg/chromium/ui/base/WindowAndroid;)V
    .registers 8

    invoke-static {p1}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object p1

    iget-object p1, p1, Llyg;->b:Ljyg;

    if-eqz p1, :cond_53

    iget-boolean v0, p1, Ljyg;->p:Z

    if-nez v0, :cond_53

    iget-byte v0, p1, Ljyg;->k:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_53

    const/4 v0, 0x0

    iput-byte v0, p1, Ljyg;->k:B

    invoke-virtual {p1}, Ljyg;->a()V

    const/4 v2, 0x0

    if-lez p0, :cond_4a

    iget-object v3, p1, Ljyg;->h:[I

    if-eqz v3, :cond_33

    array-length v1, v3

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    new-array v1, p0, [Landroid/print/PageRange;

    :goto_25
    if-ge v0, p0, :cond_3e

    aget v4, v3, v0

    new-instance v5, Landroid/print/PageRange;

    invoke-direct {v5, v4, v4}, Landroid/print/PageRange;-><init>(II)V

    aput-object v5, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    :cond_33
    new-array v3, v1, [Landroid/print/PageRange;

    new-instance v4, Landroid/print/PageRange;

    sub-int/2addr p0, v1

    invoke-direct {v4, v0, p0}, Landroid/print/PageRange;-><init>(II)V

    aput-object v4, v3, v0

    move-object v1, v3

    :cond_3e
    iget-object p0, p1, Ljyg;->i:Llld;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Landroid/print/PrintDocumentAdapter$WriteResultCallback;

    invoke-virtual {p0, v1}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFinished([Landroid/print/PageRange;)V

    iput-object v2, p1, Ljyg;->i:Llld;

    return-void

    :cond_4a
    iget-object p0, p1, Ljyg;->i:Llld;

    iget-object v0, p1, Ljyg;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Llld;->k0(Ljava/lang/CharSequence;)V

    iput-object v2, p1, Ljyg;->i:Llld;

    :cond_53
    return-void
.end method

.method public static setPendingPrint(Lorg/chromium/ui/base/WindowAndroid;Lorg/chromium/printing/Printable;II)V
    .registers 6

    invoke-virtual {p0}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_24

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_24

    invoke-static {p0}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object p0

    new-instance v1, Lz8b;

    invoke-direct {v1, v0}, Lz8b;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, p1, v1, p2, p3}, Llyg;->f(Lorg/chromium/printing/Printable;Liyg;II)V

    :cond_24
    return-void
.end method


# virtual methods
.method public final askUserForSettings(I)V
    .registers 4

    iget-object p1, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p1, p1, Llyg;->b:Ljyg;

    const/4 v0, 0x1

    if-eqz p1, :cond_e

    iget-byte p1, p1, Ljyg;->k:B

    const/4 v1, 0x2

    if-ne p1, v1, :cond_e

    move p1, v0

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    xor-int/2addr p1, v0

    iget-wide v0, p0, Lorg/chromium/printing/PrintingContext;->b:J

    invoke-static {v0, v1, p1}, LJ/N;->M8HtOhJl(JZ)V

    return-void
.end method

.method public final getBottomMargin()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljyg;->g:Landroid/print/PrintAttributes$Margins;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/print/PrintAttributes$Margins;->getBottomMils()I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final getDpi()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_9

    iget p0, p0, Ljyg;->e:I

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final getHeight()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljyg;->f:Landroid/print/PrintAttributes$MediaSize;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final getLeftMargin()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljyg;->g:Landroid/print/PrintAttributes$Margins;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/print/PrintAttributes$Margins;->getLeftMils()I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final getPages()[I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_11

    iget-object p0, p0, Ljyg;->h:[I

    if-eqz p0, :cond_11

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getRightMargin()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljyg;->g:Landroid/print/PrintAttributes$Margins;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/print/PrintAttributes$Margins;->getRightMils()I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final getTopMargin()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljyg;->g:Landroid/print/PrintAttributes$Margins;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/print/PrintAttributes$Margins;->getTopMils()I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final getWidth()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljyg;->f:Landroid/print/PrintAttributes$MediaSize;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final showPrintDialog()V
    .registers 5

    iget-object v0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    invoke-virtual {v0}, Llyg;->d()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-wide v0, p0, Lorg/chromium/printing/PrintingContext;->b:J

    invoke-static {v0, v1}, LJ/N;->Mmq2M8tt(J)V

    return-void

    :cond_e
    new-instance v1, Lpjg;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_21

    iget-byte v2, p0, Ljyg;->k:B

    const/4 v3, 0x2

    if-eq v2, v3, :cond_21

    iput-object v1, p0, Ljyg;->l:Lpjg;

    goto :goto_23

    :cond_21
    iput-object v1, v0, Llyg;->c:Lpjg;

    :goto_23
    invoke-virtual {v0}, Llyg;->g()V

    return-void
.end method

.method public final takeDuplicatedFileDescriptor()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_9

    iget-object p0, p0, Ljyg;->d:Landroid/os/ParcelFileDescriptor;

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    if-eqz p0, :cond_15

    :try_start_c
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->dup()Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result p0
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_14} :catch_15

    return p0

    :catch_15
    :cond_15
    const/4 p0, -0x1

    return p0
.end method

.method public final useCustomMargins()Z
    .registers 1

    iget-object p0, p0, Lorg/chromium/printing/PrintingContext;->a:Llyg;

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_c

    iget-object p0, p0, Ljyg;->g:Landroid/print/PrintAttributes$Margins;

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
