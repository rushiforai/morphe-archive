.class public final synthetic Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;->f$0:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda6;->f$0:Landroid/os/Bundle;

    invoke-static {v0}, Le/e/a/FeedbackDev10;->lambda$loadSeries$5(Landroid/os/Bundle;)V

    return-void
.end method
