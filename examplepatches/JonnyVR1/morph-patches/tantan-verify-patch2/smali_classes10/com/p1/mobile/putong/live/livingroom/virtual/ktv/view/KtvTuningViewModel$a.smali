.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->l:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/obc0;->K9:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p1, Ll/obc0;->L9:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p3, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->c(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)Ll/x6r;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p2}, Ll/x6r;->c4(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
