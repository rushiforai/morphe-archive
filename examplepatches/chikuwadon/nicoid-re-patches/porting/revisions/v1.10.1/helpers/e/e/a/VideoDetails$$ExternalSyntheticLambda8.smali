.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Landroid/os/Bundle;

.field public final synthetic f$3:Landroid/widget/LinearLayout;

.field public final synthetic f$4:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Lorg/json/JSONObject;Landroid/os/Bundle;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$2:Landroid/os/Bundle;

    iput-object p4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$3:Landroid/widget/LinearLayout;

    iput-object p5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$4:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$2:Landroid/os/Bundle;

    iget-object v3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$3:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;->f$4:Landroid/view/View;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/VideoDetails;->lambda$1(Le/e/a/NetworkTask;Lorg/json/JSONObject;Landroid/os/Bundle;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method
