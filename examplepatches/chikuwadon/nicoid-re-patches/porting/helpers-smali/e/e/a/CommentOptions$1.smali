.class Le/e/a/CommentOptions$1;
.super Ljava/lang/Object;
.source "CommentOptions.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$current:Landroid/widget/TextView;

.field final synthetic val$min:I

.field final synthetic val$unit:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/widget/TextView;ILjava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 13
    iput-object p1, p0, Le/e/a/CommentOptions$1;->val$current:Landroid/widget/TextView;

    iput p2, p0, Le/e/a/CommentOptions$1;->val$min:I

    iput-object p3, p0, Le/e/a/CommentOptions$1;->val$unit:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 13
    iget-object p1, p0, Le/e/a/CommentOptions$1;->val$current:Landroid/widget/TextView;

    iget p3, p0, Le/e/a/CommentOptions$1;->val$min:I

    add-int/2addr p2, p3

    iget-object p3, p0, Le/e/a/CommentOptions$1;->val$unit:Ljava/lang/String;

    invoke-static {p2, p3}, Le/e/a/CommentOptions;->label(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 13
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 13
    return-void
.end method
