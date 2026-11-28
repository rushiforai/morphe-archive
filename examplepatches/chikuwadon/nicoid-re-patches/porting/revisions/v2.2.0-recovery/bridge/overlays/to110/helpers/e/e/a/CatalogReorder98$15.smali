.class public final synthetic Le/e/a/CatalogReorder98$15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$installUnfiled$5"
    proto = "(Landroid/view/View;Landroid/view/DragEvent;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$15;->f$0:Le/e/a/CatalogReorder98;

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$15;->f$0:Le/e/a/CatalogReorder98;

    invoke-virtual {v0, p1, p2}, Le/e/a/CatalogReorder98;->lambda$installUnfiled$5$e-e-a-CatalogReorder98(Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
