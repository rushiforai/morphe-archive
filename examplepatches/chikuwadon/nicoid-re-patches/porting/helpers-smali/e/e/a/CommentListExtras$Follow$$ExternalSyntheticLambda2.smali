.class public final synthetic Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/CommentListExtras$Follow;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CommentListExtras$Follow;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda2;->f$0:Le/e/a/CommentListExtras$Follow;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 12

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda2;->f$0:Le/e/a/CommentListExtras$Follow;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentListExtras$Follow;->lambda$clicks$1$e-e-a-CommentListExtras$Follow(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
