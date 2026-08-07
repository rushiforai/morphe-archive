.class public Ll/san0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qam;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

.field public b:Ll/mbn0;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/san0;->c:Lrx/subjects/a;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTitle()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getSubTitle()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHeadSculptureList()Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    return-object p0
.end method


# virtual methods
.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/san0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/android/app/Frag;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .param p3    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/san0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/xec0;->T1:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 28
    .line 29
    iput-object v0, p0, Ll/san0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 30
    .line 31
    invoke-virtual {v0, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object p3, p0, Ll/san0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 35
    .line 36
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/mbn0;

    .line 40
    .line 41
    invoke-direct {p2, p1}, Ll/mbn0;-><init>(Ll/ner;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Ll/san0;->b:Ll/mbn0;

    .line 45
    .line 46
    iget-object p1, p0, Ll/san0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/san0;->b:Ll/mbn0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/mbn0;->a0()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public f()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getVoiceSummaryEntryData()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ran0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ran0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/san0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->e(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/san0;->b:Ll/mbn0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mbn0;->A0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Frag;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0
    .param p3    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/san0;->b:Ll/mbn0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mbn0;->z0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
