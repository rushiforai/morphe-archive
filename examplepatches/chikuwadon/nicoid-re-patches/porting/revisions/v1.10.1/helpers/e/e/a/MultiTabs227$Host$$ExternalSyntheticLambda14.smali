.class public final synthetic Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/MultiTabs227$Host;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Le/e/a/SavedTabs227$Tab;


# direct methods
.method public synthetic constructor <init>(Le/e/a/MultiTabs227$Host;Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;->f$0:Le/e/a/MultiTabs227$Host;

    iput-object p2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;->f$2:Le/e/a/SavedTabs227$Tab;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;->f$0:Le/e/a/MultiTabs227$Host;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;->f$2:Le/e/a/SavedTabs227$Tab;

    invoke-virtual {v0, v1, v2}, Le/e/a/MultiTabs227$Host;->lambda$7$e-e-a-MultiTabs227$Host(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method
