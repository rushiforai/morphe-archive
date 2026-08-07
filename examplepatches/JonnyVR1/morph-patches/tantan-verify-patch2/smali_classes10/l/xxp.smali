.class public Ll/xxp;
.super Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a4(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/rre;->n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p0, :cond_1

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 17
    .line 18
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/ifv;

    .line 23
    .line 24
    iget-object p1, p1, Ll/ifv;->l:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/ifv;

    .line 44
    .line 45
    iget-object p0, p0, Ll/ifv;->k:Ll/jxd0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    xor-int/2addr p0, v0

    .line 58
    return p0

    .line 59
    :cond_1
    :goto_0
    return v0
.end method

.method public f4(Ll/h1e;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g4()V
    .locals 0

    .line 1
    return-void
.end method

.method public l4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    return-void
.end method
