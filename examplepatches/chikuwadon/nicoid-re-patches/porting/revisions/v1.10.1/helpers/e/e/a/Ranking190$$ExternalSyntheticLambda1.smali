.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/ListView;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ListView;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$0:Landroid/widget/ListView;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$3:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 15

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$0:Landroid/widget/ListView;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda1;->f$3:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    move-wide v7, p4

    invoke-static/range {v0 .. v8}, Le/e/a/Ranking190;->lambda$1(Landroid/widget/ListView;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/widget/AdapterView$OnItemClickListener;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
