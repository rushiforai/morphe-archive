.class public final synthetic Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/MultiTabs227$Host;

.field public final synthetic f$1:Le/e/a/SavedTabs227$Tab;


# direct methods
.method public synthetic constructor <init>(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;->f$0:Le/e/a/MultiTabs227$Host;

    iput-object p2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;->f$1:Le/e/a/SavedTabs227$Tab;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;->f$0:Le/e/a/MultiTabs227$Host;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;->f$1:Le/e/a/SavedTabs227$Tab;

    invoke-virtual {v0, v1, p1}, Le/e/a/MultiTabs227$Host;->lambda$1$e-e-a-MultiTabs227$Host(Le/e/a/SavedTabs227$Tab;Landroid/view/View;)V

    return-void
.end method
