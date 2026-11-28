.class public Ld/h/e/a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/h/e/a$a;
    }
.end annotation


# static fields
.field public static final a:Ljava/lang/Object;

.field public static b:Landroid/util/TypedValue;


# direct methods
.method public static a(Landroid/content/Context;I)I
    .registers 3

    invoke-static {p0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public static c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 3

    invoke-static {p0, p1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method
