.class public Ll/n4s;
.super Ll/yh2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yh2<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/fw40;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/yh2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public K4(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/yh2;->K4(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string p1, "profile"

    .line 8
    .line 9
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    const-string p2, "buttonOpenProfile"

    .line 16
    .line 17
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p2, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 25
    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget-object p2, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 41
    .line 42
    :goto_1
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 43
    .line 44
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userName:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {p2, p3, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-wide p3, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    invoke-virtual {p0, p2, p3, p4, p1}, Ll/yh2;->Q4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;JZ)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
