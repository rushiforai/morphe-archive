.class public final synthetic Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FilterUi110$Page;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FilterUi110$Page;Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;->f$0:Le/e/a/FilterUi110$Page;

    iput-object p2, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;->f$0:Le/e/a/FilterUi110$Page;

    iget-object v1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1, p2}, Le/e/a/FilterUi110$Page;->lambda$11$e-e-a-FilterUi110$Page(Lorg/json/JSONObject;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
