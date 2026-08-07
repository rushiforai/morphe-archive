.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->J(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-static {}, Ll/bnl0;->y0()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    int-to-float p3, p3

    .line 20
    int-to-float p1, p1

    .line 21
    int-to-float p2, p2

    .line 22
    div-float/2addr p1, p2

    .line 23
    mul-float/2addr p3, p1

    .line 24
    float-to-int p1, p3

    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->a:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-static {p2, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 33
    .line 34
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
