.class public Ll/pks$a;
.super Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pks;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic d:Ll/pks;


# direct methods
.method public constructor <init>(Ll/pks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pks$a;->d:Ll/pks;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/pks$a;->b:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/pks$a;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public loadResError(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->loadResError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks$a;->d:Ll/pks;

    .line 5
    .line 6
    iget-object v0, v0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pks$a;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 13
    .line 14
    iget-object v2, p0, Ll/pks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 15
    .line 16
    invoke-static {v0, p1, v2}, Ll/muj;->y(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/pks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/pks$a;->b:Z

    .line 22
    .line 23
    invoke-static {p1, v1, v0}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/pks$a;->d:Ll/pks;

    .line 27
    .line 28
    invoke-static {p0}, Ll/pks;->a(Ll/pks;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks$a;->d:Ll/pks;

    .line 5
    .line 6
    iget-object v0, v0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    invoke-static {v0}, Ll/muj;->x(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/pks$a;->d:Ll/pks;

    .line 18
    .line 19
    invoke-static {p0}, Ll/pks;->a(Ll/pks;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks$a;->d:Ll/pks;

    .line 5
    .line 6
    iget-object v0, v0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    invoke-static {v0}, Ll/muj;->z(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    iget-boolean p0, p0, Ll/pks$a;->b:Z

    .line 20
    .line 21
    invoke-static {v0, v1, p0}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
