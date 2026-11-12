.class public final synthetic Lbz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Llyg;Ldx3;Lcom/opera/android/browser/chromium/ChromiumContent;II)V
    .registers 8

    .line 20
    const/4 v0, 0x0

    iput-byte v0, p0, Lbz4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbz4;->d:Ljava/lang/Object;

    iput-object p2, p0, Lbz4;->f:Ljava/lang/Object;

    iput-object p3, p0, Lbz4;->g:Ljava/lang/Object;

    iput-object p4, p0, Lbz4;->e:Ljava/lang/Object;

    iput p5, p0, Lbz4;->b:I

    iput p6, p0, Lbz4;->c:I

    return-void
.end method

.method public synthetic constructor <init>(Lkn8;IILandroid/graphics/Bitmap;Ljava/util/concurrent/Executor;Ln61;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lbz4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbz4;->d:Ljava/lang/Object;

    iput p2, p0, Lbz4;->b:I

    iput p3, p0, Lbz4;->c:I

    iput-object p4, p0, Lbz4;->e:Ljava/lang/Object;

    iput-object p5, p0, Lbz4;->f:Ljava/lang/Object;

    iput-object p6, p0, Lbz4;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lxqd;Lnod;ILnpd;ILvqd;)V
    .registers 8

    .line 19
    const/4 v0, 0x2

    iput-byte v0, p0, Lbz4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbz4;->d:Ljava/lang/Object;

    iput-object p2, p0, Lbz4;->e:Ljava/lang/Object;

    iput p3, p0, Lbz4;->b:I

    iput-object p4, p0, Lbz4;->f:Ljava/lang/Object;

    iput p5, p0, Lbz4;->c:I

    iput-object p6, p0, Lbz4;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 12

    iget-byte v0, p0, Lbz4;->a:B

    iget-object v1, p0, Lbz4;->g:Ljava/lang/Object;

    iget v2, p0, Lbz4;->c:I

    iget-object v3, p0, Lbz4;->f:Ljava/lang/Object;

    iget v4, p0, Lbz4;->b:I

    iget-object v5, p0, Lbz4;->e:Ljava/lang/Object;

    iget-object p0, p0, Lbz4;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e8

    check-cast p0, Lxqd;

    check-cast v5, Lnod;

    check-cast v3, Lnpd;

    check-cast v1, Lvqd;

    iget-object p0, p0, Lxqd;->b:Lvzk;

    invoke-virtual {p0, v5, v4}, Lvzk;->T(Lnod;I)Z

    move-result v0

    if-nez v0, :cond_2b

    new-instance p0, Le4j;

    const/4 v0, -0x4

    invoke-direct {p0, v0}, Le4j;-><init>(I)V

    invoke-static {v3, v5, v2, p0}, Lxqd;->Y0(Lnpd;Lnod;ILe4j;)V

    goto :goto_4b

    :cond_2b
    iget-object v0, v3, Lnpd;->e:Lkod;

    invoke-virtual {v3, v5}, Lnpd;->r(Lnod;)Lnod;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v0, 0x1b

    if-ne v4, v0, :cond_43

    invoke-interface {v1, v3, v5, v2}, Lvqd;->l(Lnpd;Lnod;I)Ljava/lang/Object;

    new-instance v0, Loqd;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v5, v4, v0}, Lvzk;->k(Lnod;ILvl5;)V

    goto :goto_4b

    :cond_43
    new-instance v0, Lpqd;

    invoke-direct {v0, v1, v3, v5, v2}, Lpqd;-><init>(Lvqd;Lnpd;Lnod;I)V

    invoke-virtual {p0, v5, v4, v0}, Lvzk;->k(Lnod;ILvl5;)V

    :goto_4b
    return-void

    :pswitch_4c
    check-cast p0, Lkn8;

    check-cast v5, Landroid/graphics/Bitmap;

    check-cast v3, Ljava/util/concurrent/Executor;

    check-cast v1, Ln61;

    new-instance v0, Landroid/media/FaceDetector;

    iget p0, p0, Lkn8;->a:I

    invoke-direct {v0, v4, v2, p0}, Landroid/media/FaceDetector;-><init>(III)V

    new-array p0, p0, [Landroid/media/FaceDetector$Face;

    invoke-virtual {v0, v5, p0}, Landroid/media/FaceDetector;->findFaces(Landroid/graphics/Bitmap;[Landroid/media/FaceDetector$Face;)I

    move-result v0

    new-array v2, v0, [Lpn8;

    const/4 v4, 0x0

    move v5, v4

    :goto_65
    if-ge v5, v0, :cond_a1

    new-instance v6, Lpn8;

    invoke-direct {v6, v4}, Lpn8;-><init>(I)V

    aput-object v6, v2, v5

    aget-object v6, p0, v5

    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {v6, v7}, Landroid/media/FaceDetector$Face;->getMidPoint(Landroid/graphics/PointF;)V

    invoke-virtual {v6}, Landroid/media/FaceDetector$Face;->eyesDistance()F

    move-result v6

    aget-object v8, v2, v5

    new-instance v9, Lwoh;

    invoke-direct {v9, v4}, Lwoh;-><init>(I)V

    iput-object v9, v8, Lpn8;->b:Lwoh;

    aget-object v8, v2, v5

    iget-object v9, v8, Lpn8;->b:Lwoh;

    iget v10, v7, Landroid/graphics/PointF;->x:F

    sub-float/2addr v10, v6

    iput v10, v9, Lwoh;->b:F

    iget v7, v7, Landroid/graphics/PointF;->y:F

    sub-float/2addr v7, v6

    iput v7, v9, Lwoh;->c:F

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    iput v6, v9, Lwoh;->d:F

    iput v6, v9, Lwoh;->e:F

    new-array v6, v4, [Lpzb;

    iput-object v6, v8, Lpn8;->c:[Lpzb;

    add-int/lit8 v5, v5, 0x1

    goto :goto_65

    :cond_a1
    new-instance p0, Lcn7;

    const/16 v0, 0x12

    invoke-direct {p0, v1, v2, v0}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_ac
    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    check-cast v3, Llyg;

    check-cast v1, Ldx3;

    check-cast v5, Lcom/opera/android/browser/chromium/ChromiumContent;

    sget-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p0

    if-nez p0, :cond_e7

    new-instance p0, Ll45;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ll45;->a:Ljava/lang/Object;

    const v0, 0x7f140d4a

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll45;->b:Ljava/lang/Object;

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const v5, 0x7f1406c1

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll45;->c:Ljava/lang/Object;

    new-instance v0, Lz8b;

    invoke-direct {v0, v1}, Lz8b;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v3, p0, v0, v4, v2}, Llyg;->f(Lorg/chromium/printing/Printable;Liyg;II)V

    invoke-virtual {v3}, Llyg;->g()V

    :cond_e7
    return-void

    :pswitch_data_e8
    .packed-switch 0x0
        :pswitch_ac
        :pswitch_4c
    .end packed-switch
.end method
