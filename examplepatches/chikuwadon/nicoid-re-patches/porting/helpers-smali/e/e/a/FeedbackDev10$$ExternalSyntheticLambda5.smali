.class public final synthetic Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/os/Bundle;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lorg/json/JSONObject;

.field public final synthetic f$3:Ljava/lang/Object;

.field public final synthetic f$4:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Object;Landroid/view/View;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$0:Landroid/os/Bundle;

    iput-object p2, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$2:Lorg/json/JSONObject;

    iput-object p4, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$3:Ljava/lang/Object;

    iput-object p5, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$4:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$0:Landroid/os/Bundle;

    iget-object v1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$2:Lorg/json/JSONObject;

    iget-object v3, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$3:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda5;->f$4:Landroid/view/View;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/FeedbackDev10;->lambda$loadSeries$4(Landroid/os/Bundle;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method
