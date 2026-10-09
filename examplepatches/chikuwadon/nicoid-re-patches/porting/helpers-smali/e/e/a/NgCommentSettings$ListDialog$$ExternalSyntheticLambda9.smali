.class public final synthetic Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NgCommentSettings$ListDialog;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Le/e/a/NetworkTask;

.field public final synthetic f$3:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NgCommentSettings$ListDialog;Lorg/json/JSONObject;Le/e/a/NetworkTask;Ljava/util/Set;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$0:Le/e/a/NgCommentSettings$ListDialog;

    iput-object p2, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$2:Le/e/a/NetworkTask;

    iput-object p4, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$3:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$0:Le/e/a/NgCommentSettings$ListDialog;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$2:Le/e/a/NetworkTask;

    iget-object v3, p0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;->f$3:Ljava/util/Set;

    invoke-virtual {v0, v1, v2, v3}, Le/e/a/NgCommentSettings$ListDialog;->lambda$11$e-e-a-NgCommentSettings$ListDialog(Lorg/json/JSONObject;Le/e/a/NetworkTask;Ljava/util/Set;)V

    return-void
.end method
