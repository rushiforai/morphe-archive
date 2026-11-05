.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/ScrollView;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ScrollView;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda5;->f$0:Landroid/widget/ScrollView;

    iput p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda5;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda5;->f$0:Landroid/widget/ScrollView;

    iget v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda5;->f$1:I

    invoke-static {v0, v1}, Le/e/a/Ranking190;->lambda$15(Landroid/widget/ScrollView;I)V

    return-void
.end method
