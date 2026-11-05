.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda27;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONObject;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Ljava/util/ArrayList;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:Landroid/app/Activity;

.field public final synthetic f$5:Landroid/app/AlertDialog;

.field public final synthetic f$6:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$0:Lorg/json/JSONObject;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$2:Ljava/util/ArrayList;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$4:Landroid/app/Activity;

    iput-object p6, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$5:Landroid/app/AlertDialog;

    iput-object p7, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$6:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$0:Lorg/json/JSONObject;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$2:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$4:Landroid/app/Activity;

    iget-object v5, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$5:Landroid/app/AlertDialog;

    iget-object v6, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda27;->f$6:Ljava/lang/Runnable;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Le/e/a/Ranking190;->lambda$36(Lorg/json/JSONObject;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
