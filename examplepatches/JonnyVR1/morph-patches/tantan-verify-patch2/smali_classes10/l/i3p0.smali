.class public Ll/i3p0;
.super Ll/dh2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dh2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dh2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/dh2;->b:Ll/yql;

    .line 15
    .line 16
    iget-object v1, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 17
    .line 18
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/text/SpannableStringBuilder;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/dh2;->H()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    const/high16 v0, 0x40c00000    # 6.0f

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    :goto_0
    invoke-static {p1, v3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    const/high16 p0, 0x40800000    # 4.0f

    .line 54
    .line 55
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->h8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i3p0;->J(Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
