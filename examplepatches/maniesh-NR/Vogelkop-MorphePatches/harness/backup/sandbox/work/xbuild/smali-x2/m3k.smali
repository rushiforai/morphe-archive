.class public final Lm3k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:F

.field public final d:Ljava/lang/String;

.field public final e:Lcm;

.field public f:Ljava/lang/CharSequence;

.field public g:Ljava/lang/CharSequence;

.field public h:Ljava/lang/CharSequence;

.field public i:Ljava/lang/CharSequence;

.field public j:Landroid/graphics/Bitmap;

.field public k:I

.field public l:Landroid/graphics/Bitmap;

.field public m:Lyhe;

.field public n:Lyhe;

.field public final o:Ljava/util/ArrayList;

.field public p:Lt0f;

.field public q:I

.field public r:[J

.field public s:J

.field public t:Z

.field public u:Landroid/graphics/Bitmap;

.field public final v:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcm;)V
    .registers 7

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lm3k;->o:Ljava/util/ArrayList;

    const v1, 0x1050005

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lm3k;->a:I

    const v1, 0x1050006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lm3k;->b:I

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41e00000    # 28.0f

    mul-float/2addr v0, v1

    iput v0, p0, Lm3k;->c:F

    iput-object p2, p0, Lm3k;->d:Ljava/lang/String;

    iput-object p3, p0, Lm3k;->e:Lcm;

    iput-object p1, p0, Lm3k;->v:Landroid/content/Context;

    return-void
.end method

.method public static a(Lua7;Lt0f;)V
    .registers 14

    iget-object v0, p1, Lt0f;->b:Landroid/graphics/Bitmap;

    iget-object v1, p1, Lt0f;->d:Landroid/app/PendingIntent;

    iget-object v2, p1, Lt0f;->c:Ljava/lang/CharSequence;

    if-eqz v0, :cond_12

    invoke-static {v0}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v0

    new-instance v3, Lc1f;

    invoke-direct {v3, v0, v2, v1}, Lc1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    goto :goto_19

    :cond_12
    new-instance v3, Lc1f;

    iget v0, p1, Lt0f;->a:I

    invoke-direct {v3, v0, v2, v1}, Lc1f;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    :goto_19
    iget v0, p1, Lt0f;->e:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_44

    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    iget-object v6, p1, Lt0f;->f:Ljava/lang/String;

    new-instance v4, Lith;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const-string v5, "key_text_reply"

    const/4 v8, 0x1

    invoke-direct/range {v4 .. v11}, Lith;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;[Ljava/lang/CharSequence;ZILandroid/os/Bundle;Ljava/util/HashSet;)V

    iget-object p1, v3, Lc1f;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    if-nez p1, :cond_41

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, v3, Lc1f;->a:Ljava/lang/Object;

    :cond_41
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_44
    invoke-virtual {v3}, Lc1f;->a()Ld1f;

    move-result-object p1

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    iget-object p0, p0, Ll1f;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 3

    if-nez p0, :cond_3

    return-object p0

    :cond_3
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0x1400

    if-le v0, v1, :cond_10

    const/4 v0, 0x0

    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    :cond_10
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/graphics/Bitmap;Ljava/lang/String;Lyhe;ILjava/lang/String;)V
    .registers 15

    iget-object p0, p0, Lm3k;->o:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_39

    if-eqz p1, :cond_24

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    const/4 v2, -0x1

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_24
    new-instance v3, Lt0f;

    invoke-static {p2}, Lm3k;->d(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    iget-object p2, p3, Lyhe;->b:Ljava/lang/Object;

    move-object v6, p2

    check-cast v6, Landroid/app/PendingIntent;

    move-object v4, p1

    move v7, p4

    move-object v8, p5

    invoke-direct/range {v3 .. v8}, Lt0f;-><init>(Landroid/graphics/Bitmap;Ljava/lang/CharSequence;Landroid/app/PendingIntent;ILjava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_39
    const-string p0, "Cannot add more than 2 actions."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final c()Landroid/graphics/Bitmap;
    .registers 10

    iget-object v0, p0, Lm3k;->u:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lm3k;->h:Ljava/lang/CharSequence;

    iget v2, p0, Lm3k;->b:I

    iget v3, p0, Lm3k;->a:I

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-eqz v4, :cond_23

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    if-gt p0, v3, :cond_1d

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    if-gt p0, v2, :cond_1d

    return-object v0

    :cond_1d
    const/4 p0, 0x0

    invoke-static {v0, v3, v2, p0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_23
    if-eqz v1, :cond_4e

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    div-int/lit8 v5, v1, 0x2

    new-instance v1, Lo1;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lo1;-><init>(B)V

    invoke-virtual {v1, v0}, Lo1;->b(Ljava/lang/String;)V

    new-instance v2, La9i;

    iget v6, v1, Lo1;->c:I

    iget v7, v1, Lo1;->d:I

    iget v8, p0, Lm3k;->c:F

    iget v3, p0, Lm3k;->a:I

    iget v4, p0, Lm3k;->b:I

    invoke-direct/range {v2 .. v8}, La9i;-><init>(IIIIIF)V

    iget-object p0, v1, Lo1;->b:Ljava/lang/String;

    invoke-virtual {v2, p0}, La9i;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_4e
    const/4 p0, 0x0

    return-object p0
.end method
