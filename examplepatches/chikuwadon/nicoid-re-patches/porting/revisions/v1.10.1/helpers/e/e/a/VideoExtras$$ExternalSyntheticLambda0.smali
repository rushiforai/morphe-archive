.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONObject;

    invoke-static {v0, v1, p1}, Le/e/a/VideoExtras;->lambda$series$8(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
