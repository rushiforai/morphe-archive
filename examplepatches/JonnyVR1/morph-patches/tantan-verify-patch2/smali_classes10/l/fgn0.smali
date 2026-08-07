.class public final Ll/fgn0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0019\u0010\n\u001a\u00020\t2\n\u0010\u0008\u001a\u0006\u0012\u0002\u0008\u00030\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ!\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u00102\u0008\u0008\u0001\u0010\u0012\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018R\u0017\u0010\u0004\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u0016\u001a\u0004\u0008\u0015\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/fgn0;",
        "",
        "",
        "type",
        "name",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "Ll/wgn0;",
        "presenter",
        "Landroid/view/View;",
        "b",
        "(Ll/wgn0;)Landroid/view/View;",
        "",
        "c",
        "()I",
        "d",
        "Landroid/content/Context;",
        "context",
        "resource",
        "f",
        "(Landroid/content/Context;I)Landroid/view/View;",
        "a",
        "Ljava/lang/String;",
        "e",
        "()Ljava/lang/String;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/fgn0;->a:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p2, p0, Ll/fgn0;->b:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fgn0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/wgn0;)Landroid/view/View;
    .locals 3
    .param p1    # Ll/wgn0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wgn0<",
            "*>;)",
            "Landroid/view/View;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/fgn0;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sparse-switch v2, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :sswitch_0
    const-string v2, "chatTopic"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget v1, Ll/yec0;->l7:I

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Ll/fgn0;->f(Landroid/content/Context;I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v0, Ll/haj0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/wgn0;->Y3()Ll/dum;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-object v2, p0

    .line 47
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    .line 48
    .line 49
    invoke-direct {v0, v1, v2}, Ll/haj0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ll/i6t;

    .line 57
    .line 58
    return-object p0

    .line 59
    :sswitch_1
    const-string v2, "ktv"

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    sget v1, Ll/yec0;->d7:I

    .line 69
    .line 70
    invoke-virtual {p0, v0, v1}, Ll/fgn0;->f(Landroid/content/Context;I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    new-instance v0, Ll/v5r;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/wgn0;->Y3()Ll/dum;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    move-object v2, p0

    .line 84
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/ktv/KtvView;

    .line 85
    .line 86
    invoke-direct {v0, v1, v2}, Ll/v5r;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/ktv/KtvView;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Ll/i6t;

    .line 94
    .line 95
    return-object p0

    .line 96
    :sswitch_2
    const-string v2, "auction"

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_2

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    sget v1, Ll/yec0;->Y6:I

    .line 106
    .line 107
    invoke-virtual {p0, v0, v1}, Ll/fgn0;->f(Landroid/content/Context;I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance v0, Ll/p81;

    .line 112
    .line 113
    invoke-virtual {p1}, Ll/wgn0;->Y3()Ll/dum;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    .line 119
    .line 120
    move-object v2, p0

    .line 121
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/auction/AuctionView;

    .line 122
    .line 123
    invoke-direct {v0, v1, v2}, Ll/p81;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/auction/AuctionView;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Ll/i6t;

    .line 131
    .line 132
    return-object p0

    .line 133
    :sswitch_3
    const-string v2, "undercover"

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-nez v1, :cond_3

    .line 140
    .line 141
    :goto_0
    sget v1, Ll/yec0;->V6:I

    .line 142
    .line 143
    invoke-virtual {p0, v0, v1}, Ll/fgn0;->f(Landroid/content/Context;I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    new-instance v0, Ll/ts0;

    .line 148
    .line 149
    invoke-virtual {p1}, Ll/wgn0;->Y3()Ll/dum;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 154
    .line 155
    .line 156
    move-object v2, p0

    .line 157
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 158
    .line 159
    invoke-direct {v0, v1, v2}, Ll/ts0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Ll/i6t;

    .line 167
    .line 168
    return-object p0

    .line 169
    :cond_3
    sget v1, Ll/yec0;->k7:I

    .line 170
    .line 171
    invoke-virtual {p0, v0, v1}, Ll/fgn0;->f(Landroid/content/Context;I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    new-instance v0, Ll/tzf0;

    .line 176
    .line 177
    invoke-virtual {p1}, Ll/wgn0;->Y3()Ll/dum;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    .line 183
    .line 184
    move-object v2, p0

    .line 185
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/spy/SpyDialogView;

    .line 186
    .line 187
    invoke-direct {v0, v1, v2}, Ll/tzf0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/spy/SpyDialogView;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Ll/i6t;

    .line 195
    .line 196
    return-object p0

    .line 197
    :sswitch_data_0
    .sparse-switch
        -0x6a0ce821 -> :sswitch_3
        -0x277321bd -> :sswitch_2
        0x1a02d -> :sswitch_1
        0x5ff3a0b7 -> :sswitch_0
    .end sparse-switch
.end method

.method public final c()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fgn0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sparse-switch v0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :sswitch_0
    const-string v0, "chatTopic"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget p0, Ll/obc0;->x9:I

    .line 21
    .line 22
    return p0

    .line 23
    :sswitch_1
    const-string v0, "backgroundMusic"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget p0, Ll/obc0;->v9:I

    .line 33
    .line 34
    return p0

    .line 35
    :sswitch_2
    const-string v0, "ktv"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    sget p0, Ll/obc0;->t9:I

    .line 45
    .line 46
    return p0

    .line 47
    :sswitch_3
    const-string v0, "auction"

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    sget p0, Ll/obc0;->s9:I

    .line 57
    .line 58
    return p0

    .line 59
    :sswitch_4
    const-string v0, "undercover"

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    :goto_0
    sget p0, Ll/obc0;->q9:I

    .line 68
    .line 69
    return p0

    .line 70
    :cond_4
    sget p0, Ll/obc0;->ia:I

    .line 71
    .line 72
    return p0

    .line 73
    :sswitch_data_0
    .sparse-switch
        -0x6a0ce821 -> :sswitch_4
        -0x277321bd -> :sswitch_3
        0x1a02d -> :sswitch_2
        0x4d47b597 -> :sswitch_1
        0x5ff3a0b7 -> :sswitch_0
    .end sparse-switch
.end method

.method public final d()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fgn0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sparse-switch v0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :sswitch_0
    const-string v0, "chatTopic"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget p0, Ll/obc0;->y9:I

    .line 21
    .line 22
    return p0

    .line 23
    :sswitch_1
    const-string v0, "backgroundMusic"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget p0, Ll/obc0;->w9:I

    .line 33
    .line 34
    return p0

    .line 35
    :sswitch_2
    const-string v0, "ktv"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    sget p0, Ll/obc0;->u9:I

    .line 45
    .line 46
    return p0

    .line 47
    :sswitch_3
    const-string v0, "auction"

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    sget p0, Ll/obc0;->w9:I

    .line 57
    .line 58
    return p0

    .line 59
    :sswitch_4
    const-string v0, "undercover"

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    :goto_0
    sget p0, Ll/obc0;->r9:I

    .line 68
    .line 69
    return p0

    .line 70
    :cond_4
    sget p0, Ll/obc0;->w9:I

    .line 71
    .line 72
    return p0

    .line 73
    :sswitch_data_0
    .sparse-switch
        -0x6a0ce821 -> :sswitch_4
        -0x277321bd -> :sswitch_3
        0x1a02d -> :sswitch_2
        0x4d47b597 -> :sswitch_1
        0x5ff3a0b7 -> :sswitch_0
    .end sparse-switch
.end method

.method public final e()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fgn0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Landroid/content/Context;I)Landroid/view/View;
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    return-object p0
.end method
