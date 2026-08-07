.class public Ll/ur30;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

.field public final d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ur30;->e:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic E(Ll/ur30;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ur30;->N()V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic G(Ll/ur30;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ur30;->O()Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Ll/ur30;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ur30;->Q()V

    return-void
.end method

.method public static synthetic I(Ll/ur30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ur30;->M(Landroid/view/View;)V

    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->A7(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ur30;->J(Landroid/view/View;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/ur30;->K()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 p0, 0x6

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p2, p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p2, Ll/pec0;->j0:I

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x7

    .line 21
    if-ne p2, p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p2, Ll/pec0;->i0:I

    .line 32
    .line 33
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    const/16 p0, 0x8

    .line 39
    .line 40
    if-ne p2, p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget p2, Ll/pec0;->r0:I

    .line 51
    .line 52
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_2
    const/16 p0, 0x9

    .line 58
    .line 59
    if-ne p2, p0, :cond_3

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget p2, Ll/pec0;->k0:I

    .line 70
    .line 71
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_3
    const/16 p0, 0xa

    .line 77
    .line 78
    if-ne p2, p0, :cond_4

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget p2, Ll/pec0;->n0:I

    .line 89
    .line 90
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_4
    const/16 p0, 0xb

    .line 96
    .line 97
    if-ne p2, p0, :cond_5

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget p2, Ll/pec0;->E0:I

    .line 108
    .line 109
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_5
    invoke-static {p1, p2}, Ll/r9y;->b(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;II)V
    .locals 1

    .line 1
    const/4 p4, 0x6

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;

    .line 5
    .line 6
    iget-object p2, p0, Ll/ur30;->e:Ljava/util/List;

    .line 7
    .line 8
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 9
    .line 10
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->Q(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p4, 0x7

    .line 15
    if-ne p3, p4, :cond_1

    .line 16
    .line 17
    const-string p2, "\u53bb\u5212\u5361\u8ba4\u8bc6\u65b0\u670b\u53cb"

    .line 18
    .line 19
    filled-new-array {p2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string p3, "#fe7e1d"

    .line 28
    .line 29
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    const/4 p4, 0x2

    .line 34
    invoke-static {p4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    const-string v0, "\u65b0\u52a8\u6001\u5df2\u770b\u5b8c\uff0c\u53bb\u5212\u5361\u8ba4\u8bc6\u65b0\u670b\u53cb"

    .line 39
    .line 40
    invoke-static {v0, p2, p3, p4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget p3, Ll/ddc0;->R:I

    .line 45
    .line 46
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    check-cast p3, Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Ll/pr30;

    .line 56
    .line 57
    invoke-direct {p2, p0}, Ll/pr30;-><init>(Ll/ur30;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->S4()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    const/16 p4, 0x8

    .line 72
    .line 73
    if-ne p3, p4, :cond_2

    .line 74
    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedNoSvipItemView;

    .line 76
    .line 77
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;

    .line 78
    .line 79
    new-instance p3, Ll/qr30;

    .line 80
    .line 81
    invoke-direct {p3, p0}, Ll/qr30;-><init>(Ll/ur30;)V

    .line 82
    .line 83
    .line 84
    new-instance p4, Ll/rr30;

    .line 85
    .line 86
    invoke-direct {p4, p0}, Ll/rr30;-><init>(Ll/ur30;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 90
    .line 91
    invoke-virtual {p1, p2, p3, p4, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedNoSvipItemView;->e(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;Ll/x20;Lkotlin/jvm/functions/Function0;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    const/16 p4, 0x9

    .line 96
    .line 97
    if-ne p3, p4, :cond_3

    .line 98
    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 100
    .line 101
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;

    .line 102
    .line 103
    iget-object p3, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 104
    .line 105
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->P0()Ll/dzl;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    new-instance p4, Ll/sr30;

    .line 110
    .line 111
    invoke-direct {p4, p0}, Ll/sr30;-><init>(Ll/ur30;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->s(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;Ll/dzl;Ll/x20;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    const/16 p4, 0xa

    .line 119
    .line 120
    if-ne p3, p4, :cond_4

    .line 121
    .line 122
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 123
    .line 124
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;

    .line 125
    .line 126
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->O0()Lcom/p1/mobile/android/app/Frag;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->w(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;Lcom/p1/mobile/android/app/Frag;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    const/16 p4, 0xb

    .line 137
    .line 138
    if-ne p3, p4, :cond_5

    .line 139
    .line 140
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/weekly/MeetFeedSvipWeeklyItemView;

    .line 141
    .line 142
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 143
    .line 144
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 145
    .line 146
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/weekly/MeetFeedSvipWeeklyItemView;->i(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    .line 151
    .line 152
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 153
    .line 154
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->B0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final K()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ur30;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public L(I)Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ur30;->K()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ur30;->K()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    sub-int/2addr p1, p0

    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic N()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-string v1, "p_meet_view,e_meet_unlock,click"

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->N0(ZLjava/lang/String;)Lkotlin/Unit;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic O()Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const-string v1, "p_meet_view,e_meet_unlock,click"

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->N0(ZLjava/lang/String;)Lkotlin/Unit;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public P(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ur30;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ur30;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/16 v2, 0x14

    .line 19
    .line 20
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-interface {p1, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/tr30;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/tr30;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x2

    .line 8
    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/ur30;->c:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->p1()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ur30;->L(I)Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ur30;->K()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x6

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ur30;->K()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr p1, v0

    .line 16
    iget-object v0, p0, Ll/ur30;->d:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 23
    .line 24
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetGuideToSwipeCardItemData;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x7

    .line 29
    return p0

    .line 30
    :cond_1
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedImageItemData;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedVideoItemData;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    const/4 p0, 0x2

    .line 41
    return p0

    .line 42
    :cond_3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 43
    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    const/4 p0, 0x4

    .line 47
    return p0

    .line 48
    :cond_4
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 49
    .line 50
    if-eqz v1, :cond_5

    .line 51
    .line 52
    const/4 p0, 0x5

    .line 53
    return p0

    .line 54
    :cond_5
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;

    .line 55
    .line 56
    if-eqz v1, :cond_6

    .line 57
    .line 58
    const/16 p0, 0x8

    .line 59
    .line 60
    return p0

    .line 61
    :cond_6
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;

    .line 62
    .line 63
    if-eqz v1, :cond_7

    .line 64
    .line 65
    const/16 p0, 0x9

    .line 66
    .line 67
    return p0

    .line 68
    :cond_7
    instance-of v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;

    .line 69
    .line 70
    if-eqz v1, :cond_8

    .line 71
    .line 72
    const/16 p0, 0xa

    .line 73
    .line 74
    return p0

    .line 75
    :cond_8
    instance-of v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 76
    .line 77
    if-eqz v0, :cond_9

    .line 78
    .line 79
    const/16 p0, 0xb

    .line 80
    .line 81
    return p0

    .line 82
    :cond_9
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0
.end method
