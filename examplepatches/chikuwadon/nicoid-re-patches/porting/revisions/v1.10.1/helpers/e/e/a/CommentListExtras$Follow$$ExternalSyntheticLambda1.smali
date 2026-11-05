.class public final synthetic Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:Le/e/a/CommentListExtras$Follow;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CommentListExtras$Follow;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda1;->f$0:Le/e/a/CommentListExtras$Follow;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda1;->f$0:Le/e/a/CommentListExtras$Follow;

    invoke-virtual {v0, p1, p2}, Le/e/a/CommentListExtras$Follow;->lambda$sort$2$e-e-a-CommentListExtras$Follow(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p1

    return p1
.end method
