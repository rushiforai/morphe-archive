.class public final Lg8i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Landroid/graphics/Typeface;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:I

.field public c:I

.field public d:Landroid/graphics/drawable/Drawable;

.field public e:Ljava/lang/String;

.field public f:I

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    sput-object v0, Lg8i;->h:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lg8i;->c:I

    const v0, -0x4c000001

    iput v0, p0, Lg8i;->f:I

    iput-object p1, p0, Lg8i;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()Landroid/graphics/drawable/Drawable;
    .registers 9

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    iget v2, p0, Lg8i;->b:I

    iget-object v3, p0, Lg8i;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eqz v2, :cond_18

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_1e

    :cond_18
    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    :goto_1e
    invoke-virtual {v0, v2, v2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    iget v2, p0, Lg8i;->c:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v2, p0, Lg8i;->d:Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez v2, :cond_2e

    move-object v6, v5

    goto :goto_35

    :cond_2e
    new-instance v6, Lw3a;

    const/16 v7, 0x11

    invoke-direct {v6, v2, v7, v4}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    :goto_35
    iget-object v2, p0, Lg8i;->e:Ljava/lang/String;

    if-eqz v2, :cond_57

    iget v2, p0, Lg8i;->g:I

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v2, :cond_46

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_4c

    :cond_46
    const/high16 v2, 0x41c00000    # 24.0f

    invoke-static {v2, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    :goto_4c
    iget v3, p0, Lg8i;->f:I

    new-instance v5, Lngl;

    iget-object p0, p0, Lg8i;->e:Ljava/lang/String;

    sget-object v7, Lg8i;->h:Landroid/graphics/Typeface;

    invoke-direct {v5, p0, v7, v2, v3}, Lngl;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    :cond_57
    if-nez v6, :cond_5a

    move-object v6, v5

    :cond_5a
    if-nez v6, :cond_5d

    return-object v0

    :cond_5d
    new-instance p0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v2, v4

    aput-object v6, v2, v1

    invoke-direct {p0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method
