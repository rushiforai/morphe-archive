.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$0:Ljava/lang/Runnable;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$0:Ljava/lang/Runnable;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;->f$2:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, p1}, Le/e/a/VideoDetails;->lambda$17(Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
