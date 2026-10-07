.class public final Le/e/a/TagDictionary;
.super Ljava/lang/Object;
.source "TagDictionary.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/widget/Button;Lorg/json/JSONObject;)V
    .registers 2

    .line 7
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 8
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    .line 9
    return-void
.end method
