.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Le/e/a/NetworkTask;

.field public final synthetic f$3:Landroid/app/Activity;

.field public final synthetic f$4:Landroid/widget/LinearLayout;

.field public final synthetic f$5:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lorg/json/JSONObject;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$2:Le/e/a/NetworkTask;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$3:Landroid/app/Activity;

    iput-object p5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$4:Landroid/widget/LinearLayout;

    iput-object p6, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$5:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$2:Le/e/a/NetworkTask;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$3:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$4:Landroid/widget/LinearLayout;

    iget-object v5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;->f$5:Landroid/view/View;

    invoke-static/range {v0 .. v5}, Le/e/a/CreatorPage;->lambda$31(Landroid/content/Context;Lorg/json/JSONObject;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method
