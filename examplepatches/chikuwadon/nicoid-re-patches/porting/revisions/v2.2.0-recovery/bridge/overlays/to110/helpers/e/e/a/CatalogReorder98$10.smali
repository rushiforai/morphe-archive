.class public final synthetic Le/e/a/CatalogReorder98$10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$save$14"
    proto = "(Ljava/lang/Boolean;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$10;->f$0:Le/e/a/CatalogReorder98;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$10;->f$0:Le/e/a/CatalogReorder98;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Le/e/a/CatalogReorder98;->lambda$save$14$e-e-a-CatalogReorder98(Ljava/lang/Boolean;)V

    return-void
.end method
