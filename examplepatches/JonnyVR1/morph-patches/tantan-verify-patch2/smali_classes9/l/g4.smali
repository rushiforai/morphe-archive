.class public abstract Ll/g4;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g4$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:J

.field public n:Ljava/lang/String;

.field public o:Ll/ws40;

.field public p:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final r:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/gg3;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ll/vxd0;

.field public t:Ll/vxd0;

.field public u:Ll/byd0;

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/g4;->q:Ljava/util/List;

    .line 17
    .line 18
    new-instance p1, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 24
    .line 25
    new-instance p1, Ll/vxd0;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "total_user_count"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/g4;->s:Ll/vxd0;

    .line 52
    .line 53
    new-instance p1, Ll/vxd0;

    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v2, "total_everyday_count"

    .line 58
    .line 59
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 63
    .line 64
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Ll/g4;->t:Ll/vxd0;

    .line 79
    .line 80
    new-instance p1, Ll/byd0;

    .line 81
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v1, "latest_show_time"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const-wide/16 v1, 0x0

    .line 103
    .line 104
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 109
    .line 110
    .line 111
    iput-object p1, p0, Ll/g4;->u:Ll/byd0;

    .line 112
    .line 113
    new-instance p1, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object p1, p0, Ll/g4;->v:Ljava/util/List;

    .line 119
    .line 120
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "live"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->liveType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic L3(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->z4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic M3(Ll/g4;Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;)V

    return-void
.end method

.method private M4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g4;->v:Ljava/util/List;

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
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Ll/g4;->J4()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_2
    invoke-virtual {p0}, Ll/g4;->L4()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Ll/g4;->u:Ll/byd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Long;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/g4;->P4()V

    .line 60
    .line 61
    .line 62
    :cond_4
    invoke-virtual {p0}, Ll/g4;->K4()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    goto/16 :goto_1

    .line 69
    .line 70
    :cond_5
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_6
    iget-object v0, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 80
    .line 81
    iget-object v1, p0, Ll/g4;->q:Ljava/util/List;

    .line 82
    .line 83
    const/4 v2, 0x0

    .line 84
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 93
    .line 94
    if-nez v0, :cond_7

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_7
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Ll/g4;->j4(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_8

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_8
    invoke-virtual {p0, v0}, Ll/g4;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_9

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_9
    iget-object v1, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 114
    .line 115
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    check-cast v1, Ll/gg3;

    .line 122
    .line 123
    if-nez v1, :cond_a

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_a
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 127
    .line 128
    iput-object v3, p0, Ll/g4;->n:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v3, p0, Ll/g4;->q:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v0, v1}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-nez v2, :cond_b

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_b
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_c

    .line 149
    .line 150
    const/4 v2, -0x1

    .line 151
    goto :goto_0

    .line 152
    :cond_c
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->buttonId:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    :goto_0
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p0, v3, v2}, Ll/g4;->r4(Ljava/lang/String;I)Ll/g4$a;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    if-eqz v2, :cond_e

    .line 165
    .line 166
    iget-object v3, v2, Ll/g4$a;->a:Landroid/view/View;

    .line 167
    .line 168
    if-nez v3, :cond_d

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_d
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p0, v3, v2, v0, v1}, Ll/g4;->O4(Ljava/lang/String;Ll/g4$a;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)V

    .line 174
    .line 175
    .line 176
    :cond_e
    :goto_1
    return-void
.end method

.method public static synthetic N3(Ll/g4;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->t4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O3(Ll/g4;[Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g4;->x4([Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic P3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic R3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic S3(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->A4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x2

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic V3(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->v4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic W3(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->T4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X3(Ll/g4;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->u4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method public static synthetic Y3(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->U4(Ljava/lang/String;)V

    return-void
.end method

.method private Y4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/oo2;->k2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, v0, v1}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/f4;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/f4;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/g3;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/g3;-><init>(Ll/g4;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/h3;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/h3;-><init>(Ll/g4;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic Z3(Ll/g4;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g4;->y4([Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b4(Ll/g4;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->C4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d4(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->w4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e4(ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p0}, Ll/fwk;->q(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic g4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h4(Ll/g4;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->B4(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i4(Ll/g4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g4;->n4(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g4;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic B4(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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

.method public final synthetic C4(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/g4;->m:J

    .line 6
    .line 7
    invoke-direct {p0}, Ll/g4;->M4()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final D4(Ljava/lang/String;)Ll/wyd0;
    .locals 2

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "bubble_anchor_id"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, ""

    .line 27
    .line 28
    invoke-direct {p0, p1, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public final E4(Ljava/lang/String;)Ll/wyd0;
    .locals 2

    .line 1
    new-instance p0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "bubble_id"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, ""

    .line 27
    .line 28
    invoke-direct {p0, p1, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public final F4(Ljava/lang/String;)Ll/vxd0;
    .locals 2

    .line 1
    new-instance p0, Ll/vxd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "bubble_today_times"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public final G4(Ljava/lang/String;)Ll/vxd0;
    .locals 2

    .line 1
    new-instance p0, Ll/vxd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "bubble_total_times"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public final H4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/g4;->m:J

    .line 2
    .line 3
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 4
    .line 5
    int-to-long p0, p0

    .line 6
    cmp-long p0, v0, p0

    .line 7
    .line 8
    if-gez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public abstract I4(Ljava/lang/String;)V
.end method

.method public final J4()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/g4;->l:I

    .line 2
    .line 3
    iget p0, p0, Ll/g4;->k:I

    .line 4
    .line 5
    if-lt v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final K4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4;->t:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget p0, p0, Ll/g4;->j:I

    .line 14
    .line 15
    if-lt v0, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final L4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4;->s:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget p0, p0, Ll/g4;->i:I

    .line 14
    .line 15
    if-lt v0, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final N4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/p3;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/p3;-><init>(Ll/g4;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public abstract O4(Ljava/lang/String;Ll/g4$a;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)V
.end method

.method public final P4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g4;->t:Ll/vxd0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/l3;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/l3;-><init>(Ll/g4;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/g4;->u:Ll/byd0;

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final Q4()Ll/ws40;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g4;->o:Ll/ws40;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/l6t;->C2(Ll/l6t;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/g4;->o:Ll/ws40;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ll/ws40;

    .line 13
    .line 14
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/ws40;-><init>(Ll/dum;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/g4;->o:Ll/ws40;

    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Ll/g4;->o:Ll/ws40;

    .line 22
    .line 23
    return-object p0
.end method

.method public final R4(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4;->v:Ljava/util/List;

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
    iget-object p0, p0, Ll/g4;->v:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Ll/o3;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/o3;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public S4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;Ll/g4$a;)V
    .locals 10

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

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
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    new-array v2, v1, [Ljava/lang/String;

    .line 16
    .line 17
    new-instance v3, Ll/zvk;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-direct {v3, v4}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    sget v4, Ll/zvk;->C:I

    .line 40
    .line 41
    const/high16 v6, 0x41400000    # 12.0f

    .line 42
    .line 43
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    invoke-virtual {v3, v4, v7}, Ll/zvk;->g(II)Ll/zvk;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const/high16 v4, 0x41800000    # 16.0f

    .line 52
    .line 53
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    const/high16 v8, 0x41200000    # 10.0f

    .line 58
    .line 59
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 60
    .line 61
    .line 62
    move-result v9

    .line 63
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    invoke-virtual {v3, v7, v9, v4, v8}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-static {v6}, Ll/bnl0;->w(F)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-virtual {v3, v4}, Ll/zvk;->p(I)Ll/zvk;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v6, "#"

    .line 86
    .line 87
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    new-instance v7, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    filled-new-array {v4, v6}, [I

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v3, v4}, Ll/zvk;->e([I)Ll/zvk;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v3, v1}, Ll/zvk;->k(Z)Ll/zvk;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    const/16 v3, 0xd

    .line 134
    .line 135
    invoke-virtual {v1, v3}, Ll/zvk;->t(I)Ll/zvk;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    const/4 v3, -0x1

    .line 140
    invoke-virtual {v1, v3}, Ll/zvk;->q(I)Ll/zvk;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v1, v5}, Ll/zvk;->v(Z)Ll/zvk;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    sget v3, Ll/zvk;->D:I

    .line 149
    .line 150
    invoke-virtual {v1, v3}, Ll/zvk;->i(I)Ll/zvk;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 155
    .line 156
    mul-int/lit16 v3, v3, 0x3e8

    .line 157
    .line 158
    int-to-long v3, v3

    .line 159
    invoke-virtual {v1, v3, v4}, Ll/zvk;->a(J)Ll/zvk;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    new-instance v3, Ll/r3;

    .line 164
    .line 165
    invoke-direct {v3}, Ll/r3;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v3}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    new-instance v3, Ll/s3;

    .line 173
    .line 174
    invoke-direct {v3, p0, v2}, Ll/s3;-><init>(Ll/g4;[Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1, v3}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    const-string v3, "click"

    .line 182
    .line 183
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 184
    .line 185
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-eqz v3, :cond_1

    .line 190
    .line 191
    new-instance v3, Ll/t3;

    .line 192
    .line 193
    invoke-direct {v3, p0}, Ll/t3;-><init>(Ll/g4;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1, v3}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 197
    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_1
    const-string v3, "timing"

    .line 201
    .line 202
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->disAppearMod:Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_2

    .line 209
    .line 210
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 211
    .line 212
    mul-int/lit16 v3, v3, 0x3e8

    .line 213
    .line 214
    int-to-long v3, v3

    .line 215
    invoke-virtual {v1, v3, v4}, Ll/zvk;->a(J)Ll/zvk;

    .line 216
    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_2
    new-instance v3, Ll/u3;

    .line 220
    .line 221
    invoke-direct {v3, p0}, Ll/u3;-><init>(Ll/g4;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1, v3}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    iget v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 229
    .line 230
    mul-int/lit16 v4, v4, 0x3e8

    .line 231
    .line 232
    int-to-long v6, v4

    .line 233
    invoke-virtual {v3, v6, v7}, Ll/zvk;->a(J)Ll/zvk;

    .line 234
    .line 235
    .line 236
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/g4;->Z4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0, p1}, Ll/g4;->W4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Z

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    if-eqz p2, :cond_3

    .line 244
    .line 245
    iget-object p2, p3, Ll/g4$a;->a:Landroid/view/View;

    .line 246
    .line 247
    invoke-virtual {p2}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object p3

    .line 251
    check-cast p3, Landroid/view/ViewGroup;

    .line 252
    .line 253
    invoke-virtual {v0, v1, p2, p3}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p2

    .line 257
    aput-object p2, v2, v5

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_3
    iget-object p2, p3, Ll/g4$a;->a:Landroid/view/View;

    .line 261
    .line 262
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 263
    .line 264
    check-cast p3, Landroid/view/ViewGroup;

    .line 265
    .line 266
    invoke-virtual {v0, v1, p2, p3}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p2

    .line 270
    aput-object p2, v2, v5

    .line 271
    .line 272
    :goto_1
    iget-object p2, p0, Ll/g4;->v:Ljava/util/List;

    .line 273
    .line 274
    aget-object p3, v2, v5

    .line 275
    .line 276
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {p0, p1}, Ll/g4;->I4(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/f3;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/f3;-><init>(Ll/g4;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Ll/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/q3;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/q3;-><init>(Ll/g4;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/y3;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/y3;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/z3;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/z3;-><init>(Ll/g4;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lrx/c;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/a4;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/a4;-><init>(Ll/g4;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleById()Ll/v3f$d;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lrx/c;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/b4;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/b4;-><init>(Ll/g4;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleByType()Ll/v3f$d;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lrx/c;

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/c4;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/c4;-><init>(Ll/g4;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 151
    .line 152
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lrx/c;

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v1, Ll/d4;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/d4;-><init>(Ll/g4;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showExtraBubble()Ll/v3f$d;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    check-cast v0, Lrx/c;

    .line 193
    .line 194
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    new-instance v1, Ll/e4;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/e4;-><init>(Ll/g4;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 208
    .line 209
    .line 210
    return-void
.end method

.method public final T4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/g4;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ll/gg3;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ll/g4;->M4()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final U4(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/m3;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/m3;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/g4;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ll/gg3;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Ll/g4;->M4()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public V4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/g4;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ll/gg3;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Ll/g4;->M4()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public W4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string p1, "firstRechargeGiftDialogBubble"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final X4(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Ll/g4;->q:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/v3;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/v3;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/w3;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/w3;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0, v1}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, 0x0

    .line 24
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-ge v0, v1, :cond_2

    .line 29
    .line 30
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Ll/g4;->q:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    :goto_1
    return-void
.end method

.method public Z4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)V
    .locals 1

    .line 1
    iget-object p1, p2, Ll/gg3;->a:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g4;->j3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p2, Ll/gg3;->c:Ll/vxd0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p1, p2, Ll/gg3;->d:Ll/vxd0;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    add-int/lit8 p2, p2, 0x1

    .line 44
    .line 45
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/g4;->t:Ll/vxd0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    check-cast p2, Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    add-int/lit8 p2, p2, 0x1

    .line 65
    .line 66
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/g4;->s:Ll/vxd0;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    add-int/lit8 p2, p2, 0x1

    .line 86
    .line 87
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    iget p1, p0, Ll/g4;->l:I

    .line 95
    .line 96
    add-int/lit8 p1, p1, 0x1

    .line 97
    .line 98
    iput p1, p0, Ll/g4;->l:I

    .line 99
    .line 100
    return-void
.end method

.method public j3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public abstract j4(Ljava/lang/String;)Z
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z
    .locals 1

    .line 1
    iget-object p0, p2, Ll/gg3;->c:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 14
    .line 15
    if-ge p0, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p2, Ll/gg3;->d:Ll/vxd0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 30
    .line 31
    if-lt p0, p1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public l4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public m4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g4;->v:Ljava/util/List;

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
    iget-object v0, p0, Ll/g4;->v:Ljava/util/List;

    .line 11
    .line 12
    new-instance v1, Ll/n3;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/n3;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/g4;->v:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g4;->m4()V

    .line 5
    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/g4;->m:J

    .line 10
    .line 11
    return-void
.end method

.method public final n4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/g4;->m4()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final o4()Z
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    xor-int/lit8 p0, p0, 0x1

    .line 7
    .line 8
    return p0
.end method

.method public abstract p4()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ">;"
        }
    .end annotation
.end method

.method public final q4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ll/gg3;
    .locals 2

    .line 1
    new-instance v0, Ll/gg3;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gg3;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/g4;->D4(Ljava/lang/String;)Ll/wyd0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Ll/gg3;->a:Ll/wyd0;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/g4;->E4(Ljava/lang/String;)Ll/wyd0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Ll/gg3;->b:Ll/wyd0;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/g4;->F4(Ljava/lang/String;)Ll/vxd0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Ll/gg3;->c:Ll/vxd0;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/g4;->G4(Ljava/lang/String;)Ll/vxd0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput-object p0, v0, Ll/gg3;->d:Ll/vxd0;

    .line 37
    .line 38
    return-object v0
.end method

.method public abstract r4(Ljava/lang/String;I)Ll/g4$a;
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->totalBubbleUserShowMaxCount:I

    .line 2
    .line 3
    iput v0, p0, Ll/g4;->i:I

    .line 4
    .line 5
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->totalBubbleEveryDayShowMaxCount:I

    .line 6
    .line 7
    iput v0, p0, Ll/g4;->j:I

    .line 8
    .line 9
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->totalBubbleUserShowInRoomCount:I

    .line 10
    .line 11
    iput v0, p0, Ll/g4;->k:I

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->bubbleConfigs:Ljava/util/List;

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/g4;->o4()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->bubbleConfigs:Ljava/util/List;

    .line 24
    .line 25
    new-instance v1, Ll/i3;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/i3;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_0
    if-eqz v0, :cond_1

    .line 35
    .line 36
    new-instance v1, Ll/j3;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/j3;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/k3;

    .line 42
    .line 43
    invoke-direct {v2}, Ll/k3;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1, v2}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    new-instance v1, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 59
    .line 60
    :goto_0
    invoke-virtual {p0}, Ll/g4;->Q4()Ll/ws40;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1, v0}, Ll/ws40;->R3(Ljava/util/List;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->anchorBubblePriority:Ljava/util/List;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->audienceBubblePriority:Ljava/util/List;

    .line 78
    .line 79
    :goto_1
    invoke-virtual {p0, v0, p1}, Ll/g4;->X4(Ljava/util/List;Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/g4;->N4()V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/g4;->Y4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic t4(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g4;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/g4;->R4(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic v4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4;->p:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/g4;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ll/gg3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic w4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4;->r:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gg3;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/gg3;->c:Ll/vxd0;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic x4([Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4;->v:Ljava/util/List;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    aget-object p1, p1, p2

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic y4([Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x2

    .line 6
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-virtual {p2, v0, v1}, Ll/oo2;->j2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, p2, v0}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    new-instance v0, Ll/x3;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Ll/x3;-><init>(Ll/g4;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic z4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g4;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
