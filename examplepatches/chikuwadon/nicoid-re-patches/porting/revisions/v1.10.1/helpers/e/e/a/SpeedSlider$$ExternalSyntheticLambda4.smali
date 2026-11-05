.class public final synthetic Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/SpeedSlider$Selection;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Landroid/widget/SeekBar;


# direct methods
.method public synthetic constructor <init>(Le/e/a/SpeedSlider$Selection;ZLandroid/widget/SeekBar;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;->f$0:Le/e/a/SpeedSlider$Selection;

    iput-boolean p2, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;->f$1:Z

    iput-object p3, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;->f$2:Landroid/widget/SeekBar;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;->f$0:Le/e/a/SpeedSlider$Selection;

    iget-boolean v1, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;->f$1:Z

    iget-object v2, p0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;->f$2:Landroid/widget/SeekBar;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/SpeedSlider;->lambda$0(Le/e/a/SpeedSlider$Selection;ZLandroid/widget/SeekBar;Landroid/content/DialogInterface;I)V

    return-void
.end method
