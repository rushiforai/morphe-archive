.class Le/e/a/QueueUi120$2;
.super Landroid/view/ViewOutlineProvider;
.source "QueueUi120.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/QueueUi120;->render()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/QueueUi120;


# direct methods
.method constructor <init>(Le/e/a/QueueUi120;)V
    .registers 2

    .line 10
    iput-object p1, p0, Le/e/a/QueueUi120$2;->this$0:Le/e/a/QueueUi120;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .registers 9

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    iget-object p1, p0, Le/e/a/QueueUi120$2;->this$0:Le/e/a/QueueUi120;

    iget-object p1, p1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/4 v0, 0x6

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float v5, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void
.end method
