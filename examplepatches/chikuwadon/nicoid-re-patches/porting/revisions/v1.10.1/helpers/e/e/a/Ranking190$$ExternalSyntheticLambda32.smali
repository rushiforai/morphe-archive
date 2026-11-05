.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda32;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Lorg/json/JSONObject;

.field public final synthetic f$3:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$2:Lorg/json/JSONObject;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$3:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$2:Lorg/json/JSONObject;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda32;->f$3:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/Ranking190;->lambda$33(Landroid/content/Context;Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
