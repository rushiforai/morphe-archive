.class public final Lnb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le2m;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lnb9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 2

    iget-byte p0, p0, Lnb9;->a:B

    packed-switch p0, :pswitch_data_28

    sget-object p0, Ljkn;->b:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p0}, Ljkn;->d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0

    if-eq p0, p1, :cond_10

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_10
    return-object p0

    :pswitch_11
    sget-object p0, Ljkn;->a:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p0}, Ljkn;->d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0

    if-eq p0, p1, :cond_1c

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_1c
    return-object p0

    :pswitch_1d
    const/high16 p0, 0x40000000    # 2.0f

    invoke-static {p0, p1}, Lz5i;->m0(FLandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_11
    .end packed-switch
.end method

.method public final key()Ljava/lang/String;
    .registers 1

    iget-byte p0, p0, Lnb9;->a:B

    packed-switch p0, :pswitch_data_e

    const-string p0, "WallpaperValidationTransformationPreview"

    return-object p0

    :pswitch_8
    const-string p0, "WallpaperValidationTransformationFull"

    return-object p0

    :pswitch_b
    const-string p0, "myflow-data-preview-blur"

    return-object p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
