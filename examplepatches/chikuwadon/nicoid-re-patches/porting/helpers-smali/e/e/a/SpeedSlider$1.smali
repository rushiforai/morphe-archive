.class Le/e/a/SpeedSlider$1;
.super Ljava/lang/Object;
.source "SpeedSlider.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$label:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 12
    iput-object p1, p0, Le/e/a/SpeedSlider$1;->val$label:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6
    .param p1, "s"    # Landroid/widget/SeekBar;
    .param p2, "p"    # I
    .param p3, "user"    # Z

    .line 12
    iget-object v0, p0, Le/e/a/SpeedSlider$1;->val$label:Landroid/widget/TextView;

    invoke-static {p2}, Le/e/a/SpeedSlider;->value(I)F

    move-result v1

    invoke-static {v1}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "s"    # Landroid/widget/SeekBar;

    .line 12
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "s"    # Landroid/widget/SeekBar;

    .line 12
    return-void
.end method
