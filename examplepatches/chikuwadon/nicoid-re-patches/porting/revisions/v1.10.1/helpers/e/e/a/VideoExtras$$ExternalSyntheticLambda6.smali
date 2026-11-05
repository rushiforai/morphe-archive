.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/os/Bundle;

.field public final synthetic f$3:Lorg/json/JSONObject;

.field public final synthetic f$4:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ljava/lang/String;Landroid/os/Bundle;Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$0:Landroid/view/View;

    iput-object p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$2:Landroid/os/Bundle;

    iput-object p4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$3:Lorg/json/JSONObject;

    iput-object p5, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$4:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$0:Landroid/view/View;

    iget-object v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$2:Landroid/os/Bundle;

    iget-object v3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$3:Lorg/json/JSONObject;

    iget-object v4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda6;->f$4:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/VideoExtras;->lambda$loadSeries$2(Landroid/view/View;Ljava/lang/String;Landroid/os/Bundle;Lorg/json/JSONObject;Ljava/lang/Object;)V

    return-void
.end method
