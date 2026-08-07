.class public Ll/xij0;
.super Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A4(I)Z
    .locals 0

    .line 1
    const/16 p0, 0x300

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public a4(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Ll/rre;->n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/ifv;

    .line 23
    .line 24
    iget-object v2, v2, Ll/ifv;->l:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/xij0;->A4(I)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/ifv;

    .line 52
    .line 53
    iget-object p0, p0, Ll/ifv;->k:Ll/jxd0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    xor-int/2addr p0, v1

    .line 66
    return p0

    .line 67
    :cond_1
    :goto_0
    return v1
.end method
