.class final Le/e/a/FullscreenViewport208$Moved;
.super Ljava/lang/Object;
.source "FullscreenViewport208.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport208;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Moved"
.end annotation


# instance fields
.field final index:I

.field final parent:Landroid/view/ViewGroup;

.field final view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FullscreenViewport208$Moved;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Le/e/a/FullscreenViewport208$Moved;->parent:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Le/e/a/FullscreenViewport208$Moved;->index:I

    return-void
.end method
