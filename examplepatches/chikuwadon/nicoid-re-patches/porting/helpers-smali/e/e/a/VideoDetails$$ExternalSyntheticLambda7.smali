.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lorg/json/JSONObject;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:[Z

.field public final synthetic f$5:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;[ZLjava/lang/Runnable;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$2:Lorg/json/JSONObject;

    iput-object p4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$4:[Z

    iput-object p6, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$5:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$2:Lorg/json/JSONObject;

    iget-object v3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$4:[Z

    iget-object v5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$5:Ljava/lang/Runnable;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Le/e/a/VideoDetails;->lambda$9(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;[ZLjava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
