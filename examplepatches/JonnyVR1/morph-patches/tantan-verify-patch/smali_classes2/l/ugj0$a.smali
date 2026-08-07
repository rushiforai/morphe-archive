.class Ll/ugj0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ugj0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ugj0;->n(Ll/w23;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ugj0$a;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    iget p0, p0, Ll/ugj0$a;->a:I

    .line 2
    .line 3
    int-to-float v0, p0

    .line 4
    int-to-float p0, p0

    .line 5
    invoke-virtual {p1, p3, v0, p0, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
