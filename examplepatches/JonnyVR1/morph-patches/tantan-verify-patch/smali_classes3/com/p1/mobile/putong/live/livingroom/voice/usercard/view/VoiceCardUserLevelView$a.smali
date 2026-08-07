.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

.field public final synthetic e:Landroid/view/View;

.field public final synthetic f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Landroid/view/View;Landroid/view/View;ZLcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->b:Landroid/view/View;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->c:Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->d:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->e:Landroid/view/View;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->e:Landroid/view/View;

    .line 17
    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->e:Landroid/view/View;

    .line 24
    .line 25
    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->c:Z

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->z(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->z(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->a:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->b:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->a:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 35
    .line 36
    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->c:Z

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->w(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;)Ll/vak0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->f:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 48
    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;->d:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 52
    .line 53
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 54
    .line 55
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->superGrade:J

    .line 56
    .line 57
    const/4 v2, 0x1

    .line 58
    const/4 v3, 0x1

    .line 59
    invoke-static/range {v0 .. v7}, Ll/ln4;->c(Ll/vak0;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;ZZJJ)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method
