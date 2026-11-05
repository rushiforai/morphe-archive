.class public final synthetic Le/e/a/TabRecovery244$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/MultiTabs227$Host;

.field public final synthetic f$1:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Le/e/a/MultiTabs227$Host;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda1;->f$0:Le/e/a/MultiTabs227$Host;

    iput-object p2, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda1;->f$1:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda1;->f$0:Le/e/a/MultiTabs227$Host;

    iget-object v1, p0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda1;->f$1:Landroid/widget/LinearLayout;

    invoke-static {v0, v1}, Le/e/a/TabRecovery244;->lambda$2(Le/e/a/MultiTabs227$Host;Landroid/widget/LinearLayout;)V

    return-void
.end method
