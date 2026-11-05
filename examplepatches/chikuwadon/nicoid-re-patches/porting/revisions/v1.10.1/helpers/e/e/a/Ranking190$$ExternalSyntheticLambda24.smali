.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda24;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda24;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda24;->f$2:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda24;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda24;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda24;->f$2:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/Ranking190;->lambda$29(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V

    return-void
.end method
