.class public Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;
.super Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;
.source "SourceFile"

# interfaces
.implements Ll/cvl;


# instance fields
.field public C:Landroid/widget/FrameLayout;

.field public D:Landroid/widget/FrameLayout;

.field public E:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeTitleBarRootLayout;

.field public F:Lv/VFrame;

.field public G:Lv/VOnlineIndicator;

.field public H:Landroid/widget/FrameLayout;

.field public I:Landroid/view/View;

.field public J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final K:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lal;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->K:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public static C5()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private J5()V
    .locals 1

    .line 1
    invoke-static {}, Ll/s7a;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    instance-of v0, p0, Lcom/p1/mobile/android/statistic/AutoSpeedFrameLayout;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private synthetic M5()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->f1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic O5(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->F:Lv/VFrame;

    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/dkb;->a8()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MARRY_MODE:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 36
    .line 37
    iget-object p1, p1, Ll/uab;->Z:Ll/jxd0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 54
    .line 55
    iget-object p1, p1, Ll/uab;->Z:Ll/jxd0;

    .line 56
    .line 57
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-static {}, Ll/s7a;->z()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/tqb;->m3()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/tqb;->p3()V

    .line 83
    .line 84
    .line 85
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->YOUTH_VIP:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 86
    .line 87
    invoke-virtual {p0, v0, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    invoke-static {}, Ll/gra;->J3()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 100
    .line 101
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 114
    .line 115
    iget-object p1, p1, Ll/dkb;->R3:Ll/wyd0;

    .line 116
    .line 117
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Ljava/lang/CharSequence;

    .line 122
    .line 123
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_3

    .line 134
    .line 135
    invoke-virtual {p0, v0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->enable:Z

    .line 144
    .line 145
    if-eqz p1, :cond_4

    .line 146
    .line 147
    invoke-static {}, Ll/v4j0;->c()Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-eqz p1, :cond_4

    .line 152
    .line 153
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->WEBVIEW_CONFIG:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 154
    .line 155
    invoke-virtual {p0, v0, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 160
    .line 161
    invoke-virtual {p0, v0, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method private synthetic P5(Ljava/lang/Integer;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    new-array v0, v3, [Landroid/view/View;

    .line 24
    .line 25
    aput-object p0, v0, v2

    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    new-array v0, v3, [Landroid/view/View;

    .line 38
    .line 39
    aput-object p0, v0, v2

    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method private synthetic U5(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->B(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic g5(Ll/bkj0;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic h5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->V5(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic i5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->N5(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Ll/pf60;)V

    return-void
.end method

.method public static synthetic j5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->R5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    return-void
.end method

.method public static synthetic m5(Ll/pf60;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->T5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->O5(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic p5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->W5()V

    return-void
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->Q5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic r5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->S5(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->X5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic u5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->P5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic v5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->U5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic z5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->M5()V

    return-void
.end method


# virtual methods
.method public A5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/abl;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public B5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 9
    .line 10
    if-ne v0, p1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->I:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->I:Landroid/view/View;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    if-ne v0, p1, :cond_2

    .line 30
    .line 31
    invoke-static {}, Ll/jj40;->c()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    new-array p1, v1, [Landroid/view/View;

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    new-array v0, v0, [Landroid/view/View;

    .line 49
    .line 50
    aput-object p0, v0, v1

    .line 51
    .line 52
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public C1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C4()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "+",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nal;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u63d2\u5165\u6bcf\u65e5\u7cbe\u9009tab"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    filled-new-array {v0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->C4()Ljava/util/Collection;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public D4(Landroid/view/MotionEvent;Z)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongFrag;->D4(Landroid/view/MotionEvent;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public D5()Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E5()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->G:Lv/VOnlineIndicator;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    new-array p0, p0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v0, "e_mode_switching_red_dot"

    .line 13
    .line 14
    const-string v1, "p_suggest_users_home_view"

    .line 15
    .line 16
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final F5()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 10
    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    const/high16 v0, 0x42600000    # 56.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    :catch_0
    :cond_2
    return-void
.end method

.method public G5()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/jj40;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public H5()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/gra;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->I:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ux0;->d()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 34
    .line 35
    const/4 v1, -0x1

    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->I:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->I:Landroid/view/View;

    .line 48
    .line 49
    filled-new-array {p0}, [Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ll/bnl0;->r0([Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public I2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->h(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final I5()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Ll/haw;->Companion:Ll/haw$a;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/haw$a;->a()Ll/haw;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/haw;->G0()Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ll/qal;

    .line 30
    .line 31
    invoke-direct {v2, p0, v0}, Ll/qal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/ral;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/ral;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public K5()V
    .locals 0

    .line 1
    return-void
.end method

.method public L5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->F:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->e2()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->e()V

    .line 22
    .line 23
    .line 24
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 25
    .line 26
    const/4 v1, -0x2

    .line 27
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    sget-object v1, Ll/r5j0;->INSTANCE:Ll/r5j0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/r5j0;->f()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    const/4 v1, -0x1

    .line 39
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 40
    .line 41
    :cond_0
    const/16 v1, 0x13

    .line 42
    .line 43
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->setTabSelected(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 60
    .line 61
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->K:Ll/y20;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->setOnTabClickListener(Ll/y20;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 72
    .line 73
    new-instance v0, Ll/mal;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/mal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/gra;->Z2()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    const/4 v0, 0x0

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    invoke-static {}, Ll/spl0;->A()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_1

    .line 93
    .line 94
    invoke-static {}, Ll/spl0;->B()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_1

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 101
    .line 102
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    :cond_1
    invoke-static {}, Ll/gra;->X2()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 114
    .line 115
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 116
    .line 117
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Ljava/lang/String;

    .line 122
    .line 123
    const-string v1, "marryMode"

    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->F:Lv/VFrame;

    .line 130
    .line 131
    if-eqz p1, :cond_2

    .line 132
    .line 133
    const/4 p1, 0x1

    .line 134
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 138
    .line 139
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 143
    .line 144
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_2
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H:Landroid/widget/FrameLayout;

    .line 152
    .line 153
    sget p1, Ll/qa00;->h:I

    .line 154
    .line 155
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 156
    .line 157
    .line 158
    :cond_3
    return-void
.end method

.method public final synthetic N5(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Ll/pf60;)V
    .locals 2

    .line 1
    sget-object v0, Ll/i8w;->INSTANCE:Ll/i8w;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0, p2, p1}, Ll/i8w;->e(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Ll/pf60;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public O()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->E:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeTitleBarRootLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic Q5(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->E5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->WEBVIEW_CONFIG:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->B(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Ll/oal;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/oal;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-static {}, Ll/v4j0;->f()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 59
    .line 60
    const/4 p1, 0x1

    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->B(Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->B(Z)V

    .line 74
    .line 75
    .line 76
    :cond_3
    return-void
.end method

.method public final synthetic S5(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->WEBVIEW_CONFIG:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public T()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic T5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/v4j0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->Z5()Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic V5(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserInfoForMarryStatus()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "passed"

    .line 6
    .line 7
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object p1, p1, Ll/dkb;->b4:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    :cond_0
    invoke-static {}, Ll/n3x;->e()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    :cond_1
    sget-object p1, Ll/esc0;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1}, Ll/esc0;->e(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->G:Lv/VOnlineIndicator;

    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->G:Lv/VOnlineIndicator;

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic W5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ll/jj40;->h(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic X5(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->d(I)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->b5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->Y5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/s7a;->w()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->D:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->E:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeTitleBarRootLayout;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public Y()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Y5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, "p_suggest_users_home_view"

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "e_swipe_nav_tab"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Ll/r5j0;->INSTANCE:Ll/r5j0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/r5j0;->d()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PLAY_TOGETHER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const-string p0, "e_suggest_offline_party"

    .line 40
    .line 41
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public Z5()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->b5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public e3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->A()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 1

    .line 1
    sget-object v0, Ll/jj40;->f:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->h(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f4()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/eal;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/eal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ll/jj40;->d:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/xal;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/xal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/d79;->e0()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->I5()V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->enable:Z

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->G5()Lrx/subjects/a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/yal;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/yal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/zal;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/zal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/fal;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/fal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Ll/gal;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/gal;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 120
    .line 121
    iget-object v0, v0, Ll/dkb;->N3:Lrx/subjects/b;

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ll/hal;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/hal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 130
    .line 131
    .line 132
    new-instance v2, Ll/ial;

    .line 133
    .line 134
    invoke-direct {v2}, Ll/ial;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    :cond_1
    invoke-static {}, Ll/gra;->e2()Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_2

    .line 149
    .line 150
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 151
    .line 152
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 153
    .line 154
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 163
    .line 164
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 165
    .line 166
    iget-object v1, v1, Ll/dkb;->b4:Ll/jxd0;

    .line 167
    .line 168
    invoke-virtual {v1}, Ll/hxd0;->obs()Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 177
    .line 178
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 179
    .line 180
    iget-object v2, v2, Ll/dkb;->o4:Ll/wyd0;

    .line 181
    .line 182
    invoke-virtual {v2}, Ll/hxd0;->obs()Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    new-instance v3, Ll/jal;

    .line 191
    .line 192
    invoke-direct {v3}, Ll/jal;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-static {v0, v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v1, Ll/kal;

    .line 200
    .line 201
    invoke-direct {v1}, Ll/kal;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    new-instance v1, Ll/pal;

    .line 213
    .line 214
    invoke-direct {v1, p0}, Ll/pal;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 215
    .line 216
    .line 217
    new-instance v2, Ll/sal;

    .line 218
    .line 219
    invoke-direct {v2}, Ll/sal;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    new-instance v2, Ll/p040;

    .line 254
    .line 255
    invoke-direct {v2}, Ll/p040;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    new-instance v1, Ll/tal;

    .line 263
    .line 264
    invoke-direct {v1}, Ll/tal;-><init>()V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    new-instance v1, Ll/ual;

    .line 276
    .line 277
    invoke-direct {v1, p0}, Ll/ual;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 278
    .line 279
    .line 280
    new-instance v2, Ll/val;

    .line 281
    .line 282
    invoke-direct {v2}, Ll/val;-><init>()V

    .line 283
    .line 284
    .line 285
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 290
    .line 291
    .line 292
    invoke-static {}, Ll/gra;->X2()Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_2

    .line 297
    .line 298
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 299
    .line 300
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 301
    .line 302
    iget-object v0, v0, Ll/dkb;->F1:Lrx/subjects/b;

    .line 303
    .line 304
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag$b;

    .line 309
    .line 310
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V

    .line 311
    .line 312
    .line 313
    new-instance p0, Ll/wal;

    .line 314
    .line 315
    invoke-direct {p0}, Ll/wal;-><init>()V

    .line 316
    .line 317
    .line 318
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 323
    .line 324
    .line 325
    :cond_2
    return-void
.end method

.method public f5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->setTabSelected(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->B5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 25
    .line 26
    const-string v1, "tab"

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    const-string v3, "initiative"

    .line 30
    .line 31
    invoke-virtual {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->s6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->F5()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J5()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->A5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->E:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeTitleBarRootLayout;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    new-array v1, v0, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aput-object p2, v1, v2

    .line 12
    .line 13
    invoke-static {v1}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->E:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeTitleBarRootLayout;

    .line 17
    .line 18
    new-array v0, v0, [Landroid/view/View;

    .line 19
    .line 20
    aput-object p2, v0, v2

    .line 21
    .line 22
    invoke-static {v0}, Ll/bnl0;->r0([Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->H5()V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->L5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->B5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->K5()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->F5()V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public k4()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public n2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/gra;->e2()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->a8()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MARRY_MODE:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 23
    .line 24
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->J:Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->setTabSelected(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public o()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 11
    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->f()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    if-ne v0, v2, :cond_1

    .line 31
    .line 32
    return v3

    .line 33
    :cond_1
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MARRY_MODE:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 34
    .line 35
    if-ne v0, v4, :cond_2

    .line 36
    .line 37
    return v3

    .line 38
    :cond_2
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->b5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 39
    .line 40
    .line 41
    return v1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "p_suggest_users_home_view"

    .line 21
    .line 22
    return-object p0
.end method
