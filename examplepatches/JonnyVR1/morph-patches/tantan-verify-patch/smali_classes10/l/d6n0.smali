.class public final Ll/d6n0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rR\"\u0010\u0004\u001a\u00020\u00038\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0006R$\u0010\u001a\u001a\u0004\u0018\u00010\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/d6n0;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;",
        "voiceChatGroupApply",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "J",
        "(Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;)V",
        "a",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;",
        "I",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;",
        "setVoiceChatGroupApply",
        "Landroid/view/View$OnClickListener;",
        "b",
        "Landroid/view/View$OnClickListener;",
        "getAgreeClickListener",
        "()Landroid/view/View$OnClickListener;",
        "K",
        "(Landroid/view/View$OnClickListener;)V",
        "agreeClickListener",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Landroid/view/View$OnClickListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/d6n0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;

    .line 8
    .line 9
    return-void
.end method

.method public static H(Ll/d6n0;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/d6n0;->b:Landroid/view/View$OnClickListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method


# virtual methods
.method public final I()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d6n0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/d6n0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;->get_agree_btn()Lv/VText;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/c6n0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/c6n0;-><init>(Ll/d6n0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final K(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/d6n0;->b:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->j8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d6n0;->J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/model/VoiceChatGroupApplyItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
