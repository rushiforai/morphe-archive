.class public final synthetic Le/e/a/CatalogReorder98$11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$applySort$2"
    proto = "(Ljava/text/Collator;Landroid/view/View;Landroid/view/View;)I"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;

.field public final synthetic f$1:Ljava/text/Collator;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;Ljava/text/Collator;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$11;->f$0:Le/e/a/CatalogReorder98;

    iput-object p2, p0, Le/e/a/CatalogReorder98$11;->f$1:Ljava/text/Collator;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$11;->f$0:Le/e/a/CatalogReorder98;

    iget-object v1, p0, Le/e/a/CatalogReorder98$11;->f$1:Ljava/text/Collator;

    check-cast p1, Landroid/view/View;

    check-cast p2, Landroid/view/View;

    invoke-virtual {v0, v1, p1, p2}, Le/e/a/CatalogReorder98;->lambda$applySort$2$e-e-a-CatalogReorder98(Ljava/text/Collator;Landroid/view/View;Landroid/view/View;)I

    move-result p1

    return p1
.end method
