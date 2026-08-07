.class Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->onMusicBeatDetect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->access$002(Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;F)F

    .line 6
    .line 7
    .line 8
    return-void
.end method
