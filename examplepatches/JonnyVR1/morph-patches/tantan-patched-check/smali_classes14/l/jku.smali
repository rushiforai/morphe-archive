.class public Ll/jku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vlu<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/vlu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vlu<",
            "*>;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


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

.method public static synthetic a(Ll/jku;Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jku;->w(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lv/VRadioButton;Landroid/view/View;)V
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

.method public static synthetic d(Ll/jku;Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jku;->x(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/jku;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jku;->u(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic f(Ll/jku;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jku;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/jku;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jku;->k()V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->q0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;J)V
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
    invoke-virtual {p0}, Ll/jku;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/xec0;->k:I

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
    iput-object v1, p0, Ll/jku;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 21
    .line 22
    sget p1, Ll/hgc0;->a:I

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 25
    .line 26
    .line 27
    sget p1, Ll/ldc0;->Z:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget v1, Ll/ldc0;->B:I

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
    sget v2, Ll/ldc0;->D:I

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
    sget v3, Ll/ldc0;->C:I

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    sget v4, Ll/ldc0;->R1:I

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
    sget v5, Ll/ldc0;->A:I

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
    sget v6, Ll/ldc0;->I:I

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
    invoke-virtual {p0, v4}, Ll/jku;->z(Landroid/widget/TextView;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v5}, Ll/jku;->z(Landroid/widget/TextView;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v6}, Ll/jku;->z(Landroid/widget/TextView;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v2}, Ll/jku;->z(Landroid/widget/TextView;)V

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
    sget v7, Lcom/p1/mobile/putong/live/external/R$string;->D:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    sget v7, Lcom/p1/mobile/putong/live/external/R$string;->C:I

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
    sget p5, Lcom/p1/mobile/putong/live/external/R$string;->h:I

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
    sget p5, Lcom/p1/mobile/putong/live/external/R$string;->E:I

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
    new-instance p4, Ll/dku;

    .line 146
    .line 147
    invoke-direct {p4, v1}, Ll/dku;-><init>(Lv/VRadioButton;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v3, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    new-instance p4, Ll/eku;

    .line 154
    .line 155
    invoke-direct {p4, p0}, Ll/eku;-><init>(Ll/jku;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    new-instance p4, Ll/fku;

    .line 162
    .line 163
    invoke-direct {p4}, Ll/fku;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    .line 168
    .line 169
    new-instance p1, Ll/gku;

    .line 170
    .line 171
    invoke-direct {p1, p0, p3, v1}, Ll/gku;-><init>(Ll/jku;Ll/y20;Lv/VRadioButton;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    new-instance p1, Ll/hku;

    .line 178
    .line 179
    invoke-direct {p1, p0, p2, v1}, Ll/hku;-><init>(Ll/jku;Ll/y20;Lv/VRadioButton;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v6, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Ll/jku;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public C(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->r0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

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

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->p0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/jku;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vlu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jku;->j(Ll/vlu;)V

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
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public j(Ll/vlu;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vlu<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jku;->a:Ll/vlu;

    .line 2
    .line 3
    return-void
.end method

.method public final k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->m0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->getDialog()Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->getDialog()Landroid/app/Dialog;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Ll/juj;->a()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jku;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    iput-object v0, p0, Ll/jku;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public n()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->getCurrentShowGiftPanel()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogGiftsView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogGiftsView;->f:Lv/VPager;

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

.method public p()Ll/e060;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->getFlyDestination()Ll/e060;

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

.method public q()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogGiftsView;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogGiftsView;->i:I

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

.method public s(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 11
    .line 12
    iget-object p1, p0, Ll/jku;->a:Ll/vlu;

    .line 13
    .line 14
    new-instance v1, Ll/bku;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/bku;-><init>(Ll/jku;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/cku;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/cku;-><init>(Ll/jku;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->k0(Ll/vlu;Ll/x20;Landroid/content/DialogInterface$OnDismissListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/jku;->a:Ll/vlu;

    .line 28
    .line 29
    iget-object p0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ll/vlu;->S3(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jku;->a:Ll/vlu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vlu;->P3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jku;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
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
    invoke-virtual {p0}, Ll/jku;->m()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic x(Ll/y20;Lv/VRadioButton;Landroid/view/View;)V
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
    invoke-virtual {p0}, Ll/jku;->m()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public y(Ll/xxj;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jku;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogContentView;->o0(Ll/xxj;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/iku;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/iku;-><init>(Ll/jku;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final z(Landroid/widget/TextView;)V
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
