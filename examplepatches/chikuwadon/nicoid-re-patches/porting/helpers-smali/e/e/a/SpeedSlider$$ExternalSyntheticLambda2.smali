.class public final synthetic Le/e/a/SpeedSlider$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/SpeedSlider$Selection;

.field public final synthetic f$1:Landroid/widget/SeekBar;


# direct methods
.method public synthetic constructor <init>(Le/e/a/SpeedSlider$Selection;Landroid/widget/SeekBar;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda2;->f$0:Le/e/a/SpeedSlider$Selection;

    iput-object p2, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda2;->f$1:Landroid/widget/SeekBar;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda2;->f$0:Le/e/a/SpeedSlider$Selection;

    iget-object v1, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda2;->f$1:Landroid/widget/SeekBar;

    invoke-static {v0, v1, p1, p2}, Le/e/a/SpeedSlider;->lambda$show$0(Le/e/a/SpeedSlider$Selection;Landroid/widget/SeekBar;Landroid/content/DialogInterface;I)V

    return-void
.end method
