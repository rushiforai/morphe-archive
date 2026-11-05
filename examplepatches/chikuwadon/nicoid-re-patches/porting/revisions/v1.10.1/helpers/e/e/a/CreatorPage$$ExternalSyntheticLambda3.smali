.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Lorg/json/JSONObject;

.field public final synthetic f$3:Landroid/app/Activity;

.field public final synthetic f$4:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/content/Context;Lorg/json/JSONObject;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$0:Landroid/view/View;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$2:Lorg/json/JSONObject;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$3:Landroid/app/Activity;

    iput-object p5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$4:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$0:Landroid/view/View;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$2:Lorg/json/JSONObject;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$3:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;->f$4:Landroid/widget/LinearLayout;

    move-object v5, p1

    move v6, p2

    invoke-static/range {v0 .. v6}, Le/e/a/CreatorPage;->lambda$30(Landroid/view/View;Landroid/content/Context;Lorg/json/JSONObject;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V

    return-void
.end method
