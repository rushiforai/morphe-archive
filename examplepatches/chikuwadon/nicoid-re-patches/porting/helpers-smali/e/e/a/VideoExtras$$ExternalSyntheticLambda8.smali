.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/os/Bundle;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Z

.field public final synthetic f$3:Landroid/view/View;

.field public final synthetic f$4:Landroid/widget/Button;

.field public final synthetic f$5:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;ZZLandroid/view/View;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$0:Landroid/os/Bundle;

    iput-boolean p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$1:Z

    iput-boolean p3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$2:Z

    iput-object p4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$3:Landroid/view/View;

    iput-object p5, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$4:Landroid/widget/Button;

    iput-object p6, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$5:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$0:Landroid/os/Bundle;

    iget-boolean v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$1:Z

    iget-boolean v2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$2:Z

    iget-object v3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$3:Landroid/view/View;

    iget-object v4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$4:Landroid/widget/Button;

    iget-object v5, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;->f$5:Lorg/json/JSONObject;

    invoke-static/range {v0 .. v5}, Le/e/a/VideoExtras;->lambda$toggle$5(Landroid/os/Bundle;ZZLandroid/view/View;Landroid/widget/Button;Lorg/json/JSONObject;)V

    return-void
.end method
