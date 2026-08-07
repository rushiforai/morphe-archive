.class public final Ll/usn0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\u0008\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\n\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0007\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0016\u0010\u000bJ\u0017\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u000b\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/usn0;",
        "",
        "<init>",
        "()V",
        "",
        "heart",
        "",
        "name",
        "c",
        "(JLjava/lang/String;)Ljava/lang/String;",
        "d",
        "(J)Ljava/lang/String;",
        "Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;",
        "_image",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
        "item",
        "",
        "suggestSize",
        "",
        "f",
        "(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V",
        "rank",
        "e",
        "b",
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


# static fields
.field public static final INSTANCE:Ll/usn0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/usn0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/usn0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/usn0;->INSTANCE:Ll/usn0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public static final c(JLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "noble"

    .line 5
    .line 6
    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_5

    .line 11
    .line 12
    sget-object v0, Ll/jcr;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    const-string v0, "flower"

    .line 23
    .line 24
    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    sget-object v0, Ll/jcr;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    sget-object v0, Ll/jcr;->d:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    sget-object p2, Ll/usn0;->INSTANCE:Ll/usn0;

    .line 48
    .line 49
    invoke-virtual {p2, p0, p1}, Ll/usn0;->b(J)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p0, "\u4eba\u6c14"

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_2
    sget-object v0, Ll/jcr;->c:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    sget-object p2, Ll/usn0;->INSTANCE:Ll/usn0;

    .line 80
    .line 81
    invoke-virtual {p2, p0, p1}, Ll/usn0;->b(J)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    new-instance p1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p0, "\u5962\u534e\u5ea6"

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_3
    sget-object p2, Ll/usn0;->INSTANCE:Ll/usn0;

    .line 104
    .line 105
    invoke-virtual {p2, p0, p1}, Ll/usn0;->b(J)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    new-instance p1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string p0, "\u4eba\u6c14\u503c"

    .line 118
    .line 119
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :cond_4
    :goto_0
    sget-object p2, Ll/usn0;->INSTANCE:Ll/usn0;

    .line 128
    .line 129
    invoke-virtual {p2, p0, p1}, Ll/usn0;->b(J)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance p1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p0, "\u9b45\u529b\u503c"

    .line 142
    .line 143
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0

    .line 151
    :cond_5
    :goto_1
    sget-object p2, Ll/usn0;->INSTANCE:Ll/usn0;

    .line 152
    .line 153
    invoke-virtual {p2, p0, p1}, Ll/usn0;->b(J)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    new-instance p1, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string p0, "\u8d21\u732e\u503c"

    .line 166
    .line 167
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method

.method public static final d(J)Ljava/lang/String;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "0"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    long-to-double p0, p0

    .line 11
    invoke-static {p0, p1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, "\u4eba\u6c14"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static final e(J)Ljava/lang/String;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u672a\u4e0a\u699c"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-wide/16 v0, 0x64

    .line 11
    .line 12
    cmp-long v0, p0, v0

    .line 13
    .line 14
    if-lez v0, :cond_1

    .line 15
    .line 16
    const-string p0, "100+"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static final f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V
    .locals 6
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/l6o0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/l6o0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 35
    .line 36
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->staticFrame:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->dynamicFrame:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->smallDynamicFrame:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->mediumDynamicFrame:Ljava/lang/String;

    .line 49
    .line 50
    iput-object p1, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 53
    .line 54
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 55
    .line 56
    iput-object v2, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 57
    .line 58
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v1}, Ll/nsv;->d(Ll/pyl;)Ll/nsv;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    const/high16 v0, 0x42a00000    # 80.0f

    .line 70
    .line 71
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-le p2, v0, :cond_0

    .line 76
    .line 77
    const/4 v0, 0x2

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const/4 v0, 0x1

    .line 80
    :goto_0
    new-instance v1, Ll/ssn0;

    .line 81
    .line 82
    invoke-direct {v1}, Ll/ssn0;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {p0, p2, p1, v1, v0}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public final b(J)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "0"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    long-to-double p0, p1

    .line 11
    invoke-static {p0, p1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object p0
.end method
