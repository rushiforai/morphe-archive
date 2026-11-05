.class Le/e/a/SpeedSlider$1;
.super Ljava/lang/Object;
.source "SpeedSlider.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZZLe/e/a/SpeedSlider$Selection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$disabled:Z

.field private final synthetic val$label:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Z)V
    .registers 3

    .line 16
    iput-object p1, p0, Le/e/a/SpeedSlider$1;->val$label:Landroid/widget/TextView;

    iput-boolean p2, p0, Le/e/a/SpeedSlider$1;->val$disabled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 16
    iget-object p1, p0, Le/e/a/SpeedSlider$1;->val$label:Landroid/widget/TextView;

    iget-boolean p3, p0, Le/e/a/SpeedSlider$1;->val$disabled:Z

    # invokes: Le/e/a/SpeedSlider;->sliderLabel(IZ)Ljava/lang/String;
    invoke-static {p2, p3}, Le/e/a/SpeedSlider;->access$0(IZ)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    return-void
.end method
