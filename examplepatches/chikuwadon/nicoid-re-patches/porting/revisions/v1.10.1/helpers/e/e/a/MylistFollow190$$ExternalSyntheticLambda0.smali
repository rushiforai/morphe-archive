.class public final synthetic Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Landroid/widget/ListView;

.field public final synthetic f$2:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/widget/ListView;Landroid/app/Activity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;->f$1:Landroid/widget/ListView;

    iput-object p3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;->f$2:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 14

    .line 0
    iget-object v0, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;->f$1:Landroid/widget/ListView;

    iget-object v2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;->f$2:Landroid/app/Activity;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-static/range {v0 .. v7}, Le/e/a/MylistFollow190;->lambda$1(Ljava/lang/Object;Landroid/widget/ListView;Landroid/app/Activity;Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    move-result p1

    return p1
.end method
