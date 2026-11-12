.class public final Lff2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lff2;


# instance fields
.field public final a:[I

.field public final b:Landroid/util/TypedValue;

.field public final c:Ljava/lang/String;

.field public final d:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [I

    new-instance v2, Lff2;

    invoke-direct {v2, v1, v0}, Lff2;-><init>([ILandroid/util/TypedValue;)V

    sput-object v2, Lff2;->e:Lff2;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;[I)V
    .registers 4

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p3, p0, Lff2;->a:[I

    const/4 p3, 0x0

    .line 16
    iput-object p3, p0, Lff2;->b:Landroid/util/TypedValue;

    .line 17
    iput-object p2, p0, Lff2;->c:Ljava/lang/String;

    .line 18
    iput p1, p0, Lff2;->d:I

    return-void
.end method

.method public constructor <init>([ILandroid/util/TypedValue;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lff2;->a:[I

    iput-object p2, p0, Lff2;->b:Landroid/util/TypedValue;

    const/4 p1, 0x0

    iput-object p1, p0, Lff2;->c:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lff2;->d:I

    return-void
.end method

.method public static a(Lzg;[I)Lff2;
    .registers 12

    iget-object v0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/AttributeSet;

    iget-object v1, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    iget v2, p0, Lzg;->a:I

    const/4 v3, 0x0

    if-eqz v0, :cond_9e

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    iget-object v6, p0, Lzg;->d:Ljava/lang/Object;

    check-cast v6, Landroid/content/res/Resources$Theme;

    if-nez v6, :cond_2a

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    iput-object v6, p0, Lzg;->d:Ljava/lang/Object;

    :cond_2a
    const/4 v1, 0x0

    invoke-virtual {v6, v0, p1, v1, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v6

    invoke-virtual {v6, v1, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v7

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    const/4 v6, 0x2

    if-eqz v7, :cond_54

    iget p0, v5, Landroid/util/TypedValue;->type:I

    if-ne p0, v6, :cond_44

    iget p0, v5, Landroid/util/TypedValue;->data:I

    const v0, 0x7f04007c

    if-eq p0, v0, :cond_9e

    :cond_44
    iget p0, v5, Landroid/util/TypedValue;->resourceId:I

    const v0, 0x7f060207

    if-ne p0, v0, :cond_4e

    sget-object p0, Lff2;->e:Lff2;

    return-object p0

    :cond_4e
    new-instance p0, Lff2;

    invoke-direct {p0, p1, v5}, Lff2;-><init>([ILandroid/util/TypedValue;)V

    return-object p0

    :cond_54
    move v7, v1

    :goto_55
    invoke-interface {v0}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v8

    if-ge v7, v8, :cond_66

    invoke-interface {v0, v7}, Landroid/util/AttributeSet;->getAttributeNameResource(I)I

    move-result v8

    aget v9, p1, v1

    if-eq v8, v9, :cond_9e

    add-int/lit8 v7, v7, 0x1

    goto :goto_55

    :cond_66
    invoke-interface {v0}, Landroid/util/AttributeSet;->getStyleAttribute()I

    move-result v7

    if-eqz v7, :cond_83

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "attr"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_81

    invoke-static {p0, v7, p1}, Lff2;->e(Lzg;I[I)I

    move-result v8

    goto :goto_84

    :cond_81
    const/4 v8, 0x3

    goto :goto_84

    :cond_83
    move v8, v6

    :goto_84
    if-eqz v2, :cond_8b

    invoke-static {p0, v2, p1}, Lff2;->e(Lzg;I[I)I

    move-result p0

    goto :goto_8c

    :cond_8b
    move p0, v6

    :goto_8c
    if-ne p0, v6, :cond_9f

    const/4 p0, 0x1

    if-eq v8, p0, :cond_9f

    invoke-virtual {v4, v0, p1, v2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {p0, v1, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v4

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    if-nez v4, :cond_9f

    :cond_9e
    return-object v3

    :cond_9f
    if-nez v7, :cond_ad

    new-instance p0, Lff2;

    const-string v0, "?"

    invoke-static {v2, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0, p1}, Lff2;-><init>(ILjava/lang/String;[I)V

    return-object p0

    :cond_ad
    const-string p0, "style"

    invoke-interface {v0, v3, p0}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lff2;

    invoke-direct {v0, v2, p0, p1}, Lff2;-><init>(ILjava/lang/String;[I)V

    return-object v0
.end method

.method public static b(Lff2;)Z
    .registers 2

    if-eqz p0, :cond_8

    sget-object v0, Lff2;->e:Lff2;

    if-eq p0, v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    const/4 p0, 0x1

    return p0
.end method

.method public static d(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/util/TypedValue;
    .registers 6

    iget v0, p1, Landroid/util/TypedValue;->resourceId:I

    const v1, 0x7f060207

    const/4 v2, 0x0

    if-ne v0, v1, :cond_9

    return-object v2

    :cond_9
    iget v1, p1, Landroid/util/TypedValue;->type:I

    if-eqz v1, :cond_3c

    const/4 v3, 0x1

    if-eq v1, v3, :cond_39

    const/4 v0, 0x2

    if-eq v1, v0, :cond_26

    const/4 p0, 0x3

    if-eq v1, p0, :cond_3b

    const/4 p0, 0x5

    if-eq v1, p0, :cond_3b

    const/16 p0, 0x10

    if-eq v1, p0, :cond_3b

    const/16 p0, 0x1c

    if-lt v1, p0, :cond_3c

    const/16 p0, 0x1f

    if-gt v1, p0, :cond_3c

    goto :goto_3b

    :cond_26
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    iget p1, p1, Landroid/util/TypedValue;->data:I

    invoke-virtual {v1, p1, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    invoke-static {p0, v0}, Lff2;->d(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/util/TypedValue;

    move-result-object p0

    return-object p0

    :cond_39
    if-eqz v0, :cond_3c

    :cond_3b
    :goto_3b
    return-object p1

    :cond_3c
    return-object v2
.end method

.method public static e(Lzg;I[I)I
    .registers 7

    iget-object v0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_4a

    iget p1, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_46

    iget-object v3, p0, Lzg;->d:Ljava/lang/Object;

    check-cast v3, Landroid/content/res/Resources$Theme;

    if-nez v3, :cond_35

    iget-object v3, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    iput-object v3, p0, Lzg;->d:Ljava/lang/Object;

    :cond_35
    const/4 p0, 0x0

    invoke-virtual {v3, p0, p2, v0, p1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result p1

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p1, :cond_44

    return v2

    :cond_44
    const/4 p0, 0x2

    return p0

    :cond_46
    invoke-static {}, Lhai;->d()V

    return v0

    :cond_4a
    invoke-static {}, Lhai;->d()V

    return v0
.end method

.method public static f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;
    .registers 4

    iget v0, p1, Landroid/util/TypedValue;->type:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_11

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_11

    iget p0, p1, Landroid/util/TypedValue;->data:I

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_11
    const/4 v1, 0x1

    if-eq v0, v1, :cond_19

    const/4 v1, 0x3

    if-eq v0, v1, :cond_19

    const/4 p0, 0x0

    return-object p0

    :cond_19
    iget p1, p1, Landroid/util/TypedValue;->resourceId:I

    invoke-static {p1, p0}, Lnb6;->v(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public static g(Landroid/content/Context;Landroid/util/TypedValue;)I
    .registers 4

    iget v0, p1, Landroid/util/TypedValue;->type:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_7

    const/4 p0, 0x0

    return p0

    :cond_7
    iget p1, p1, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result p0

    return p0
.end method

.method public static h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;
    .registers 4

    iget v0, p1, Landroid/util/TypedValue;->type:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_12

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_12

    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    iget p1, p1, Landroid/util/TypedValue;->data:I

    invoke-direct {p0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    return-object p0

    :cond_12
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1a

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1a

    const/4 p0, 0x0

    return-object p0

    :cond_1a
    iget p1, p1, Landroid/util/TypedValue;->resourceId:I

    invoke-static {p1, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final c(Landroid/content/Context;)Landroid/util/TypedValue;
    .registers 10

    iget-object v0, p0, Lff2;->b:Landroid/util/TypedValue;

    if-eqz v0, :cond_9

    invoke-static {p1, v0}, Lff2;->d(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/util/TypedValue;

    move-result-object p0

    return-object p0

    :cond_9
    const-string v0, "?"

    iget-object v1, p0, Lff2;->c:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_47

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    :try_start_1b
    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_23
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_23} :catch_24

    goto :goto_36

    :catch_24
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v6, "attr"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v1, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    :goto_36
    if-eqz v1, :cond_45

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-virtual {v5, v1, v0, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_45

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_7b

    :cond_45
    move v0, v3

    goto :goto_7b

    :cond_47
    const-string v0, "@"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_cb

    const/16 v0, 0x2f

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v5, -0x1

    const-string v6, "style"

    if-ne v0, v5, :cond_6b

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v1, v6, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_7b

    :cond_6b
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v6, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    :goto_7b
    iget v1, p0, Lff2;->d:I

    if-eqz v1, :cond_a8

    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v6, v1, v5, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_a3

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    iget v5, v5, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v5, v4}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    goto :goto_ac

    :cond_a3
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    goto :goto_ac

    :cond_a8
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    :goto_ac
    new-instance v4, Landroid/util/TypedValue;

    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    iget-object p0, p0, Lff2;->a:[I

    if-eqz v0, :cond_ba

    invoke-virtual {v1, v0, p0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    goto :goto_be

    :cond_ba
    invoke-virtual {v1, p0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p0

    :goto_be
    invoke-virtual {p0, v3, v4}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v0

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v0, :cond_cb

    invoke-static {p1, v4}, Lff2;->d(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/util/TypedValue;

    move-result-object v2

    :cond_cb
    return-object v2
.end method
