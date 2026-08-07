.class public Ll/tjd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wkd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/c0s;

.field public b:Ll/wkd0;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;


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

.method public static synthetic a(Ll/tjd0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tjd0;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/tjd0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tjd0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/tjd0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tjd0;->m(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/tjd0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tjd0;->n(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->c:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->b:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->a:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public f(Ll/wkd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tjd0;->j()Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tjd0;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v1, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 25
    .line 26
    iget-object v1, v1, Ll/wkd0;->i:Ll/nv2;

    .line 27
    .line 28
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 29
    .line 30
    invoke-virtual {v1, v3, v2}, Ll/nv2;->Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/c0s;

    .line 34
    .line 35
    iget-object v2, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 36
    .line 37
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/tjd0;->a:Ll/c0s;

    .line 41
    .line 42
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->d:Landroid/widget/TextView;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->f:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->d:Landroid/widget/TextView;

    .line 54
    .line 55
    new-instance v3, Ll/pjd0;

    .line 56
    .line 57
    invoke-direct {v3, p0, p1}, Ll/pjd0;-><init>(Ll/tjd0;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->f:Landroid/widget/ImageView;

    .line 64
    .line 65
    new-instance v3, Ll/qjd0;

    .line 66
    .line 67
    invoke-direct {v3, p0, p1}, Ll/qjd0;-><init>(Ll/tjd0;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->f:Landroid/widget/ImageView;

    .line 74
    .line 75
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    const/high16 p1, 0x43260000    # 166.0f

    .line 79
    .line 80
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 85
    .line 86
    invoke-direct {v1, p1, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 87
    .line 88
    .line 89
    const/16 p1, 0x51

    .line 90
    .line 91
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 92
    .line 93
    const/high16 p1, 0x41200000    # 10.0f

    .line 94
    .line 95
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 100
    .line 101
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautyMenuView;->g:Landroid/widget/FrameLayout;

    .line 102
    .line 103
    iget-object v0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 104
    .line 105
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/tjd0;->a:Ll/c0s;

    .line 109
    .line 110
    const/4 p1, 0x0

    .line 111
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d0(Z)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tjd0;->f(Ll/wkd0;)V

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

.method public final j()Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/tjd0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->i5:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->b:Landroid/widget/ImageView;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->a:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->b:Landroid/widget/ImageView;

    .line 34
    .line 35
    new-instance v2, Ll/rjd0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/rjd0;-><init>(Ll/tjd0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    sget v1, Ll/obc0;->H7:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->c:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    new-instance v2, Ll/sjd0;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/sjd0;-><init>(Ll/tjd0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->a:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ll/tjd0;->a:Ll/c0s;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/tjd0;->a:Ll/c0s;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public l()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tjd0;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherPreviewView;->a:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic m(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wkd0;->t4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wkd0;->s4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wkd0;->e5()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tjd0;->b:Ll/wkd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wkd0;->o4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tjd0;->a:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/tjd0;->i(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/tjd0;->a:Ll/c0s;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
