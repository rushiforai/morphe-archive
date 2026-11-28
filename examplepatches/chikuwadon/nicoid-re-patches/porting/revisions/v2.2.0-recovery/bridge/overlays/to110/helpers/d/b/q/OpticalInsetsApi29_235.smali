.class public Ld/b/q/OpticalInsetsApi29_235;
.super Ljava/lang/Object;
.source "DrawableUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    return-void
.end method

.method public static getOpticalInsets(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Insets;
    .registers 2
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 217
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpticalInsets()Landroid/graphics/Insets;

    move-result-object v0

    return-object v0
.end method
