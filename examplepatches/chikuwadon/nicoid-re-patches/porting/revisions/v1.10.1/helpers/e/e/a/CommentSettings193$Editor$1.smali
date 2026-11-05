.class Le/e/a/CommentSettings193$Editor$1;
.super Ljava/lang/Object;
.source "CommentSettings193.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings193$Editor;->slider(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/CommentSettings193$Editor;

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Le/e/a/CommentSettings193$Editor;I)V
    .registers 3

    .line 28
    iput-object p1, p0, Le/e/a/CommentSettings193$Editor$1;->this$1:Le/e/a/CommentSettings193$Editor;

    iput p2, p0, Le/e/a/CommentSettings193$Editor$1;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6

    .line 28
    iget-object p1, p0, Le/e/a/CommentSettings193$Editor$1;->this$1:Le/e/a/CommentSettings193$Editor;

    iget-object p1, p1, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object p1, p1, Le/e/a/CommentAppearance192;->values:[I

    iget p3, p0, Le/e/a/CommentSettings193$Editor$1;->val$i:I

    iget v0, p0, Le/e/a/CommentSettings193$Editor$1;->val$i:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    mul-int/lit8 p2, p2, 0x64

    add-int/lit16 p2, p2, 0x12c

    goto :goto_19

    :cond_12
    sget-object v0, Le/e/a/CommentAppearance192;->MIN:[I

    iget v1, p0, Le/e/a/CommentSettings193$Editor$1;->val$i:I

    aget v0, v0, v1

    add-int/2addr p2, v0

    :goto_19
    aput p2, p1, p3

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor$1;->this$1:Le/e/a/CommentSettings193$Editor;

    iget p2, p0, Le/e/a/CommentSettings193$Editor$1;->val$i:I

    invoke-virtual {p1, p2}, Le/e/a/CommentSettings193$Editor;->label(I)V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor$1;->this$1:Le/e/a/CommentSettings193$Editor;

    iget-object p1, p1, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings193$Preview;->changed()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 28
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 28
    return-void
.end method
