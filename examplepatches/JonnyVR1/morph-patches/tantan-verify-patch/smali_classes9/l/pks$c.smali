.class public Ll/pks$c;
.super Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pks;->h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Z

.field public final synthetic c:Ll/pks;


# direct methods
.method public constructor <init>(Ll/pks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pks$c;->c:Ll/pks;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pks$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/pks$c;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public loadResError(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->loadResError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks$c;->c:Ll/pks;

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
    iget-object v0, p0, Ll/pks$c;->c:Ll/pks;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/pks;->j()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pks$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/muj;->J(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/pks$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 23
    .line 24
    iget-boolean p0, p0, Ll/pks$c;->b:Z

    .line 25
    .line 26
    invoke-static {p1, v1, p0}, Ll/rre;->t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks$c;->c:Ll/pks;

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
    iget-object v0, p0, Ll/pks$c;->c:Ll/pks;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/pks;->j()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/pks$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    invoke-static {p0}, Ll/muj;->K(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks$c;->c:Ll/pks;

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
    iget-object v0, p0, Ll/pks$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    invoke-static {v0}, Ll/muj;->L(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pks$c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    iget-boolean p0, p0, Ll/pks$c;->b:Z

    .line 20
    .line 21
    invoke-static {v0, v1, p0}, Ll/rre;->t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
