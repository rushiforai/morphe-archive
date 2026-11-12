.class public final Lfyg;
.super Landroid/print/PrintDocumentAdapter;
.source "SourceFile"


# instance fields
.field public final a:Ljyg;


# direct methods
.method public constructor <init>(Ljyg;)V
    .registers 2

    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter;-><init>()V

    iput-object p1, p0, Lfyg;->a:Ljyg;

    return-void
.end method


# virtual methods
.method public final onFinish()V
    .registers 2

    invoke-super {p0}, Landroid/print/PrintDocumentAdapter;->onFinish()V

    const/4 v0, 0x0

    iget-object p0, p0, Lfyg;->a:Ljyg;

    iput-object v0, p0, Ljyg;->i:Llld;

    invoke-virtual {p0}, Ljyg;->b()V

    return-void
.end method

.method public final onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
    .registers 6

    new-instance p1, Li4d;

    const/16 p3, 0x12

    invoke-direct {p1, p4, p3}, Li4d;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p1, Li4d;->b:Ljava/lang/Object;

    check-cast p1, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    iget-object p0, p0, Lfyg;->a:Ljyg;

    iget-object p3, p0, Ljyg;->a:Ljava/lang/String;

    iget-boolean p4, p0, Ljyg;->p:Z

    if-eqz p4, :cond_17

    invoke-virtual {p1, p3}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFailed(Ljava/lang/CharSequence;)V

    goto :goto_58

    :cond_17
    invoke-virtual {p2}, Landroid/print/PrintAttributes;->getResolution()Landroid/print/PrintAttributes$Resolution;

    move-result-object p4

    invoke-virtual {p4}, Landroid/print/PrintAttributes$Resolution;->getHorizontalDpi()I

    move-result p4

    iput p4, p0, Ljyg;->e:I

    invoke-virtual {p2}, Landroid/print/PrintAttributes;->getMediaSize()Landroid/print/PrintAttributes$MediaSize;

    move-result-object p4

    iput-object p4, p0, Ljyg;->f:Landroid/print/PrintAttributes$MediaSize;

    iget-boolean p4, p0, Ljyg;->m:Z

    if-eqz p4, :cond_30

    invoke-virtual {p2}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    move-result-object p2

    goto :goto_31

    :cond_30
    const/4 p2, 0x0

    :goto_31
    iput-object p2, p0, Ljyg;->g:Landroid/print/PrintAttributes$Margins;

    iget-byte p2, p0, Ljyg;->k:B

    const/4 p4, 0x1

    if-ne p2, p4, :cond_3c

    invoke-virtual {p1, p3}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFailed(Ljava/lang/CharSequence;)V

    goto :goto_58

    :cond_3c
    iget-object p0, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    invoke-interface {p0}, Lorg/chromium/printing/Printable;->getTitle()Ljava/lang/String;

    move-result-object p0

    new-instance p2, Landroid/print/PrintDocumentInfo$Builder;

    invoke-direct {p2, p0}, Landroid/print/PrintDocumentInfo$Builder;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Landroid/print/PrintDocumentInfo$Builder;->setContentType(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object p0

    const/4 p2, -0x1

    invoke-virtual {p0, p2}, Landroid/print/PrintDocumentInfo$Builder;->setPageCount(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/print/PrintDocumentInfo$Builder;->build()Landroid/print/PrintDocumentInfo;

    move-result-object p0

    invoke-virtual {p1, p0, p4}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V

    :goto_58
    return-void
.end method

.method public final onStart()V
    .registers 3

    iget-object p0, p0, Lfyg;->a:Ljyg;

    iget-boolean v0, p0, Ljyg;->p:Z

    if-nez v0, :cond_23

    const/4 v0, 0x0

    iput-byte v0, p0, Ljyg;->k:B

    iget-boolean v1, p0, Ljyg;->n:Z

    if-nez v1, :cond_23

    iget-object v1, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    if-eqz v1, :cond_23

    invoke-interface {v1}, Lorg/chromium/printing/Printable;->b()Z

    move-result v1

    if-eqz v1, :cond_23

    iget-object v1, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-boolean v0, p0, Ljyg;->n:Z

    :cond_23
    return-void
.end method

.method public final onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .registers 12

    new-instance p3, Llld;

    const/16 v0, 0xe

    invoke-direct {p3, p4, v0}, Llld;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lfyg;->a:Ljyg;

    iget-object p4, p0, Ljyg;->a:Ljava/lang/String;

    const-string v0, "ParcelFileDescriptor.dup() failed: "

    iget-boolean v1, p0, Ljyg;->p:Z

    if-eqz v1, :cond_19

    invoke-virtual {p3, p4}, Llld;->k0(Ljava/lang/CharSequence;)V

    :try_start_14
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_17} :catch_bd

    goto/16 :goto_bd

    :cond_19
    const/4 v1, 0x0

    if-eqz p1, :cond_b7

    array-length v2, p1

    if-eqz v2, :cond_b7

    iput-object p3, p0, Ljyg;->i:Llld;

    :try_start_21
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->dup()Landroid/os/ParcelFileDescriptor;

    move-result-object p3

    iput-object p3, p0, Ljyg;->d:Landroid/os/ParcelFileDescriptor;
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_27} :catch_96
    .catchall {:try_start_21 .. :try_end_27} :catchall_b2

    :try_start_27
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_2a

    :catch_2a
    array-length p2, p1

    const/4 p3, 0x1

    const/4 v0, 0x0

    if-ne p2, p3, :cond_3b

    aget-object p2, p1, v0

    sget-object v2, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    invoke-virtual {p2, v2}, Landroid/print/PageRange;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3b

    move-object v2, v1

    goto :goto_78

    :cond_3b
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    array-length v2, p1

    move v3, v0

    :goto_42
    if-ge v3, v2, :cond_5d

    aget-object v4, p1, v3

    invoke-virtual {v4}, Landroid/print/PageRange;->getStart()I

    move-result v5

    :goto_4a
    invoke-virtual {v4}, Landroid/print/PageRange;->getEnd()I

    move-result v6

    if-gt v5, v6, :cond_5a

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_4a

    :cond_5a
    add-int/lit8 v3, v3, 0x1

    goto :goto_42

    :cond_5d
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array v2, p1, [I

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_67
    if-ge v0, p1, :cond_78

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_67

    :cond_78
    :goto_78
    iput-object v2, p0, Ljyg;->h:[I

    iget-object p1, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    if-eqz p1, :cond_8b

    iget p2, p0, Ljyg;->b:I

    iget v0, p0, Ljyg;->c:I

    invoke-interface {p1, p2, v0}, Lorg/chromium/printing/Printable;->j(II)Z

    move-result p1

    if-eqz p1, :cond_8b

    iput-byte p3, p0, Ljyg;->k:B

    goto :goto_bd

    :cond_8b
    invoke-virtual {p0}, Ljyg;->a()V

    iget-object p1, p0, Ljyg;->i:Llld;

    invoke-virtual {p1, p4}, Llld;->k0(Ljava/lang/CharSequence;)V

    iput-object v1, p0, Ljyg;->i:Llld;

    goto :goto_bd

    :catch_96
    move-exception p1

    :try_start_97
    iget-object p3, p0, Ljyg;->i:Llld;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Llld;->k0(Ljava/lang/CharSequence;)V

    iput-object v1, p0, Ljyg;->i:Llld;
    :try_end_ae
    .catchall {:try_start_97 .. :try_end_ae} :catchall_b2

    :try_start_ae
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b1} :catch_bd

    goto :goto_bd

    :catchall_b2
    move-exception p0

    :try_start_b3
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_b6
    .catch Ljava/io/IOException; {:try_start_b3 .. :try_end_b6} :catch_b6

    :catch_b6
    throw p0

    :cond_b7
    invoke-virtual {p3, v1}, Llld;->k0(Ljava/lang/CharSequence;)V

    :try_start_ba
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_bd
    .catch Ljava/io/IOException; {:try_start_ba .. :try_end_bd} :catch_bd

    :catch_bd
    :goto_bd
    return-void
.end method
