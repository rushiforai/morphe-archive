.class Le/e/a/FullscreenViewport209$4;
.super Ljava/lang/Object;
.source "FullscreenViewport209.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FullscreenViewport209;->normalStatus(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 2

    .line 77
    iput-object p1, p0, Le/e/a/FullscreenViewport209$4;->val$root:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 77
    iget-object p1, p0, Le/e/a/FullscreenViewport209$4;->val$root:Landroid/view/View;

    # invokes: Le/e/a/FullscreenViewport209;->normalStatus(Landroid/view/View;)V
    invoke-static {p1}, Le/e/a/FullscreenViewport209;->access$4(Landroid/view/View;)V

    return-void
.end method
