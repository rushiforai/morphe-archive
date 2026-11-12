.class public final synthetic Lbf1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Leek;Landroid/widget/FrameLayout;JLc9l;Ldf1;)V
    .registers 8

    .line 18
    const/4 v0, 0x0

    iput-byte v0, p0, Lbf1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbf1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lbf1;->d:Ljava/lang/Object;

    iput-wide p3, p0, Lbf1;->b:J

    iput-object p5, p0, Lbf1;->e:Ljava/lang/Object;

    iput-object p6, p0, Lbf1;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Llg4;Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lbf1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbf1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lbf1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lbf1;->e:Ljava/lang/Object;

    iput-object p4, p0, Lbf1;->f:Ljava/lang/Object;

    iput-wide p5, p0, Lbf1;->b:J

    return-void
.end method

.method public synthetic constructor <init>(Lwyd;JLandroid/net/Uri;Lrn9;Ljava/lang/String;)V
    .registers 8

    .line 17
    const/4 v0, 0x2

    iput-byte v0, p0, Lbf1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbf1;->c:Ljava/lang/Object;

    iput-wide p2, p0, Lbf1;->b:J

    iput-object p4, p0, Lbf1;->d:Ljava/lang/Object;

    iput-object p5, p0, Lbf1;->e:Ljava/lang/Object;

    iput-object p6, p0, Lbf1;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 16

    iget-byte v0, p0, Lbf1;->a:B

    iget-object v1, p0, Lbf1;->f:Ljava/lang/Object;

    iget-object v2, p0, Lbf1;->e:Ljava/lang/Object;

    iget-object v3, p0, Lbf1;->d:Ljava/lang/Object;

    iget-object v4, p0, Lbf1;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_184

    move-object v6, v4

    check-cast v6, Lwyd;

    move-object v9, v3

    check-cast v9, Landroid/net/Uri;

    check-cast v2, Lrn9;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v6, Lwyd;->a:Landroid/content/Context;

    iget-boolean v3, v2, Lrn9;->b:Z

    iget-object v4, v2, Lrn9;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v2, v2, Lrn9;->c:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    const/4 v5, 0x0

    const-string v7, "file"

    const/4 v8, 0x1

    const/4 v10, 0x0

    if-eqz v3, :cond_7e

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_52

    new-instance v1, Ljava/io/File;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Lvyd;

    invoke-direct {v2, v4}, Lvyd;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_a9

    array-length v2, v1

    if-ne v2, v8, :cond_a9

    aget-object v1, v1, v10

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    goto :goto_a9

    :cond_52
    invoke-static {v0, v2}, Ldd7;->f(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v1

    invoke-virtual {v1}, Lrlj;->l()[Ldd7;

    move-result-object v1

    array-length v2, v1

    move-object v12, v5

    move v11, v10

    :goto_5d
    if-ge v11, v2, :cond_71

    aget-object v13, v1, v11

    invoke-virtual {v13}, Ldd7;->g()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6e

    if-nez v12, :cond_a9

    move-object v12, v13

    :cond_6e
    add-int/lit8 v11, v11, 0x1

    goto :goto_5d

    :cond_71
    if-eqz v12, :cond_a9

    invoke-virtual {v12}, Ldd7;->a()Z

    move-result v1

    if-eqz v1, :cond_a9

    invoke-virtual {v12}, Ldd7;->i()Landroid/net/Uri;

    move-result-object v5

    goto :goto_a9

    :cond_7e
    invoke-static {v0, v2, v4}, Llg7;->d(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_99

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    goto :goto_a9

    :cond_99
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    invoke-static {v2}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v2, v12}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    :try_start_a5
    invoke-static {v11, v2, v1, v4}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5
    :try_end_a9
    .catch Ljava/lang/Exception; {:try_start_a5 .. :try_end_a9} :catch_a9

    :catch_a9
    :cond_a9
    :goto_a9
    if-eqz v5, :cond_12b

    if-eqz v3, :cond_b5

    new-instance v0, Llq3;

    invoke-direct {v0, v5, v8}, Llq3;-><init>(Landroid/net/Uri;I)V

    :goto_b2
    move-object v10, v0

    goto/16 :goto_133

    :cond_b5
    invoke-virtual {v9}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_11e

    invoke-virtual {v9}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ec

    new-instance v0, Ljava/io/File;

    invoke-virtual {v9}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_11e

    new-instance v0, Llq3;

    invoke-direct {v0, v5, v8}, Llq3;-><init>(Landroid/net/Uri;I)V

    goto :goto_b2

    :cond_ec
    invoke-static {v9}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v5}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    :try_start_fc
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {v4, v9, v1, v3}, Landroid/provider/DocumentsContract;->moveDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_10d

    new-instance v4, Llq3;

    invoke-direct {v4, v1, v8}, Llq3;-><init>(Landroid/net/Uri;I)V
    :try_end_10b
    .catch Ljava/lang/Exception; {:try_start_fc .. :try_end_10b} :catch_10d

    move-object v0, v4

    goto :goto_b2

    :catch_10d
    :cond_10d
    :try_start_10d
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v9, v3}, Landroid/provider/DocumentsContract;->copyDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_11e

    new-instance v1, Llq3;

    invoke-direct {v1, v0, v2}, Llq3;-><init>(Landroid/net/Uri;I)V
    :try_end_11c
    .catch Ljava/lang/Exception; {:try_start_10d .. :try_end_11c} :catch_11e

    move-object v0, v1

    goto :goto_b2

    :catch_11e
    :cond_11e
    invoke-static {v9, v5}, Lqyn;->v(Landroid/net/Uri;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_125

    move v10, v2

    :cond_125
    new-instance v0, Llq3;

    invoke-direct {v0, v5, v10}, Llq3;-><init>(Landroid/net/Uri;I)V

    goto :goto_b2

    :cond_12b
    new-instance v0, Llq3;

    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-direct {v0, v1, v10}, Llq3;-><init>(Landroid/net/Uri;I)V

    goto :goto_b2

    :goto_133
    new-instance v5, Lrb5;

    iget-wide v7, p0, Lbf1;->b:J

    invoke-direct/range {v5 .. v10}, Lrb5;-><init>(Lwyd;JLandroid/net/Uri;Llq3;)V

    invoke-static {v5}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_13e
    check-cast v4, Llg4;

    move-object v6, v3

    check-cast v6, Landroid/hardware/camera2/CameraCaptureSession;

    move-object v7, v2

    check-cast v7, Landroid/hardware/camera2/CaptureRequest;

    move-object v8, v1

    check-cast v8, Landroid/view/Surface;

    iget-wide v9, p0, Lbf1;->b:J

    iget-object v5, v4, Llg4;->a:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    invoke-virtual/range {v5 .. v10}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V

    return-void

    :pswitch_151
    check-cast v4, Leek;

    check-cast v3, Landroid/widget/FrameLayout;

    check-cast v2, Lc9l;

    check-cast v1, Ldf1;

    invoke-virtual {v4}, Leek;->invoke()Ljava/lang/Object;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v3, p0, Lbf1;->b:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    new-instance v0, Lc4;

    const/16 v3, 0x1a

    invoke-direct {v0, v2, v3}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void

    nop

    :pswitch_data_184
    .packed-switch 0x0
        :pswitch_151
        :pswitch_13e
    .end packed-switch
.end method
