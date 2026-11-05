.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Landroid/widget/LinearLayout;

.field public final synthetic f$2:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda12;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda12;->f$1:Landroid/widget/LinearLayout;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda12;->f$2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda12;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda12;->f$1:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda12;->f$2:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, p1}, Le/e/a/Ranking190;->lambda$25(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
