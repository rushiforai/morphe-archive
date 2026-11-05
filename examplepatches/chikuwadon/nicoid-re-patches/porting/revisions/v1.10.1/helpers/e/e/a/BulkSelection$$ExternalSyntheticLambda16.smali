.class public final synthetic Le/e/a/BulkSelection$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Le/e/a/BulkSelection$SelectionMark;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Le/e/a/BulkSelection$SelectionMark;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda16;->f$0:Landroid/view/View;

    iput-object p2, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda16;->f$1:Le/e/a/BulkSelection$SelectionMark;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda16;->f$0:Landroid/view/View;

    iget-object v1, p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda16;->f$1:Le/e/a/BulkSelection$SelectionMark;

    invoke-static {v0, v1}, Le/e/a/BulkSelection;->lambda$16(Landroid/view/View;Le/e/a/BulkSelection$SelectionMark;)V

    return-void
.end method
