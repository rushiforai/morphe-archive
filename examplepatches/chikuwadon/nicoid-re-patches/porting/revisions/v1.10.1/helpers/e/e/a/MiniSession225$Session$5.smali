.class Le/e/a/MiniSession225$Session$5;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225$Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$Session;


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;)V
    .registers 2

    .line 131
    iput-object p1, p0, Le/e/a/MiniSession225$Session$5;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 11

    .line 131
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MiniSession225$Session$5;->this$1:Le/e/a/MiniSession225$Session;

    if-ne p1, v0, :cond_21

    iget-object p1, p0, Le/e/a/MiniSession225$Session$5;->this$1:Le/e/a/MiniSession225$Session;

    iget-object p1, p1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_21

    sub-int/2addr p4, p2

    sub-int/2addr p8, p6

    if-ne p4, p8, :cond_16

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_21

    :cond_16
    iget-object p1, p0, Le/e/a/MiniSession225$Session$5;->this$1:Le/e/a/MiniSession225$Session;

    iget-object p2, p0, Le/e/a/MiniSession225$Session$5;->this$1:Le/e/a/MiniSession225$Session;

    iget-object p2, p2, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget p2, p2, Le/e/a/MiniState225;->fraction:F

    invoke-virtual {p1, p2}, Le/e/a/MiniSession225$Session;->apply(F)V

    :cond_21
    return-void
.end method
