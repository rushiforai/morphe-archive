.class public Ll/ado0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static j:Ljava/lang/String; = "VoiceNewMemberInfo"


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;>;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:J

.field public i:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 137
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 138
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 139
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 140
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/ado0;->e:Ljava/util/List;

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/ado0;->f:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveData;ZIZI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 24
    .line 25
    new-instance v0, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/ado0;->e:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 45
    .line 46
    iput p5, p0, Ll/ado0;->i:I

    .line 47
    .line 48
    iput-boolean p4, p0, Ll/ado0;->g:Z

    .line 49
    .line 50
    int-to-long p3, p3

    .line 51
    iput-wide p3, p0, Ll/ado0;->h:J

    .line 52
    .line 53
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    .line 54
    .line 55
    new-instance p4, Ll/dco0;

    .line 56
    .line 57
    invoke-direct {p4}, Ll/dco0;-><init>()V

    .line 58
    .line 59
    .line 60
    new-instance p5, Ll/oco0;

    .line 61
    .line 62
    invoke-direct {p5}, Ll/oco0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p3, p4, p5}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    iput-object p3, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 70
    .line 71
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 72
    .line 73
    new-instance p4, Ll/sco0;

    .line 74
    .line 75
    invoke-direct {p4}, Ll/sco0;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance p5, Ll/tco0;

    .line 79
    .line 80
    invoke-direct {p5}, Ll/tco0;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {p3, p4, p5}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 88
    .line 89
    if-eqz p4, :cond_0

    .line 90
    .line 91
    const/4 p4, 0x0

    .line 92
    :goto_0
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result p5

    .line 98
    if-ge p4, p5, :cond_0

    .line 99
    .line 100
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {p5, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p5

    .line 106
    check-cast p5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 107
    .line 108
    invoke-virtual {p0, p5, p3, p2}, Ll/ado0;->M(Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ljava/util/Map;Z)V

    .line 109
    .line 110
    .line 111
    add-int/lit8 p4, p4, 0x1

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {p0}, Ll/ado0;->z()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ll/ado0;->R()V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    new-instance p2, Ll/uco0;

    .line 127
    .line 128
    invoke-direct {p2, p0}, Ll/uco0;-><init>(Ll/ado0;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "guideGoCallUser"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ado0;->O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic f(Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ado0;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 2
    .line 3
    const-string v0, "anchor"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    if-le p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    if-ne p0, p1, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, -0x1

    .line 14
    return p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->nextPlayInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->nextPlayInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 19
    .line 20
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 21
    .line 22
    move v0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 42
    .line 43
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move v1, v0

    .line 47
    :goto_1
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 50
    .line 51
    const-string v0, "unknown_"

    .line 52
    .line 53
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public static synthetic m(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic n(Ljava/util/HashMap;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic q(Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ado0;->P(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic s(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic t(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/h64;

    .line 4
    .line 5
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 2
    .line 3
    const-string v0, "anchor"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 2
    .line 3
    const-string v0, "anchor"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic w(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final A(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRole;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->id:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    return-object p0
.end method

.method public C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/xco0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/xco0;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 17
    .line 18
    return-object p0
.end method

.method public D(Ljava/lang/String;)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nsv;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ll/h64;

    .line 18
    .line 19
    iget-object v0, v0, Ll/h64;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Ll/h64;

    .line 30
    .line 31
    iput-object p1, v0, Ll/h64;->a:Ljava/lang/String;

    .line 32
    .line 33
    :cond_0
    return-object p0
.end method

.method public E()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public F()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ado0;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 22
    .line 23
    const-string v3, "anchor"

    .line 24
    .line 25
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    new-instance v2, Ll/qco0;

    .line 32
    .line 33
    invoke-direct {v2}, Ll/qco0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const/4 v3, -0x1

    .line 41
    if-le v2, v3, :cond_0

    .line 42
    .line 43
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 48
    .line 49
    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_0
    iget-object v2, p0, Ll/ado0;->e:Ljava/util/List;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    new-array v3, v3, [Ljava/util/List;

    .line 59
    .line 60
    aput-object p0, v3, v1

    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/jyb;->e(Ljava/util/List;[Ljava/util/List;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v2, Ll/rco0;

    .line 67
    .line 68
    invoke-direct {v2}, Ll/rco0;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 76
    .line 77
    if-eqz p0, :cond_1

    .line 78
    .line 79
    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-object v0
.end method

.method public G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 8
    .line 9
    return-object p0
.end method

.method public H()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ado0;->e:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    new-array v1, v1, [Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput-object p0, v1, v2

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->e(Ljava/util/List;[Ljava/util/List;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 28
    .line 29
    const-string v1, "anchor"

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    new-instance v0, Ll/vco0;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/vco0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, -0x1

    .line 47
    if-le v0, v1, :cond_0

    .line 48
    .line 49
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 54
    .line 55
    invoke-interface {p0, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-object p0
.end method

.method public I()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ado0;->E()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/lco0;

    .line 11
    .line 12
    invoke-direct {v2, v1}, Ll/lco0;-><init>(Ljava/util/HashMap;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 25
    .line 26
    .line 27
    iget-boolean v1, p0, Ll/ado0;->g:Z

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    new-instance v1, Ll/mco0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/mco0;-><init>(Ll/ado0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance p0, Ll/nco0;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/nco0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public J()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ado0;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public K(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x2

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public L(Ljava/lang/String;)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nsv;

    .line 8
    .line 9
    return-object p0
.end method

.method public final M(Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ljava/util/Map;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 21
    .line 22
    const-string v1, "anchor"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ado0;->e:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/h64;

    .line 47
    .line 48
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 63
    .line 64
    invoke-direct {v0, p1, v1, v2}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 68
    .line 69
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 78
    .line 79
    invoke-virtual {v0, p1, p2, p3}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, -0x1

    .line 16
    .line 17
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 18
    .line 19
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/nsv;

    .line 10
    .line 11
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ll/h64;

    .line 14
    .line 15
    iget-object v0, v0, Ll/h64;->b:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/nsv;

    .line 28
    .line 29
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p0, Ll/h64;

    .line 32
    .line 33
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 36
    .line 37
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/lit8 p0, p0, -0x1

    .line 18
    .line 19
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object p0, Ll/ado0;->j:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "member data exception ,userId="

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final R()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ado0;->H()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v1, v3, :cond_2

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "guideGoCallUser"

    .line 24
    .line 25
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 32
    .line 33
    const/4 v4, -0x1

    .line 34
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    iget-object v4, p0, Ll/ado0;->d:Ljava/util/HashMap;

    .line 44
    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    add-int/lit8 v5, v1, 0x1

    .line 56
    .line 57
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-boolean v0, p0, Ll/ado0;->g:Z

    .line 68
    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    invoke-virtual {p0}, Ll/ado0;->E()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/yco0;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/yco0;-><init>(Ll/ado0;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ado0;->e:Ljava/util/List;

    .line 20
    .line 21
    new-instance v1, Ll/pco0;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Ll/pco0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/ado0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    const-string p1, "anchor"

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-string p1, "audience"

    .line 51
    .line 52
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRole;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 57
    .line 58
    iget-object p1, p0, Ll/ado0;->f:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p0}, Ll/ado0;->z()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ado0;->R()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public T(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/eco0;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/eco0;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Ll/ado0;->e:Ljava/util/List;

    .line 23
    .line 24
    new-instance v2, Ll/fco0;

    .line 25
    .line 26
    invoke-direct {v2, p1}, Ll/fco0;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-gtz v0, :cond_0

    .line 34
    .line 35
    if-lez p1, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-wide v0, p0, Ll/ado0;->h:J

    .line 38
    .line 39
    const-wide/16 v2, 0x1

    .line 40
    .line 41
    sub-long/2addr v0, v2

    .line 42
    iput-wide v0, p0, Ll/ado0;->h:J

    .line 43
    .line 44
    :cond_1
    invoke-virtual {p0}, Ll/ado0;->R()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public U(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ado0;->h:J

    .line 2
    .line 3
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/ico0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/ico0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public X(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getUserIdsList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_4

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x2

    .line 16
    if-eq v1, v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/String;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/String;

    .line 33
    .line 34
    iget-object v2, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 41
    .line 42
    iget-object p0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->callConnections:Ljava/util/List;

    .line 57
    .line 58
    new-instance v4, Ll/gco0;

    .line 59
    .line 60
    invoke-direct {v4, v0}, Ll/gco0;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v3, v4}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->callConnections:Ljava/util/List;

    .line 73
    .line 74
    new-instance v4, Ll/hco0;

    .line 75
    .line 76
    invoke-direct {v4, v1}, Ll/hco0;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v3, v4}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getOn()Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_4

    .line 87
    .line 88
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-eqz v3, :cond_3

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getHorizontalCallConnectionEffectSvga()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->horizontalEffectSvga:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getVerticalCallConnectionEffectSvga()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->verticalEffectSvga:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->callConnections:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_4

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getHorizontalCallConnectionEffectSvga()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->horizontalEffectSvga:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getVerticalCallConnectionEffectSvga()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->verticalEffectSvga:Ljava/lang/String;

    .line 138
    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;->userId:Ljava/lang/String;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->callConnections:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_0
    return-void
.end method

.method public Y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ado0;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/ado0;->a:Ljava/util/HashMap;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/ado0;->f:Ljava/util/List;

    .line 16
    .line 17
    new-instance v0, Ll/jco0;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/jco0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Ll/ado0;->e:Ljava/util/List;

    .line 26
    .line 27
    new-instance v0, Ll/kco0;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Ll/kco0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 44
    .line 45
    const-string v0, "caller"

    .line 46
    .line 47
    if-nez p2, :cond_0

    .line 48
    .line 49
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRole;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {p0, p2, v1}, Ll/ado0;->A(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRole;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    :cond_0
    invoke-virtual {p0, p1}, Ll/ado0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    const-string v0, "anchor"

    .line 66
    .line 67
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRole;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 72
    .line 73
    iget-object p1, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 74
    .line 75
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/ado0;->e:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ado0;->z()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ado0;->R()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public y(Ll/nsv;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/zco0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/zco0;-><init>(Ll/nsv;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-wide v0, p0, Ll/ado0;->h:J

    .line 15
    .line 16
    const-wide/16 v2, 0x1

    .line 17
    .line 18
    add-long/2addr v0, v2

    .line 19
    iput-wide v0, p0, Ll/ado0;->h:J

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 22
    .line 23
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Ll/h64;

    .line 26
    .line 27
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Ll/h64;

    .line 35
    .line 36
    iget-object v0, v0, Ll/h64;->a:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "audience"

    .line 39
    .line 40
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRole;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p0, v0, v1}, Ll/ado0;->A(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRole;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "anchor"

    .line 49
    .line 50
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRole;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const-string v1, "manager"

    .line 64
    .line 65
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_2

    .line 70
    .line 71
    const/4 p2, 0x1

    .line 72
    iput-boolean p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 73
    .line 74
    :cond_2
    :goto_0
    iget-object p2, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 75
    .line 76
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v1, Ll/h64;

    .line 79
    .line 80
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Ll/ado0;->f:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ado0;->z()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/ado0;->R()V

    .line 94
    .line 95
    .line 96
    iget-object p0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast p0, Ll/h64;

    .line 99
    .line 100
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 101
    .line 102
    return-void
.end method

.method public final z()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const-string v2, "guideGoCallUser"

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/ado0;->e:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget v3, p0, Ll/ado0;->i:I

    .line 30
    .line 31
    if-ge v1, v3, :cond_2

    .line 32
    .line 33
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v3, "audience"

    .line 44
    .line 45
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_0

    .line 50
    .line 51
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v3, "admin"

    .line 58
    .line 59
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_0

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v1, "anchor"

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    :cond_0
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    const-string v0, "unknown_"

    .line 89
    .line 90
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRole;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v2, v0}, Ll/ado0;->A(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRole;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v1, p0, Ll/ado0;->f:Ljava/util/List;

    .line 99
    .line 100
    const/4 v3, 0x0

    .line 101
    invoke-interface {v1, v3, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->getId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v1, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    new-instance v0, Ll/h64;

    .line 114
    .line 115
    const-string v1, ""

    .line 116
    .line 117
    invoke-direct {v0, v2, v1, v1}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Ll/ado0;->b:Ljava/util/HashMap;

    .line 121
    .line 122
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v0, v2, v1, v3}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_2
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 139
    .line 140
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_3

    .line 145
    .line 146
    iget-object v0, p0, Ll/ado0;->c:Ljava/util/HashMap;

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Ll/ado0;->f:Ljava/util/List;

    .line 152
    .line 153
    new-instance v0, Ll/wco0;

    .line 154
    .line 155
    invoke-direct {v0}, Ll/wco0;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-static {p0, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 159
    .line 160
    .line 161
    :cond_3
    :goto_0
    return-void
.end method
