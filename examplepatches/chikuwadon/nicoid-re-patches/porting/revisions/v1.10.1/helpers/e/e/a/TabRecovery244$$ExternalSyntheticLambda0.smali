.class public final synthetic Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/SavedTabs227$Tab;

.field public final synthetic f$1:I

.field public final synthetic f$2:Le/e/a/MultiTabs227$Host;


# direct methods
.method public synthetic constructor <init>(Le/e/a/SavedTabs227$Tab;ILe/e/a/MultiTabs227$Host;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;->f$0:Le/e/a/SavedTabs227$Tab;

    iput p2, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;->f$2:Le/e/a/MultiTabs227$Host;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;->f$0:Le/e/a/SavedTabs227$Tab;

    iget v1, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda0;->f$2:Le/e/a/MultiTabs227$Host;

    invoke-static {v0, v1, v2, p1}, Le/e/a/TabRecovery244;->lambda$1(Le/e/a/SavedTabs227$Tab;ILe/e/a/MultiTabs227$Host;Landroid/view/View;)V

    return-void
.end method
