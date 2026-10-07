.class public final synthetic Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/FeedbackDev10$NgAdapter;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FeedbackDev10$NgAdapter;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;->f$0:Le/e/a/FeedbackDev10$NgAdapter;

    iput-object p2, p0, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;->f$0:Le/e/a/FeedbackDev10$NgAdapter;

    iget-object v1, p0, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Le/e/a/FeedbackDev10$NgAdapter;->lambda$getView$0$e-e-a-FeedbackDev10$NgAdapter(Ljava/lang/Object;)V

    return-void
.end method
