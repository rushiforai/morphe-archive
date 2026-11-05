.class public final synthetic Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/MultiTabs227$Host;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Le/e/a/MultiTabs227$Host;ILjava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;->f$0:Le/e/a/MultiTabs227$Host;

    iput p2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;->f$1:I

    iput-object p3, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;->f$0:Le/e/a/MultiTabs227$Host;

    iget v1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;->f$1:I

    iget-object v2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;->f$2:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Le/e/a/MultiTabs227$Host;->lambda$5$e-e-a-MultiTabs227$Host(ILjava/lang/String;)V

    return-void
.end method
