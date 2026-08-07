.class public Lcom/p1/mobile/putong/data/Profile;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/data/Profile;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final FOOD:Ljava/lang/String; = "food"

.field public static final GAMES:Ljava/lang/String; = "games"

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/Profile;",
            ">;"
        }
    .end annotation
.end field

.field public static final LITERATURE:Ljava/lang/String; = "literature"

.field public static final MOVIES:Ljava/lang/String; = "movies"

.field public static final MUSIC:Ljava/lang/String; = "music"

.field public static final PERSONALITY:Ljava/lang/String; = "personality"

.field public static final PLACES:Ljava/lang/String; = "places"

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Profile;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPORTS:Ljava/lang/String; = "sports"

.field public static final SUGGESTION_REASON:Ljava/lang/String; = "suggestion_reason"

.field public static final TAG_CATEGORIES:[Ljava/lang/String;

.field public static final TYPE:Ljava/lang/String; = "profile"


# instance fields
.field public answers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Answer;",
            ">;"
        }
    .end annotation
.end field

.field public api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public extensions:Lcom/p1/mobile/putong/data/Extensions;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public followships:Lcom/p1/mobile/putong/data/FollowshipCounters;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public hangouts:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public hometown:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public job:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public moments:Lcom/p1/mobile/putong/data/Moments;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public mood:Lcom/p1/mobile/putong/data/UserProfileMood;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public occupation:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public onlyShowAboutMeInside:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public receivedLikes:Ljava/lang/Long;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public receivedLikesRank:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public scenarios:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public school:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public social:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Social;",
            ">;"
        }
    .end annotation
.end field

.field public studies:Lcom/p1/mobile/putong/data/Studies;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation
.end field

.field public tbh:Lcom/p1/mobile/putong/data/ProfileTbh;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public work:Lcom/p1/mobile/putong/data/Work;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-string v7, "suggestion_reason"

    .line 2
    .line 3
    const-string v8, "games"

    .line 4
    .line 5
    const-string v0, "personality"

    .line 6
    .line 7
    const-string v1, "sports"

    .line 8
    .line 9
    const-string v2, "music"

    .line 10
    .line 11
    const-string v3, "literature"

    .line 12
    .line 13
    const-string v4, "movies"

    .line 14
    .line 15
    const-string v5, "food"

    .line 16
    .line 17
    const-string v6, "places"

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/p1/mobile/putong/data/Profile;->TAG_CATEGORIES:[Ljava/lang/String;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/data/Profile$1;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Profile$1;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/data/Profile$2;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Profile$2;-><init>()V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lcom/p1/mobile/putong/data/Profile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/Social;)Lcom/p1/mobile/putong/data/Social;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Social;->clone()Lcom/p1/mobile/putong/data/Social;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Tag;)Lcom/p1/mobile/putong/data/Tag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Tag;->clone()Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static categoryToIndex(Ljava/lang/String;)I
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x6

    .line 9
    const/4 v2, 0x5

    .line 10
    const/4 v3, 0x4

    .line 11
    const/4 v4, 0x3

    .line 12
    const/4 v5, 0x2

    .line 13
    const/4 v6, 0x1

    .line 14
    const/4 v7, 0x0

    .line 15
    const/4 v8, 0x7

    .line 16
    const/4 v9, -0x1

    .line 17
    sparse-switch v0, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :sswitch_0
    const-string v0, "music"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    move v9, v8

    .line 33
    goto :goto_0

    .line 34
    :sswitch_1
    const-string v0, "games"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v9, v1

    .line 44
    goto :goto_0

    .line 45
    :sswitch_2
    const-string v0, "food"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v9, v2

    .line 55
    goto :goto_0

    .line 56
    :sswitch_3
    const-string v0, "suggestion_reason"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    move v9, v3

    .line 66
    goto :goto_0

    .line 67
    :sswitch_4
    const-string v0, "sports"

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    move v9, v4

    .line 77
    goto :goto_0

    .line 78
    :sswitch_5
    const-string v0, "places"

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    move v9, v5

    .line 88
    goto :goto_0

    .line 89
    :sswitch_6
    const-string v0, "movies"

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_6

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    move v9, v6

    .line 99
    goto :goto_0

    .line 100
    :sswitch_7
    const-string v0, "literature"

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_7

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    move v9, v7

    .line 110
    :goto_0
    packed-switch v9, :pswitch_data_0

    .line 111
    .line 112
    .line 113
    return v7

    .line 114
    :pswitch_0
    return v5

    .line 115
    :pswitch_1
    return v8

    .line 116
    :pswitch_2
    return v2

    .line 117
    :pswitch_3
    return v8

    .line 118
    :pswitch_4
    return v6

    .line 119
    :pswitch_5
    return v1

    .line 120
    :pswitch_6
    return v3

    .line 121
    :pswitch_7
    return v4

    .line 122
    nop

    .line 123
    :sswitch_data_0
    .sparse-switch
        -0x67ff2aaf -> :sswitch_7
        -0x3fac58bd -> :sswitch_6
        -0x3ac1b7b4 -> :sswitch_5
        -0x35643881 -> :sswitch_4
        -0x1620c721 -> :sswitch_3
        0x300c5e -> :sswitch_2
        0x5d932c1 -> :sswitch_1
        0x636ee25 -> :sswitch_0
    .end sparse-switch

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/Answer;)Lcom/p1/mobile/putong/data/Answer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Answer;->clone()Lcom/p1/mobile/putong/data/Answer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "places"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

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

.method public static new_()Lcom/p1/mobile/putong/data/Profile;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Profile;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 214
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Profile;->clone()Lcom/p1/mobile/putong/data/Profile;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Profile;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v2, Ll/em90;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/em90;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->clone()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 50
    .line 51
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->clone()Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 60
    .line 61
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 62
    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    new-instance v2, Ll/fm90;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/fm90;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 75
    .line 76
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 77
    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    new-instance v2, Ll/gm90;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/gm90;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 90
    .line 91
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 100
    .line 101
    if-eqz v1, :cond_5

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Work;->clone()Lcom/p1/mobile/putong/data/Work;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 108
    .line 109
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 110
    .line 111
    if-eqz v1, :cond_6

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Studies;->clone()Lcom/p1/mobile/putong/data/Studies;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 118
    .line 119
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 120
    .line 121
    if-eqz v1, :cond_7

    .line 122
    .line 123
    new-instance v2, Ll/hm90;

    .line 124
    .line 125
    invoke-direct {v2}, Ll/hm90;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 133
    .line 134
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 135
    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 139
    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileTbh;->clone()Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 147
    .line 148
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 149
    .line 150
    if-eqz v1, :cond_9

    .line 151
    .line 152
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FollowshipCounters;->clone()Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 157
    .line 158
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 159
    .line 160
    if-eqz v1, :cond_a

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Moments;->clone()Lcom/p1/mobile/putong/data/Moments;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 167
    .line 168
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 169
    .line 170
    if-eqz v1, :cond_b

    .line 171
    .line 172
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserProfileMood;->clone()Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 177
    .line 178
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 179
    .line 180
    if-eqz v1, :cond_c

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Extensions;->clone()Lcom/p1/mobile/putong/data/Extensions;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 187
    .line 188
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 189
    .line 190
    if-eqz v1, :cond_d

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MoodMoment;->clone()Lcom/p1/mobile/putong/data/MoodMoment;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 197
    .line 198
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 199
    .line 200
    if-eqz v1, :cond_e

    .line 201
    .line 202
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BizAnswers;->clone()Lcom/p1/mobile/putong/data/BizAnswers;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 207
    .line 208
    :cond_e
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 209
    .line 210
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 211
    .line 212
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 213
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Profile;->clone()Lcom/p1/mobile/putong/data/Profile;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 146
    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 176
    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_2

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 186
    .line 187
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_2

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 196
    .line 197
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_2

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 206
    .line 207
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_2

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 216
    .line 217
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_2

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 226
    .line 227
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-eqz v1, :cond_2

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 234
    .line 235
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 236
    .line 237
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_2

    .line 242
    .line 243
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 244
    .line 245
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 246
    .line 247
    if-ne p0, p1, :cond_2

    .line 248
    .line 249
    return v0

    .line 250
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "profile"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_18

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Long;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_9

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_9
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_a

    .line 147
    :cond_a
    move v1, v2

    .line 148
    :goto_a
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_b

    .line 160
    :cond_b
    move v1, v2

    .line 161
    :goto_b
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Work;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    goto :goto_c

    .line 173
    :cond_c
    move v1, v2

    .line 174
    :goto_c
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Studies;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_d

    .line 186
    :cond_d
    move v1, v2

    .line 187
    :goto_d
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_e

    .line 199
    :cond_e
    move v1, v2

    .line 200
    :goto_e
    add-int/2addr v0, v1

    .line 201
    mul-int/lit8 v0, v0, 0x29

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    goto :goto_f

    .line 212
    :cond_f
    move v1, v2

    .line 213
    :goto_f
    add-int/2addr v0, v1

    .line 214
    mul-int/lit8 v0, v0, 0x29

    .line 215
    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileTbh;->hashCode()I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    goto :goto_10

    .line 225
    :cond_10
    move v1, v2

    .line 226
    :goto_10
    add-int/2addr v0, v1

    .line 227
    mul-int/lit8 v0, v0, 0x29

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FollowshipCounters;->hashCode()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    goto :goto_11

    .line 238
    :cond_11
    move v1, v2

    .line 239
    :goto_11
    add-int/2addr v0, v1

    .line 240
    mul-int/lit8 v0, v0, 0x29

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 243
    .line 244
    if-eqz v1, :cond_12

    .line 245
    .line 246
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Moments;->hashCode()I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    goto :goto_12

    .line 251
    :cond_12
    move v1, v2

    .line 252
    :goto_12
    add-int/2addr v0, v1

    .line 253
    mul-int/lit8 v0, v0, 0x29

    .line 254
    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 256
    .line 257
    if-eqz v1, :cond_13

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserProfileMood;->hashCode()I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    goto :goto_13

    .line 264
    :cond_13
    move v1, v2

    .line 265
    :goto_13
    add-int/2addr v0, v1

    .line 266
    mul-int/lit8 v0, v0, 0x29

    .line 267
    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 269
    .line 270
    if-eqz v1, :cond_14

    .line 271
    .line 272
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Extensions;->hashCode()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    goto :goto_14

    .line 277
    :cond_14
    move v1, v2

    .line 278
    :goto_14
    add-int/2addr v0, v1

    .line 279
    mul-int/lit8 v0, v0, 0x29

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 282
    .line 283
    if-eqz v1, :cond_15

    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MoodMoment;->hashCode()I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    goto :goto_15

    .line 290
    :cond_15
    move v1, v2

    .line 291
    :goto_15
    add-int/2addr v0, v1

    .line 292
    mul-int/lit8 v0, v0, 0x29

    .line 293
    .line 294
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 295
    .line 296
    if-eqz v1, :cond_16

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BizAnswers;->hashCode()I

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    :cond_16
    add-int/2addr v0, v2

    .line 303
    mul-int/lit8 v0, v0, 0x29

    .line 304
    .line 305
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 306
    .line 307
    if-eqz v1, :cond_17

    .line 308
    .line 309
    const/16 v1, 0x4cf

    .line 310
    .line 311
    goto :goto_16

    .line 312
    :cond_17
    const/16 v1, 0x4d5

    .line 313
    .line 314
    :goto_16
    add-int/2addr v0, v1

    .line 315
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 316
    .line 317
    :cond_18
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/data/Profile;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Profile;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_18

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Profile;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "school"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "hangouts"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    const-string v0, "hometown"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "receivedLikes"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 62
    .line 63
    :cond_4
    const-string v0, "tags"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 74
    .line 75
    :cond_5
    const-string v0, "job"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 86
    .line 87
    :cond_6
    const-string v0, "mutualContacts"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->api_only_mutualContacts:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 98
    .line 99
    :cond_7
    const-string v0, "social"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 110
    .line 111
    :cond_8
    const-string v0, "answers"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 122
    .line 123
    :cond_9
    const-string v0, "zodiac"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 134
    .line 135
    :cond_a
    const-string v0, "occupation"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 146
    .line 147
    :cond_b
    const-string v0, "work"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 158
    .line 159
    :cond_c
    const-string v0, "studies"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 170
    .line 171
    :cond_d
    const-string v0, "scenarios"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 182
    .line 183
    :cond_e
    const-string v0, "receivedLikesRank"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 194
    .line 195
    :cond_f
    const-string v0, "tbh"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 206
    .line 207
    :cond_10
    const-string v0, "followships"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 218
    .line 219
    :cond_11
    const-string v0, "moments"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 230
    .line 231
    :cond_12
    const-string v0, "mood"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 240
    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 242
    .line 243
    :cond_13
    const-string v0, "extensions"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 254
    .line 255
    :cond_14
    const-string v0, "moodMoment"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 266
    .line 267
    :cond_15
    const-string v0, "bizAnswers"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 278
    .line 279
    :cond_16
    const-string v0, "onlyShowAboutMeInside"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Profile;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 288
    .line 289
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 290
    .line 291
    :cond_17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->parseFieldSet:Ljava/util/HashSet;

    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 294
    .line 295
    .line 296
    :cond_18
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 297
    check-cast p1, Lcom/p1/mobile/putong/data/Profile;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Profile;->mergeData(Lcom/p1/mobile/putong/data/Profile;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->new_()Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 47
    .line 48
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 49
    .line 50
    if-nez v0, :cond_6

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 58
    .line 59
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 60
    .line 61
    if-nez v0, :cond_7

    .line 62
    .line 63
    new-instance v0, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 69
    .line 70
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 71
    .line 72
    if-nez v0, :cond_8

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 83
    .line 84
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 85
    .line 86
    if-nez v0, :cond_9

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 89
    .line 90
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 91
    .line 92
    if-nez v0, :cond_a

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/data/Work;->new_()Lcom/p1/mobile/putong/data/Work;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 99
    .line 100
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 101
    .line 102
    if-nez v0, :cond_b

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/data/Studies;->new_()Lcom/p1/mobile/putong/data/Studies;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 109
    .line 110
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 111
    .line 112
    if-nez v0, :cond_c

    .line 113
    .line 114
    new-instance v0, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 120
    .line 121
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 122
    .line 123
    if-nez v0, :cond_d

    .line 124
    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 126
    .line 127
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 128
    .line 129
    if-nez v0, :cond_e

    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileTbh;->new_()Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 136
    .line 137
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 138
    .line 139
    if-nez v0, :cond_f

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/putong/data/FollowshipCounters;->new_()Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 146
    .line 147
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 148
    .line 149
    if-nez v0, :cond_10

    .line 150
    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/data/Moments;->new_()Lcom/p1/mobile/putong/data/Moments;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 156
    .line 157
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 158
    .line 159
    if-nez v0, :cond_11

    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/data/UserProfileMood;->new_()Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 166
    .line 167
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 168
    .line 169
    if-nez v0, :cond_12

    .line 170
    .line 171
    invoke-static {}, Lcom/p1/mobile/putong/data/Extensions;->new_()Lcom/p1/mobile/putong/data/Extensions;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 176
    .line 177
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 178
    .line 179
    if-nez v0, :cond_13

    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/data/MoodMoment;->new_()Lcom/p1/mobile/putong/data/MoodMoment;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 186
    .line 187
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 188
    .line 189
    if-nez v0, :cond_14

    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/data/BizAnswers;->new_()Lcom/p1/mobile/putong/data/BizAnswers;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 196
    .line 197
    :cond_14
    return-void
.end method

.method public placesTag()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

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
    new-instance p0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 16
    .line 17
    new-instance v0, Ll/dm90;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/dm90;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public putParsedField(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "v2"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->requestUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "v3"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->parseFieldSet:Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public shouldMergeData()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Profile;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "v2"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->requestUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "v3"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public subtract(Lcom/p1/mobile/putong/data/Profile;)Lcom/p1/mobile/putong/data/Profile;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_4

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_6

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_7

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 117
    .line 118
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 119
    .line 120
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 121
    .line 122
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_8

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 131
    .line 132
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 133
    .line 134
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 135
    .line 136
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_9

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 145
    .line 146
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 147
    .line 148
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_a

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 157
    .line 158
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 159
    .line 160
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_b

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 173
    .line 174
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 175
    .line 176
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 177
    .line 178
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_c

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 185
    .line 186
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 187
    .line 188
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 189
    .line 190
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 191
    .line 192
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_d

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 201
    .line 202
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 203
    .line 204
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 205
    .line 206
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_e

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 213
    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 215
    .line 216
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 217
    .line 218
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 219
    .line 220
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_f

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 227
    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 229
    .line 230
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 231
    .line 232
    if-eqz v1, :cond_10

    .line 233
    .line 234
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 235
    .line 236
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Extensions;->subtract(Lcom/p1/mobile/putong/data/Extensions;)Lcom/p1/mobile/putong/data/Extensions;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 241
    .line 242
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 243
    .line 244
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 245
    .line 246
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    if-nez v1, :cond_11

    .line 251
    .line 252
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 253
    .line 254
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 255
    .line 256
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 257
    .line 258
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 259
    .line 260
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-nez p1, :cond_12

    .line 265
    .line 266
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 267
    .line 268
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 269
    .line 270
    :cond_12
    new-instance p0, Lcom/p1/mobile/putong/data/Profile;

    .line 271
    .line 272
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/Profile;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    if-eqz p0, :cond_13

    .line 280
    .line 281
    const/4 p0, 0x0

    .line 282
    return-object p0

    .line 283
    :cond_13
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Profile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
