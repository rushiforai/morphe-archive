.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->n0(Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->a:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->a:Lv/VDraweeView;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 9
    .line 10
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->X(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lv/VDraweeView;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->a:Lv/VDraweeView;

    .line 14
    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->T(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;)Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;->a:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
