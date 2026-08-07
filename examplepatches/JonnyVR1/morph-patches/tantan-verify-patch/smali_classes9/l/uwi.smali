.class public Ll/uwi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dxi;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VText;

.field public k:Lv/VRelative;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Landroid/widget/RelativeLayout;

.field public o:Lv/VDraweeView;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Ll/dxi;

.field public t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public u:Ljava/lang/String;


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

.method public static synthetic a(Ll/uwi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uwi;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/uwi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uwi;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/uwi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uwi;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/uwi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uwi;->k(Landroid/view/View;)V

    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uwi;->s:Ll/dxi;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Ll/uwi;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/c0s;

    .line 17
    .line 18
    iget-object v2, p0, Ll/uwi;->s:Ll/dxi;

    .line 19
    .line 20
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->FOLLOW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/uwi;->s:Ll/dxi;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uwi;->j:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, p0, v0}, Ll/dxi;->R3(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/uwi;->s:Ll/dxi;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uwi;->j:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, p0, v0}, Ll/dxi;->R3(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/exi;->b(Ll/uwi;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/dxi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uwi;->s:Ll/dxi;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uwi;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dxi;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uwi;->f(Ll/dxi;)V

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
    iget-object p0, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uwi;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uwi;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uwi;->n:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uwi;->c:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/uwi;->o:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "context_single_room"

    .line 24
    .line 25
    invoke-static {v3, v0, v2}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const/16 v3, 0x8

    .line 41
    .line 42
    if-le v2, v3, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "%s..."

    .line 53
    .line 54
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    :cond_0
    iget-object v1, p0, Ll/uwi;->p:Lv/VText;

    .line 59
    .line 60
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->titlePrefix:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->titleSuffix:Ljava/lang/String;

    .line 63
    .line 64
    filled-new-array {v2, v0, v3}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v2, "%s%s%s"

    .line 69
    .line 70
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/uwi;->q:Lv/VText;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->text:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Ll/uwi;->r:Lv/VText;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 87
    .line 88
    invoke-static {p1}, Ll/q0j;->a(Lcom/p1/mobile/putong/data/Gender;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/uwi;->r:Lv/VText;

    .line 96
    .line 97
    sget p2, Ll/obc0;->o7:I

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/uwi;->r:Lv/VText;

    .line 103
    .line 104
    const-string p2, "#ffffff"

    .line 105
    .line 106
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Ll/uwi;->b:Landroid/view/View;

    .line 114
    .line 115
    new-instance p2, Ll/swi;

    .line 116
    .line 117
    invoke-direct {p2, p0}, Ll/swi;-><init>(Ll/uwi;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/uwi;->c:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uwi;->n:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/uwi;->e:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "context_single_room"

    .line 24
    .line 25
    invoke-static {v4, v0, v3}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/uwi;->g:Lv/VText;

    .line 29
    .line 30
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/uwi;->j:Lv/VText;

    .line 36
    .line 37
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->text:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/uwi;->h:Lv/VText;

    .line 43
    .line 44
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 45
    .line 46
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v3, p0, Ll/uwi;->i:Landroid/widget/ImageView;

    .line 58
    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    sget v0, Ll/obc0;->a2:I

    .line 62
    .line 63
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/uwi;->i:Landroid/widget/ImageView;

    .line 67
    .line 68
    sget v3, Ll/obc0;->r7:I

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    sget v0, Ll/obc0;->b2:I

    .line 75
    .line 76
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/uwi;->i:Landroid/widget/ImageView;

    .line 80
    .line 81
    sget v3, Ll/obc0;->s7:I

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 84
    .line 85
    .line 86
    :goto_0
    iget-object v0, p0, Ll/uwi;->k:Lv/VRelative;

    .line 87
    .line 88
    sget v3, Ll/obc0;->B0:I

    .line 89
    .line 90
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/uwi;->l:Lv/VText;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 96
    .line 97
    invoke-static {p1}, Ll/q0j;->a(Lcom/p1/mobile/putong/data/Gender;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/uwi;->b:Landroid/view/View;

    .line 105
    .line 106
    new-instance v0, Ll/twi;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/twi;-><init>(Ll/uwi;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/uwi;->m:Lv/VText;

    .line 115
    .line 116
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/uwi;->u:Ljava/lang/String;

    .line 120
    .line 121
    const-string v0, "ticker"

    .line 122
    .line 123
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_1

    .line 128
    .line 129
    iget-object p1, p0, Ll/uwi;->m:Lv/VText;

    .line 130
    .line 131
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 132
    .line 133
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z0:I

    .line 134
    .line 135
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->tickerTime:I

    .line 136
    .line 137
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    invoke-virtual {v0, v2, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/uwi;->m:Lv/VText;

    .line 153
    .line 154
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    :cond_1
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->type:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/uwi;->u:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Ll/uwi;->init()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Ll/uwi;->k:Lv/VRelative;

    .line 16
    .line 17
    new-instance v1, Ll/qwi;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/qwi;-><init>(Ll/uwi;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 26
    .line 27
    new-instance v1, Ll/rwi;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/rwi;-><init>(Ll/uwi;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->type:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "float"

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Ll/uwi;->n(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/uwi;->p(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public s(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Ll/uwi;->m:Lv/VText;

    .line 7
    .line 8
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z0:I

    .line 11
    .line 12
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final u()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 2
    .line 3
    sget v1, Ll/obc0;->G7:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 9
    .line 10
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 11
    .line 12
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pe:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/uwi;->k:Lv/VRelative;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 33
    .line 34
    const-string v1, "#d0d0d0"

    .line 35
    .line 36
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 44
    .line 45
    new-instance v1, Ll/pwi;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/pwi;-><init>(Ll/uwi;)V

    .line 48
    .line 49
    .line 50
    const-wide/16 v2, 0x3e8

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uwi;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/uwi;->u:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "float"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/uwi;->u()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-virtual {p0}, Ll/uwi;->w()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final w()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uwi;->m:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uwi;->k:Lv/VRelative;

    .line 8
    .line 9
    sget v1, Ll/obc0;->Y0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/uwi;->l:Lv/VText;

    .line 15
    .line 16
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pe:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/uwi;->k:Lv/VRelative;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/uwi;->r:Lv/VText;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/uwi;->l:Lv/VText;

    .line 39
    .line 40
    const-string v1, "#40ffffff"

    .line 41
    .line 42
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/uwi;->k:Lv/VRelative;

    .line 50
    .line 51
    new-instance v1, Ll/pwi;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/pwi;-><init>(Ll/uwi;)V

    .line 54
    .line 55
    .line 56
    const-wide/16 v2, 0x3e8

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 59
    .line 60
    .line 61
    return-void
.end method
