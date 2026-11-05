.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:[Ljava/lang/Runnable;

.field public final synthetic f$3:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;Landroid/content/Context;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$2:[Ljava/lang/Runnable;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$3:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$2:[Ljava/lang/Runnable;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda28;->f$3:Landroid/content/Context;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/Ranking190;->lambda$34(Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
