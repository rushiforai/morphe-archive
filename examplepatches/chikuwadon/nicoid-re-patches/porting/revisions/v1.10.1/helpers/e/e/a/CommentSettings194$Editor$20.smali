.class Le/e/a/CommentSettings194$Editor$20;
.super Ljava/lang/Object;
.source "CommentSettings194.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings194$Editor;->slider(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/CommentSettings194$Editor;

.field private final synthetic val$i:I

.field private final synthetic val$i2:I


# direct methods
.method constructor <init>(Le/e/a/CommentSettings194$Editor;II)V
    .registers 4

    .line 523
    iput-object p1, p0, Le/e/a/CommentSettings194$Editor$20;->this$1:Le/e/a/CommentSettings194$Editor;

    iput p2, p0, Le/e/a/CommentSettings194$Editor$20;->val$i:I

    iput p3, p0, Le/e/a/CommentSettings194$Editor$20;->val$i2:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6

    .line 526
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor$20;->this$1:Le/e/a/CommentSettings194$Editor;

    iget-object p1, p1, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object p1, p1, Le/e/a/CommentAppearance192;->values:[I

    iget p3, p0, Le/e/a/CommentSettings194$Editor$20;->val$i:I

    sget-object v0, Le/e/a/CommentAppearance192;->MIN:[I

    iget v1, p0, Le/e/a/CommentSettings194$Editor$20;->val$i:I

    aget v0, v0, v1

    iget v1, p0, Le/e/a/CommentSettings194$Editor$20;->val$i2:I

    mul-int p2, p2, v1

    add-int/2addr v0, p2

    aput v0, p1, p3

    .line 527
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor$20;->this$1:Le/e/a/CommentSettings194$Editor;

    iget p2, p0, Le/e/a/CommentSettings194$Editor$20;->val$i:I

    invoke-virtual {p1, p2}, Le/e/a/CommentSettings194$Editor;->label(I)V

    .line 528
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor$20;->this$1:Le/e/a/CommentSettings194$Editor;

    iget-object p1, p1, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 529
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 533
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 537
    return-void
.end method
