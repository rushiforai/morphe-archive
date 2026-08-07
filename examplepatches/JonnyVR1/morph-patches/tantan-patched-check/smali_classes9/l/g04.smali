.class public Ll/g04;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public h:Ljava/lang/String;

.field public final i:Ll/i04;

.field public j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

.field public k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

.field public l:[I

.field public m:I

.field public n:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/j04;

.field public final p:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>(Ll/i04;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "[live]CallAnchorMotion"

    .line 5
    .line 6
    iput-object v0, p0, Ll/g04;->h:Ljava/lang/String;

    .line 7
    .line 8
    const/16 v0, 0x21c

    .line 9
    .line 10
    const/16 v1, 0x3c0

    .line 11
    .line 12
    filled-new-array {v0, v1}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/g04;->l:[I

    .line 17
    .line 18
    const v0, 0x124f80

    .line 19
    .line 20
    .line 21
    iput v0, p0, Ll/g04;->m:I

    .line 22
    .line 23
    new-instance v0, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 29
    .line 30
    iput-object p1, p0, Ll/g04;->i:Ll/i04;

    .line 31
    .line 32
    new-instance p1, Lcom/google/gson/Gson;

    .line 33
    .line 34
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/g04;->p:Lcom/google/gson/Gson;

    .line 38
    .line 39
    return-void
.end method

.method private F1()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 6
    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/d04;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/d04;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/util/Map$Entry;

    .line 59
    .line 60
    iget-object v1, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    new-instance v2, Ll/e04;

    .line 67
    .line 68
    invoke-direct {v2, p0, v0}, Ll/e04;-><init>(Ll/g04;Ljava/util/Map$Entry;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 75
    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    iget-object v2, p0, Ll/g04;->l:[I

    .line 79
    .line 80
    const/4 v3, 0x0

    .line 81
    aget v3, v2, v3

    .line 82
    .line 83
    iput v3, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    aget v2, v2, v4

    .line 87
    .line 88
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 89
    .line 90
    iget-object v1, p0, Ll/g04;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 91
    .line 92
    iput v3, v1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 93
    .line 94
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    const/16 v2, 0x438

    .line 98
    .line 99
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 100
    .line 101
    const/16 v2, 0x324

    .line 102
    .line 103
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 104
    .line 105
    iget-object v1, p0, Ll/g04;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 106
    .line 107
    const/16 v3, 0x21c

    .line 108
    .line 109
    iput v3, v1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 110
    .line 111
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 112
    .line 113
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 114
    .line 115
    iget-object v1, v1, Ll/u1f;->d:Ll/p410;

    .line 116
    .line 117
    iget-object v2, p0, Ll/g04;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Ll/p410;->g1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 123
    .line 124
    iget-object v1, v1, Ll/u1f;->d:Ll/p410;

    .line 125
    .line 126
    iget-object v2, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/g04;->o:Ll/j04;

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Ll/j04;->m(Ljava/util/Map$Entry;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/g04;->o:Ll/j04;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/j04;->b()V

    .line 139
    .line 140
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v1, "updateCanvasAndVideoResolution sei = "

    .line 144
    .line 145
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_2
    :goto_1
    return-void
.end method

.method public static synthetic p1(Ll/g04;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g04;->y1()V

    return-void
.end method

.method public static synthetic q1(Ll/g04;Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g04;->A1(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V

    return-void
.end method

.method public static synthetic r1(Ljava/util/Map$Entry;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x2

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic s1(Ll/g04;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g04;->z1()V

    return-void
.end method

.method public static synthetic t1(Ljava/util/concurrent/ConcurrentHashMap;Ll/td1;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/td1;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/td1;->b()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static x1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ll/g04;

    .line 12
    .line 13
    check-cast p0, Ll/i04;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/g04;-><init>(Ll/i04;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public final synthetic A1(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V
    .locals 6

    .line 1
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 2
    .line 3
    invoke-direct {v1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    const/4 v0, 0x1

    .line 27
    if-eq p2, v0, :cond_3

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    if-eq p2, p1, :cond_2

    .line 31
    .line 32
    const/4 p1, 0x3

    .line 33
    if-eq p2, p1, :cond_0

    .line 34
    .line 35
    move-object v0, p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p1, p0, Ll/g04;->i:Ll/i04;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 40
    .line 41
    const-string p2, "tencent"

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    const/4 v5, 0x0

    .line 51
    const/4 v2, 0x0

    .line 52
    const/4 v3, 0x0

    .line 53
    move-object v0, p0

    .line 54
    invoke-virtual/range {v0 .. v5}, Ll/g04;->E1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFF)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    move-object v0, p0

    .line 59
    const/4 v4, 0x0

    .line 60
    const/4 v5, 0x0

    .line 61
    const v2, 0x3b449ba6    # 0.003f

    .line 62
    .line 63
    .line 64
    const v3, 0x3b449ba6    # 0.003f

    .line 65
    .line 66
    .line 67
    invoke-virtual/range {v0 .. v5}, Ll/g04;->E1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFF)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    move-object v0, p0

    .line 72
    const/high16 v4, 0x3f000000    # 0.5f

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    const/high16 v2, 0x3f000000    # 0.5f

    .line 76
    .line 77
    const/high16 v3, 0x3f800000    # 1.0f

    .line 78
    .line 79
    invoke-virtual/range {v0 .. v5}, Ll/g04;->E1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFF)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    move-object v0, p0

    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    const/4 v4, 0x0

    .line 87
    const/4 v5, 0x0

    .line 88
    const/high16 v2, 0x3f800000    # 1.0f

    .line 89
    .line 90
    const/high16 v3, 0x3f800000    # 1.0f

    .line 91
    .line 92
    invoke-virtual/range {v0 .. v5}, Ll/g04;->E1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFF)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    const/4 v4, 0x0

    .line 97
    const/4 v5, 0x0

    .line 98
    const/high16 v2, 0x3f000000    # 0.5f

    .line 99
    .line 100
    const/high16 v3, 0x3f800000    # 1.0f

    .line 101
    .line 102
    invoke-virtual/range {v0 .. v5}, Ll/g04;->E1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFF)V

    .line 103
    .line 104
    .line 105
    :goto_0
    iget-object p0, v0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    iget-object p0, v0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g04;->i:Ll/i04;

    .line 5
    .line 6
    iget-object v0, v0, Ll/i04;->m:Ll/z20;

    .line 7
    .line 8
    const/4 v1, 0x6

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/g04;->i:Ll/i04;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "onRequestChannelKey"

    .line 21
    .line 22
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final B1(Landroid/view/SurfaceView;J)V
    .locals 3

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Ll/g04;->o:Ll/j04;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1, p1, p2, p3}, Ll/j04;->f(Landroid/view/SurfaceView;J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2, p3, v2}, Ll/g04;->u1(JZ)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/g04;->i:Ll/i04;

    .line 18
    .line 19
    iget-object p0, p0, Ll/i04;->m:Ll/z20;

    .line 20
    .line 21
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, v0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {v1, p2, p3}, Ll/j04;->j(J)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, p2, p3, v2}, Ll/g04;->u1(JZ)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/g04;->i:Ll/i04;

    .line 39
    .line 40
    iget-object p0, p0, Ll/i04;->m:Ll/z20;

    .line 41
    .line 42
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p0, v0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p2, "onLocalLeaveChannel"

    .line 7
    .line 8
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final C1(J)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/g04;->D1(JZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final D1(JZ)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p3, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iget-object p3, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    if-eqz p3, :cond_1

    .line 40
    .line 41
    iget-object p3, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 p2, 0x3

    .line 48
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p3, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object p3, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    if-eqz p3, :cond_2

    .line 67
    .line 68
    iget-object p3, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 69
    .line 70
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    invoke-direct {p0}, Ll/g04;->F1()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final E1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFF)V
    .locals 0

    .line 1
    iput p2, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 2
    .line 3
    iput p3, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 4
    .line 5
    iput p4, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 6
    .line 7
    iput p5, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 8
    .line 9
    return-void
.end method

.method public I(JZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->I(JZ)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "onMemberAudioMuted"

    .line 7
    .line 8
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public X0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Y0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a1()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 2
    .line 3
    .line 4
    const-string p0, "goToEnd"

    .line 5
    .line 6
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(JI)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->b(JI)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/g04;->C1(J)V

    .line 5
    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "onVideoChannelRemove uid:"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, ",reason:"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    const/4 p4, 0x0

    .line 5
    invoke-virtual {p0, p2, p3, p4}, Ll/g04;->u1(JZ)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string p4, "onLocalJoinChannel result channel = "

    .line 11
    .line 12
    invoke-direct {p0, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " uid = "

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public e(JZ)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->e(JZ)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/g04;->C1(J)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0, p1, p2}, Ll/g04;->B1(Landroid/view/SurfaceView;J)V

    .line 12
    .line 13
    .line 14
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, "onMemberVideoMuted uid:"

    .line 17
    .line 18
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, ",muted:"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onMemberJoinChannel"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p2, p3, p1}, Ll/g04;->u1(JZ)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/g04;->i:Ll/i04;

    .line 26
    .line 27
    iget-object p0, p0, Ll/i04;->m:Ll/z20;

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0([Ll/td1;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/eas;->l0([Ll/td1;)V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget-object v0, p1, v0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/td1;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/f04;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ll/f04;-><init>(Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 37
    .line 38
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    .line 43
    iget-object v0, p0, Ll/g04;->i:Ll/i04;

    .line 44
    .line 45
    iget-object v0, v0, Ll/i04;->m:Ll/z20;

    .line 46
    .line 47
    const/4 v1, 0x5

    .line 48
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v0, v1, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 56
    .line 57
    iget-object v1, p0, Ll/g04;->p:Lcom/google/gson/Gson;

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 66
    .line 67
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 68
    .line 69
    iget-object v1, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "onAudioVolumeIndication"

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/g04;->p:Lcom/google/gson/Gson;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p4, "onMemberLeaveChannel"

    .line 7
    .line 8
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Ll/g64;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    invoke-virtual {p0, p1, p2, p3}, Ll/g04;->D1(JZ)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/g04;->i:Ll/i04;

    .line 26
    .line 27
    iget-object p0, p0, Ll/i04;->m:Ll/z20;

    .line 28
    .line 29
    const/4 p3, 0x2

    .line 30
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p0, p3, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public o1()I
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->destroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "start motionParams"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/g04;->i:Ll/i04;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/i04;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/j04;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/j04;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/g04;->o:Ll/j04;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 45
    .line 46
    iget-object v1, v1, Ll/u1f;->h:Ll/r510;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ll/r510;->d(Ll/o510;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/g04;->i:Ll/i04;

    .line 52
    .line 53
    iget-object v1, v0, Ll/nw40;->l:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v2, v0, Ll/nw40;->k:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v0, v0, Ll/nw40;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 58
    .line 59
    invoke-virtual {p0, v1, v2, v0}, Ll/g04;->w1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Ll/g04;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 64
    .line 65
    iget-object v0, p0, Ll/g04;->l:[I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/g04;->v1([I)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 74
    .line 75
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Ll/p410;->i1(Ll/cgu;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 85
    .line 86
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 87
    .line 88
    iget-object v1, p0, Ll/g04;->k:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 89
    .line 90
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 91
    .line 92
    const/4 v3, 0x1

    .line 93
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iget-object v3, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 98
    .line 99
    invoke-virtual {v0, v1, v2, v3}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 103
    .line 104
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 105
    .line 106
    const/16 v0, 0x3e8

    .line 107
    .line 108
    const/4 v1, 0x3

    .line 109
    invoke-virtual {p0, v0, v1}, Ll/p410;->T0(II)V

    .line 110
    .line 111
    .line 112
    const/4 p0, 0x0

    .line 113
    return p0
.end method

.method public final u1(JZ)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p3, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p3, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Ll/g04;->n:Ljava/util/HashMap;

    .line 33
    .line 34
    if-eqz p3, :cond_1

    .line 35
    .line 36
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 p2, 0x2

    .line 41
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const/4 p2, 0x3

    .line 54
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-direct {p0}, Ll/g04;->F1()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final v1([I)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aget v1, p1, v1

    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    aget p1, p1, v1

    .line 13
    .line 14
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 15
    .line 16
    iget p1, p0, Ll/g04;->m:I

    .line 17
    .line 18
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoBitrate:I

    .line 19
    .line 20
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x0

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    const/high16 v4, 0x3f800000    # 1.0f

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->V0(Ljava/lang/String;FFFF)Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->userid:Ljava/lang/String;

    .line 54
    .line 55
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 64
    .line 65
    .line 66
    move-result-wide p0

    .line 67
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->inv:Ljava/lang/String;

    .line 72
    .line 73
    const/4 p0, 0x2

    .line 74
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 75
    .line 76
    return-object v0
.end method

.method public final w1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 8
    .line 9
    const v1, 0xac44

    .line 10
    .line 11
    .line 12
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 13
    .line 14
    const v1, 0xfa00

    .line 15
    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 18
    .line 19
    const v1, 0x124f80

    .line 20
    .line 21
    .line 22
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 23
    .line 24
    const/16 v2, 0x14

    .line 25
    .line 26
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 27
    .line 28
    iput v1, p0, Ll/g04;->m:I

    .line 29
    .line 30
    new-instance v1, Ll/b04;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/b04;-><init>(Ll/g04;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/c04;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/c04;-><init>(Ll/g04;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/g04;->l:[I

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    aget v3, v1, v2

    .line 47
    .line 48
    iput v3, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    aget v1, v1, v3

    .line 52
    .line 53
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 54
    .line 55
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 56
    .line 57
    iput-object p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->ipv6Url:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->isValid()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 74
    .line 75
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->fps:I

    .line 76
    .line 77
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 78
    .line 79
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->bitRate:I

    .line 80
    .line 81
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 82
    .line 83
    iput p2, p0, Ll/g04;->m:I

    .line 84
    .line 85
    iget-object p2, p0, Ll/g04;->l:[I

    .line 86
    .line 87
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->width:I

    .line 88
    .line 89
    aput v1, p2, v2

    .line 90
    .line 91
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->heigth:I

    .line 92
    .line 93
    aput p1, p2, v3

    .line 94
    .line 95
    iget p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->videoCodecType:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 99
    .line 100
    iget-object p1, p1, Ll/u1f;->c:Ll/b210;

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/b210;->a1()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    if-eqz p1, :cond_1

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->isValid()Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-eqz p2, :cond_1

    .line 113
    .line 114
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushFps:I

    .line 115
    .line 116
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 117
    .line 118
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushBitrate:I

    .line 119
    .line 120
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 121
    .line 122
    iput p2, p0, Ll/g04;->m:I

    .line 123
    .line 124
    iget-object p2, p0, Ll/g04;->l:[I

    .line 125
    .line 126
    iget p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushWidth:I

    .line 127
    .line 128
    aput p3, p2, v2

    .line 129
    .line 130
    iget p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushHeight:I

    .line 131
    .line 132
    aput p3, p2, v3

    .line 133
    .line 134
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->videoCodecType:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_1
    move p1, v2

    .line 138
    :goto_0
    iget-object p2, p0, Ll/g04;->l:[I

    .line 139
    .line 140
    aget p3, p2, v2

    .line 141
    .line 142
    iput p3, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 143
    .line 144
    aget p2, p2, v3

    .line 145
    .line 146
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 147
    .line 148
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 149
    .line 150
    iget-object p1, p0, Ll/g04;->i:Ll/i04;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 159
    .line 160
    iget-object p0, p0, Ll/g04;->i:Ll/i04;

    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 169
    .line 170
    return-object v0
.end method

.method public final synthetic y1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/g04;->l:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, 0x21c

    .line 5
    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const/16 v1, 0x3c0

    .line 10
    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3, p1, p2}, Ll/g04;->B1(Landroid/view/SurfaceView;J)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string p2, "onVideoChannelAdded sei = "

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/g04;->j:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic z1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/g04;->l:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, 0x1e0

    .line 5
    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const/16 v1, 0x280

    .line 10
    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    return-void
.end method
