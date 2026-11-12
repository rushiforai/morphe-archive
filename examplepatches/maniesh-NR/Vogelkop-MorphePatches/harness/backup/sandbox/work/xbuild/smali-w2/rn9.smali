.class public final Lrn9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luya;
.implements Ligd;
.implements Lrr9;
.implements Lqr9;
.implements Lxl2;
.implements Lcyi;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lrn9;->a:B

    sparse-switch p1, :sswitch_data_2a

    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 342
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    return-void

    .line 343
    :sswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 344
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    .line 345
    invoke-static {p1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 346
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    return-void

    .line 347
    :sswitch_26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_data_2a
    .sparse-switch
        0x13 -> :sswitch_26
        0x1a -> :sswitch_10
    .end sparse-switch
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 284
    iput-byte p1, p0, Lrn9;->a:B

    iput-object p2, p0, Lrn9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lrn9;->d:Ljava/lang/Object;

    iput-boolean p4, p0, Lrn9;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljf4;)V
    .registers 7

    const/16 v0, 0x9

    iput-byte v0, p0, Lrn9;->a:B

    .line 348
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 349
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 350
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_19

    .line 351
    invoke-static {p1}, Lg8;->o(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_19

    move v0, v3

    goto :goto_1a

    :cond_19
    move v0, v2

    .line 352
    :goto_1a
    iput-boolean v0, p0, Lrn9;->b:Z

    .line 353
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    if-eqz p2, :cond_27

    .line 354
    invoke-virtual {p2}, Ljf4;->b()Ljava/lang/Integer;

    move-result-object p2

    goto :goto_28

    :cond_27
    const/4 p2, 0x0

    .line 355
    :goto_28
    const-string v0, "android.hardware.camera"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    .line 356
    const-string v1, "android.hardware.camera.front"

    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    if-eqz v0, :cond_40

    if-eqz p2, :cond_3e

    .line 357
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v3, :cond_40

    :cond_3e
    move v0, v3

    goto :goto_41

    :cond_40
    move v0, v2

    :goto_41
    if-eqz p1, :cond_4c

    if-eqz p2, :cond_4b

    .line 358
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_4c

    :cond_4b
    move v2, v3

    .line 359
    :cond_4c
    new-instance p1, Ltg4;

    invoke-direct {p1, v0, v2}, Ltg4;-><init>(ZZ)V

    .line 360
    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwa;Ljava/util/ArrayList;Z[I)V
    .registers 11

    const/16 v0, 0x1d

    iput-byte v0, p0, Lrn9;->a:B

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 297
    iput-object p2, p0, Lrn9;->d:Ljava/lang/Object;

    .line 298
    new-instance p2, Landroid/widget/ListView;

    invoke-direct {p2, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 299
    invoke-virtual {p2, v0}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 300
    sget-object v1, Lurj;->c:Lurj;

    if-nez v1, :cond_1e

    new-instance v1, Lurj;

    const/4 v2, 0x6

    .line 301
    invoke-direct {v1, v2}, Lurj;-><init>(B)V

    .line 302
    sput-object v1, Lurj;->c:Lurj;

    .line 303
    :cond_1e
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 304
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 305
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    const/4 v1, 0x1

    .line 306
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 307
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->setInverseBackgroundForced(Z)V

    if-eqz p4, :cond_5e

    .line 308
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x104000a

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ldyi;

    invoke-direct {v3, p0, p2, v0}, Ldyi;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v4, -0x1

    .line 309
    invoke-virtual {p1, v4, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 310
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x1040000

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lsk;

    const/16 v4, 0xb

    invoke-direct {v3, p0, v4}, Lsk;-><init>(Ljava/lang/Object;B)V

    const/4 v4, -0x2

    .line 311
    invoke-virtual {p1, v4, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 312
    :cond_5e
    new-instance v2, Lcs2;

    .line 313
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p4, :cond_6a

    const v3, 0x1090013

    goto :goto_6d

    :cond_6a
    const v3, 0x1090012

    :goto_6d
    invoke-direct {v2, p1, v3, p3}, Lcs2;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    .line 314
    invoke-virtual {p2, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 315
    invoke-virtual {p2, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    if-eqz p4, :cond_87

    const/4 p1, 0x2

    .line 316
    invoke-virtual {p2, p1}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    .line 317
    :goto_7c
    array-length p1, p5

    if-ge v0, p1, :cond_9f

    .line 318
    aget p1, p5, v0

    invoke-virtual {p2, p1, v1}, Landroid/widget/AbsListView;->setItemChecked(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7c

    .line 319
    :cond_87
    invoke-virtual {p2, v1}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    .line 320
    new-instance p1, Lvy0;

    invoke-direct {p1, p0, p2, v1}, Lvy0;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 321
    array-length p1, p5

    if-lez p1, :cond_9f

    .line 322
    aget p1, p5, v0

    invoke-virtual {p2, p1}, Landroid/widget/ListView;->setSelection(I)V

    .line 323
    aget p1, p5, v0

    invoke-virtual {p2, p1, v1}, Landroid/widget/AbsListView;->setItemChecked(IZ)V

    .line 324
    :cond_9f
    iget-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p1, Landroid/app/AlertDialog;

    new-instance p2, Ls77;

    invoke-direct {p2, p0, v1}, Ls77;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .registers 12

    const/16 v0, 0xf

    iput-byte v0, p0, Lrn9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    const/4 v3, 0x1

    if-eqz v0, :cond_1d

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ge v0, v2, :cond_1d

    move v0, v3

    goto :goto_1e

    :cond_1d
    move v0, v1

    :goto_1e
    iput-boolean v0, p0, Lrn9;->b:Z

    const/4 v0, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    if-ne p2, v3, :cond_ab

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    div-int/2addr p2, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    div-int/2addr v6, v0

    new-array v2, v2, [I

    iput-object v2, p0, Lrn9;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    div-int/2addr v7, v5

    sub-int/2addr v7, v6

    invoke-virtual {p1, v5, v7}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v7

    aput v7, v2, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    div-int/2addr v7, v5

    add-int/2addr v7, v6

    invoke-virtual {p1, v5, v7}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v7

    aput v7, v2, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    div-int/2addr v7, v5

    sub-int/2addr v7, p2

    invoke-virtual {p1, v7, v5}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v7

    aput v7, v2, v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    div-int/2addr v7, v5

    add-int/2addr v7, p2

    invoke-virtual {p1, v7, v5}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v7

    aput v7, v2, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    div-int/2addr v8, v5

    sub-int/2addr v8, v6

    invoke-virtual {p1, v7, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v7

    aput v7, v2, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    div-int/2addr v8, v5

    add-int/2addr v8, v6

    invoke-virtual {p1, v7, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v6

    const/4 v7, 0x5

    aput v6, v2, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    div-int/2addr v6, v5

    sub-int/2addr v6, p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    sub-int/2addr v7, v4

    invoke-virtual {p1, v6, v7}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v6

    const/4 v7, 0x6

    aput v6, v2, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    div-int/2addr v6, v5

    add-int/2addr v6, p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    sub-int/2addr p2, v4

    invoke-virtual {p1, v6, p2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p2

    const/4 v6, 0x7

    aput p2, v2, v6

    goto :goto_db

    :cond_ab
    new-array p2, v0, [I

    iput-object p2, p0, Lrn9;->c:Ljava/lang/Object;

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v2

    aput v2, p2, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v2

    aput v2, p2, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v2

    aput v2, p2, v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sub-int/2addr v6, v3

    invoke-virtual {p1, v2, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v2

    aput v2, p2, v4

    :goto_db
    new-array p2, v0, [I

    iput-object p2, p0, Lrn9;->d:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    div-int/2addr p0, v5

    invoke-virtual {p1, v1, p0}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p0

    aput p0, p2, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    div-int/2addr p0, v5

    invoke-virtual {p1, p0, v1}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p0

    aput p0, p2, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    sub-int/2addr p0, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    div-int/2addr v0, v5

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p0

    aput p0, p2, v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    div-int/2addr p0, v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p0

    aput p0, p2, v4

    return-void
.end method

.method public constructor <init>(Landroid/graphics/PointF;Lode;)V
    .registers 3

    const/16 p1, 0x8

    iput-byte p1, p0, Lrn9;->a:B

    .line 386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 387
    iput-boolean p1, p0, Lrn9;->b:Z

    .line 388
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    .line 389
    iput-object p2, p0, Lrn9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/media/ImageReader;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lrn9;->a:B

    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 331
    iput-boolean v0, p0, Lrn9;->b:Z

    .line 332
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lb0e;)V
    .registers 4

    const/16 v0, 0x17

    iput-byte v0, p0, Lrn9;->a:B

    .line 375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    .line 376
    new-instance v0, Lhpd;

    const/16 v1, 0x8

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbxk;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lrn9;->a:B

    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 295
    new-instance p1, Lq02;

    const/16 v0, 0x15

    invoke-direct {p1, p0, v0}, Lq02;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfe5;Lpde;Lx5f;)V
    .registers 5

    const/16 v0, 0x1c

    iput-byte v0, p0, Lrn9;->a:B

    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 281
    iput-object p2, p0, Lrn9;->c:Ljava/lang/Object;

    .line 282
    iput-object p3, p0, Lrn9;->d:Ljava/lang/Object;

    .line 283
    new-instance p3, Lqzg;

    const/4 v0, 0x6

    invoke-direct {p3, p0, v0}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lge4;)V
    .registers 5

    const/16 v0, 0xe

    iput-byte v0, p0, Lrn9;->a:B

    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 286
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    move-object v1, p1

    check-cast v1, Lma4;

    invoke-virtual {v1, v0}, Lma4;->c(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    const/16 v2, 0x12

    .line 287
    invoke-static {v2, v0}, Le82;->t(I[I)I

    move-result v0

    if-ltz v0, :cond_20

    const/4 v1, 0x1

    .line 288
    :cond_20
    iput-boolean v1, p0, Lrn9;->b:Z

    .line 289
    invoke-static {p1}, Lt8;->k(Lge4;)Lqe6;

    move-result-object p1

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 279
    iput-byte p3, p0, Lrn9;->a:B

    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    iput-object p2, p0, Lrn9;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;Lcom/opera/android/custom_views/ObservableEditText;)V
    .registers 4

    const/16 v0, 0xd

    iput-byte v0, p0, Lrn9;->a:B

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 326
    iput-boolean v0, p0, Lrn9;->b:Z

    .line 327
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 328
    iput-object p2, p0, Lrn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLj55;)V
    .registers 5

    const/16 v0, 0xa

    iput-byte v0, p0, Lrn9;->a:B

    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 291
    iput-boolean p2, p0, Lrn9;->b:Z

    iput-object p3, p0, Lrn9;->d:Ljava/lang/Object;

    .line 292
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Lgl;Z)V
    .registers 5

    const/4 v0, 0x3

    iput-byte v0, p0, Lrn9;->a:B

    .line 377
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_a

    const/4 p1, 0x0

    goto :goto_e

    .line 378
    :cond_a
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    :goto_e
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 379
    iput-object p2, p0, Lrn9;->d:Ljava/lang/Object;

    .line 380
    iput-boolean p3, p0, Lrn9;->b:Z

    return-void
.end method

.method public synthetic constructor <init>(Lk24;B)V
    .registers 3

    .line 278
    iput-byte p2, p0, Lrn9;->a:B

    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lla2;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lrn9;->a:B

    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 335
    iput-boolean v0, p0, Lrn9;->b:Z

    .line 336
    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm0e;)V
    .registers 5

    const/16 v0, 0x18

    iput-byte v0, p0, Lrn9;->a:B

    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    .line 368
    new-instance v0, Lhpd;

    const/16 v1, 0xa

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    .line 369
    iget-object v0, p1, Lm0e;->d:Lyhe;

    .line 370
    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Lz5l;

    .line 371
    iget-object v0, v0, Lz5l;->o:Lc5l;

    .line 372
    iget-object v0, v0, Lc5l;->x:Lpde;

    .line 373
    iget-object p1, p1, Lm0e;->a:Lpde;

    .line 374
    new-instance v2, Ld8d;

    invoke-direct {v2, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lnpd;Lnod;ZLcig;)V
    .registers 5

    const/16 p4, 0x15

    iput-byte p4, p0, Lrn9;->a:B

    .line 385
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    iput-object p2, p0, Lrn9;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lrn9;->b:Z

    return-void
.end method

.method public constructor <init>(Lqb;Lkotlin/jvm/functions/Function0;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lrn9;->a:B

    .line 365
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    .line 366
    new-array p1, v0, [Lkotlin/jvm/functions/Function0;

    const/4 v0, 0x0

    aput-object p2, p1, v0

    invoke-static {p1}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lr65;ZLs65;)V
    .registers 5

    const/16 v0, 0xb

    iput-byte v0, p0, Lrn9;->a:B

    .line 381
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    .line 382
    iput-boolean p2, p0, Lrn9;->b:Z

    .line 383
    iput-object p3, p0, Lrn9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lse2;Lse2;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lrn9;->a:B

    .line 337
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 338
    iput-object p1, p0, Lrn9;->c:Ljava/lang/Object;

    .line 339
    iput-object p2, p0, Lrn9;->d:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 340
    iput-boolean p1, p0, Lrn9;->b:Z

    return-void
.end method

.method public constructor <init>(Lubf;Lyl2;)V
    .registers 4

    const/16 v0, 0x19

    iput-byte v0, p0, Lrn9;->a:B

    .line 384
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lrn9;->c:Ljava/lang/Object;

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lrn9;->a:B

    .line 361
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 362
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    .line 363
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    .line 364
    iput-boolean p1, p0, Lrn9;->b:Z

    return-void
.end method

.method public static P(Ljava/util/LinkedHashSet;Lip7;Lqe6;)V
    .registers 5

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Cannot update already-empty constraints."

    invoke-static {v1, v0}, Ljpo;->n(Ljava/lang/String;Z)V

    iget-object p2, p2, Lqe6;->b:Ljava/lang/Object;

    check-cast p2, Llp7;

    invoke-interface {p2, p1}, Llp7;->c(Lip7;)Ljava/util/Set;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_51

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {p0, v0}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_51

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Constraints of dynamic range cannot be combined with existing constraints.\nDynamic range:\n  "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\nConstraints:\n  "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\nExisting constraints:\n  "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_51
    return-void
.end method

.method public static h(II)Z
    .registers 5

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    sub-int/2addr p0, p1

    mul-int/2addr v0, v0

    mul-int/2addr v1, v1

    add-int/2addr v1, v0

    mul-int/2addr p0, p0

    add-int/2addr p0, v1

    int-to-double p0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    const-wide/high16 v0, 0x4030000000000000L    # 16.0

    cmpg-double p0, p0, v0

    if-gez p0, :cond_2d

    const/4 p0, 0x1

    return p0

    :cond_2d
    const/4 p0, 0x0

    return p0
.end method

.method public static m(Lip7;Lip7;)Z
    .registers 7

    invoke-virtual {p1}, Lip7;->b()Z

    move-result v0

    iget v1, p1, Lip7;->a:I

    const/4 v2, 0x0

    if-eqz v0, :cond_20

    iget v0, p0, Lip7;->a:I

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ne v0, v4, :cond_12

    if-ne v1, v3, :cond_16

    goto :goto_1e

    :cond_12
    if-eqz v0, :cond_16

    if-ne v0, v1, :cond_1e

    :cond_16
    iget p0, p0, Lip7;->b:I

    if-eqz p0, :cond_1f

    iget p1, p1, Lip7;->b:I

    if-eq p0, p1, :cond_1f

    :cond_1e
    :goto_1e
    return v2

    :cond_1f
    return v3

    :cond_20
    const-string p0, "Fully specified range "

    const-string v0, " not actually fully specified."

    invoke-static {p1, v0, p0}, Lkp5;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    return v2
.end method

.method public static s(Lip7;Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)Lip7;
    .registers 8

    iget v0, p0, Lip7;->a:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_43

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lip7;

    iget v3, v0, Lip7;->a:I

    invoke-virtual {v0}, Lip7;->b()Z

    move-result v4

    if-eqz v4, :cond_3e

    if-eq v3, v2, :cond_a

    invoke-interface {p2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_37

    const-string v3, "CXCP"

    const/4 v4, 0x3

    invoke-static {v4, v3}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_35
    const/4 v3, 0x0

    goto :goto_3b

    :cond_37
    invoke-static {p0, v0}, Lrn9;->m(Lip7;Lip7;)Z

    move-result v3

    :goto_3b
    if-eqz v3, :cond_a

    return-object v0

    :cond_3e
    const-string p0, "Fully specified DynamicRange must have fully defined encoding."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_43
    return-object v1
.end method

.method public static u(Lq50;Liq;Lorb;)Lrn9;
    .registers 32

    move-object/from16 v0, p2

    const-string v1, "fixed"

    invoke-virtual {v0, v1}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v1

    const-string v2, "pid"

    const-string v3, ""

    const-string v4, "style"

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eqz v1, :cond_84

    iget-object v7, v1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lez v8, :cond_84

    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    move v9, v5

    move v10, v9

    :goto_25
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v11

    const/4 v12, 0x1

    if-ge v9, v11, :cond_74

    invoke-virtual {v1, v9}, Lvpb;->c(I)Lorb;

    move-result-object v11

    invoke-virtual {v11, v4, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lvep;->a(Ljava/lang/String;)I

    move-result v15

    const-string v13, "position"

    iget-object v14, v11, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v21

    if-ltz v21, :cond_6e

    new-instance v14, Lel;

    invoke-virtual {v11, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static {v11}, Ldl;->b(Lorb;)Ljava/util/TreeSet;

    move-result-object v18

    invoke-static {v11}, Ldl;->a(Lorb;)Ljava/util/TreeSet;

    move-result-object v19

    move-object/from16 v16, p0

    move-object/from16 v20, p1

    invoke-direct/range {v14 .. v21}, Lel;-><init>(ILq50;Ljava/lang/String;Ljava/util/TreeSet;Ljava/util/TreeSet;Liq;I)V

    if-lez v9, :cond_68

    add-int/lit8 v11, v9, -0x1

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lel;

    iget v11, v11, Lel;->g:I

    iget v13, v14, Lel;->g:I

    if-ge v13, v11, :cond_68

    move v10, v12

    :cond_68
    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_25

    :cond_6e
    const-string v0, "incorrect position"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v6

    :cond_74
    if-eqz v10, :cond_85

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v7, Ljk;

    invoke-direct {v7, v1, v12}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v8, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_85

    :cond_84
    move-object v8, v6

    :cond_85
    :goto_85
    const-string v1, "interval"

    invoke-virtual {v0, v1}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v7

    if-eqz v7, :cond_ed

    iget-object v9, v7, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v9, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_e7

    const-string v9, "repeat"

    invoke-virtual {v7, v9}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v7

    iget-object v9, v7, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-eqz v10, :cond_e1

    new-instance v10, Ljava/util/ArrayList;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    :goto_ac
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v5, v11, :cond_db

    invoke-virtual {v7, v5}, Lvpb;->c(I)Lorb;

    move-result-object v11

    invoke-virtual {v11, v4, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lvep;->a(Ljava/lang/String;)I

    move-result v23

    new-instance v22, Lfl;

    invoke-virtual {v11, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-static {v11}, Ldl;->b(Lorb;)Ljava/util/TreeSet;

    move-result-object v26

    invoke-static {v11}, Ldl;->a(Lorb;)Ljava/util/TreeSet;

    move-result-object v27

    move-object/from16 v24, p0

    move-object/from16 v28, p1

    invoke-direct/range {v22 .. v28}, Ldl;-><init>(ILq50;Ljava/lang/String;Ljava/util/TreeSet;Ljava/util/TreeSet;Liq;)V

    move-object/from16 v11, v22

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_ac

    :cond_db
    new-instance v2, Lgl;

    invoke-direct {v2, v1, v10}, Lgl;-><init>(ILjava/util/ArrayList;)V

    goto :goto_ee

    :cond_e1
    const-string v0, "empty interval repeat config"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v6

    :cond_e7
    const-string v0, "incorrect interval"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v6

    :cond_ed
    move-object v2, v6

    :goto_ee
    if-eqz v8, :cond_f6

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_100

    :cond_f6
    if-eqz v2, :cond_10c

    iget-object v1, v2, Lgl;->b:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_10c

    :cond_100
    new-instance v1, Lrn9;

    const-string v3, "allowAtEnd"

    invoke-virtual {v0, v3}, Lorb;->f(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {v1, v8, v2, v0}, Lrn9;-><init>(Ljava/util/ArrayList;Lgl;Z)V

    return-object v1

    :cond_10c
    const-string v0, "either fixed or interval config must be available"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v6
.end method

.method public static v(Landroid/widget/ListView;)[I
    .registers 6

    invoke-virtual {p0}, Landroid/widget/AbsListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_7
    invoke-virtual {p0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_18

    invoke-virtual {p0, v1}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v3

    if-eqz v3, :cond_15

    add-int/lit8 v2, v2, 0x1

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_18
    new-array v1, v2, [I

    move v2, v0

    :goto_1b
    invoke-virtual {p0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_33

    invoke-virtual {p0, v0}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v3

    if-eqz v3, :cond_30

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p0, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v4

    aput v4, v1, v2

    move v2, v3

    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    :cond_33
    return-object v1
.end method

.method public static x(Ljava/util/Set;Ljf4;)Z
    .registers 3

    :try_start_0
    new-instance v0, Ljava/util/LinkedHashSet;

    check-cast p0, Ljava/util/Collection;

    invoke-direct {v0, p0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v0}, Ljf4;->c(Ljava/util/LinkedHashSet;)Lzd4;
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_a} :catch_c

    const/4 p0, 0x1

    return p0

    :catch_c
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final A()Z
    .registers 5

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v2, [I

    array-length v3, v2

    if-ge v1, v3, :cond_17

    aget v2, v2, v1

    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    const/16 v3, 0xfa

    if-ge v2, v3, :cond_14

    return v0

    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_17
    const/4 p0, 0x1

    return p0
.end method

.method public final B(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    sget-object v0, Lkhh;->d:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x1

    :try_start_10
    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/graphics/Point;->x:I

    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Landroid/graphics/Point;->y:I
    :try_end_1c
    .catchall {:try_start_10 .. :try_end_1c} :catchall_20

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_20
    move-exception p0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public final C(Ljava/util/LinkedHashSet;Ljava/util/Set;)Z
    .registers 10

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Ltg4;

    iget-boolean v1, v0, Ltg4;->b:Z

    iget-boolean v0, v0, Ltg4;->a:Z

    iget-boolean p0, p0, Lrn9;->b:Z

    const/4 v2, 0x0

    if-nez p0, :cond_96

    if-nez v0, :cond_11

    if-eqz v1, :cond_96

    :cond_11
    sget-object p0, Ljf4;->c:Ljf4;

    invoke-static {p1, p0}, Lrn9;->x(Ljava/util/Set;Ljf4;)Z

    move-result p0

    sget-object v3, Ljf4;->b:Ljf4;

    invoke-static {p1, v3}, Lrn9;->x(Ljava/util/Set;Ljf4;)Z

    move-result v3

    check-cast p2, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {p2, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2e
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_42

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ltd4;

    invoke-virtual {v5}, Ltd4;->a()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_42
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4f
    :goto_4f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lzd4;

    invoke-interface {v6}, Lzd4;->g()Lxd4;

    move-result-object v6

    invoke-interface {v6}, Lxd4;->e()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4f

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    :cond_6e
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    sget-object p2, Ljf4;->c:Ljf4;

    invoke-static {p1, p2}, Lrn9;->x(Ljava/util/Set;Ljf4;)Z

    move-result p2

    sget-object v4, Ljf4;->b:Ljf4;

    invoke-static {p1, v4}, Lrn9;->x(Ljava/util/Set;Ljf4;)Z

    move-result p1

    const/4 v4, 0x1

    if-eqz v0, :cond_87

    if-eqz p0, :cond_87

    if-nez p2, :cond_87

    move p0, v4

    goto :goto_88

    :cond_87
    move p0, v2

    :goto_88
    if-eqz v1, :cond_90

    if-eqz v3, :cond_90

    if-nez p1, :cond_90

    move p1, v4

    goto :goto_91

    :cond_90
    move p1, v2

    :goto_91
    if-nez p0, :cond_95

    if-eqz p1, :cond_96

    :cond_95
    return v4

    :cond_96
    return v2
.end method

.method public final D(Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzb;

    if-nez v2, :cond_18

    new-instance v2, Lzb;

    invoke-direct {v2, p1}, Lzb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iput-wide v3, v2, Lzb;->c:J

    iget-boolean p0, p0, Lrn9;->b:Z

    if-eqz p0, :cond_4b

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_48

    const/4 p0, 0x1

    invoke-static {p0, v0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzb;

    iget-object p1, p0, Lzb;->b:Ljava/util/ArrayList;

    if-nez p1, :cond_3d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lzb;->b:Ljava/util/ArrayList;

    :cond_3d
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_48

    iget-object p0, p0, Lzb;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_48
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4b
    return-void
.end method

.method public final E(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 5

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrn9;->b:Z

    const/4 v0, -0x1

    if-eq p2, v0, :cond_1a

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lltl;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Lqn9;

    invoke-direct {v1, p0, p2, p1}, Lqn9;-><init>(Lrn9;ILandroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    :cond_1a
    return-void
.end method

.method public final F()V
    .registers 5

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_16

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrn9;->b:Z

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lon9;

    invoke-interface {v0}, Lon9;->a()Loba;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v1, v0, Loba;->a:[I

    array-length v2, v1

    if-nez v2, :cond_17

    :cond_16
    return-void

    :cond_17
    iget v0, v0, Loba;->b:I

    iget-object v2, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v2, Lltl;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v2

    new-instance v3, Lqn9;

    invoke-direct {v3, p0, v1, v0}, Lqn9;-><init>(Lrn9;[II)V

    invoke-virtual {v2, v3}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final G([I)V
    .registers 3

    iget-boolean v0, p0, Lrn9;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lwa;

    invoke-virtual {v0, p1}, Lwa;->onResult(Ljava/lang/Object;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrn9;->b:Z

    return-void
.end method

.method public final H(II)Z
    .registers 8

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lla2;

    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Point;

    iget-boolean p0, p0, Lrn9;->b:Z

    const/4 v2, 0x0

    if-nez p0, :cond_11

    invoke-interface {v0, p1, p2}, Lla2;->e(II)V

    return v2

    :cond_11
    iget p0, v1, Landroid/graphics/Point;->x:I

    if-eqz p0, :cond_5e

    iget p0, v1, Landroid/graphics/Point;->y:I

    if-eqz p0, :cond_5e

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    if-nez p0, :cond_29

    if-nez v3, :cond_29

    invoke-interface {v0, p1, p2}, Lla2;->e(II)V

    return v2

    :cond_29
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/high16 v3, 0x40000000    # 2.0f

    if-eq p1, v3, :cond_4a

    const/high16 v4, -0x80000000

    if-ne p1, v4, :cond_43

    if-ne p2, v3, :cond_4a

    :cond_43
    iget p0, v1, Landroid/graphics/Point;->x:I

    mul-int/2addr p0, v2

    iget p1, v1, Landroid/graphics/Point;->y:I

    div-int/2addr p0, p1

    goto :goto_51

    :cond_4a
    iget p1, v1, Landroid/graphics/Point;->y:I

    mul-int/2addr p1, p0

    iget p2, v1, Landroid/graphics/Point;->x:I

    div-int v2, p1, p2

    :goto_51
    invoke-static {p0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-interface {v0, p0, p1}, Lla2;->e(II)V

    const/4 p0, 0x1

    return p0

    :cond_5e
    invoke-interface {v0, p1, p2}, Lla2;->e(II)V

    return v2
.end method

.method public final I()V
    .registers 3

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_1e

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lltl;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->c:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/w;

    if-nez v0, :cond_1f

    :cond_1e
    return-void

    :cond_1f
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrn9;->b:Z

    const/4 p0, 0x0

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    return-void
.end method

.method public final J(Lkf0;)V
    .registers 3

    iget-boolean v0, p0, Lrn9;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrn9;->b:Z

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lorm;

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lmf0;

    check-cast v0, Lx5f;

    invoke-virtual {v0, p1, p0}, Lx5f;->W(Lkf0;Lmf0;)V

    return-void
.end method

.method public final K(Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;)Ljava/util/LinkedHashMap;
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lqe6;

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v5, 0x0

    :goto_10
    if-ge v5, v3, :cond_22

    move-object/from16 v6, p1

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    check-cast v7, Lqm2;

    iget-object v7, v7, Lqm2;->d:Lip7;

    invoke-interface {v2, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_22
    iget-object v3, v1, Lqe6;->b:Ljava/lang/Object;

    check-cast v3, Llp7;

    invoke-interface {v3}, Llp7;->a()Ljava/util/Set;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Ljava/lang/Iterable;

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_35
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_45

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lip7;

    invoke-static {v5, v7, v1}, Lrn9;->P(Ljava/util/LinkedHashSet;Lip7;Lqe6;)V

    goto :goto_35

    :cond_45
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_58
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const/4 v11, 0x2

    if-eqz v10, :cond_96

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v10

    move-object/from16 v12, p2

    invoke-interface {v12, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lqsm;

    invoke-interface {v10}, Ltxa;->v()Lip7;

    move-result-object v13

    sget-object v14, Lip7;->c:Lip7;

    invoke-virtual {v13, v14}, Lip7;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_81

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_58

    :cond_81
    iget v14, v13, Lip7;->a:I

    iget v13, v13, Lip7;->b:I

    if-eq v14, v11, :cond_92

    if-eqz v14, :cond_8c

    if-eqz v13, :cond_92

    goto :goto_8e

    :cond_8c
    if-nez v13, :cond_92

    :goto_8e
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_58

    :cond_92
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_58

    :cond_96
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    :goto_b3
    if-ge v7, v6, :cond_214

    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lqsm;

    invoke-interface {v8}, Ltxa;->v()Lip7;

    move-result-object v13

    sget-object v14, Lfcl;->Cp:Lan2;

    invoke-interface {v8, v14}, Lskh;->i(Lan2;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v13}, Lip7;->b()Z

    move-result v14

    if-eqz v14, :cond_df

    invoke-interface {v5, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v14

    move/from16 p2, v6

    move/from16 v16, v7

    if-eqz v14, :cond_dc

    move-object v15, v13

    goto/16 :goto_1c9

    :cond_dc
    const/4 v15, 0x0

    goto/16 :goto_1c9

    :cond_df
    iget v14, v13, Lip7;->a:I

    iget v4, v13, Lip7;->b:I

    const/16 p1, 0x0

    const/4 v15, 0x1

    sget-object v11, Lip7;->d:Lip7;

    if-ne v14, v15, :cond_101

    if-nez v4, :cond_101

    invoke-interface {v5, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f9

    move/from16 p2, v6

    move/from16 v16, v7

    :cond_f6
    :goto_f6
    move-object v15, v11

    goto/16 :goto_1c9

    :cond_f9
    move-object/from16 v15, p1

    move/from16 p2, v6

    move/from16 v16, v7

    goto/16 :goto_1c9

    :cond_101
    invoke-static {v13, v2, v5}, Lrn9;->s(Lip7;Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)Lip7;

    move-result-object v15

    move/from16 p2, v6

    const-string v6, "CXCP"

    move/from16 v16, v7

    const/4 v7, 0x3

    if-eqz v15, :cond_11c

    invoke-static {v7, v6}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1c9

    invoke-virtual {v13}, Lip7;->toString()Ljava/lang/String;

    invoke-virtual {v15}, Lip7;->toString()Ljava/lang/String;

    goto/16 :goto_1c9

    :cond_11c
    invoke-static {v13, v10, v5}, Lrn9;->s(Lip7;Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)Lip7;

    move-result-object v15

    if-eqz v15, :cond_130

    invoke-static {v7, v6}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1c9

    invoke-virtual {v13}, Lip7;->toString()Ljava/lang/String;

    invoke-virtual {v15}, Lip7;->toString()Ljava/lang/String;

    goto/16 :goto_1c9

    :cond_130
    invoke-interface {v5, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_144

    invoke-static {v7, v6}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_142

    invoke-static {v13}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-static {v11}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_142
    const/4 v15, 0x0

    goto :goto_148

    :cond_144
    invoke-static {v13, v11}, Lrn9;->m(Lip7;Lip7;)Z

    move-result v15

    :goto_148
    if-eqz v15, :cond_157

    invoke-static {v7, v6}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f6

    invoke-virtual {v13}, Lip7;->toString()Ljava/lang/String;

    invoke-virtual {v11}, Lip7;->toString()Ljava/lang/String;

    goto :goto_f6

    :cond_157
    const/4 v15, 0x2

    if-ne v14, v15, :cond_191

    const/16 v14, 0xa

    if-eq v4, v14, :cond_160

    if-nez v4, :cond_191

    :cond_160
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x21

    if-lt v14, v15, :cond_178

    iget-object v14, v0, Lrn9;->c:Ljava/lang/Object;

    check-cast v14, Lge4;

    invoke-static {v14}, Lt8;->y(Lge4;)Lip7;

    move-result-object v14

    if-eqz v14, :cond_178

    invoke-interface {v4, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_178
    sget-object v14, Lip7;->e:Lip7;

    invoke-interface {v4, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-static {v13, v4, v5}, Lrn9;->s(Lip7;Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)Lip7;

    move-result-object v4

    if-eqz v4, :cond_191

    invoke-static {v7, v6}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_18f

    invoke-virtual {v13}, Lip7;->toString()Ljava/lang/String;

    invoke-virtual {v4}, Lip7;->toString()Ljava/lang/String;

    :cond_18f
    move-object v15, v4

    goto :goto_1c9

    :cond_191
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_195
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1c7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lip7;

    invoke-virtual {v14}, Lip7;->b()Z

    move-result v15

    if-eqz v15, :cond_1c1

    invoke-virtual {v14, v11}, Lip7;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_195

    invoke-static {v13, v14}, Lrn9;->m(Lip7;Lip7;)Z

    move-result v15

    if-eqz v15, :cond_195

    invoke-static {v7, v6}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1bf

    invoke-virtual {v13}, Lip7;->toString()Ljava/lang/String;

    invoke-virtual {v14}, Lip7;->toString()Ljava/lang/String;

    :cond_1bf
    move-object v15, v14

    goto :goto_1c9

    :cond_1c1
    const-string v0, "Candidate dynamic range must be fully specified."

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object p1

    :cond_1c7
    move-object/from16 v15, p1

    :cond_1c9
    :goto_1c9
    if-eqz v15, :cond_1e0

    invoke-static {v5, v15, v1}, Lrn9;->P(Ljava/util/LinkedHashSet;Lip7;Lqe6;)V

    invoke-interface {v9, v8, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v2, v15}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1da

    invoke-interface {v10, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_1da
    move/from16 v6, p2

    move/from16 v7, v16

    goto/16 :goto_b3

    :cond_1e0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Lfcl;->Cp:Lan2;

    invoke-interface {v8, v1}, Lskh;->i(Lan2;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Unable to resolve supported dynamic range. The dynamic range may not be supported on the device or may not be allowed concurrently with other attached use cases.\nUse case:\n  "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nRequested dynamic range:\n  "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\nSupported dynamic ranges:\n  "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\nConstrained set of concurrent dynamic ranges:\n  "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_214
    return-object v9
.end method

.method public final L()V
    .registers 9

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-static {v0}, Lrm5;->y(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_e
    :goto_e
    if-ge v3, v1, :cond_43

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lzlj;

    invoke-virtual {v4}, Lzlj;->e()Z

    move-result v5

    if-nez v5, :cond_e

    iget-object v5, v4, Lzlj;->b:Ljava/lang/Object;

    monitor-enter v5

    :try_start_21
    iget v6, v4, Lzlj;->x:I

    const/4 v7, 0x6

    if-ne v6, v7, :cond_28

    const/4 v6, 0x1

    goto :goto_29

    :cond_28
    move v6, v2

    :goto_29
    monitor-exit v5
    :try_end_2a
    .catchall {:try_start_21 .. :try_end_2a} :catchall_41

    if-nez v6, :cond_e

    invoke-virtual {v4}, Lzlj;->c()V

    iget-boolean v5, p0, Lrn9;->b:Z

    if-nez v5, :cond_37

    invoke-virtual {v4}, Lzlj;->a()V

    goto :goto_e

    :cond_37
    iget-object v5, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :goto_3f
    :try_start_3f
    monitor-exit v5
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_41

    throw p0

    :catchall_41
    move-exception p0

    goto :goto_3f

    :cond_43
    return-void
.end method

.method public final M()V
    .registers 4

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lhpd;

    iget-object v1, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lm0e;

    iget-object v2, v1, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Lm0e;->d:Lyhe;

    iget-object v1, v1, Lyhe;->b:Ljava/lang/Object;

    check-cast v1, Lz5l;

    iget-object v1, v1, Lz5l;->o:Lc5l;

    iget-object v1, v1, Lc5l;->x:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_27

    const/4 v1, 0x0

    iput-boolean v1, p0, Lrn9;->b:Z

    invoke-virtual {v2, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void

    :cond_27
    iget-boolean v1, p0, Lrn9;->b:Z

    if-nez v1, :cond_31

    const/4 v1, 0x1

    iput-boolean v1, p0, Lrn9;->b:Z

    invoke-virtual {v2, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_31
    return-void
.end method

.method public final N()V
    .registers 2

    iget-boolean v0, p0, Lrn9;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrn9;->b:Z

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lb0e;

    iget-object v0, v0, Lb0e;->h:Lg0e;

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Lhpd;

    invoke-virtual {v0, p0}, Lg0e;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final O(Lehf;)V
    .registers 5

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_26

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lqb;

    if-nez p1, :cond_11

    invoke-virtual {v0}, Lqb;->a()V

    invoke-virtual {p0}, Lrn9;->k()V

    return-void

    :cond_11
    iget-object v0, v0, Lqb;->g:Lesk;

    if-eqz v0, :cond_26

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    if-eqz v0, :cond_26

    new-instance v1, Lmb;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    :cond_26
    return-void
.end method

.method public final Q(Lhf4;)V
    .registers 4

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Ltg4;

    iget-boolean p0, p0, Lrn9;->b:Z

    if-eqz p0, :cond_10

    invoke-virtual {p1}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    return-void

    :cond_10
    sget-object p0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iget-boolean p0, v0, Ltg4;->a:Z

    if-eqz p0, :cond_22

    :try_start_16
    sget-object p0, Ljf4;->c:Ljf4;

    invoke-virtual {p1}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljf4;->c(Ljava/util/LinkedHashSet;)Lzd4;
    :try_end_1f
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_1f} :catch_20

    goto :goto_22

    :catch_20
    move-exception p0

    goto :goto_23

    :cond_22
    :goto_22
    const/4 p0, 0x0

    :goto_23
    iget-boolean v0, v0, Ltg4;->b:Z

    if-eqz v0, :cond_35

    :try_start_27
    sget-object v0, Ljf4;->b:Ljf4;

    invoke-virtual {p1}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljf4;->c(Ljava/util/LinkedHashSet;)Lzd4;
    :try_end_30
    .catch Ljava/lang/RuntimeException; {:try_start_27 .. :try_end_30} :catch_31

    goto :goto_35

    :catch_31
    move-exception v0

    if-nez p0, :cond_35

    move-object p0, v0

    :cond_35
    :goto_35
    if-nez p0, :cond_38

    return-void

    :cond_38
    new-instance v0, Lsg4;

    invoke-virtual {p1}, Lhf4;->c()Ljava/util/LinkedHashSet;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    move-result p1

    invoke-direct {v0, p1, p0}, Lsg4;-><init>(ILjava/lang/RuntimeException;)V

    throw v0
.end method

.method public final a(Z)V
    .registers 3

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/AlertDialog;

    if-eqz p1, :cond_e

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lrn9;->G([I)V

    return-void

    :cond_e
    const/4 p1, 0x1

    iput-boolean p1, p0, Lrn9;->b:Z

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method public final b(Lue5;Lih5;I)V
    .registers 9

    check-cast p2, Lvt9;

    const v0, 0xf38c621

    invoke-virtual {p2, v0}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {p2, p1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x4

    goto :goto_11

    :cond_10
    const/4 v0, 0x2

    :goto_11
    or-int/2addr v0, p3

    invoke-virtual {p2, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/16 v1, 0x20

    goto :goto_1d

    :cond_1b
    const/16 v1, 0x10

    :goto_1d
    or-int/2addr v0, v1

    and-int/lit8 v1, v0, 0x13

    const/16 v2, 0x12

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v1, v2, :cond_28

    move v1, v4

    goto :goto_29

    :cond_28
    move v1, v3

    :goto_29
    and-int/2addr v0, v4

    invoke-virtual {p2, v0, v1}, Lvt9;->N(IZ)Z

    move-result v0

    if-eqz v0, :cond_91

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Ldg5;

    iget-boolean v1, p0, Lrn9;->b:Z

    sget-object v2, Lhh5;->a:Lzpa;

    if-eqz v1, :cond_54

    const v1, 0x5fda6abd

    invoke-virtual {p2, v1}, Lvt9;->W(I)V

    invoke-virtual {p2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v2, :cond_4e

    new-instance v1, Lxg5;

    invoke-direct {v1}, Lxg5;-><init>()V

    invoke-virtual {p2, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_4e
    check-cast v1, Lxg5;

    invoke-virtual {p2, v3}, Lvt9;->p(Z)V

    goto :goto_5e

    :cond_54
    const v1, 0x5fdb84a5

    invoke-virtual {p2, v1}, Lvt9;->W(I)V

    invoke-virtual {p2, v3}, Lvt9;->p(Z)V

    const/4 v1, 0x0

    :goto_5e
    invoke-virtual {p2, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p2, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v3, v4

    invoke-virtual {p2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v3, :cond_6f

    if-ne v4, v2, :cond_79

    :cond_6f
    new-instance v4, Lcv2;

    const/16 v2, 0x11

    invoke-direct {v4, p0, v1, v2}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_79
    check-cast v4, Lkotlin/jvm/functions/Function1;

    invoke-static {v1, v4, p2}, Lrm5;->b(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lih5;)V

    new-instance v2, Lg9;

    const/16 v3, 0x9

    invoke-direct {v2, v0, v1, p1, v3}, Lg9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v0, 0x4a403724    # 3149257.0f

    invoke-static {v0, v2, p2}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v0, p2, v1}, Lrof;->a(Lue5;Lih5;I)V

    goto :goto_94

    :cond_91
    invoke-virtual {p2}, Lvt9;->Q()V

    :goto_94
    invoke-virtual {p2}, Lvt9;->r()Lznh;

    move-result-object p2

    if-eqz p2, :cond_a1

    new-instance v0, Lag5;

    invoke-direct {v0, p0, p1, p3}, Lag5;-><init>(Lrn9;Lue5;I)V

    iput-object v0, p2, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_a1
    return-void
.end method

.method public final c(Landroid/graphics/drawable/Drawable;)V
    .registers 7

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lubf;

    iget-object v1, v0, Lubf;->g:Lvbf;

    const-wide/16 v2, 0x1000

    if-eqz p1, :cond_1c

    iget-object v0, v0, Lubf;->f:Lyl2;

    iget-object v4, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v4, Lyl2;

    if-ne v0, v4, :cond_1c

    const/4 p0, 0x1

    invoke-virtual {v1, v2, v3, p0}, Lvbf;->r(JZ)V

    iget-object p0, v1, Lvbf;->q:Lv73;

    invoke-virtual {p0, p1}, Lv73;->p(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_1c
    iget-boolean p0, p0, Lrn9;->b:Z

    if-nez p0, :cond_2a

    const/4 p0, 0x0

    invoke-virtual {v1, v2, v3, p0}, Lvbf;->r(JZ)V

    iget-object p0, v1, Lvbf;->q:Lv73;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lv73;->p(Landroid/graphics/drawable/Drawable;)V

    :cond_2a
    return-void
.end method

.method public final close()V
    .registers 2

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->close()V

    monitor-exit v0

    return-void

    :goto_c
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_e

    throw p0

    :catchall_e
    move-exception p0

    goto :goto_c
.end method

.method public final d()V
    .registers 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrn9;->b:Z

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lubf;

    iget-object p0, p0, Lubf;->g:Lvbf;

    const-wide/16 v0, 0x1000

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lvbf;->r(JZ)V

    iget-object p0, p0, Lvbf;->q:Lv73;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lv73;->p(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final e()Lqya;
    .registers 5

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_c} :catch_d
    .catchall {:try_start_4 .. :try_end_c} :catchall_29

    goto :goto_1b

    :catch_d
    move-exception p0

    :try_start_e
    const-string v2, "ImageReaderContext is not initialized"

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    move-object p0, v1

    :goto_1b
    if-nez p0, :cond_1f

    monitor-exit v0

    return-object v1

    :cond_1f
    new-instance v1, Lk71;

    invoke-direct {v1, p0}, Lk71;-><init>(Landroid/media/Image;)V

    monitor-exit v0

    return-object v1

    :cond_26
    throw p0

    :goto_27
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_e .. :try_end_28} :catchall_29

    throw p0

    :catchall_29
    move-exception p0

    goto :goto_27
.end method

.method public final f(J)Z
    .registers 9

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lk5o;

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_e
    if-ge v2, v0, :cond_22

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lnmg;

    iget-wide v4, v4, Lnmg;->a:J

    invoke-static {v4, v5, p1, p2}, Lk1g;->s(JJ)Z

    move-result v4

    if-nez v4, :cond_23

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_22
    const/4 v3, 0x0

    :cond_23
    check-cast v3, Lnmg;

    if-eqz v3, :cond_2a

    iget-boolean p0, v3, Lnmg;->h:Z

    return p0

    :cond_2a
    return v1
.end method

.method public final bridge synthetic g(Ligi;)Ljgd;
    .registers 2

    invoke-virtual {p0, p1}, Lrn9;->p(Ligi;)Lte2;

    move-result-object p0

    return-object p0
.end method

.method public final getHeight()I
    .registers 2

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->getHeight()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d
.end method

.method public final getSurface()Landroid/view/Surface;
    .registers 2

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d
.end method

.method public final getWidth()I
    .registers 2

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->getWidth()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d
.end method

.method public final i()I
    .registers 2

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->getImageFormat()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d
.end method

.method public final j(Lue5;)Lch5;
    .registers 5

    new-instance v0, Lch5;

    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Lk24;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lch5;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ld4;->m()V

    new-instance v1, Lag5;

    invoke-direct {v1, p0, p1}, Lag5;-><init>(Lrn9;Lue5;)V

    new-instance p0, Lue5;

    const p1, -0x20502247

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {v0, p0}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    return-object v0
.end method

.method public final k()V
    .registers 5

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_17

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_9

    :cond_17
    invoke-virtual {p0}, Lrn9;->t()V

    return-void
.end method

.method public final l()V
    .registers 3

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_4
    iput-boolean v1, p0, Lrn9;->b:Z

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    monitor-exit v0

    return-void

    :goto_10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_12

    throw p0

    :catchall_12
    move-exception p0

    goto :goto_10
.end method

.method public final n()V
    .registers 3

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lbxk;

    iget-object v0, v0, Lbxk;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;

    iget-object v0, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->i:Lxr5;

    iget-object v1, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lq02;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrn9;->b:Z

    return-void
.end method

.method public final o(Lzlj;)Z
    .registers 4

    const/4 v0, 0x1

    if-nez p1, :cond_4

    return v0

    :cond_4
    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    if-nez v1, :cond_19

    const/4 v0, 0x0

    :cond_19
    if-eqz v0, :cond_1e

    invoke-virtual {p1}, Lzlj;->c()V

    :cond_1e
    return v0
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 5

    iget-byte v0, p0, Lrn9;->a:B

    packed-switch v0, :pswitch_data_70

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lnpd;

    instance-of v1, p1, Ljava/lang/UnsupportedOperationException;

    if-eqz v1, :cond_13

    const-string v1, "UnsupportedOperationException: Make sure to implement MediaSession.Callback.onPlaybackResumption() if you add a media button receiver to your manifest or if you implement the recent media item contract with your MediaLibraryService."

    invoke-static {v1, p1}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_28

    :cond_13
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failure calling MediaSession.Callback.onPlaybackResumption(): "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Lw7d;->r(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_28
    iget-object p1, v0, Lnpd;->t:Lxkg;

    invoke-static {p1}, Ltym;->F(Lgig;)Z

    iget-boolean p1, p0, Lrn9;->b:Z

    if-eqz p1, :cond_38

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Lnod;

    invoke-virtual {v0, p0}, Lnpd;->o(Lnod;)V

    :cond_38
    return-void

    :pswitch_39
    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3c
    iget-boolean v1, p0, Lrn9;->b:Z

    if-eqz v1, :cond_42

    monitor-exit v0

    goto :goto_6a

    :cond_42
    instance-of p1, p1, Lgc4;

    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    if-eqz p1, :cond_60

    new-instance p1, Lybl;

    const/4 v2, 0x0

    invoke-direct {p1, v2}, Lybl;-><init>(I)V

    invoke-virtual {v1, p1}, Lekc;->n(Ljava/lang/Object;)V

    iget-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter p1
    :try_end_56
    .catchall {:try_start_3c .. :try_end_56} :catchall_6d

    const/4 v1, 0x1

    :try_start_57
    iput-boolean v1, p0, Lrn9;->b:Z

    monitor-exit p1
    :try_end_5a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_5e

    :try_start_5a
    monitor-exit v0
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_6d

    goto :goto_6a

    :goto_5c
    :try_start_5c
    monitor-exit p1
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_5e

    :try_start_5d
    throw p0

    :catchall_5e
    move-exception p0

    goto :goto_5c

    :cond_60
    new-instance p0, Lybl;

    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lybl;-><init>(I)V

    invoke-virtual {v1, p0}, Lekc;->n(Ljava/lang/Object;)V

    monitor-exit v0

    :goto_6a
    return-void

    :goto_6b
    monitor-exit v0
    :try_end_6c
    .catchall {:try_start_5d .. :try_end_6c} :catchall_6d

    throw p0

    :catchall_6d
    move-exception p0

    goto :goto_6b

    nop

    :pswitch_data_70
    .packed-switch 0x8
        :pswitch_39
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lrn9;->a:B

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Lood;

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lnod;

    iget-boolean v1, p0, Lrn9;->b:Z

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lnpd;

    iget-object v2, p0, Lnpd;->t:Lxkg;

    invoke-static {v2, p1}, Lz5i;->n0(Lgig;Lood;)V

    iget-object p1, p0, Lnpd;->t:Lxkg;

    invoke-static {p1}, Ltym;->F(Lgig;)Z

    if-eqz v1, :cond_20

    invoke-virtual {p0, v0}, Lnpd;->o(Lnod;)V

    :cond_20
    return-void

    :pswitch_21
    check-cast p1, Leg9;

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_26
    iget-boolean v1, p0, Lrn9;->b:Z

    if-eqz v1, :cond_2c

    monitor-exit v0

    goto :goto_44

    :cond_2c
    if-nez p1, :cond_30

    monitor-exit v0

    goto :goto_44

    :cond_30
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    new-instance v1, Lybl;

    iget-boolean p1, p1, Leg9;->a:Z

    if-eqz p1, :cond_3c

    const/4 p1, 0x2

    goto :goto_3d

    :cond_3c
    const/4 p1, 0x3

    :goto_3d
    invoke-direct {v1, p1}, Lybl;-><init>(I)V

    invoke-virtual {p0, v1}, Lekc;->n(Ljava/lang/Object;)V

    monitor-exit v0

    :goto_44
    return-void

    :goto_45
    monitor-exit v0
    :try_end_46
    .catchall {:try_start_26 .. :try_end_46} :catchall_47

    throw p0

    :catchall_47
    move-exception p0

    goto :goto_45

    nop

    :pswitch_data_4a
    .packed-switch 0x8
        :pswitch_21
    .end packed-switch
.end method

.method public final p(Ligi;)Lte2;
    .registers 8

    const-string v0, "createCodec:"

    iget-object v1, p1, Ligi;->b:Ljava/lang/Object;

    check-cast v1, Logd;

    iget-object v1, v1, Logd;->a:Ljava/lang/String;

    const/4 v2, 0x0

    :try_start_9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_1c} :catch_7b

    :try_start_1c
    iget-boolean v1, p0, Lrn9;->b:Z

    if-eqz v1, :cond_2d

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x24

    if-lt v1, v3, :cond_2d

    new-instance v1, Loji;

    invoke-direct {v1, v0}, Loji;-><init>(Ljava/lang/Object;)V

    const/4 v3, 0x4

    goto :goto_3d

    :cond_2d
    new-instance v1, Lwe2;

    iget-object v3, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v3, Lse2;

    invoke-virtual {v3}, Lse2;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/HandlerThread;

    invoke-direct {v1, v0, v3}, Lwe2;-><init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;)V

    const/4 v3, 0x0

    :goto_3d
    new-instance v4, Lte2;

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Lse2;

    invoke-virtual {p0}, Lse2;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/HandlerThread;

    iget-object v5, p1, Ligi;->g:Ljava/lang/Object;

    check-cast v5, Lr3d;

    invoke-direct {v4, v0, p0, v1, v5}, Lte2;-><init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;Lmgd;Lr3d;)V
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_50} :catch_79

    :try_start_50
    invoke-static {}, Landroid/os/Trace;->endSection()V

    iget-object p0, p1, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Landroid/view/Surface;

    if-nez p0, :cond_69

    iget-object v1, p1, Ligi;->b:Ljava/lang/Object;

    check-cast v1, Logd;

    iget-boolean v1, v1, Logd;->h:Z

    if-eqz v1, :cond_69

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x23

    if-lt v1, v2, :cond_69

    or-int/lit8 v3, v3, 0x8

    :cond_69
    iget-object v1, p1, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Landroid/media/MediaFormat;

    iget-object p1, p1, Ligi;->f:Ljava/lang/Object;

    check-cast p1, Landroid/media/MediaCrypto;

    invoke-virtual {v4, v1, p0, p1, v3}, Lte2;->s(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_74} :catch_77

    return-object v4

    :goto_75
    move-object v2, v4

    goto :goto_7d

    :catch_77
    move-exception p0

    goto :goto_75

    :catch_79
    move-exception p0

    goto :goto_7d

    :catch_7b
    move-exception p0

    move-object v0, v2

    :goto_7d
    if-nez v2, :cond_85

    if-eqz v0, :cond_88

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    goto :goto_88

    :cond_85
    invoke-virtual {v2}, Lte2;->release()V

    :cond_88
    :goto_88
    throw p0
.end method

.method public final q()I
    .registers 2

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->getMaxImages()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d
.end method

.method public final r(Z)V
    .registers 10

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Ls65;

    iget-object v1, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lr65;

    const/4 v2, 0x0

    if-eqz p1, :cond_a2

    invoke-virtual {v1}, Lr65;->d()Z

    move-result p1

    if-eqz p1, :cond_a2

    iget-boolean p0, p0, Lrn9;->b:Z

    iget-object p1, v1, Lr65;->h:Lru9;

    invoke-virtual {v1}, Lr65;->d()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_52

    if-nez p0, :cond_3f

    iget-boolean p0, v1, Lr65;->s:Z

    if-nez p0, :cond_52

    iget-object p0, v1, Lr65;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_52

    invoke-virtual {v1}, Lr65;->k()Z

    move-result p0

    if-nez p0, :cond_52

    sget p0, Lr65;->z:I

    invoke-static {p1}, Li41;->j0(Lru9;)Z

    move-result p0

    if-eqz p0, :cond_41

    :cond_3f
    move p0, v4

    goto :goto_53

    :cond_41
    iget-object p0, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "startup.request_cmp_consent"

    invoke-interface {p0, p1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_52

    iget-object p0, v1, Lr65;->o:Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    if-eqz p0, :cond_52

    iget-boolean p0, p0, Lcom/usercentrics/sdk/UsercentricsReadyStatus;->a:Z

    goto :goto_53

    :cond_52
    move p0, v5

    :goto_53
    if-eqz p0, :cond_98

    iget-object p1, v1, Lr65;->i:Lf1p;

    invoke-virtual {p1, v4}, Lf1p;->r(Z)Lxrf;

    move-result-object p1

    iget-object v3, v1, Lr65;->p:Lcom/usercentrics/sdk/UsercentricsOptions;

    if-eqz v3, :cond_83

    iget-object v6, v3, Lcom/usercentrics/sdk/UsercentricsOptions;->c:Ljava/lang/String;

    iget-object v3, v3, Lcom/usercentrics/sdk/UsercentricsOptions;->a:Ljava/lang/String;

    iget-object v7, p1, Lxrf;->a:Ljava/lang/String;

    invoke-static {v3, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7d

    const-string v3, "latest"

    invoke-static {v6, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7e

    iget-object v3, p1, Lxrf;->b:Lo65;

    iget-object v3, v3, Lo65;->a:Ljava/lang/String;

    invoke-static {v6, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7e

    :cond_7d
    move v4, v5

    :cond_7e
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_84

    :cond_83
    move-object v3, v2

    :goto_84
    if-eqz v3, :cond_8b

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_8c

    :cond_8b
    move v3, v5

    :goto_8c
    invoke-virtual {v1, v5}, Lr65;->l(Z)Z

    move-result v4

    if-nez v3, :cond_98

    if-eqz v4, :cond_98

    invoke-virtual {v1, p1}, Lr65;->g(Lxrf;)V

    return-void

    :cond_98
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Ls65;->run(Ljava/lang/Object;)V

    iput-object v2, v1, Lr65;->r:Lrn9;

    return-void

    :cond_a2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ls65;->run(Ljava/lang/Object;)V

    iput-object v2, v1, Lr65;->r:Lrn9;

    return-void
.end method

.method public final show()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    const/4 v0, 0x6

    invoke-static {v0}, Lwxe;->V(I)V
    :try_end_b
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_b} :catch_c

    return-void

    :catch_c
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lrn9;->G([I)V

    return-void
.end method

.method public final t()V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrn9;->b:Z

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lqb;

    iget-object v1, v0, Lqb;->h:Lrn9;

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x0

    iput-object p0, v0, Lqb;->h:Lrn9;

    :cond_12
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lrn9;->a:B

    packed-switch v0, :pswitch_data_34

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{numRequests="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", isPaused="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lrn9;->b:Z

    const-string v1, "}"

    invoke-static {v0, p0, v1}, Lz1m;->m(Ljava/lang/StringBuilder;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_34
    .packed-switch 0x1a
        :pswitch_a
    .end packed-switch
.end method

.method public final w(Ltya;Ljava/util/concurrent/Executor;)V
    .registers 5

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    iput-boolean v1, p0, Lrn9;->b:Z

    new-instance v1, Ll71;

    invoke-direct {v1, p0, p2, p1}, Ll71;-><init>(Lrn9;Ljava/util/concurrent/Executor;Ltya;)V

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    sget-object p1, Lw7d;->a:Landroid/os/Handler;

    if-eqz p1, :cond_16

    sget-object p1, Lw7d;->a:Landroid/os/Handler;

    goto :goto_2a

    :cond_16
    const-class p1, Lw7d;

    monitor-enter p1
    :try_end_19
    .catchall {:try_start_4 .. :try_end_19} :catchall_35

    :try_start_19
    sget-object p2, Lw7d;->a:Landroid/os/Handler;

    if-nez p2, :cond_27

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-static {p2}, Landroid/os/Handler;->createAsync(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object p2

    sput-object p2, Lw7d;->a:Landroid/os/Handler;

    :cond_27
    monitor-exit p1
    :try_end_28
    .catchall {:try_start_19 .. :try_end_28} :catchall_31

    :try_start_28
    sget-object p1, Lw7d;->a:Landroid/os/Handler;

    :goto_2a
    invoke-virtual {p0, v1, p1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    monitor-exit v0
    :try_end_2e
    .catchall {:try_start_28 .. :try_end_2e} :catchall_35

    return-void

    :goto_2f
    :try_start_2f
    monitor-exit p1
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_31

    :try_start_30
    throw p0

    :catchall_31
    move-exception p0

    goto :goto_2f

    :goto_33
    monitor-exit v0
    :try_end_34
    .catchall {:try_start_30 .. :try_end_34} :catchall_35

    throw p0

    :catchall_35
    move-exception p0

    goto :goto_33
.end method

.method public final y()Lqya;
    .registers 5

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/ImageReader;

    invoke-virtual {p0}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_c} :catch_d
    .catchall {:try_start_4 .. :try_end_c} :catchall_29

    goto :goto_1b

    :catch_d
    move-exception p0

    :try_start_e
    const-string v2, "ImageReaderContext is not initialized"

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    move-object p0, v1

    :goto_1b
    if-nez p0, :cond_1f

    monitor-exit v0

    return-object v1

    :cond_1f
    new-instance v1, Lk71;

    invoke-direct {v1, p0}, Lk71;-><init>(Landroid/media/Image;)V

    monitor-exit v0

    return-object v1

    :cond_26
    throw p0

    :goto_27
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_e .. :try_end_28} :catchall_29

    throw p0

    :catchall_29
    move-exception p0

    goto :goto_27
.end method

.method public final z()Z
    .registers 6

    const/4 v0, 0x1

    move v1, v0

    :goto_2
    iget-object v2, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v2, [I

    array-length v3, v2

    if-ge v1, v3, :cond_18

    const/4 v3, 0x0

    aget v4, v2, v3

    aget v2, v2, v1

    invoke-static {v4, v2}, Lrn9;->h(II)Z

    move-result v2

    if-nez v2, :cond_15

    return v3

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_18
    return v0
.end method
