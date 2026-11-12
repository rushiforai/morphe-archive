.class public final Lweg;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# static fields
.field public static final d:Lixh;

.field public static final e:Lixh;

.field public static final f:Lixh;

.field public static final g:Lixh;

.field public static final h:Lixh;

.field public static final i:Lixh;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x42480000    # 50.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lweg;->d:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x42200000    # 40.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lweg;->e:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lweg;->f:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lweg;->g:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lweg;->h:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lweg;->i:Lixh;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ljava/util/List;Lzw0;)V
    .registers 15

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_13

    new-array p2, v1, [Landroid/graphics/drawable/Drawable;

    new-instance p3, Lf08;

    invoke-direct {p3, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object p3, p2, v2

    goto/16 :goto_d1

    :cond_13
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/high16 v3, 0x42000000    # 32.0f

    if-ne v0, v1, :cond_30

    new-array v0, v1, [Landroid/graphics/drawable/Drawable;

    invoke-static {p1, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v1

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqw0;

    invoke-static {p1, v1, p2, p3}, Lnb6;->o(Lcom/opera/android/BrowserActivity;ILqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p2

    aput-object p2, v0, v2

    :goto_2d
    move-object p2, v0

    goto/16 :goto_d1

    :cond_30
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v4, 0x0

    const/high16 v5, 0x41f00000    # 30.0f

    const/4 v6, 0x2

    if-ne v0, v6, :cond_7c

    new-array v0, v6, [Landroid/graphics/drawable/Drawable;

    invoke-static {p1, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqw0;

    invoke-static {p1, v3, v6, p3}, Lnb6;->o(Lcom/opera/android/BrowserActivity;ILqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v3

    const v6, 0x3fee147b    # 1.86f

    invoke-static {p1, v6}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v6

    new-instance v7, Ly1m;

    invoke-direct {v7, v3, v6, v4, v5}, Ly1m;-><init>(Landroid/graphics/drawable/LayerDrawable;FFF)V

    aput-object v7, v0, v2

    invoke-static {p1, v5}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqw0;

    invoke-static {p1, v3, p2, p3}, Lnb6;->o(Lcom/opera/android/BrowserActivity;ILqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p2

    const/high16 p3, -0x3fc00000    # -3.0f

    invoke-static {p1, p3}, Lz7h;->i(Landroid/content/Context;F)F

    move-result p3

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {p1, v3}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v3

    new-instance v4, Ly1m;

    const/high16 v5, -0x3e900000    # -15.0f

    invoke-direct {v4, p2, p3, v3, v5}, Ly1m;-><init>(Landroid/graphics/drawable/LayerDrawable;FFF)V

    aput-object v4, v0, v1

    goto :goto_2d

    :cond_7c
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/graphics/drawable/Drawable;

    invoke-static {p1, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v7

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lqw0;

    invoke-static {p1, v7, v8, p3}, Lnb6;->o(Lcom/opera/android/BrowserActivity;ILqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v7

    const/high16 v8, 0x40400000    # 3.0f

    invoke-static {p1, v8}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v8

    new-instance v9, Ly1m;

    const/high16 v10, 0x41a00000    # 20.0f

    invoke-direct {v9, v7, v8, v4, v10}, Ly1m;-><init>(Landroid/graphics/drawable/LayerDrawable;FFF)V

    aput-object v9, v0, v2

    invoke-static {p1, v5}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqw0;

    invoke-static {p1, v4, v5, p3}, Lnb6;->o(Lcom/opera/android/BrowserActivity;ILqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v4

    const/high16 v5, -0x40000000    # -2.0f

    invoke-static {p1, v5}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v5

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {p1, v7}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v7

    new-instance v8, Ly1m;

    const/high16 v9, -0x3de00000    # -40.0f

    invoke-direct {v8, v4, v5, v7, v9}, Ly1m;-><init>(Landroid/graphics/drawable/LayerDrawable;FFF)V

    aput-object v8, v0, v1

    invoke-static {p1, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v1

    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqw0;

    invoke-static {p1, v1, p2, p3}, Lnb6;->o(Lcom/opera/android/BrowserActivity;ILqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p2

    aput-object p2, v0, v6

    goto/16 :goto_2d

    :goto_d1
    invoke-direct {p0, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    sget-object p2, Lweg;->d:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lweg;->a:I

    sget-object p2, Lweg;->e:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lweg;->b:I

    sget-object p2, Lweg;->f:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lweg;->c:I

    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result p1

    :goto_f0
    if-ge v2, p1, :cond_100

    const p2, 0x800013

    invoke-virtual {p0, v2, p2}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    iget p2, p0, Lweg;->c:I

    invoke-virtual {p0, v2, p2}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetStart(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_f0

    :cond_100
    return-void
.end method


# virtual methods
.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lweg;->b:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lweg;->a:I

    return p0
.end method
