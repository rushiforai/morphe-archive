.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;
.super Ll/mf40;
.source "SourceFile"


# instance fields
.field public n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;

.field public o:Landroid/view/View;

.field public p:Lv/VListCell;

.field public q:Lv/VListCell;

.field public r:Lv/VListCell;

.field public s:Lv/VListCell;

.field public t:Lv/VLinear;

.field public u:Lv/VListCell;


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
    invoke-static {p0, p1}, Ll/jk40;->a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/mf40;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->I(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;

    .line 7
    .line 8
    iput-object p1, p0, Ll/mf40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->p:Lv/VListCell;

    .line 11
    .line 12
    iput-object p1, p0, Ll/mf40;->b:Lv/VListCell;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->q:Lv/VListCell;

    .line 15
    .line 16
    iput-object p1, p0, Ll/mf40;->c:Lv/VListCell;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->r:Lv/VListCell;

    .line 19
    .line 20
    iput-object p1, p0, Ll/mf40;->d:Lv/VListCell;

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->s:Lv/VListCell;

    .line 23
    .line 24
    iput-object p1, p0, Ll/mf40;->e:Lv/VListCell;

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->t:Lv/VLinear;

    .line 27
    .line 28
    iput-object p1, p0, Ll/mf40;->g:Lv/VLinear;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->u:Lv/VListCell;

    .line 31
    .line 32
    iput-object p1, p0, Ll/mf40;->f:Lv/VListCell;

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->o:Landroid/view/View;

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->q()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;

    .line 65
    .line 66
    new-instance v0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a$a;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a$a;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/a;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->setHiddenNearByViewListener(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-virtual {p0}, Ll/mf40;->r()V

    .line 75
    .line 76
    .line 77
    return-void
.end method
