.class public final synthetic Le/e/a/CatalogReorder98$14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$enter$4"
    proto = "(Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/view/View;Landroid/view/DragEvent;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;

.field public final synthetic f$1:Le/e/a/CatalogReorder98$Item;

.field public final synthetic f$2:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;Le/e/a/CatalogReorder98$Item;Landroid/view/View;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$14;->f$0:Le/e/a/CatalogReorder98;

    iput-object p2, p0, Le/e/a/CatalogReorder98$14;->f$1:Le/e/a/CatalogReorder98$Item;

    iput-object p3, p0, Le/e/a/CatalogReorder98$14;->f$2:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$14;->f$0:Le/e/a/CatalogReorder98;

    iget-object v1, p0, Le/e/a/CatalogReorder98$14;->f$1:Le/e/a/CatalogReorder98$Item;

    iget-object v2, p0, Le/e/a/CatalogReorder98$14;->f$2:Landroid/view/View;

    invoke-virtual {v0, v1, v2, p1, p2}, Le/e/a/CatalogReorder98;->lambda$enter$4$e-e-a-CatalogReorder98(Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
