.class final Le/e/a/FullscreenViewport204$Saved;
.super Ljava/lang/Object;
.source "FullscreenViewport204.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport204;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Saved"
.end annotation


# instance fields
.field final clip:Landroid/graphics/Rect;

.field final padding:[I

.field final params:Landroid/view/ViewGroup$LayoutParams;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 6

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    # invokes: Le/e/a/FullscreenViewport204;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v0}, Le/e/a/FullscreenViewport204;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenViewport204$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v0

    iput-object v0, p0, Le/e/a/FullscreenViewport204$Saved;->padding:[I

    invoke-virtual {p1}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object p1

    iput-object p1, p0, Le/e/a/FullscreenViewport204$Saved;->clip:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method restore(Landroid/view/View;)V
    .registers 7

    .line 39
    iget-object v0, p0, Le/e/a/FullscreenViewport204$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Saved;->padding:[I

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    const/4 v3, 0x2

    aget v3, v0, v3

    const/4 v4, 0x3

    aget v0, v0, v4

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Saved;->clip:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    return-void
.end method
