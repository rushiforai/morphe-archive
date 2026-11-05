.class Le/e/a/FullscreenViewport207$Session$2;
.super Ljava/lang/Object;
.source "FullscreenViewport207.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FullscreenViewport207$Session;->commentBounds(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/FullscreenViewport207$Session;


# direct methods
.method constructor <init>(Le/e/a/FullscreenViewport207$Session;)V
    .registers 2

    .line 173
    iput-object p1, p0, Le/e/a/FullscreenViewport207$Session$2;->this$1:Le/e/a/FullscreenViewport207$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 173
    iget-object p2, p0, Le/e/a/FullscreenViewport207$Session$2;->this$1:Le/e/a/FullscreenViewport207$Session;

    invoke-virtual {p2, p1}, Le/e/a/FullscreenViewport207$Session;->sync(Landroid/view/View;)V

    return-void
.end method
