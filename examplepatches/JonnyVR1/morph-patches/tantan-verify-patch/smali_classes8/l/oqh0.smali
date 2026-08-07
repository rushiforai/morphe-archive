.class public Ll/oqh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/drawable/NinePatchDrawable;

.field public b:Landroid/graphics/Rect;


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


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/drawable/NinePatchDrawable;

    .line 2
    .line 3
    iput-object p1, p0, Ll/oqh0;->a:Landroid/graphics/drawable/NinePatchDrawable;

    .line 4
    .line 5
    new-instance p1, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/oqh0;->b:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget-object p0, p0, Ll/oqh0;->a:Landroid/graphics/drawable/NinePatchDrawable;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/NinePatchDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
