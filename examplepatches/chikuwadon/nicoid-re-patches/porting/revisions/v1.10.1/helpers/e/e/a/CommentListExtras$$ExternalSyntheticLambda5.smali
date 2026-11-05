.class public final synthetic Le/e/a/CommentListExtras$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic f$0:Le/e/a/CommentListExtras$Follow;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CommentListExtras$Follow;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda5;->f$0:Le/e/a/CommentListExtras$Follow;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda5;->f$0:Le/e/a/CommentListExtras$Follow;

    invoke-static {v0, p1, p2}, Le/e/a/CommentListExtras;->lambda$install$5(Le/e/a/CommentListExtras$Follow;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
