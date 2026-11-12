.class public final enum Lw6k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lw6k;

.field public static final enum b:Lw6k;

.field public static final synthetic c:[Lw6k;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lw6k;

    const-string v1, "BLACK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lw6k;->a:Lw6k;

    new-instance v1, Lw6k;

    const-string v2, "WHITE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lw6k;->b:Lw6k;

    filled-new-array {v0, v1}, [Lw6k;

    move-result-object v0

    sput-object v0, Lw6k;->c:[Lw6k;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw6k;
    .registers 2

    const-class v0, Lw6k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw6k;

    return-object p0
.end method

.method public static values()[Lw6k;
    .registers 1

    sget-object v0, Lw6k;->c:[Lw6k;

    invoke-virtual {v0}, [Lw6k;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw6k;

    return-object v0
.end method


# virtual methods
.method public final d(Lcom/opera/android/custom_views/StylingImageView;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_28

    const/4 v1, 0x1

    if-eq p0, v1, :cond_1f

    const p0, 0x7f040216

    const v1, 0x7f06063b

    invoke-static {p0, v0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    const v2, 0x7f040215

    invoke-static {v2, v0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    goto :goto_36

    :cond_1f
    const p0, 0x7f060f8c

    invoke-virtual {v0, p0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    const/4 p0, -0x1

    goto :goto_36

    :cond_28
    const p0, 0x7f0600b6

    invoke-virtual {v0, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    const v1, 0x7f060f8d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    :goto_36
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    instance-of v0, p0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_4e

    check-cast p0, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    :cond_4e
    return-void
.end method
