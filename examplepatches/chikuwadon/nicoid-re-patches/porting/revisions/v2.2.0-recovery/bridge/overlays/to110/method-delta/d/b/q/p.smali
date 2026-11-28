.class public Ld/b/q/p;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RestrictedAPI"
    }
.end annotation


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:Landroid/graphics/Rect;

.field public static d:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    sput-object v0, Ld/b/q/p;->a:[I

    new-array v0, v1, [I

    sput-object v0, Ld/b/q/p;->b:[I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Ld/b/q/p;->c:Landroid/graphics/Rect;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    const-string v0, "android.graphics.Insets"

    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Ld/b/q/p;->d:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;
    .registers 3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    return-object p1

    :pswitch_0
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :pswitch_1
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :pswitch_2
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :cond_0
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :cond_1
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :cond_2
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Landroid/graphics/drawable/Drawable;)Z
    .registers 2
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method public static b(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "className":Ljava/lang/String;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-ge v1, v2, :cond_0

    .line 77
    const-string v1, "android.graphics.drawable.ColorStateListDrawable"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    invoke-static {p0}, Ld/b/q/p;->forceDrawableStateChange235(Landroid/graphics/drawable/Drawable;)V

    .line 82
    :cond_0
    return-void
.end method

.method public static c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;
    .registers 7
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 57
    invoke-static {p0}, Ld/b/q/OpticalInsetsApi29_235;->getOpticalInsets(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Insets;

    move-result-object v0

    .line 58
    .local v0, "insets":Landroid/graphics/Insets;
    new-instance v1, Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Insets;->left:I

    iget v3, v0, Landroid/graphics/Insets;->top:I

    iget v4, v0, Landroid/graphics/Insets;->right:I

    iget v5, v0, Landroid/graphics/Insets;->bottom:I

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1

    .line 65
    .end local v0    # "insets":Landroid/graphics/Insets;
    :cond_0
    :try_start_0
    move-object v0, p0

    instance-of v1, v0, Ld/h/f/i/b;

    if-eqz v1, :cond_1

    check-cast v0, Ld/h/f/i/c;

    iget-object v0, v0, Ld/h/f/i/c;->f:Landroid/graphics/drawable/Drawable;

    :cond_1
    invoke-static {v0}, Ld/b/q/OpticalInsetsApi28_235;->getOpticalInsets(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;

    move-result-object v0

    sget-object v1, Ld/b/q/p;->c:Landroid/graphics/Rect;

    if-eq v0, v1, :cond_2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    :cond_2
    invoke-static {p0}, Ld/b/q/p;->legacyOpticalBounds235(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method private static forceDrawableStateChange235(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 99
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    .line 100
    .local v0, "originalState":[I
    if-eqz v0, :cond_0

    array-length v1, v0

    if-eqz v1, :cond_0

    .line 105
    sget-object v1, Ld/b/q/p;->b:[I

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_0

    .line 102
    :cond_0
    sget-object v1, Ld/b/q/p;->a:[I

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 108
    :goto_0
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 109
    return-void
.end method

.method private static legacyOpticalBounds235(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;
    .registers 13

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpticalInsets()Landroid/graphics/Insets;

    move-result-object p0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget v1, p0, Landroid/graphics/Insets;->left:I

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget v1, p0, Landroid/graphics/Insets;->right:I

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget v1, p0, Landroid/graphics/Insets;->top:I

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget p0, p0, Landroid/graphics/Insets;->bottom:I

    iput p0, v0, Landroid/graphics/Rect;->bottom:I

    return-object v0

    :cond_0
    sget-object v0, Ld/b/q/p;->d:Ljava/lang/Class;

    if-eqz v0, :cond_8

    .line 1
    :try_start_0
    instance-of v0, p0, Ld/h/f/i/b;

    if-eqz v0, :cond_1

    check-cast p0, Ld/h/f/i/c;

    .line 2
    iget-object p0, p0, Ld/h/f/i/c;->f:Landroid/graphics/drawable/Drawable;

    .line 3
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getOpticalInsets"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_8

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sget-object v1, Ld/b/q/p;->d:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_7

    aget-object v5, v1, v4

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v8

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x1

    sparse-switch v8, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v8, "right"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v7, 0x2

    goto :goto_1

    :sswitch_1
    const-string v8, "left"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v7, 0x0

    goto :goto_1

    :sswitch_2
    const-string v8, "top"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v7, 0x1

    goto :goto_1

    :sswitch_3
    const-string v8, "bottom"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v7, 0x3

    :cond_2
    :goto_1
    if-eqz v7, :cond_6

    if-eq v7, v11, :cond_5

    if-eq v7, v10, :cond_4

    if-eq v7, v9, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    iput v5, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_2

    :cond_4
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    iput v5, v0, Landroid/graphics/Rect;->right:I

    goto :goto_2

    :cond_5
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    iput v5, v0, Landroid/graphics/Rect;->top:I

    goto :goto_2

    :cond_6
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    iput v5, v0, Landroid/graphics/Rect;->left:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_7
    return-object v0

    :catch_0
    const-string p0, "DrawableUtils"

    const-string v0, "Couldn\'t obtain the optical insets. Ignoring."

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    sget-object p0, Ld/b/q/p;->c:Landroid/graphics/Rect;

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x527265d5 -> :sswitch_3
        0x1c155 -> :sswitch_2
        0x32a007 -> :sswitch_1
        0x677c21c -> :sswitch_0
    .end sparse-switch
.end method
