.class public Ll/tx00;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 9
    .line 10
    iput-object p1, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e(I)V
    .locals 1

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    iget-object v0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ky00;->z0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 16
    .line 17
    iget-boolean v0, v0, Ll/ky00;->c:Z

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/vg60;->c()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 30
    .line 31
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lez v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 40
    .line 41
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    sub-int/2addr v0, p1

    .line 48
    const/4 p1, 0x6

    .line 49
    if-ge v0, p1, :cond_1

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 52
    .line 53
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 56
    .line 57
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/api/b;->b4(Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public getCount()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ky00;->z0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x2

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 15
    .line 16
    iget-boolean v0, v0, Ll/ky00;->c:Z

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 21
    .line 22
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return v1

    .line 31
    :cond_0
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 32
    .line 33
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 40
    .line 41
    const/4 v2, 0x6

    .line 42
    if-lt v0, v2, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    add-int/2addr p0, v1

    .line 51
    return p0

    .line 52
    :cond_1
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    add-int/lit8 p0, p0, 0x1

    .line 59
    .line 60
    return p0

    .line 61
    :cond_2
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/vg60;->c()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v2, p0, Ll/tx00;->c:Ll/vg60;

    .line 68
    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    iget-object p0, v2, Ll/vg60;->a:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/2addr p0, v1

    .line 78
    return p0

    .line 79
    :cond_3
    invoke-virtual {v2}, Ll/vg60;->c()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_4

    .line 84
    .line 85
    iget-object v0, p0, Ll/tx00;->c:Ll/vg60;

    .line 86
    .line 87
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    return v1

    .line 96
    :cond_4
    iget-object v0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 99
    .line 100
    iget-boolean v2, v0, Ll/ky00;->c:Z

    .line 101
    .line 102
    if-nez v2, :cond_6

    .line 103
    .line 104
    iget-object v0, v0, Ll/ky00;->a:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_6

    .line 111
    .line 112
    invoke-static {}, Ll/zt40;->a()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_5

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_5
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 120
    .line 121
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    add-int/2addr p0, v1

    .line 128
    return p0

    .line 129
    :cond_6
    :goto_0
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 130
    .line 131
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    add-int/lit8 p0, p0, 0x1

    .line 138
    .line 139
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    iget-object v1, p0, Ll/tx00;->c:Ll/vg60;

    .line 8
    .line 9
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge p1, v1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 18
    .line 19
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    return-object v0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    iget-object v1, p0, Ll/tx00;->c:Ll/vg60;

    .line 8
    .line 9
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Ll/tx00;->c:Ll/vg60;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/vg60;->c()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/ky00;->z0()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    :cond_1
    const/4 p0, 0x7

    .line 36
    return p0

    .line 37
    :cond_2
    iget-object v1, p0, Ll/tx00;->c:Ll/vg60;

    .line 38
    .line 39
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ne v1, p1, :cond_5

    .line 46
    .line 47
    iget-object p1, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/ky00;->z0()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 60
    .line 61
    iget-boolean p1, p1, Ll/ky00;->c:Z

    .line 62
    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    iget-object p1, p0, Ll/tx00;->c:Ll/vg60;

    .line 66
    .line 67
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-lt p1, v0, :cond_3

    .line 74
    .line 75
    const/16 p0, 0x9

    .line 76
    .line 77
    return p0

    .line 78
    :cond_3
    iget-object p1, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->d:Ll/ky00;

    .line 81
    .line 82
    iget-boolean v0, p1, Ll/ky00;->c:Z

    .line 83
    .line 84
    if-nez v0, :cond_4

    .line 85
    .line 86
    iget-object p1, p1, Ll/ky00;->a:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_4

    .line 93
    .line 94
    invoke-static {}, Ll/zt40;->a()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    iget-object p1, p0, Ll/tx00;->c:Ll/vg60;

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_4

    .line 107
    .line 108
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 109
    .line 110
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-lez p0, :cond_4

    .line 117
    .line 118
    const/16 p0, 0xa

    .line 119
    .line 120
    return p0

    .line 121
    :cond_4
    const/4 p0, 0x5

    .line 122
    return p0

    .line 123
    :cond_5
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 124
    .line 125
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 134
    .line 135
    const/4 v0, 0x0

    .line 136
    if-nez p1, :cond_6

    .line 137
    .line 138
    return v0

    .line 139
    :cond_6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-lez p1, :cond_7

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 152
    .line 153
    if-eqz p1, :cond_7

    .line 154
    .line 155
    const/16 p0, 0x8

    .line 156
    .line 157
    return p0

    .line 158
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    const/4 p1, 0x4

    .line 165
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    return p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/16 p0, 0xc

    .line 2
    .line 3
    return p0
.end method

.method public isEnabled(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tx00;->p(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Moment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->c:Ll/c110;

    .line 7
    .line 8
    iget-object p0, p0, Ll/c110;->l:Landroid/view/View;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 v0, 0x7

    .line 12
    if-ne p2, v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->c:Ll/c110;

    .line 17
    .line 18
    iget-object p0, p0, Ll/c110;->m:Landroid/view/View;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const/4 v0, 0x6

    .line 22
    if-ne p2, v0, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->c:Ll/c110;

    .line 27
    .line 28
    iget-object p0, p0, Ll/c110;->d:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    const/16 v0, 0x9

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    if-ne p2, v0, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget p2, Ll/tec0;->G4:I

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_3
    const/16 v0, 0xa

    .line 50
    .line 51
    if-ne p2, v0, :cond_4

    .line 52
    .line 53
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget p2, Ll/tec0;->S4:I

    .line 60
    .line 61
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_4
    iget-object p0, p0, Ll/tx00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 67
    .line 68
    const/16 v0, 0xb

    .line 69
    .line 70
    if-ne p2, v0, :cond_5

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget p2, Ll/tec0;->L4:I

    .line 77
    .line 78
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget v0, Ll/tec0;->J4:I

    .line 90
    .line 91
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;

    .line 96
    .line 97
    const/16 p1, 0x8

    .line 98
    .line 99
    if-ne p2, p1, :cond_6

    .line 100
    .line 101
    sget p1, Ll/tec0;->Q4:I

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->W(I)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    const/4 p1, 0x1

    .line 108
    if-ne p2, p1, :cond_7

    .line 109
    .line 110
    sget p1, Ll/tec0;->M4:I

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->W(I)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_7
    const/4 p1, 0x2

    .line 117
    if-ne p2, p1, :cond_8

    .line 118
    .line 119
    sget p1, Ll/tec0;->O4:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->W(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_8
    const/4 p1, 0x3

    .line 126
    if-ne p2, p1, :cond_9

    .line 127
    .line 128
    sget p1, Ll/tec0;->N4:I

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->W(I)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_9
    const/4 p1, 0x4

    .line 135
    if-ne p2, p1, :cond_a

    .line 136
    .line 137
    sget p1, Ll/tec0;->K4:I

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->W(I)V

    .line 140
    .line 141
    .line 142
    :cond_a
    :goto_0
    if-nez p2, :cond_b

    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->h:Landroid/widget/LinearLayout;

    .line 145
    .line 146
    const/4 p2, 0x0

    .line 147
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 148
    .line 149
    .line 150
    return-object p0

    .line 151
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->h:Landroid/widget/LinearLayout;

    .line 152
    .line 153
    sget p2, Ll/lbc0;->E6:I

    .line 154
    .line 155
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 156
    .line 157
    .line 158
    return-object p0
.end method

.method public p(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Moment;II)V
    .locals 5

    .line 1
    const/4 v0, 0x5

    .line 2
    if-eq p3, v0, :cond_7

    .line 3
    .line 4
    const/4 v0, 0x7

    .line 5
    if-eq p3, v0, :cond_7

    .line 6
    .line 7
    const/4 v0, 0x6

    .line 8
    if-eq p3, v0, :cond_7

    .line 9
    .line 10
    const/16 v0, 0xa

    .line 11
    .line 12
    if-eq p3, v0, :cond_7

    .line 13
    .line 14
    const/16 v0, 0x9

    .line 15
    .line 16
    if-ne p3, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    add-int/lit8 v0, p4, -0x1

    .line 20
    .line 21
    const/16 v1, 0xb

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x1

    .line 26
    if-ne p3, v1, :cond_3

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;

    .line 29
    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    iget-object p3, p0, Ll/tx00;->c:Ll/vg60;

    .line 33
    .line 34
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 35
    .line 36
    add-int/lit8 p4, p4, -0x2

    .line 37
    .line 38
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    move-object v3, p3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    :cond_1
    iget-object p3, p0, Ll/tx00;->c:Ll/vg60;

    .line 46
    .line 47
    invoke-virtual {p3}, Ll/vg60;->c()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-nez p3, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 54
    .line 55
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    sub-int/2addr p0, v4

    .line 62
    if-ne v0, p0, :cond_2

    .line 63
    .line 64
    move v2, v4

    .line 65
    :cond_2
    invoke-virtual {p1, p2, v4, v3, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileViewLarge;->X(Lcom/p1/mobile/putong/feed/data/Moment;ILcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;

    .line 70
    .line 71
    const/16 v1, 0x8

    .line 72
    .line 73
    if-ne p3, v1, :cond_4

    .line 74
    .line 75
    move p3, v4

    .line 76
    :cond_4
    if-lez v0, :cond_5

    .line 77
    .line 78
    iget-object v1, p0, Ll/tx00;->c:Ll/vg60;

    .line 79
    .line 80
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 81
    .line 82
    add-int/lit8 p4, p4, -0x2

    .line 83
    .line 84
    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    move-object v3, p4

    .line 89
    check-cast v3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 90
    .line 91
    :cond_5
    iget-object p4, p0, Ll/tx00;->c:Ll/vg60;

    .line 92
    .line 93
    invoke-virtual {p4}, Ll/vg60;->c()Z

    .line 94
    .line 95
    .line 96
    move-result p4

    .line 97
    if-nez p4, :cond_6

    .line 98
    .line 99
    iget-object p0, p0, Ll/tx00;->c:Ll/vg60;

    .line 100
    .line 101
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    sub-int/2addr p0, v4

    .line 108
    if-ne v0, p0, :cond_6

    .line 109
    .line 110
    move v2, v4

    .line 111
    :cond_6
    invoke-virtual {p1, p2, p3, v3, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileView;->a0(Lcom/p1/mobile/putong/feed/data/Moment;ILcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 112
    .line 113
    .line 114
    :cond_7
    :goto_0
    return-void
.end method

.method public s(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tx00;->c:Ll/vg60;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
