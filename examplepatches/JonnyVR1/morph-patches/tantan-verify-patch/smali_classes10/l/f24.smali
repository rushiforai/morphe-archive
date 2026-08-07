.class public Ll/f24;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/t14;

.field public b:Ll/c0s;

.field public c:Ll/nv2;


# direct methods
.method public constructor <init>(Ll/t14;Ll/nv2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f24;->a:Ll/t14;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f24;->c:Ll/nv2;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/f24;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f24;->c(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f24;->b:Ll/c0s;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f24;->b:Ll/c0s;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f24;->b:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/f24;->a:Ll/t14;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/yec0;->q:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/f24;->c:Ll/nv2;

    .line 25
    .line 26
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 27
    .line 28
    invoke-virtual {v1, v3, v2}, Ll/nv2;->Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/c0s;

    .line 32
    .line 33
    iget-object v2, p0, Ll/f24;->a:Ll/t14;

    .line 34
    .line 35
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Ll/f24;->b:Ll/c0s;

    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->f:Landroid/widget/ImageView;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->d:Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->g:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    new-instance v1, Ll/e24;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/e24;-><init>(Ll/f24;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object p0, p0, Ll/f24;->b:Ll/c0s;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 64
    .line 65
    .line 66
    return-void
.end method
