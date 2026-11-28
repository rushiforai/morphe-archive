.class public final synthetic Le/e/a/CatalogReorder98$13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$enter$3"
    proto = "(Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/widget/ImageButton;Landroid/view/View;Landroid/view/MotionEvent;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;

.field public final synthetic f$1:Le/e/a/CatalogReorder98$Item;

.field public final synthetic f$2:Landroid/view/View;

.field public final synthetic f$3:Landroid/widget/ImageButton;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/widget/ImageButton;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$13;->f$0:Le/e/a/CatalogReorder98;

    iput-object p2, p0, Le/e/a/CatalogReorder98$13;->f$1:Le/e/a/CatalogReorder98$Item;

    iput-object p3, p0, Le/e/a/CatalogReorder98$13;->f$2:Landroid/view/View;

    iput-object p4, p0, Le/e/a/CatalogReorder98$13;->f$3:Landroid/widget/ImageButton;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$13;->f$0:Le/e/a/CatalogReorder98;

    iget-object v1, p0, Le/e/a/CatalogReorder98$13;->f$1:Le/e/a/CatalogReorder98$Item;

    iget-object v2, p0, Le/e/a/CatalogReorder98$13;->f$2:Landroid/view/View;

    iget-object v3, p0, Le/e/a/CatalogReorder98$13;->f$3:Landroid/widget/ImageButton;

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Le/e/a/CatalogReorder98;->lambda$enter$3$e-e-a-CatalogReorder98(Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/widget/ImageButton;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
