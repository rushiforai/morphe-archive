.class Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->onMusicBeatDetect(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->access$002(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p1, v0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->access$102(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->access$202(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F

    .line 17
    .line 18
    .line 19
    return-void
.end method
