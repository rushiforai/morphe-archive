.class public final synthetic Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/SavedTabs227$Tab;

.field public final synthetic f$1:I

.field public final synthetic f$2:I

.field public final synthetic f$3:Le/e/a/MultiTabs227$Host;


# direct methods
.method public synthetic constructor <init>(Le/e/a/SavedTabs227$Tab;IILe/e/a/MultiTabs227$Host;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$0:Le/e/a/SavedTabs227$Tab;

    iput p2, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$1:I

    iput p3, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$2:I

    iput-object p4, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$3:Le/e/a/MultiTabs227$Host;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$0:Le/e/a/SavedTabs227$Tab;

    iget v1, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$1:I

    iget v2, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$2:I

    iget-object v3, p0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;->f$3:Le/e/a/MultiTabs227$Host;

    invoke-static {v0, v1, v2, v3}, Le/e/a/TabPlayback110;->lambda$1(Le/e/a/SavedTabs227$Tab;IILe/e/a/MultiTabs227$Host;)V

    return-void
.end method
