.class public Lcom/p1/mobile/putong/core/newui/home/b$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/atl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/b;->b2(Lcom/p1/mobile/putong/core/newui/home/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B(IIILjava/lang/String;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->u1(Lcom/p1/mobile/putong/core/newui/home/b;)Ll/q4h0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0, v1}, Ll/q4h0;->a(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->u1(Lcom/p1/mobile/putong/core/newui/home/b;)Ll/q4h0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    if-nez p5, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v1, 0x0

    .line 24
    :goto_0
    invoke-interface {v0, v1}, Ll/q4h0;->a(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/b;->w1(Lcom/p1/mobile/putong/core/newui/home/b;)I

    .line 30
    .line 31
    .line 32
    move-result p5

    .line 33
    sub-int v4, p1, p5

    .line 34
    .line 35
    move v3, p1

    .line 36
    move v5, p2

    .line 37
    move v6, p3

    .line 38
    move-object v7, p4

    .line 39
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/home/b;->D5(IIIILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 43
    .line 44
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/core/newui/home/b;->C1(Lcom/p1/mobile/putong/core/newui/home/b;I)V

    .line 45
    .line 46
    .line 47
    const-string p1, "VirtualCard"

    .line 48
    .line 49
    invoke-static {v7, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->v1(Lcom/p1/mobile/putong/core/newui/home/b;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    const/16 p1, 0xa

    .line 68
    .line 69
    if-le v3, p1, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 72
    .line 73
    invoke-static {p1, v7}, Lcom/p1/mobile/putong/core/newui/home/b;->B1(Lcom/p1/mobile/putong/core/newui/home/b;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    invoke-virtual {p1, v7}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_2

    .line 89
    .line 90
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 91
    .line 92
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->q1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->h(Lcom/p1/mobile/putong/data/User;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/b;->J0:Ll/bvl;

    .line 102
    .line 103
    invoke-interface {p1}, Ll/bvl;->getImmediatelyMatch()Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/b;->J0:Ll/bvl;

    .line 116
    .line 117
    invoke-interface {p1}, Ll/bvl;->getButtonScrolledDistance()I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-lez p1, :cond_5

    .line 122
    .line 123
    const/4 p1, 0x5

    .line 124
    if-le v3, p1, :cond_3

    .line 125
    .line 126
    invoke-static {}, Ll/z5h0;->u()V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    const-string p3, "bubble_odiamond_immediate_match_guide"

    .line 134
    .line 135
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    const/high16 p2, 0x41a00000    # 20.0f

    .line 139
    .line 140
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-ge v3, p1, :cond_4

    .line 145
    .line 146
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 147
    .line 148
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/b;->J0:Ll/bvl;

    .line 149
    .line 150
    invoke-interface {p3}, Ll/bvl;->getButtonRootLayout()Landroid/view/ViewGroup;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-virtual {p3}, Landroid/view/View;->getTranslationY()F

    .line 155
    .line 156
    .line 157
    move-result p3

    .line 158
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 163
    .line 164
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/home/b;->J0:Ll/bvl;

    .line 165
    .line 166
    invoke-interface {p4}, Ll/bvl;->getButtonScrolledDistance()I

    .line 167
    .line 168
    .line 169
    move-result p4

    .line 170
    sub-int/2addr p4, p1

    .line 171
    int-to-float p4, p4

    .line 172
    cmpl-float p3, p3, p4

    .line 173
    .line 174
    if-ltz p3, :cond_4

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_4
    if-gt v3, p2, :cond_5

    .line 178
    .line 179
    if-le v3, p1, :cond_5

    .line 180
    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 182
    .line 183
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->F1(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 184
    .line 185
    .line 186
    :cond_5
    :goto_1
    return-void
.end method

.method public c0(IIIILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->p1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eqz p2, :cond_5

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->p1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    if-lez p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->p1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 p1, 0x0

    .line 37
    if-eqz p5, :cond_4

    .line 38
    .line 39
    invoke-virtual {p5}, Landroid/view/View;->isAttachedToWindow()Z

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    if-nez p4, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/high16 p4, 0x42300000    # 44.0f

    .line 47
    .line 48
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 53
    .line 54
    if-le p3, p4, :cond_3

    .line 55
    .line 56
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->p1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 61
    .line 62
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->p1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->p1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 85
    .line 86
    .line 87
    :cond_5
    :goto_1
    return-void
.end method
