.class public Ll/gd60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;


# direct methods
.method public constructor <init>(Ll/bjs;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gd60;->a:Ll/bjs;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/gd60;Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/gd60;->d(Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;)V

    return-void
.end method

.method public static synthetic b(Ll/gd60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gd60;->c()V

    return-void
.end method


# virtual methods
.method public final synthetic c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gd60;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gd60;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/yrj;->d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/gd60;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;

    .line 10
    .line 11
    new-instance p1, Ll/g4s;

    .line 12
    .line 13
    iget-object v0, p0, Ll/gd60;->a:Ll/bjs;

    .line 14
    .line 15
    iget-object v1, p0, Ll/gd60;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;

    .line 16
    .line 17
    invoke-direct {p1, v0, v1}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/gd60;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 21
    .line 22
    sget v0, Ll/jgc0;->e:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/gd60;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT_SHOW_EXPIRATION_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 41
    .line 42
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;->expirationInfos:Ljava/util/List;

    .line 43
    .line 44
    iput-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->expirationInfos:Ljava/util/List;

    .line 45
    .line 46
    iget-object p1, p0, Ll/gd60;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/gd60;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;

    .line 52
    .line 53
    new-instance p5, Ll/fd60;

    .line 54
    .line 55
    invoke-direct {p5, p0}, Ll/fd60;-><init>(Ll/gd60;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;->q(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILl/x20;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/gd60;->a:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 8
    .line 9
    iget-object v2, p0, Ll/gd60;->a:Ll/bjs;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Ll/gd60;->a:Ll/bjs;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ll/oo2;->A0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v1, v2, v3}, Ll/aiv;->t0(ILjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/ed60;

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    move-object v3, p1

    .line 41
    move-object v4, p2

    .line 42
    move-object v5, p3

    .line 43
    move v6, p4

    .line 44
    invoke-direct/range {v1 .. v6}, Ll/ed60;-><init>(Ll/gd60;Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method
