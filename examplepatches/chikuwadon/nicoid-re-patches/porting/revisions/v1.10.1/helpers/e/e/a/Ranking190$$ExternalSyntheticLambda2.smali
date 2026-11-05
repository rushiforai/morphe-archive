.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# instance fields
.field public final synthetic f$0:Le/e/a/Ranking190$Manager;

.field public final synthetic f$1:Landroid/widget/ScrollView;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Ranking190$Manager;Landroid/widget/ScrollView;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda2;->f$0:Le/e/a/Ranking190$Manager;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda2;->f$1:Landroid/widget/ScrollView;

    return-void
.end method


# virtual methods
.method public final onScrollChanged()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda2;->f$0:Le/e/a/Ranking190$Manager;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda2;->f$1:Landroid/widget/ScrollView;

    invoke-static {v0, v1}, Le/e/a/Ranking190;->lambda$14(Le/e/a/Ranking190$Manager;Landroid/widget/ScrollView;)V

    return-void
.end method
