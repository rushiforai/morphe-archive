.class public final synthetic Le/e/a/CommentOptions$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/SeekBar;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/SeekBar;II)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;->f$0:Landroid/widget/SeekBar;

    iput p2, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;->f$1:I

    iput p3, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;->f$0:Landroid/widget/SeekBar;

    iget v1, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;->f$1:I

    iget v2, p0, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;->f$2:I

    invoke-static {v0, v1, v2, p1}, Le/e/a/CommentOptions;->lambda$slider$1(Landroid/widget/SeekBar;IILandroid/view/View;)V

    return-void
.end method
