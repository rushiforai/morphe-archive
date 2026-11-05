.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONObject;

.field public final synthetic f$1:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda17;->f$0:Lorg/json/JSONObject;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda17;->f$1:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda17;->f$0:Lorg/json/JSONObject;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda17;->f$1:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, p1}, Le/e/a/Ranking190;->lambda$8(Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
