.class public Ll/sg5$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sg5;->h0(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sg5;


# direct methods
.method public constructor <init>(Ll/sg5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/sg5;->R(Ll/sg5;I)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x64

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 12
    .line 13
    iget-object p1, p1, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 19
    .line 20
    iget-object p1, p1, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 26
    .line 27
    iget-object p0, p0, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/16 v0, 0x67

    .line 34
    .line 35
    if-ne p1, v0, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 38
    .line 39
    iget-object p1, p1, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/sg5;->f0()J

    .line 50
    .line 51
    .line 52
    move-result-wide v4

    .line 53
    cmp-long p1, v2, v4

    .line 54
    .line 55
    if-gez p1, :cond_1

    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->B0:I

    .line 58
    .line 59
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 64
    .line 65
    iget-object p1, p1, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 71
    .line 72
    iget-object p1, p1, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 73
    .line 74
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 78
    .line 79
    invoke-static {p0}, Ll/sg5;->O(Ll/sg5;)Ll/b0m;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0}, Ll/l4m;->O()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    const/16 v0, 0x66

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    if-ne p1, v0, :cond_4

    .line 91
    .line 92
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 93
    .line 94
    iget-object p1, p1, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 95
    .line 96
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 100
    .line 101
    iget-object p1, p1, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 102
    .line 103
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 107
    .line 108
    iget-object p1, p1, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget-object v0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 117
    .line 118
    if-nez p1, :cond_3

    .line 119
    .line 120
    iget-object p1, v0, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 121
    .line 122
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    iget-object p1, v0, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    :goto_0
    iget-object p0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 132
    .line 133
    invoke-static {p0, v1}, Ll/sg5;->T(Ll/sg5;Z)Z

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_4
    const/16 v0, 0x65

    .line 138
    .line 139
    if-ne p1, v0, :cond_5

    .line 140
    .line 141
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 142
    .line 143
    iget-object p1, p1, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 149
    .line 150
    iget-object p1, p1, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 151
    .line 152
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 156
    .line 157
    iget-object p1, p1, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 158
    .line 159
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 163
    .line 164
    invoke-static {p0}, Ll/sg5;->S(Ll/sg5;)V

    .line 165
    .line 166
    .line 167
    :cond_5
    return-void
.end method

.method public onEvent(II)V
    .locals 3

    .line 1
    const/16 p2, 0x6a

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, p2, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 7
    .line 8
    iget-object p1, p1, Ll/sg5;->h:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 14
    .line 15
    iget-object p1, p1, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 21
    .line 22
    iget-object p1, p1, Ll/sg5;->l:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 28
    .line 29
    const/16 p1, 0x64

    .line 30
    .line 31
    invoke-static {p0, p1}, Ll/sg5;->R(Ll/sg5;I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/16 p2, 0x69

    .line 36
    .line 37
    if-ne p1, p2, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/16 p2, 0x68

    .line 41
    .line 42
    if-ne p1, p2, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/16 p2, 0x6b

    .line 46
    .line 47
    if-ne p1, p2, :cond_4

    .line 48
    .line 49
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 50
    .line 51
    iget-object p1, p1, Ll/sg5;->o:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 56
    .line 57
    .line 58
    move-result-wide p1

    .line 59
    iget-object v1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/sg5;->f0()J

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    cmp-long p1, p1, v1

    .line 66
    .line 67
    if-gez p1, :cond_3

    .line 68
    .line 69
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->B0:I

    .line 70
    .line 71
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 76
    .line 77
    iget-object p1, p1, Ll/sg5;->k:Landroid/widget/LinearLayout;

    .line 78
    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 83
    .line 84
    iget-object p1, p1, Ll/sg5;->g:Landroid/widget/ImageView;

    .line 85
    .line 86
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/sg5$b;->a:Ll/sg5;

    .line 90
    .line 91
    invoke-static {p0}, Ll/sg5;->O(Ll/sg5;)Ll/b0m;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {p0}, Ll/l4m;->O()V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_0
    return-void
.end method
