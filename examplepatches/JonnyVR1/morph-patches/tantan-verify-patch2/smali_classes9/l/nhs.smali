.class public Ll/nhs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bjs<",
        "*>;>;"
    }
.end annotation


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

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic O(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/juj;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->b()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/nhs;->a:Ll/bjs;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/bjs;->O3()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nhs;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic V(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/nhs;->w()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private a0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->E0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/nhs;Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nhs;->W(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method

.method private b0(Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/nhs;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nhs;->O(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/nhs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhs;->P(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    return-void
.end method

.method public static synthetic i(Ll/nhs;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nhs;->R()V

    return-void
.end method

.method public static synthetic j(Ll/nhs;Ll/xbe;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nhs;->T(Ll/xbe;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic k(Ll/nhs;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nhs;->S()V

    return-void
.end method

.method public static synthetic l(Ll/nhs;Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/nhs;->V(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/nhs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nhs;->u()V

    return-void
.end method

.method public static synthetic n(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Ll/nhs;Ll/xbe;Ljava/lang/String;Ll/c0s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/nhs;->Q(Ll/xbe;Ljava/lang/String;Ll/c0s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    return-void
.end method

.method public static synthetic q(Ll/nhs;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nhs;->U(Landroid/view/View;)V

    return-void
.end method

.method private u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private w()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhs;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/nhs;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public A()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/nhs;->G()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->i:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    return-object p0
.end method

.method public B()Ll/e060;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->getFlyDestination()Ll/e060;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {}, Ll/e060;->c()Ll/e060;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public C()Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->getNobleInfo()Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public E()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public F()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public H()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->l:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public I()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public K()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public L(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ehs;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ehs;-><init>(Ll/nhs;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/yrj;->b(Landroid/content/Context;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public M()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public N()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->s0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/bjs;->P5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/c0s;

    .line 9
    .line 10
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 11
    .line 12
    iget-object v1, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 13
    .line 14
    invoke-direct {p1, v0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 25
    .line 26
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 27
    .line 28
    new-instance v1, Ll/khs;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/khs;-><init>(Ll/nhs;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->r0(Ll/bjs;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 37
    .line 38
    new-instance v0, Ll/lhs;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/lhs;-><init>(Ll/nhs;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic Q(Ll/xbe;Ljava/lang/String;Ll/c0s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    iget-object v3, v0, Ll/nhs;->a:Ll/bjs;

    .line 8
    .line 9
    iget-object v4, v1, Ll/xbe;->b:Ll/jjs;

    .line 10
    .line 11
    invoke-virtual {v4}, Ll/jjs;->k()I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    iget-object v6, v0, Ll/nhs;->a:Ll/bjs;

    .line 16
    .line 17
    invoke-virtual {v6}, Ll/xzs;->R2()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 22
    .line 23
    .line 24
    move-result v8

    .line 25
    iget-object v6, v0, Ll/nhs;->a:Ll/bjs;

    .line 26
    .line 27
    invoke-virtual {v6}, Ll/bjs;->P4()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v10

    .line 31
    const/4 v11, 0x0

    .line 32
    const-string v6, "NA"

    .line 33
    .line 34
    const-string v9, "picture"

    .line 35
    .line 36
    invoke-static/range {v3 .. v11}, Ll/qzj;->j(Ll/bjs;Ll/jjs;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v3, v1, Ll/xbe;->b:Ll/jjs;

    .line 40
    .line 41
    invoke-virtual {v3}, Ll/jjs;->i()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iget v4, v1, Ll/xbe;->c:I

    .line 46
    .line 47
    iget v5, v1, Ll/xbe;->d:I

    .line 48
    .line 49
    invoke-static {v3, v4, v5}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTabBarTraceServerData(Ljava/lang/String;II)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 50
    .line 51
    .line 52
    move-result-object v15

    .line 53
    move-object/from16 v7, p4

    .line 54
    .line 55
    iget v3, v7, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 56
    .line 57
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    new-instance v8, Ll/bhs;

    .line 62
    .line 63
    invoke-direct {v8, v0, v1, v2}, Ll/bhs;-><init>(Ll/nhs;Ll/xbe;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 64
    .line 65
    .line 66
    new-instance v9, Ll/chs;

    .line 67
    .line 68
    invoke-direct {v9}, Ll/chs;-><init>()V

    .line 69
    .line 70
    .line 71
    new-instance v10, Ll/dhs;

    .line 72
    .line 73
    invoke-direct {v10}, Ll/dhs;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 77
    .line 78
    .line 79
    move-result v12

    .line 80
    iget-object v1, v0, Ll/nhs;->a:Ll/bjs;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/bjs;->M4()Ll/cqj;

    .line 83
    .line 84
    .line 85
    move-result-object v14

    .line 86
    move-object/from16 v13, p2

    .line 87
    .line 88
    invoke-static/range {v6 .. v15}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v2, v1, Ll/uoe0;->w:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 93
    .line 94
    iget-object v0, v0, Ll/nhs;->a:Ll/bjs;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/bjs;->X5(Ll/uoe0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic R()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGoWallet()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ox50;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/ox50;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v1, v2}, Ll/ox50;->d(Z)Ll/ox50;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v1, v2}, Ll/ox50;->e(Ll/uoe0;)Ll/ox50;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "liveGiftBarRechargeClick"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/ox50;->f(Ljava/lang/String;)Ll/ox50;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/nhs;->a:Ll/bjs;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Ll/qzj;->n(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic S()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->a:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openSendGiftRecordsPage()Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic T(Ll/xbe;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 2
    .line 3
    iget-object v1, p1, Ll/xbe;->b:Ll/jjs;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/jjs;->k()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object p1, p0, Ll/nhs;->a:Ll/bjs;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    iget-object p0, p0, Ll/nhs;->a:Ll/bjs;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    const/4 v8, 0x0

    .line 26
    const-string v6, "picture"

    .line 27
    .line 28
    move-object v3, p3

    .line 29
    invoke-static/range {v0 .. v8}, Ll/qzj;->r(Ll/bjs;Ll/jjs;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic W(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/nhs;->w()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public X(Ll/kpj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->w0(Ll/kpj;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Y(Ll/xxj;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 2
    .line 3
    new-instance v1, Ll/myk;

    .line 4
    .line 5
    const/16 v2, 0x2bc

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/myk;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, Ll/xxj;->m(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->B0(Ll/xxj;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/xgs;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Ll/xgs;-><init>(Ll/nhs;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public Z(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->D0(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c0(Ll/cqj;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->z0(Ll/cqj;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d0(Ll/xbe;Ljava/lang/String;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/nhs;->v()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/yec0;->z0:I

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    move-object v1, v0

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;

    .line 32
    .line 33
    new-instance v0, Ll/c0s;

    .line 34
    .line 35
    iget-object v2, p0, Ll/nhs;->a:Ll/bjs;

    .line 36
    .line 37
    invoke-direct {v0, v2, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Ll/mhs;

    .line 41
    .line 42
    invoke-direct {v3, p0, p1, p2, v0}, Ll/mhs;-><init>(Ll/nhs;Ll/xbe;Ljava/lang/String;Ll/c0s;)V

    .line 43
    .line 44
    .line 45
    new-instance v5, Ll/ygs;

    .line 46
    .line 47
    invoke-direct {v5, p0}, Ll/ygs;-><init>(Ll/nhs;)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Ll/zgs;

    .line 51
    .line 52
    invoke-direct {v4, p0}, Ll/zgs;-><init>(Ll/nhs;)V

    .line 53
    .line 54
    .line 55
    new-instance v6, Ll/ahs;

    .line 56
    .line 57
    invoke-direct {v6, v0}, Ll/ahs;-><init>(Ll/c0s;)V

    .line 58
    .line 59
    .line 60
    move-object v2, p1

    .line 61
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->I0(Ll/xbe;Ll/z20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/nhs;->a0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/nhs;->f0(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nhs;->a:Ll/bjs;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshGiftRedDot()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/nhs;->v()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public e0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->H0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;J)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/nhs;->w()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/yec0;->c1:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 16
    .line 17
    invoke-direct {v1, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/nhs;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 21
    .line 22
    sget p1, Ll/jgc0;->b:I

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 25
    .line 26
    .line 27
    sget p1, Ll/mdc0;->d1:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget v1, Ll/mdc0;->p0:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lv/VRadioButton;

    .line 40
    .line 41
    sget v2, Ll/mdc0;->s0:I

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Landroid/widget/TextView;

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 51
    .line 52
    .line 53
    sget v3, Ll/mdc0;->r0:I

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    sget v4, Ll/mdc0;->N6:I

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Landroid/widget/TextView;

    .line 66
    .line 67
    sget v5, Ll/mdc0;->f0:I

    .line 68
    .line 69
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    check-cast v5, Landroid/widget/TextView;

    .line 74
    .line 75
    sget v6, Ll/mdc0;->z0:I

    .line 76
    .line 77
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    check-cast v6, Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-direct {p0, v4}, Ll/nhs;->b0(Landroid/widget/TextView;)V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0, v5}, Ll/nhs;->b0(Landroid/widget/TextView;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0, v6}, Ll/nhs;->b0(Landroid/widget/TextView;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0, v2}, Ll/nhs;->b0(Landroid/widget/TextView;)V

    .line 93
    .line 94
    .line 95
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 96
    .line 97
    invoke-static {}, Ll/u8n;->a()Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_0

    .line 102
    .line 103
    sget v7, Lcom/p1/mobile/putong/live/livingroom/R$string;->b5:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    sget v7, Lcom/p1/mobile/putong/live/livingroom/R$string;->a5:I

    .line 107
    .line 108
    :goto_0
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 109
    .line 110
    .line 111
    move-result-object p4

    .line 112
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p4

    .line 116
    invoke-virtual {v2, v7, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p4

    .line 120
    invoke-virtual {v4, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    sget-object p4, Ll/zrv;->e:Landroid/app/Application;

    .line 124
    .line 125
    sget p5, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 126
    .line 127
    invoke-virtual {p4, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p4

    .line 131
    invoke-virtual {v5, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    sget-object p4, Ll/zrv;->e:Landroid/app/Application;

    .line 135
    .line 136
    sget p5, Lcom/p1/mobile/putong/live/livingroom/R$string;->m5:I

    .line 137
    .line 138
    invoke-virtual {p4, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p4

    .line 142
    invoke-virtual {v6, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    new-instance p4, Ll/fhs;

    .line 146
    .line 147
    invoke-direct {p4, v1}, Ll/fhs;-><init>(Lv/VRadioButton;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v3, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    new-instance p4, Ll/ghs;

    .line 154
    .line 155
    invoke-direct {p4, p0}, Ll/ghs;-><init>(Ll/nhs;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    new-instance p4, Ll/hhs;

    .line 162
    .line 163
    invoke-direct {p4}, Ll/hhs;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    .line 168
    .line 169
    new-instance p1, Ll/ihs;

    .line 170
    .line 171
    invoke-direct {p1, p0, p3, v1}, Ll/ihs;-><init>(Ll/nhs;Ll/y20;Lv/VRadioButton;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    new-instance p1, Ll/jhs;

    .line 178
    .line 179
    invoke-direct {p1, p0, p2, v1}, Ll/jhs;-><init>(Ll/nhs;Ll/y20;Lv/VRadioButton;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v6, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Ll/nhs;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public h0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nhs;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->I0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public i0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->L0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nhs;->s(Ll/bjs;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public j0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->O0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s(Ll/bjs;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nhs;->a:Ll/bjs;

    .line 2
    .line 3
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nhs;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public x()Ll/g4$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->i:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/g4$a;

    .line 16
    .line 17
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->i:Lv/VText;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/g4$a;-><init>(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->getCurrentShowGiftPanel()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, -0x1

    .line 17
    return p0
.end method

.method public z()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhs;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 2
    .line 3
    return-object p0
.end method
