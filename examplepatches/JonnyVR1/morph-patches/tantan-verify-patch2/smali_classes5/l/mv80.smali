.class public Ll/mv80;
.super Ll/mf40;
.source "SourceFile"


# instance fields
.field public n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

.field public o:Lv/VListCell;

.field public p:Lv/VListCell;

.field public q:Lv/VListCell;

.field public r:Lv/VListCell;

.field public s:Lv/VListCell;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mf40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nv80;->a(Ll/mv80;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/mv80;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/mv80;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->q()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/mv80;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 27
    .line 28
    new-instance v1, Ll/mv80$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/mv80$a;-><init>(Ll/mv80;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->setHiddenNearByViewListener(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-super {p0}, Ll/mf40;->r()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public v(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mf40;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mv80;->I(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/mv80;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 7
    .line 8
    iput-object p1, p0, Ll/mf40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 9
    .line 10
    iget-object p1, p0, Ll/mv80;->r:Lv/VListCell;

    .line 11
    .line 12
    iput-object p1, p0, Ll/mf40;->b:Lv/VListCell;

    .line 13
    .line 14
    iget-object p1, p0, Ll/mv80;->p:Lv/VListCell;

    .line 15
    .line 16
    iput-object p1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 17
    .line 18
    iget-object p1, p0, Ll/mv80;->o:Lv/VListCell;

    .line 19
    .line 20
    iput-object p1, p0, Ll/mf40;->d:Lv/VListCell;

    .line 21
    .line 22
    iget-object p1, p0, Ll/mv80;->q:Lv/VListCell;

    .line 23
    .line 24
    iput-object p1, p0, Ll/mf40;->e:Lv/VListCell;

    .line 25
    .line 26
    iget-object p1, p0, Ll/mv80;->s:Lv/VListCell;

    .line 27
    .line 28
    iput-object p1, p0, Ll/mf40;->f:Lv/VListCell;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/mv80;->r()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
