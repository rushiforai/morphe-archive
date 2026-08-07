.class public Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/CardLabelShowView;->onDraw(Landroid/graphics/Canvas;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/TagCategories;

.field public final synthetic b:Lcom/p1/mobile/putong/core/view/CardLabelShowView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/CardLabelShowView;Lcom/p1/mobile/putong/core/data/TagCategories;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;->b:Lcom/p1/mobile/putong/core/view/CardLabelShowView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;->a:Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;->b:Lcom/p1/mobile/putong/core/view/CardLabelShowView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;->a:Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;->b:Lcom/p1/mobile/putong/core/view/CardLabelShowView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;->a(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
