.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;->X(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead$a;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead$a;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 4
    .line 5
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
