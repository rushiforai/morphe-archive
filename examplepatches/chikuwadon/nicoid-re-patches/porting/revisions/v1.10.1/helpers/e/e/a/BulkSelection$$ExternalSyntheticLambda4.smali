.class public final synthetic Le/e/a/BulkSelection$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Landroid/app/Activity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda4;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda4;->f$1:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda4;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda4;->f$1:Landroid/app/Activity;

    invoke-static {v0, v1}, Le/e/a/BulkSelection;->lambda$12(Ljava/util/ArrayList;Landroid/app/Activity;)V

    return-void
.end method
