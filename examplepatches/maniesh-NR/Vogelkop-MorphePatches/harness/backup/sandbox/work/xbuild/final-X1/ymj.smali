.class public final Lymj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lanj;

.field public b:Z

.field public final c:Z

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:F

.field public final h:F

.field public i:Landroid/graphics/PointF;

.field public j:Landroid/graphics/PointF;

.field public k:Landroid/graphics/PointF;

.field public final l:Landroid/text/TextPaint;

.field public final m:Landroid/text/TextPaint;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lanj;ILnrl;IIZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lymj;->a:Lanj;

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    sget p2, Lcom/opera/android/utilities/DisplayUtil;->e:F

    const/high16 p5, 0x40600000    # 3.5f

    cmpg-float p2, p2, p5

    const/4 p5, 0x0

    const/4 p6, 0x1

    if-gez p2, :cond_14

    move p2, p6

    goto :goto_15

    :cond_14
    move p2, p5

    :goto_15
    iput-boolean p2, p0, Lymj;->c:Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    iput p1, p0, Lymj;->d:F

    const/high16 p2, 0x40000000    # 2.0f

    mul-float/2addr p2, p1

    iput p2, p0, Lymj;->e:F

    const/high16 p2, 0x41a80000    # 21.0f

    mul-float/2addr p2, p1

    iput p2, p0, Lymj;->f:F

    const/high16 p2, 0x41300000    # 11.0f

    mul-float/2addr p2, p1

    iput p2, p0, Lymj;->g:F

    const/high16 p2, 0x40800000    # 4.0f

    mul-float/2addr p2, p1

    iput p2, p0, Lymj;->h:F

    new-instance p2, Landroid/text/TextPaint;

    invoke-direct {p2, p6}, Landroid/text/TextPaint;-><init>(I)V

    const-string p7, "sans-serif-medium"

    :try_start_3e
    invoke-static {p7, p5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p7
    :try_end_42
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3e .. :try_end_42} :catch_43

    goto :goto_45

    :catch_43
    sget-object p7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    :goto_45
    invoke-virtual {p2, p7}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-virtual {p4}, Lnrl;->w()Landroid/graphics/BitmapShader;

    move-result-object p7

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p2, p7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    if-eqz p7, :cond_5e

    new-instance p7, Landroid/graphics/PorterDuffColorFilter;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p7, p3, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p2, p7}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    :cond_5e
    iput-object p2, p0, Lymj;->l:Landroid/text/TextPaint;

    new-instance p2, Landroid/text/TextPaint;

    invoke-direct {p2, p6}, Landroid/text/TextPaint;-><init>(I)V

    const/high16 p6, 0x41000000    # 8.0f

    mul-float/2addr p1, p6

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    const-string p1, "sans-serif-condensed"

    :try_start_6d
    invoke-static {p1, p5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_71
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_6d .. :try_end_71} :catch_72

    goto :goto_74

    :catch_72
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    :goto_74
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-virtual {p4}, Lnrl;->w()Landroid/graphics/BitmapShader;

    move-result-object p1

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    if-eqz p1, :cond_8d

    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    sget-object p4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p3, p4}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    :cond_8d
    iput-object p2, p0, Lymj;->m:Landroid/text/TextPaint;

    return-void
.end method

.method public static a(Ljava/lang/String;Landroid/text/TextPaint;)Landroid/graphics/Rect;
    .registers 5

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, p0, v1, v2, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    return-object v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-nez p1, :cond_23

    const/4 p0, 0x0

    return-object p0

    :cond_23
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    :cond_28
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
