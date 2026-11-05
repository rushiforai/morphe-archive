.class public final synthetic Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FilterUi110$Page;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FilterUi110$Page;Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;->f$0:Le/e/a/FilterUi110$Page;

    iput-object p2, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;->f$0:Le/e/a/FilterUi110$Page;

    iget-object v1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;->f$1:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1}, Le/e/a/FilterUi110$Page;->lambda$14$e-e-a-FilterUi110$Page(Lorg/json/JSONObject;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
