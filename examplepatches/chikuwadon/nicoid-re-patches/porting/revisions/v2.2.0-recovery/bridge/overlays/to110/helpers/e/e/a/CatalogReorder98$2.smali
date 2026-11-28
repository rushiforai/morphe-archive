.class public final synthetic Le/e/a/CatalogReorder98$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$toggleSelection$6"
    proto = "(Le/e/a/CatalogReorder98$Item;Landroid/widget/CompoundButton;Z)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;

.field public final synthetic f$1:Le/e/a/CatalogReorder98$Item;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;Le/e/a/CatalogReorder98$Item;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$2;->f$0:Le/e/a/CatalogReorder98;

    iput-object p2, p0, Le/e/a/CatalogReorder98$2;->f$1:Le/e/a/CatalogReorder98$Item;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$2;->f$0:Le/e/a/CatalogReorder98;

    iget-object v1, p0, Le/e/a/CatalogReorder98$2;->f$1:Le/e/a/CatalogReorder98$Item;

    invoke-virtual {v0, v1, p1, p2}, Le/e/a/CatalogReorder98;->lambda$toggleSelection$6$e-e-a-CatalogReorder98(Le/e/a/CatalogReorder98$Item;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
