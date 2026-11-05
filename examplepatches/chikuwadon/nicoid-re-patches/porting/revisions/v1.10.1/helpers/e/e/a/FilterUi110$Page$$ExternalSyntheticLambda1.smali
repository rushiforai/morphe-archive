.class public final synthetic Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FilterUi110$Page;

.field public final synthetic f$1:Landroid/widget/CheckBox;

.field public final synthetic f$2:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FilterUi110$Page;Landroid/widget/CheckBox;Lorg/json/JSONObject;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;->f$0:Le/e/a/FilterUi110$Page;

    iput-object p2, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;->f$1:Landroid/widget/CheckBox;

    iput-object p3, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;->f$2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;->f$0:Le/e/a/FilterUi110$Page;

    iget-object v1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;->f$1:Landroid/widget/CheckBox;

    iget-object v2, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;->f$2:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2, p1}, Le/e/a/FilterUi110$Page;->lambda$12$e-e-a-FilterUi110$Page(Landroid/widget/CheckBox;Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
