.class public Ll/oyh0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/graphics/drawable/Drawable;Landroid/widget/TextView;Landroid/content/res/TypedArray;Landroid/content/Context;ZI)V
    .locals 0

    .line 1
    invoke-virtual {p2, p5}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p1, p0}, Ll/bnl0;->l(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public static b(Landroid/widget/TextView;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8

    .line 1
    sget-object v0, Ll/hhc0;->i5:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 5
    .line 6
    .line 7
    move-result-object v4

    .line 8
    const/4 v6, 0x1

    .line 9
    sget v7, Ll/hhc0;->q5:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move-object v3, p0

    .line 13
    move-object v5, p1

    .line 14
    invoke-static/range {v2 .. v7}, Ll/oyh0;->a(Landroid/graphics/drawable/Drawable;Landroid/widget/TextView;Landroid/content/res/TypedArray;Landroid/content/Context;ZI)V

    .line 15
    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    sget v7, Ll/hhc0;->r5:I

    .line 19
    .line 20
    invoke-static/range {v2 .. v7}, Ll/oyh0;->a(Landroid/graphics/drawable/Drawable;Landroid/widget/TextView;Landroid/content/res/TypedArray;Landroid/content/Context;ZI)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
