.class public final synthetic Le/e/a/CatalogReorder98$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$toggleSelection$9"
    proto = "()V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CatalogReorder98;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CatalogReorder98;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$5;->f$0:Le/e/a/CatalogReorder98;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$5;->f$0:Le/e/a/CatalogReorder98;

    invoke-virtual {v0}, Le/e/a/CatalogReorder98;->lambda$toggleSelection$9$e-e-a-CatalogReorder98()V

    return-void
.end method
