.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/c2i;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/c2i;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/content/Context;

.field public e:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Ll/c2i;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;Landroid/content/Context;Ljava/util/List;Ll/h80;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ll/c2i;",
            ">;",
            "Ll/h80<",
            "Ll/c2i;",
            ">;",
            "Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->g:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->h:I

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->i:I

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->d:Landroid/content/Context;

    .line 14
    .line 15
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->e:Ll/h80;

    .line 16
    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->f:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 20
    .line 21
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->j:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->O(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ljava/util/List;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->Q(Ljava/util/List;Ll/x20;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ll/c2i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->N(Ll/c2i;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->P(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    check-cast p2, Ll/c2i;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->J(Landroid/view/View;Ll/c2i;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->I()Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p2, Ll/tec0;->o3:I

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x3

    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->I()Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p2, Ll/tec0;->s0:I

    .line 32
    .line 33
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->I()Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p2, Ll/tec0;->K1:I

    .line 47
    .line 48
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final I()Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->d:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public J(Landroid/view/View;Ll/c2i;II)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p3, v1, :cond_1

    .line 4
    .line 5
    if-eq p3, v0, :cond_1

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    if-ne p3, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void

    .line 12
    :cond_1
    :goto_0
    if-ne p3, v1, :cond_2

    .line 13
    .line 14
    iget-object v2, p2, Ll/c2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_2
    if-ne p3, v0, :cond_3

    .line 20
    .line 21
    iget-object v2, p2, Ll/c2i;->c:Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_3
    const-string v2, "\u5979\u559c\u6b22\u4e86\u4f60,\u6253\u4e2a\u62db\u547c\u5427"

    .line 29
    .line 30
    :goto_1
    sget v3, Ll/hdc0;->j2:I

    .line 31
    .line 32
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    const/high16 v3, 0x42400000    # 48.0f

    .line 54
    .line 55
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    int-to-float v3, v3

    .line 60
    cmpg-float v3, v2, v3

    .line 61
    .line 62
    const/4 v4, 0x0

    .line 63
    if-gtz v3, :cond_4

    .line 64
    .line 65
    const/high16 v3, 0x42600000    # 56.0f

    .line 66
    .line 67
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    mul-int/2addr v3, v0

    .line 72
    int-to-float v3, v3

    .line 73
    add-float/2addr v3, v2

    .line 74
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    :goto_2
    int-to-float v2, v2

    .line 79
    add-float/2addr v3, v2

    .line 80
    float-to-int v2, v3

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    const/high16 v3, 0x42e00000    # 112.0f

    .line 83
    .line 84
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    int-to-float v3, v3

    .line 89
    cmpg-float v3, v2, v3

    .line 90
    .line 91
    if-gtz v3, :cond_5

    .line 92
    .line 93
    const/high16 v3, 0x42200000    # 40.0f

    .line 94
    .line 95
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    mul-int/2addr v3, v0

    .line 100
    int-to-float v3, v3

    .line 101
    add-float/2addr v3, v2

    .line 102
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    goto :goto_2

    .line 107
    :cond_5
    const/high16 v3, 0x43100000    # 144.0f

    .line 108
    .line 109
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    int-to-float v4, v4

    .line 114
    cmpg-float v4, v2, v4

    .line 115
    .line 116
    const/high16 v5, 0x41800000    # 16.0f

    .line 117
    .line 118
    const/high16 v6, 0x41e00000    # 28.0f

    .line 119
    .line 120
    if-gtz v4, :cond_6

    .line 121
    .line 122
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    mul-int/2addr v3, v0

    .line 127
    int-to-float v3, v3

    .line 128
    add-float/2addr v3, v2

    .line 129
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    goto :goto_2

    .line 134
    :cond_6
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    mul-int/2addr v2, v0

    .line 139
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    add-int/2addr v2, v3

    .line 144
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    add-int/2addr v2, v3

    .line 149
    :goto_3
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 154
    .line 155
    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->e:Ll/h80;

    .line 159
    .line 160
    invoke-virtual {v2, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 161
    .line 162
    .line 163
    if-ne p3, v1, :cond_7

    .line 164
    .line 165
    move-object p3, p1

    .line 166
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;

    .line 167
    .line 168
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->k0(Ll/c2i;)V

    .line 169
    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_7
    if-ne p3, v0, :cond_8

    .line 173
    .line 174
    move-object p3, p1

    .line 175
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;

    .line 176
    .line 177
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareVoiceItem;->j0(Ll/c2i;)V

    .line 178
    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_8
    move-object p3, p1

    .line 182
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedFakeSquareItem;

    .line 183
    .line 184
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedFakeSquareItem;->l0(Ll/c2i;)V

    .line 185
    .line 186
    .line 187
    :goto_4
    new-instance p3, Ll/m3i;

    .line 188
    .line 189
    invoke-direct {p3, p0, p2}, Ll/m3i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ll/c2i;)V

    .line 190
    .line 191
    .line 192
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    new-instance p2, Ll/n3i;

    .line 196
    .line 197
    invoke-direct {p2, p0}, Ll/n3i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method public K()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/c2i;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public L(I)Ll/c2i;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/c2i;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public M()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/o3i;

    .line 29
    .line 30
    invoke-direct {v0, p0, v1}, Ll/o3i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;I)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic N(Ll/c2i;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->j:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;

    .line 2
    .line 3
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;->d(Landroid/view/View;Ll/c2i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->j:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;->c()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final synthetic P(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Q(Ljava/util/List;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p2}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public R(Ljava/util/List;ZLl/x20;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/c2i;",
            ">;Z",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->I()Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/p3i;

    .line 23
    .line 24
    invoke-direct {v0, p0, p1, p3}, Ll/p3i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ljava/util/List;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 p0, 0xc8

    .line 28
    .line 29
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr v0, p1

    .line 16
    const/4 p1, 0x6

    .line 17
    if-ge v0, p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->f:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 20
    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->N0:Z

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->j:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;

    .line 26
    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a$a;->b()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->L(I)Ll/c2i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/c2i;

    .line 16
    .line 17
    iget p0, p0, Ll/c2i;->a:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getLayoutPosition()I

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->e:Ll/h80;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->e:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
