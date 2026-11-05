.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:I

.field public final synthetic f$3:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lorg/json/JSONObject;I[Ljava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$1:Lorg/json/JSONObject;

    iput p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$2:I

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$3:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$1:Lorg/json/JSONObject;

    iget v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$2:I

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda16;->f$3:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/Ranking190;->lambda$7(Ljava/util/ArrayList;Lorg/json/JSONObject;I[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
