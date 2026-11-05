.class Le/e/a/CommentSettings192$Editor$1;
.super Ljava/lang/Object;
.source "CommentSettings192.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings192$Editor;->slider(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/CommentSettings192$Editor;

.field private final synthetic val$n:I


# direct methods
.method constructor <init>(Le/e/a/CommentSettings192$Editor;I)V
    .registers 3

    .line 14
    iput-object p1, p0, Le/e/a/CommentSettings192$Editor$1;->this$1:Le/e/a/CommentSettings192$Editor;

    iput p2, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6

    .line 14
    iget-object p1, p0, Le/e/a/CommentSettings192$Editor$1;->this$1:Le/e/a/CommentSettings192$Editor;

    iget-object p1, p1, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object p1, p1, Le/e/a/CommentAppearance192;->values:[I

    iget p3, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    iget v0, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    mul-int/lit8 p2, p2, 0x64

    add-int/lit16 p2, p2, 0x12c

    goto :goto_19

    :cond_12
    sget-object v0, Le/e/a/CommentAppearance192;->MIN:[I

    iget v1, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    aget v0, v0, v1

    add-int/2addr p2, v0

    :goto_19
    aput p2, p1, p3

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor$1;->this$1:Le/e/a/CommentSettings192$Editor;

    iget p2, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    invoke-virtual {p1, p2}, Le/e/a/CommentSettings192$Editor;->label(I)V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor$1;->this$1:Le/e/a/CommentSettings192$Editor;

    iget-object p1, p1, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings192$Preview;->changed()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 14
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 7

    .line 14
    iget v0, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    goto :goto_14

    :cond_7
    sget-object v0, Le/e/a/CommentAppearance192;->DEFAULT:[I

    iget v2, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    aget v0, v0, v2

    sget-object v2, Le/e/a/CommentAppearance192;->MIN:[I

    iget v3, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    aget v2, v2, v3

    sub-int/2addr v0, v2

    :goto_14
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget v3, p0, Le/e/a/CommentSettings192$Editor$1;->val$n:I

    if-eq v3, v1, :cond_38

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3c03126f    # 0.008f

    mul-float v3, v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-gt v2, v1, :cond_38

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    :cond_38
    return-void
.end method
