.class public Ll/a8t;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/hj2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "TP;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/view/View;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VSwitch;

.field public n:Lv/VFrame;

.field public o:Landroid/view/View;

.field public p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->w4:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/a8t;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/a8t;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lv/VImage;

    .line 12
    .line 13
    iput-object v1, p0, Ll/a8t;->f:Lv/VImage;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_iv_back"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    const/4 v2, 0x1

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lv/VText;

    .line 27
    .line 28
    iput-object v3, p0, Ll/a8t;->g:Lv/VText;

    .line 29
    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    const-string v1, "_tv_title"

    .line 33
    .line 34
    :cond_1
    const/4 v3, 0x2

    .line 35
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lv/VText;

    .line 40
    .line 41
    iput-object v3, p0, Ll/a8t;->h:Lv/VText;

    .line 42
    .line 43
    if-nez v3, :cond_2

    .line 44
    .line 45
    const-string v1, "_iv_ok"

    .line 46
    .line 47
    :cond_2
    const/4 v3, 0x3

    .line 48
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iput-object v3, p0, Ll/a8t;->i:Landroid/view/View;

    .line 53
    .line 54
    if-nez v3, :cond_3

    .line 55
    .line 56
    const-string v1, "_top_space"

    .line 57
    .line 58
    :cond_3
    const/4 v3, 0x4

    .line 59
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lv/VText;

    .line 64
    .line 65
    iput-object v3, p0, Ll/a8t;->j:Lv/VText;

    .line 66
    .line 67
    if-nez v3, :cond_4

    .line 68
    .line 69
    const-string v1, "_tv_time_title"

    .line 70
    .line 71
    :cond_4
    const/4 v3, 0x5

    .line 72
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lv/VText;

    .line 77
    .line 78
    iput-object v3, p0, Ll/a8t;->k:Lv/VText;

    .line 79
    .line 80
    if-nez v3, :cond_5

    .line 81
    .line 82
    const-string v1, "_tv_time"

    .line 83
    .line 84
    :cond_5
    const/4 v3, 0x6

    .line 85
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Lv/VText;

    .line 90
    .line 91
    iput-object v3, p0, Ll/a8t;->l:Lv/VText;

    .line 92
    .line 93
    if-nez v3, :cond_6

    .line 94
    .line 95
    const-string v1, "_tv_pk_invite_title"

    .line 96
    .line 97
    :cond_6
    const/4 v3, 0x7

    .line 98
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lv/VSwitch;

    .line 103
    .line 104
    iput-object v3, p0, Ll/a8t;->m:Lv/VSwitch;

    .line 105
    .line 106
    if-nez v3, :cond_7

    .line 107
    .line 108
    const-string v1, "_switcher"

    .line 109
    .line 110
    :cond_7
    const/16 v3, 0x8

    .line 111
    .line 112
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Lv/VFrame;

    .line 117
    .line 118
    iput-object v4, p0, Ll/a8t;->n:Lv/VFrame;

    .line 119
    .line 120
    if-nez v4, :cond_8

    .line 121
    .line 122
    const-string v1, "_range_layout"

    .line 123
    .line 124
    :cond_8
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    check-cast v4, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Ll/a8t;->o:Landroid/view/View;

    .line 135
    .line 136
    if-nez v0, :cond_9

    .line 137
    .line 138
    const-string v1, "_range_layout_range_bg"

    .line 139
    .line 140
    :cond_9
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 151
    .line 152
    iput-object p1, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 153
    .line 154
    if-nez p1, :cond_a

    .line 155
    .line 156
    const-string v1, "_range_layout_wheel_pick"

    .line 157
    .line 158
    :cond_a
    if-nez v1, :cond_b

    .line 159
    .line 160
    return-void

    .line 161
    :cond_b
    const-string p0, "Missing required view with ID:"

    .line 162
    .line 163
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method
