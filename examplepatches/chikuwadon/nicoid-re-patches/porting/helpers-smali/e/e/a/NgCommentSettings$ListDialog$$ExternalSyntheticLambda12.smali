.class public final synthetic Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/NgCommentSettings$ListDialog;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NgCommentSettings$ListDialog;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;->f$0:Le/e/a/NgCommentSettings$ListDialog;

    iput-object p2, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;->f$0:Le/e/a/NgCommentSettings$ListDialog;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;->f$1:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Le/e/a/NgCommentSettings$ListDialog;->lambda$5$e-e-a-NgCommentSettings$ListDialog(Ljava/lang/String;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
