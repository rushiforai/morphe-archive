.class public final synthetic Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NgCommentSettings$ListDialog;

.field public final synthetic f$1:Le/e/a/NetworkTask;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NgCommentSettings$ListDialog;Le/e/a/NetworkTask;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;->f$0:Le/e/a/NgCommentSettings$ListDialog;

    iput-object p2, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;->f$1:Le/e/a/NetworkTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;->f$0:Le/e/a/NgCommentSettings$ListDialog;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;->f$1:Le/e/a/NetworkTask;

    invoke-virtual {v0, v1}, Le/e/a/NgCommentSettings$ListDialog;->lambda$8$e-e-a-NgCommentSettings$ListDialog(Le/e/a/NetworkTask;)V

    return-void
.end method
