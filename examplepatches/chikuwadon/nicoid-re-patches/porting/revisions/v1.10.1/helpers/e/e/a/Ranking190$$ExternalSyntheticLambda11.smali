.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/Ranking190$Manager;

.field public final synthetic f$1:Landroid/widget/CheckBox;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Lorg/json/JSONObject;

.field public final synthetic f$4:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Ranking190$Manager;Landroid/widget/CheckBox;Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$0:Le/e/a/Ranking190$Manager;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$1:Landroid/widget/CheckBox;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$3:Lorg/json/JSONObject;

    iput-object p5, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$4:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$0:Le/e/a/Ranking190$Manager;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$1:Landroid/widget/CheckBox;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$3:Lorg/json/JSONObject;

    iget-object v4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda11;->f$4:Landroid/widget/LinearLayout;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/Ranking190;->lambda$23(Le/e/a/Ranking190$Manager;Landroid/widget/CheckBox;Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method
