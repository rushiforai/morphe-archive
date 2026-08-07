.class public Ll/il8;
.super Ll/h9c;
.source "SourceFile"

# interfaces
.implements Ll/gq2;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h9c;",
        "Ll/gq2<",
        "Lcom/p1/mobile/putong/core/data/CoreData;",
        ">;"
    }
.end annotation


# static fields
.field public static t:Ljava/lang/String; = "invalid_moment_id"


# instance fields
.field public c:Ll/t600;

.field public d:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/uvv;

.field public g:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/x090;

.field public j:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/sry;

.field public l:Ll/gk6;

.field public m:Ll/mm6;

.field public n:Ll/xu4;

.field public o:Ll/wu4;

.field public p:Ll/u6b0;

.field public q:Ll/qsb;

.field public r:Ll/jzj;

.field public s:Ll/tv4;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h9c;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "moment_user_state"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 4
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

.method public static synthetic D(Lcom/p1/mobile/putong/data/UserStatus;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "RISK_TAG_CHAT_SENSITIVE_WORD_SAFETY_REMINDER"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

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

.method public static synthetic E(Ll/il8;ZZLcom/p1/mobile/putong/core/data/CoreData;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/il8;->H(ZZLcom/p1/mobile/putong/core/data/CoreData;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
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

.method public static synthetic l(Ll/qcj;Ll/qcj;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    invoke-interface {p1, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/uxk;->c()Ll/uxk;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/uxk;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 45
    .line 46
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 49
    .line 50
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 51
    .line 52
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    sget-object p2, Ll/uqb0;->k0:Ll/vj5;

    .line 56
    .line 57
    iget-object p2, p2, Ll/vj5;->d:Ll/ejk0;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 87
    .line 88
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 103
    .line 104
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 107
    .line 108
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 109
    .line 110
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-nez p2, :cond_3

    .line 117
    .line 118
    invoke-static {}, Ll/uxk;->c()Ll/uxk;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p0, p2}, Ll/uxk;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-eqz p2, :cond_4

    .line 140
    .line 141
    invoke-static {}, Ll/uxk;->c()Ll/uxk;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p2, p0}, Ll/uxk;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 156
    .line 157
    :cond_4
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string p2, "|"

    .line 170
    .line 171
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 175
    .line 176
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 184
    .line 185
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c;->F3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Counter;->mergeData(Lcom/p1/mobile/putong/data/Counter;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c;->F3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/ChatHeat;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic q()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentActivityPoll()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)I
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 4
    .line 5
    sub-double/2addr v0, p0

    .line 6
    double-to-int p0, v0

    .line 7
    return p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/pf60;
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic u(Ll/il8;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Ll/il8;->I(Lcom/p1/mobile/putong/core/data/Message;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static synthetic w()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->U0:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->D8(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->msgSource:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "system"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static synthetic z(Ll/il8;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/CoreData;ILjava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/il8;->J(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/CoreData;ILjava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method


# virtual methods
.method public final F(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->vp()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/gta;->c()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;->Ig()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 37
    .line 38
    if-ne p0, v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->newMatchExpShowInList()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/4 p0, 0x0

    .line 55
    return p0

    .line 56
    :cond_3
    :goto_0
    return v0
.end method

.method public final G(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_2

    .line 12
    .line 13
    const-string p0, "lovescript"

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isMediaBuzzConv()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->bellType:Ljava/lang/String;

    .line 52
    .line 53
    const-string p2, "male"

    .line 54
    .line 55
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_2

    .line 60
    .line 61
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isForceDropDownCell()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 p0, 0x0

    .line 69
    return p0

    .line 70
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 71
    return p0
.end method

.method public final synthetic H(ZZLcom/p1/mobile/putong/core/data/CoreData;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    if-eqz p6, :cond_0

    .line 17
    .line 18
    iget-object v0, p5, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p6, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p6, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    iget-object v2, p6, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    :cond_0
    iget-object v0, p0, Ll/il8;->o:Ll/wu4;

    .line 65
    .line 66
    iget-object v2, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ll/wu4;->F(Ljava/lang/String;)Ll/wzh0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-nez v2, :cond_1

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_1

    .line 91
    .line 92
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 97
    .line 98
    iget-object v3, p5, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v3, p5, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 103
    .line 104
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 105
    .line 106
    iget-object v3, p5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 113
    .line 114
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {}, Ll/uxk;->c()Ll/uxk;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    invoke-virtual {v3, v4}, Ll/uxk;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 145
    .line 146
    new-instance v3, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v4, "|"

    .line 159
    .line 160
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 173
    .line 174
    iget-object v3, p0, Ll/il8;->o:Ll/wu4;

    .line 175
    .line 176
    invoke-virtual {v3, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_1
    if-eqz p6, :cond_6

    .line 181
    .line 182
    if-nez p1, :cond_6

    .line 183
    .line 184
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 185
    .line 186
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 187
    .line 188
    if-nez p0, :cond_2

    .line 189
    .line 190
    iput-object p1, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_2
    if-eqz p1, :cond_6

    .line 194
    .line 195
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 196
    .line 197
    if-eqz p0, :cond_3

    .line 198
    .line 199
    const-string p1, "unknown_"

    .line 200
    .line 201
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-eqz p0, :cond_4

    .line 206
    .line 207
    :cond_3
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 208
    .line 209
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 210
    .line 211
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 212
    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 214
    .line 215
    :cond_4
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 216
    .line 217
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 218
    .line 219
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    if-eqz p0, :cond_5

    .line 224
    .line 225
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 226
    .line 227
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 228
    .line 229
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 230
    .line 231
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 232
    .line 233
    :cond_5
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 236
    .line 237
    if-nez p1, :cond_6

    .line 238
    .line 239
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 240
    .line 241
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 242
    .line 243
    if-eqz p1, :cond_6

    .line 244
    .line 245
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 246
    .line 247
    :cond_6
    :goto_1
    if-eqz p6, :cond_7

    .line 248
    .line 249
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 250
    .line 251
    if-nez p0, :cond_7

    .line 252
    .line 253
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 254
    .line 255
    if-eqz p0, :cond_7

    .line 256
    .line 257
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 258
    .line 259
    :cond_7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->c()Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-eqz p0, :cond_b

    .line 272
    .line 273
    if-eqz p6, :cond_b

    .line 274
    .line 275
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 276
    .line 277
    if-eqz p0, :cond_b

    .line 278
    .line 279
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 280
    .line 281
    const-string p1, "peeking"

    .line 282
    .line 283
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result p0

    .line 287
    const-string v0, "peeking_blocked"

    .line 288
    .line 289
    if-nez p0, :cond_8

    .line 290
    .line 291
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 292
    .line 293
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 294
    .line 295
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    if-eqz p0, :cond_b

    .line 300
    .line 301
    :cond_8
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 302
    .line 303
    if-nez p0, :cond_9

    .line 304
    .line 305
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 306
    .line 307
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 308
    .line 309
    goto :goto_2

    .line 310
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 311
    .line 312
    const-string v2, "quickchat"

    .line 313
    .line 314
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    if-eqz p0, :cond_a

    .line 319
    .line 320
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 321
    .line 322
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 323
    .line 324
    const-string v3, "default"

    .line 325
    .line 326
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 327
    .line 328
    .line 329
    move-result p0

    .line 330
    if-eqz p0, :cond_a

    .line 331
    .line 332
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 333
    .line 334
    invoke-static {p1}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 339
    .line 340
    goto :goto_2

    .line 341
    :cond_a
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 342
    .line 343
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 344
    .line 345
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    if-eqz p0, :cond_b

    .line 350
    .line 351
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 352
    .line 353
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 354
    .line 355
    const-string p1, "blocked"

    .line 356
    .line 357
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 358
    .line 359
    .line 360
    move-result p0

    .line 361
    if-eqz p0, :cond_b

    .line 362
    .line 363
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 364
    .line 365
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 370
    .line 371
    :cond_b
    :goto_2
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 372
    .line 373
    if-nez p0, :cond_c

    .line 374
    .line 375
    if-eqz p6, :cond_c

    .line 376
    .line 377
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 378
    .line 379
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 380
    .line 381
    :cond_c
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 382
    .line 383
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 384
    .line 385
    .line 386
    move-result p0

    .line 387
    if-eqz p0, :cond_d

    .line 388
    .line 389
    if-eqz p6, :cond_d

    .line 390
    .line 391
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 392
    .line 393
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 394
    .line 395
    .line 396
    move-result p0

    .line 397
    if-nez p0, :cond_d

    .line 398
    .line 399
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 400
    .line 401
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 402
    .line 403
    :cond_d
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 404
    .line 405
    if-nez p0, :cond_e

    .line 406
    .line 407
    if-eqz p6, :cond_e

    .line 408
    .line 409
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 410
    .line 411
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 412
    .line 413
    :cond_e
    if-nez p2, :cond_f

    .line 414
    .line 415
    if-eqz p6, :cond_f

    .line 416
    .line 417
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 418
    .line 419
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 420
    .line 421
    :cond_f
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 422
    .line 423
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 424
    .line 425
    .line 426
    move-result p0

    .line 427
    if-eqz p0, :cond_10

    .line 428
    .line 429
    if-eqz p6, :cond_10

    .line 430
    .line 431
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 432
    .line 433
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 434
    .line 435
    :cond_10
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 436
    .line 437
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 438
    .line 439
    if-nez p1, :cond_11

    .line 440
    .line 441
    if-eqz p6, :cond_11

    .line 442
    .line 443
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 444
    .line 445
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 446
    .line 447
    if-eqz p1, :cond_11

    .line 448
    .line 449
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 450
    .line 451
    :cond_11
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result p0

    .line 455
    if-eqz p0, :cond_12

    .line 456
    .line 457
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 458
    .line 459
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 460
    .line 461
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 462
    .line 463
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 464
    .line 465
    .line 466
    move-result p0

    .line 467
    if-eqz p0, :cond_12

    .line 468
    .line 469
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 470
    .line 471
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 472
    .line 473
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 474
    .line 475
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 476
    .line 477
    .line 478
    move-result p0

    .line 479
    if-nez p0, :cond_12

    .line 480
    .line 481
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 482
    .line 483
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 484
    .line 485
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 486
    .line 487
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 488
    .line 489
    :cond_12
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 490
    .line 491
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 492
    .line 493
    .line 494
    move-result p0

    .line 495
    if-nez p0, :cond_13

    .line 496
    .line 497
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 498
    .line 499
    .line 500
    move-result p0

    .line 501
    if-nez p0, :cond_13

    .line 502
    .line 503
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 504
    .line 505
    new-instance p1, Ll/rk8;

    .line 506
    .line 507
    invoke-direct {p1, p4}, Ll/rk8;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 508
    .line 509
    .line 510
    invoke-static {p0, p1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 511
    .line 512
    .line 513
    move-result p0

    .line 514
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 515
    .line 516
    .line 517
    move-result p1

    .line 518
    if-eqz p1, :cond_13

    .line 519
    .line 520
    if-ltz p0, :cond_13

    .line 521
    .line 522
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 523
    .line 524
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    move-result-object p0

    .line 528
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 529
    .line 530
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 531
    .line 532
    double-to-long p0, p0

    .line 533
    iget-wide p2, p6, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 534
    .line 535
    cmp-long p2, p2, p0

    .line 536
    .line 537
    if-gez p2, :cond_13

    .line 538
    .line 539
    iput-wide p0, p6, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 540
    .line 541
    :cond_13
    if-eqz p6, :cond_14

    .line 542
    .line 543
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 544
    .line 545
    if-eqz p0, :cond_14

    .line 546
    .line 547
    iget-object p1, p5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 548
    .line 549
    if-nez p1, :cond_14

    .line 550
    .line 551
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 552
    .line 553
    :cond_14
    if-eqz p6, :cond_15

    .line 554
    .line 555
    iget-wide p0, p6, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 556
    .line 557
    const-wide/16 p2, 0x0

    .line 558
    .line 559
    cmpl-double p4, p0, p2

    .line 560
    .line 561
    if-lez p4, :cond_15

    .line 562
    .line 563
    iget-wide v2, p5, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 564
    .line 565
    cmpg-double p2, v2, p2

    .line 566
    .line 567
    if-gtz p2, :cond_15

    .line 568
    .line 569
    iput-wide p0, p5, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 570
    .line 571
    :cond_15
    if-eqz p6, :cond_1a

    .line 572
    .line 573
    iget-boolean p0, p5, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 574
    .line 575
    const/4 p1, 0x1

    .line 576
    if-nez p0, :cond_17

    .line 577
    .line 578
    iget-boolean p0, p6, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 579
    .line 580
    if-eqz p0, :cond_16

    .line 581
    .line 582
    goto :goto_3

    .line 583
    :cond_16
    move p0, v1

    .line 584
    goto :goto_4

    .line 585
    :cond_17
    :goto_3
    move p0, p1

    .line 586
    :goto_4
    iput-boolean p0, p5, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 587
    .line 588
    iget-boolean p0, p5, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 589
    .line 590
    if-nez p0, :cond_18

    .line 591
    .line 592
    iget-boolean p0, p6, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 593
    .line 594
    if-eqz p0, :cond_19

    .line 595
    .line 596
    :cond_18
    move v1, p1

    .line 597
    :cond_19
    iput-boolean v1, p5, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 598
    .line 599
    :cond_1a
    if-eqz p6, :cond_1b

    .line 600
    .line 601
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 602
    .line 603
    if-eqz p0, :cond_1b

    .line 604
    .line 605
    iget-object p1, p5, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 606
    .line 607
    if-nez p1, :cond_1b

    .line 608
    .line 609
    iput-object p0, p5, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 610
    .line 611
    :cond_1b
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 612
    .line 613
    if-eqz p0, :cond_1c

    .line 614
    .line 615
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 616
    .line 617
    if-nez p1, :cond_1c

    .line 618
    .line 619
    if-eqz p6, :cond_1c

    .line 620
    .line 621
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 622
    .line 623
    if-eqz p1, :cond_1c

    .line 624
    .line 625
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 626
    .line 627
    if-eqz p1, :cond_1c

    .line 628
    .line 629
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 630
    .line 631
    :cond_1c
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 632
    .line 633
    .line 634
    move-result-object p0

    .line 635
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 636
    .line 637
    .line 638
    move-result-object p0

    .line 639
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->w()Z

    .line 640
    .line 641
    .line 642
    move-result p0

    .line 643
    if-eqz p0, :cond_1d

    .line 644
    .line 645
    if-eqz p6, :cond_1d

    .line 646
    .line 647
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 648
    .line 649
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 650
    .line 651
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 652
    .line 653
    .line 654
    move-result p0

    .line 655
    if-eqz p0, :cond_1d

    .line 656
    .line 657
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 658
    .line 659
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 660
    .line 661
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 662
    .line 663
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 664
    .line 665
    .line 666
    move-result p0

    .line 667
    if-eqz p0, :cond_1d

    .line 668
    .line 669
    iget-object p0, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 670
    .line 671
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 672
    .line 673
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 674
    .line 675
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 676
    .line 677
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 678
    .line 679
    .line 680
    move-result p0

    .line 681
    if-nez p0, :cond_1d

    .line 682
    .line 683
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 684
    .line 685
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 686
    .line 687
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    move-result p0

    .line 691
    if-eqz p0, :cond_1d

    .line 692
    .line 693
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 694
    .line 695
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 696
    .line 697
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 698
    .line 699
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 700
    .line 701
    .line 702
    move-result p0

    .line 703
    if-eqz p0, :cond_1d

    .line 704
    .line 705
    iget-object p0, p5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 706
    .line 707
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 708
    .line 709
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 710
    .line 711
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 712
    .line 713
    if-nez p1, :cond_1d

    .line 714
    .line 715
    iget-object p1, p6, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 716
    .line 717
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 718
    .line 719
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 720
    .line 721
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 722
    .line 723
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 724
    .line 725
    :cond_1d
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/data/Message;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    .line 1
    const-string v0, "\n"

    const-string v9, "cid:"

    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    move-result-object v10

    iput-object v10, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v11, "harass_alert"

    invoke-static {v10, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v10

    const-string v12, "removed"

    if-eqz v10, :cond_1

    .line 3
    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 4
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->tips:Ljava/lang/String;

    .line 5
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 6
    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->tips:Ljava/lang/String;

    iput-object v10, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 7
    :cond_0
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v10

    iput-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 8
    :cond_1
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v10

    const/4 v13, 0x1

    if-eqz v10, :cond_4

    .line 9
    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v10

    if-lez v10, :cond_5

    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v3, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 10
    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v3, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-nez v10, :cond_3

    .line 11
    :try_start_0
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    const-string v14, "Message insert error with null conv "

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 13
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "msg detail:\n"

    .line 14
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->toJson()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 17
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    const-string v0, "conv id list"

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 21
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ","

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    .line 22
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 23
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    :cond_3
    :goto_2
    iget-object v0, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/pf60;

    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_5

    .line 26
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_5

    iget-wide v9, v7, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 27
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    iget-wide v14, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v0, v9, v14

    if-gtz v0, :cond_5

    .line 28
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_3

    .line 29
    :cond_4
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 30
    iput-boolean v13, v0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    :cond_5
    :goto_3
    const/4 v0, 0x0

    if-eqz v8, :cond_13

    .line 31
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 32
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 33
    :cond_6
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 34
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 35
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 36
    :cond_7
    iget v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    iput v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 37
    iget-wide v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    iget-wide v9, v8, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    cmp-long v3, v3, v9

    if-lez v3, :cond_8

    .line 38
    iput-wide v9, v7, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 39
    :cond_8
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    if-eqz v3, :cond_9

    sget-object v4, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 40
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    :cond_9
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v3, :cond_a

    .line 41
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_b

    :cond_a
    iget-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    if-nez v3, :cond_c

    iget-boolean v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    if-eqz v3, :cond_b

    goto :goto_4

    :cond_b
    move v3, v0

    goto :goto_5

    :cond_c
    :goto_4
    move v3, v13

    :goto_5
    iput-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 42
    iget-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    if-nez v3, :cond_e

    iget-boolean v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    if-eqz v3, :cond_d

    goto :goto_6

    :cond_d
    move v3, v0

    goto :goto_7

    :cond_e
    :goto_6
    move v3, v13

    :goto_7
    iput-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 43
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v3

    if-eqz v3, :cond_11

    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v3

    if-eqz v3, :cond_11

    .line 44
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v3

    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v4

    iget-boolean v4, v4, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    if-nez v4, :cond_10

    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v4

    iget-boolean v4, v4, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    if-eqz v4, :cond_f

    goto :goto_8

    :cond_f
    move v4, v0

    goto :goto_9

    :cond_10
    :goto_8
    move v4, v13

    :goto_9
    iput-boolean v4, v3, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 45
    :cond_11
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 46
    iget-boolean v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    iput-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 47
    iget-boolean v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    iput-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 48
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 49
    iget-boolean v3, v8, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    iput-boolean v3, v7, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 50
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_12

    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 51
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 52
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 53
    :cond_12
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "common_tip"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_27

    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 54
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_27

    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 55
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_27

    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    const-string v4, "pat"

    .line 56
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_27

    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra2:Ljava/lang/String;

    .line 57
    const-string v4, "pat_grey"

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 58
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra2:Ljava/lang/String;

    goto/16 :goto_e

    .line 59
    :cond_13
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v4

    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->i()Z

    move-result v4

    if-nez v4, :cond_14

    .line 60
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v4

    .line 61
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v4

    .line 62
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ym()Z

    move-result v4

    if-eqz v4, :cond_15

    .line 63
    :cond_14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    move-result v4

    if-nez v4, :cond_15

    .line 64
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v9, "tacit_test"

    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_15

    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v9, "user_info_card"

    .line 65
    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_15

    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v9, "stripes"

    .line 66
    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_15

    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v9, "normal_card"

    .line 67
    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_15

    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 68
    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 69
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    :cond_15
    sget-object v4, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    move-result-wide v4

    long-to-double v4, v4

    iget-wide v9, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    sub-double/2addr v4, v9

    const-wide v9, 0x4194997000000000L    # 8.64E7

    cmpg-double v4, v4, v9

    if-gez v4, :cond_17

    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v4

    if-eqz v4, :cond_16

    .line 72
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->l0:Ll/g1y;

    .line 73
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Audio;->format32()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 74
    invoke-virtual {v4, v5}, Ll/g1y;->d(Ljava/lang/String;)V

    goto :goto_a

    .line 75
    :cond_16
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->picture()Lcom/p1/mobile/putong/data/Picture;

    .line 76
    :cond_17
    :goto_a
    iget v4, v6, Lcom/p1/mobile/putong/data/Envelope;->localOptions:I

    sget v5, Lcom/p1/mobile/putong/core/api/a;->L:I

    and-int/2addr v4, v5

    if-eqz v4, :cond_26

    .line 77
    iget-object v4, v1, Ll/il8;->m:Ll/mm6;

    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v4

    check-cast v4, Lcom/p1/mobile/putong/core/data/Conversation;

    if-nez v4, :cond_18

    .line 78
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/api/e;->j9(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v4

    :cond_18
    if-nez v4, :cond_19

    goto/16 :goto_13

    .line 79
    :cond_19
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    new-instance v9, Ll/xk8;

    invoke-direct {v9, v4}, Ll/xk8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 80
    invoke-static {v3, v5, v9}, Ll/jyb;->B(Ljava/util/HashMap;Ljava/lang/Object;Ll/pcj;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ll/pf60;

    .line 81
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-static {v5}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_24

    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v9

    invoke-interface {v9}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_24

    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->shouldCheckFoulWords()Z

    move-result v5

    if-eqz v5, :cond_24

    .line 84
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    const-wide/16 v14, 0x0

    cmpl-double v9, v9, v14

    if-ltz v9, :cond_1a

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    move-wide/from16 p3, v14

    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v5, v9, v14

    if-gez v5, :cond_1b

    sget-object v5, Ll/uqb0;->Z:Ll/a4j;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 85
    invoke-virtual {v5, v9}, Ll/a4j;->O(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    sget-object v5, Ll/uqb0;->k0:Ll/vj5;

    iget-object v5, v5, Ll/vj5;->d:Ll/ejk0;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 86
    invoke-virtual {v5, v9}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 87
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 88
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iput-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    :goto_b
    move v5, v13

    goto/16 :goto_d

    :cond_1a
    move-wide/from16 p3, v14

    .line 89
    :cond_1b
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    .line 90
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    .line 91
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->j()Z

    move-result v5

    if-eqz v5, :cond_1c

    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    cmpl-double v9, v9, p3

    if-ltz v9, :cond_1c

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v5, v9, v14

    if-gez v5, :cond_1c

    sget-object v5, Ll/uqb0;->Z:Ll/a4j;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 92
    invoke-virtual {v5, v9}, Ll/a4j;->P(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c

    sget-object v5, Ll/uqb0;->k0:Ll/vj5;

    iget-object v5, v5, Ll/vj5;->d:Ll/ejk0;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 93
    invoke-virtual {v5, v9}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 94
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1c

    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    new-instance v9, Ll/zk8;

    invoke-direct {v9}, Ll/zk8;-><init>()V

    .line 95
    invoke-static {v5, v9}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object v5

    .line 96
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 97
    iput-boolean v13, v2, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 98
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iput-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    goto :goto_b

    .line 99
    :cond_1c
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    cmpl-double v9, v9, p3

    if-ltz v9, :cond_1d

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v5, v9, v14

    if-gez v5, :cond_1d

    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 100
    invoke-virtual {v5}, Ll/yy6;->t()Ljava/util/List;

    move-result-object v5

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 101
    invoke-static {v5, v9}, Ll/yy6;->J(Ljava/util/List;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 102
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iput-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    goto/16 :goto_b

    .line 103
    :cond_1d
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    cmpl-double v9, v9, p3

    if-ltz v9, :cond_1e

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v5, v9, v14

    if-gez v5, :cond_1e

    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 104
    invoke-virtual {v5, v9}, Ll/yy6;->K(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 105
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iput-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    goto/16 :goto_b

    .line 106
    :cond_1e
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    cmpl-double v9, v9, p3

    if-ltz v9, :cond_22

    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v5, v9, v14

    if-gez v5, :cond_22

    sget-object v5, Ll/uqb0;->Z:Ll/a4j;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 107
    invoke-virtual {v5, v9}, Ll/a4j;->K(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1f

    sget-object v5, Ll/uqb0;->Z:Ll/a4j;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 108
    invoke-virtual {v5, v9}, Ll/a4j;->M(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 109
    :cond_1f
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    invoke-virtual {v5, v9}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    .line 110
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_22

    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v10, "moment_comment"

    .line 111
    invoke-static {v9, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_20

    .line 112
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result v5

    if-nez v5, :cond_22

    .line 113
    :cond_20
    iget-object v5, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    cmpl-double v9, v9, p3

    if-lez v9, :cond_21

    goto :goto_c

    .line 114
    :cond_21
    move-object v9, v5

    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    iput-wide v14, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 115
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    iput v0, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    goto/16 :goto_b

    :cond_22
    :goto_c
    move v5, v0

    .line 116
    :goto_d
    iget-object v9, v7, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    invoke-static {v9, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_23

    .line 117
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v9

    if-nez v9, :cond_23

    .line 118
    iget-object v9, v4, Ll/pf60;->a:Ljava/lang/Object;

    move-object v10, v9

    check-cast v10, Lcom/p1/mobile/putong/core/data/Conversation;

    iget-wide v10, v10, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    iget-wide v14, v7, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    cmpg-double v10, v10, v14

    if-gez v10, :cond_23

    .line 119
    check-cast v9, Lcom/p1/mobile/putong/core/data/Conversation;

    move-wide/from16 v10, p3

    iput-wide v10, v9, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    move v5, v13

    :cond_23
    if-eqz v5, :cond_24

    .line 120
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    iget-object v4, v4, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v4, Lcom/p1/mobile/putong/core/data/Conversation;

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v4, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    :cond_24
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    invoke-static {v3}, Ll/yy6;->u(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 122
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_25

    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 123
    :cond_25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    move-result-object v3

    if-eqz v3, :cond_26

    .line 124
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    invoke-static {v4, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 125
    iput-boolean v13, v3, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 126
    :cond_26
    invoke-virtual {v1, v7}, Ll/il8;->K(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 127
    :cond_27
    :goto_e
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 128
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 129
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_f

    .line 130
    :cond_28
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    if-eqz v3, :cond_29

    .line 131
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_f

    .line 132
    :cond_29
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    if-eqz v3, :cond_2a

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 133
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_f

    .line 134
    :cond_2a
    const-string v3, "unknown_"

    if-eqz v8, :cond_2b

    iget-object v4, v8, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 135
    invoke-static {v4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2b

    iget-object v4, v8, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    const-string v5, "undefined"

    .line 136
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 137
    iget-object v3, v8, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_f

    .line 138
    :cond_2b
    iget v4, v6, Lcom/p1/mobile/putong/data/Envelope;->localOptions:I

    sget v5, Lcom/p1/mobile/putong/core/api/a;->L:I

    and-int/2addr v4, v5

    if-eqz v4, :cond_2d

    .line 139
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    move-result v4

    if-eqz v4, :cond_2c

    iget-object v4, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 140
    invoke-static {v4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 141
    const-string v3, "pending"

    .line 142
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_f

    .line 143
    :cond_2c
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v3

    iput-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 144
    :cond_2d
    :goto_f
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v3

    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v3

    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 145
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 146
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v4, "tickle"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    const-string v4, "muting"

    if-nez v3, :cond_32

    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    const-string v5, "conversation_notification"

    .line 147
    invoke-static {v3, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2e

    goto :goto_11

    .line 148
    :cond_2e
    iget-object v1, v1, Ll/il8;->m:Ll/mm6;

    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 149
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_30

    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v3

    if-nez v3, :cond_30

    .line 150
    iget-object v3, v7, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 151
    const-string v6, "0"

    invoke-static {v6, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_31

    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v6

    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2f

    goto :goto_10

    :cond_30
    move v13, v0

    .line 153
    :cond_31
    :goto_10
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    iget-boolean v0, v1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    if-eqz v0, :cond_33

    if-nez v13, :cond_33

    .line 154
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_12

    .line 155
    :cond_32
    :goto_11
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 156
    :cond_33
    :goto_12
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 157
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v7, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    :cond_34
    :goto_13
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/CoreData;ILjava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 15

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    .line 1
    new-instance v5, Ll/sk8;

    invoke-direct {v5, v1}, Ll/sk8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 2
    new-instance v6, Ll/tk8;

    invoke-direct {v6, v1}, Ll/tk8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    move-object/from16 v7, p2

    .line 3
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    new-instance v8, Ll/uk8;

    invoke-direct {v8, v5, v6}, Ll/uk8;-><init>(Ll/qcj;Ll/qcj;)V

    .line 4
    invoke-static {v7, v8}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    const/4 v6, 0x0

    const/4 v7, 0x1

    move/from16 v8, p3

    if-ne v8, v7, :cond_0

    .line 5
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 6
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 7
    iput-boolean v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 8
    :cond_0
    const-string v5, "free_see_match"

    const-string v8, "0"

    const-string v9, "default"

    const-string v12, "removed"

    if-eqz v4, :cond_17

    .line 9
    iget-object v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    invoke-static {v13, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2

    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    invoke-static {v13}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 11
    invoke-static {v13}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 12
    iget-object v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    if-nez v13, :cond_1

    .line 13
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iput-object v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    goto :goto_0

    .line 14
    :cond_1
    iget-object v14, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    if-nez v14, :cond_2

    .line 15
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    iput-object v14, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 16
    :cond_2
    :goto_0
    iget-boolean v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    if-nez v13, :cond_4

    iget-boolean v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    if-eqz v13, :cond_3

    goto :goto_1

    :cond_3
    move v13, v6

    goto :goto_2

    :cond_4
    :goto_1
    move v13, v7

    :goto_2
    iput-boolean v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    if-nez v13, :cond_7

    .line 17
    iget-boolean v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    if-nez v13, :cond_7

    iget-object v13, v1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 18
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_5

    iget-object v13, v1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 19
    invoke-static {v13, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_7

    :cond_5
    iget-object v8, v1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 20
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_3

    :cond_6
    move v5, v6

    goto :goto_4

    :cond_7
    :goto_3
    move v5, v7

    :goto_4
    iput-boolean v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 21
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->mj()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 22
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v8, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    if-nez v8, :cond_8

    iget-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v8, v8, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    if-eqz v8, :cond_8

    .line 23
    iput-object v8, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 24
    :cond_8
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    const-string v8, "liked"

    .line 25
    invoke-static {v5, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    iget-wide v13, v5, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->swipedTime:D

    const-wide/16 p2, 0x0

    iget-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    cmpl-double v5, v13, v10

    if-lez v5, :cond_a

    .line 26
    iput-wide v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    goto :goto_5

    :cond_9
    const-wide/16 p2, 0x0

    .line 27
    :cond_a
    :goto_5
    iget-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    iget-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    cmpg-double v5, v10, v13

    if-gez v5, :cond_b

    .line 28
    iput-wide v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 29
    :cond_b
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_c

    .line 30
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 31
    :cond_c
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 32
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 33
    iget v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    iput v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 34
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 35
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 36
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 37
    iget v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    iput v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 38
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    invoke-static {v5}, Ll/jyb;->L(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 39
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 40
    :cond_d
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 41
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 42
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 43
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    iput-boolean v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 44
    iget v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    if-nez v5, :cond_e

    .line 45
    iget v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    iput v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 46
    :cond_e
    iget-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    cmpl-double v5, v10, p2

    if-nez v5, :cond_f

    .line 47
    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 48
    :cond_f
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_10

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 49
    iput-object v9, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    goto :goto_6

    .line 50
    :cond_10
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_11

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 51
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 52
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 53
    :cond_11
    :goto_6
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    if-eqz v5, :cond_12

    iget v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    if-nez v5, :cond_12

    .line 54
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    goto :goto_7

    .line 55
    :cond_12
    iput-boolean v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 56
    :goto_7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    .line 57
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    .line 58
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ys()Z

    move-result v5

    if-eqz v5, :cond_13

    iget-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    cmpl-double v5, v10, p2

    if-eqz v5, :cond_13

    iget-wide v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    cmpl-double v5, v13, p2

    if-nez v5, :cond_13

    .line 59
    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 60
    :cond_13
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    iput-boolean v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 61
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    const-string v8, "heartbeatMatch"

    invoke-static {v5, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_14

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 62
    invoke-static {v5, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 63
    iget-object v5, p0, Ll/il8;->c:Ll/t600;

    sget-object v8, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    iget-object v10, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    invoke-virtual {v8, v10}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v8

    sget-object v10, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    const-string v11, "heartbeat_notify"

    .line 65
    invoke-virtual {v10, v11}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v11

    const-string v13, "heartbeat_waiting_response"

    .line 66
    invoke-virtual {v10, v13}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v10

    filled-new-array {v11, v10}, [Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v10

    .line 67
    invoke-static {v10}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v10

    filled-new-array {v8, v10}, [Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v8

    .line 68
    invoke-static {v8}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v8

    .line 69
    invoke-virtual {v5, v8}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 70
    :cond_14
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_15

    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 71
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_15

    .line 72
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 73
    :cond_15
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Conversation;->isExposureTop()Z

    move-result v5

    if-eqz v5, :cond_16

    const/16 v5, 0x32

    .line 74
    iput v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 75
    :cond_16
    iput-boolean v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 76
    iget v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    iput v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    goto/16 :goto_b

    :cond_17
    const-wide/16 p2, 0x0

    .line 77
    iget-boolean v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    if-nez v10, :cond_18

    iget-object v10, v1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 78
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_19

    iget-object v10, v1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 79
    invoke-static {v10, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_19

    :cond_18
    move v6, v7

    :cond_19
    iput-boolean v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 80
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v6

    .line 81
    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v6

    .line 82
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ys()Z

    move-result v6

    if-eqz v6, :cond_1a

    iget-boolean v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    if-nez v6, :cond_1a

    .line 83
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v10

    iget-wide v13, v3, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    double-to-long v13, v13

    sub-long/2addr v10, v13

    const-wide/32 v13, 0xea60

    cmp-long v6, v10, v13

    if-gez v6, :cond_1a

    const-wide/high16 v10, 0x4059000000000000L    # 100.0

    .line 84
    iput-wide v10, v3, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 85
    :cond_1a
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v6

    .line 86
    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v6

    .line 87
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->x()Z

    move-result v6

    if-eqz v6, :cond_1b

    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    const-string v8, "dismissed"

    .line 88
    invoke-static {v6, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 89
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v6

    iput-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_a

    .line 90
    :cond_1b
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_20

    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1c

    goto :goto_9

    .line 91
    :cond_1c
    iget-boolean v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    if-eqz v6, :cond_1d

    .line 92
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v6

    iput-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_a

    .line 93
    :cond_1d
    iget-object v6, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v8, "-1"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1f

    iget-object v6, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v8, "-10040"

    .line 94
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1f

    iget-object v6, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v8, "-11001"

    .line 95
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1e

    goto :goto_8

    .line 96
    :cond_1e
    const-string v6, "pending"

    .line 97
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v6

    iput-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_a

    .line 98
    :cond_1f
    :goto_8
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v6

    iput-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    goto :goto_a

    .line 99
    :cond_20
    :goto_9
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v6

    iput-object v6, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 100
    :goto_a
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 101
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 102
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 103
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;->actorId:Ljava/lang/String;

    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v6

    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v6

    .line 105
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 106
    iput v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 107
    :cond_21
    :goto_b
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    invoke-static {v5, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_22

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 108
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 109
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    const-string v6, "gift"

    .line 110
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 111
    new-instance v5, Ll/vk8;

    invoke-direct {v5, v1}, Ll/vk8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    invoke-static {v5}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 112
    :cond_22
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B()Z

    move-result v5

    if-eqz v5, :cond_23

    .line 113
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    .line 114
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    .line 115
    invoke-interface {v5, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Aj(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 116
    new-instance v5, Ll/wk8;

    invoke-direct {v5, v1}, Ll/wk8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    invoke-static {v5}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 117
    :cond_23
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v5

    if-eqz v5, :cond_24

    .line 118
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    .line 119
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    .line 120
    invoke-interface {v5, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Nd(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 121
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 122
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v5

    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 123
    :cond_24
    invoke-virtual {p0, v3, v1}, Ll/il8;->G(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    move-result v5

    if-eqz v5, :cond_26

    .line 124
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 125
    invoke-virtual {p0, v3}, Ll/il8;->F(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 126
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 127
    :cond_25
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 128
    :cond_26
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v0

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->tl()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 129
    iget-boolean v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    if-nez v0, :cond_27

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 130
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 131
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    iget v0, v0, Lcom/p1/mobile/putong/core/data/ConversationGame;->gameUnread:I

    if-lez v0, :cond_27

    .line 132
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 133
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 134
    :cond_27
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v0

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 135
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 136
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 137
    :cond_28
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 138
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 139
    :cond_29
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v0

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Yh()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 140
    iget-boolean v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    const-wide/32 v5, 0x5265c00

    if-nez v0, :cond_2a

    .line 141
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v8

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 142
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-wide v10, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    double-to-long v10, v10

    sub-long/2addr v8, v10

    cmp-long v0, v8, v5

    if-gez v0, :cond_2a

    .line 143
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 144
    invoke-virtual {v2, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_d

    .line 145
    :cond_2a
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v8

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 146
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-wide v10, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    double-to-long v10, v10

    sub-long/2addr v8, v10

    cmp-long v0, v8, v5

    if-lez v0, :cond_2c

    .line 147
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    move-object/from16 v8, p5

    invoke-virtual {v8, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 148
    iget-object v8, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v8

    if-nez v8, :cond_2c

    .line 149
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2b
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 150
    iget-object v9, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object v10, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2b

    iget-wide v9, v8, Lcom/p1/mobile/putong/data/User;->createdTime:D

    cmpl-double v9, v9, p2

    if-lez v9, :cond_2b

    .line 151
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v9

    iget-wide v13, v8, Lcom/p1/mobile/putong/data/User;->createdTime:D

    double-to-long v13, v13

    sub-long/2addr v9, v13

    cmp-long v8, v9, v5

    if-gez v8, :cond_2b

    .line 152
    iput-boolean v7, v3, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 153
    invoke-virtual {v2, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_c

    .line 154
    :cond_2c
    :goto_d
    iget v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    if-ne v0, v7, :cond_2d

    const/16 v0, 0x64

    .line 155
    iput v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 156
    :cond_2d
    iget v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    const/16 v2, 0x37

    if-ge v0, v2, :cond_2e

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 157
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 158
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    iget-boolean v5, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->top:Z

    if-eqz v5, :cond_2e

    iget-wide v5, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->expireTime:J

    const-wide/16 v8, 0x3e8

    mul-long/2addr v5, v8

    .line 159
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v8

    cmp-long v0, v5, v8

    if-lez v0, :cond_2e

    .line 160
    iput v2, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 161
    :cond_2e
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 162
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->userId:Ljava/lang/String;

    iget-object v2, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 163
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->pin:Z

    if-eqz v2, :cond_2f

    iget-wide v5, v0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 164
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v8

    long-to-double v8, v8

    cmpl-double v0, v5, v8

    if-lez v0, :cond_2f

    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Ll/j49;->f()Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;

    move-result-object v0

    iget-object v2, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 167
    invoke-interface {v0, v2, v5}, Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;->zb(Ljava/lang/String;I)V

    const/16 v0, 0x5a

    .line 168
    iput v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 169
    :cond_2f
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 170
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-wide v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    cmpl-double v0, v5, p2

    if-eqz v0, :cond_30

    iget-wide v8, v3, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    cmpl-double v0, v8, p2

    if-nez v0, :cond_30

    .line 171
    iput-wide v5, v3, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 172
    :cond_30
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 173
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 174
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 175
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 176
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 177
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 178
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    if-ne v0, v7, :cond_31

    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    if-nez v0, :cond_31

    .line 179
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 180
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    invoke-virtual {v0}, Ll/f49;->Z3()V

    .line 181
    :cond_31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeOneSideConv()Z

    move-result v0

    if-eqz v0, :cond_32

    iget v0, v1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    if-gtz v0, :cond_32

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 182
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    move-result v0

    if-nez v0, :cond_32

    .line 183
    invoke-static {v12}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    move-result-object v0

    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    :cond_32
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 2
    .line 3
    double-to-long v0, v0

    .line 4
    invoke-static {v0, v1}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->jd(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/CoreData;ZZZ)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    if-eqz p1, :cond_2f

    .line 1
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v8, 0x0

    invoke-direct {v5, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 2
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    .line 4
    iget-object v4, v1, Ll/il8;->i:Ll/x090;

    invoke-virtual {v4, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 6
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 7
    iget-object v4, v1, Ll/il8;->j:Ll/wzh0;

    invoke-virtual {v4, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_1

    .line 8
    :cond_1
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 9
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 10
    iget-object v4, v1, Ll/il8;->g:Ll/wzh0;

    invoke-virtual {v4, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_2

    .line 11
    :cond_2
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 12
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Question;

    .line 13
    iget-object v4, v1, Ll/il8;->e:Ll/wzh0;

    invoke-virtual {v4, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_3

    .line 14
    :cond_3
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 15
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 16
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 17
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v6, v2, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    invoke-virtual {v4, v6, v2}, Ll/dkb;->M9(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Literatures;)V

    goto :goto_4

    .line 18
    :cond_5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 19
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    new-instance v2, Ll/nk8;

    invoke-direct {v2}, Ll/nk8;-><init>()V

    new-instance v4, Ll/cl8;

    invoke-direct {v4}, Ll/cl8;-><init>()V

    invoke-static {v0, v2, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    move-result-object v7

    .line 20
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    const-string v9, "deleted"

    if-nez v0, :cond_a

    .line 21
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 22
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->n7()Z

    move-result v4

    if-nez v4, :cond_6

    .line 24
    const-string v4, "-10021"

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v4

    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Es()Z

    move-result v4

    if-nez v4, :cond_7

    .line 26
    const-string v4, "-10025"

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 27
    :cond_7
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/p1/mobile/putong/core/data/Conversation;

    if-nez v4, :cond_8

    goto :goto_5

    .line 29
    :cond_8
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 30
    iget-object v6, v1, Ll/il8;->m:Ll/mm6;

    iget-object v10, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 31
    iget-object v6, v1, Ll/il8;->c:Ll/t600;

    iget-object v10, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ll/t600;->J(Ljava/lang/String;)V

    .line 32
    iget-object v6, v1, Ll/il8;->d:Ll/wzh0;

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_5

    .line 34
    :cond_9
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_5

    .line 36
    :cond_a
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 37
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gf()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 40
    iget-object v0, v1, Ll/il8;->m:Ll/mm6;

    const-string v2, "fake_conversation_local_instant_chat_conversation"

    .line 41
    invoke-virtual {v0, v2}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 43
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    new-instance v4, Ll/dl8;

    invoke-direct {v4, v0}, Ll/dl8;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 44
    invoke-static {v2, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 46
    iget-object v0, v1, Ll/il8;->m:Ll/mm6;

    sget-object v2, Lcom/p1/mobile/putong/core/data/Conversation;->CONVTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    const-string v4, "local_instant_chat_guide"

    .line 47
    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 49
    :cond_b
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move v0, v8

    :goto_6
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    if-nez v2, :cond_c

    goto :goto_6

    .line 50
    :cond_c
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    iget v4, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    if-lez v4, :cond_d

    .line 51
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x1

    :cond_d
    move v13, v0

    .line 52
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 53
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "\u3010.id\u5224\u7a7a\u3011conv id = null, mergeLocal = "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->toJson()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "   conv._id = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v2, Lcom/tantanapp/common/data/DbObject;->_id:J

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    :cond_e
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 58
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 59
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    move v4, v0

    goto :goto_7

    :cond_f
    move v4, v8

    :goto_7
    const/4 v0, 0x0

    .line 60
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 61
    invoke-static {}, Ll/wi5;->d()Ll/wi5;

    move-result-object v0

    invoke-virtual {v0}, Ll/wi5;->f()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 63
    iget-object v0, v1, Ll/il8;->m:Ll/mm6;

    iget-object v6, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    if-eqz v0, :cond_10

    .line 64
    const-string v6, "fakeReceiveLikeGuideSVip"

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 65
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    :goto_8
    move-object/from16 v6, p1

    move-object v15, v5

    goto :goto_9

    .line 66
    :cond_10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    invoke-virtual {v0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 67
    iget-object v0, v1, Ll/il8;->m:Ll/mm6;

    iget-object v6, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    if-eqz v0, :cond_11

    .line 68
    const-string v6, "fakeIntlReceiveLikeGuideSVip"

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 69
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_8

    .line 70
    :cond_11
    iget-object v14, v1, Ll/il8;->m:Ll/mm6;

    new-instance v0, Ll/el8;

    move-object/from16 v6, p1

    invoke-direct/range {v0 .. v6}, Ll/el8;-><init>(Ll/il8;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/CoreData;ILjava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/putong/data/Envelope;)V

    move-object v15, v5

    .line 71
    invoke-virtual {v14, v2, v0}, Ll/mm6;->p1(Lcom/p1/mobile/putong/core/data/Conversation;Ll/z20;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v0

    .line 72
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v0

    invoke-virtual {v10, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_9
    move-object/from16 v1, p0

    move v0, v13

    move-object v5, v15

    goto/16 :goto_6

    :cond_12
    :goto_a
    move-object/from16 v6, p1

    move-object v15, v5

    goto :goto_b

    :cond_13
    move v0, v8

    goto :goto_a

    :goto_b
    if-eqz v0, :cond_14

    .line 73
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Conv merge local has delete status : url = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v6, Lcom/p1/mobile/putong/data/Envelope;->requestLocalUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ids: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 76
    :cond_14
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    new-instance v1, Ll/fl8;

    invoke-direct {v1}, Ll/fl8;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 77
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_c
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 80
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    iget-object v12, v0, Ll/vj5;->d:Ll/ejk0;

    new-instance v0, Ll/gl8;

    move-object/from16 v1, p0

    move/from16 v2, p3

    move-object v4, v3

    move/from16 v3, p5

    invoke-direct/range {v0 .. v5}, Ll/gl8;-><init>(Ll/il8;ZZLcom/p1/mobile/putong/core/data/CoreData;Lcom/p1/mobile/putong/data/User;)V

    move-object v13, v4

    invoke-virtual {v12, v5, v0}, Ll/ejk0;->G(Lcom/p1/mobile/putong/data/User;Ll/z20;)Lcom/p1/mobile/putong/data/User;

    move-object v3, v13

    goto :goto_c

    :cond_15
    move-object/from16 v1, p0

    move-object v13, v3

    .line 81
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 82
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 83
    iget-object v3, v1, Ll/il8;->n:Ll/xu4;

    new-instance v4, Ll/hl8;

    invoke-direct {v4}, Ll/hl8;-><init>()V

    invoke-virtual {v3, v2, v4}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    goto :goto_d

    .line 84
    :cond_16
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 85
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 86
    iget-object v3, v1, Ll/il8;->o:Ll/wu4;

    new-instance v4, Ll/ok8;

    invoke-direct {v4, v2}, Ll/ok8;-><init>(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    invoke-virtual {v3, v2, v4}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    goto :goto_e

    .line 87
    :cond_17
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v0

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->af()Ljava/lang/String;

    move-result-object v0

    .line 88
    iget-object v2, v13, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 89
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 90
    iget-object v2, v13, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_f
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Message;

    .line 91
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v3

    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v3

    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    move-result v3

    if-eqz v3, :cond_18

    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 92
    invoke-static {v3, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_18

    goto :goto_f

    .line 93
    :cond_18
    iget-object v12, v1, Ll/il8;->c:Ll/t600;

    move-object v4, v7

    move-object v7, v0

    new-instance v0, Ll/pk8;

    move-object v3, v10

    invoke-direct/range {v0 .. v7}, Ll/pk8;-><init>(Ll/il8;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;)V

    invoke-virtual {v12, v2, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    move-object v0, v7

    move-object v7, v4

    goto :goto_f

    :cond_19
    move-object v3, v10

    .line 94
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1a
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 95
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v4

    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->i()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 96
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/api/g;->Mf(Ljava/lang/String;)Lrx/c;

    .line 97
    :cond_1b
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v4

    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ym()Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 98
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/api/g;->Df(Ljava/lang/String;)V

    goto :goto_10

    :cond_1c
    move-object v3, v10

    .line 99
    :cond_1d
    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1e
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/pf60;

    .line 100
    iget-object v3, v2, Ll/pf60;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 101
    iget-object v3, v1, Ll/il8;->m:Ll/mm6;

    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {v3, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_11

    .line 102
    :cond_1f
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_20
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Reminder;

    .line 103
    iget-object v3, v1, Ll/il8;->m:Ll/mm6;

    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Reminder;->otherUser:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ll/mm6;->d1(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object v3

    if-eqz v3, :cond_20

    .line 104
    iput-object v2, v3, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 105
    iget-object v2, v1, Ll/il8;->m:Ll/mm6;

    invoke-virtual {v2, v3}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_12

    .line 106
    :cond_21
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_22

    .line 107
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 108
    iget-object v3, v1, Ll/il8;->s:Ll/tv4;

    new-instance v4, Ll/qk8;

    invoke-direct {v4}, Ll/qk8;-><init>()V

    invoke-virtual {v3, v2, v4}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    goto :goto_13

    .line 109
    :cond_22
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 110
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    const-string v4, "pending"

    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 111
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/d0;->V:Ll/jxd0;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v5}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 112
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/d0;->U:Ll/jxd0;

    invoke-virtual {v3, v5}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 113
    :cond_23
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 114
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 115
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/d0;->R:Ll/jxd0;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 116
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/d0;->S:Ll/jxd0;

    invoke-virtual {v3, v4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 117
    :cond_24
    iget-object v3, v1, Ll/il8;->h:Ll/wzh0;

    invoke-virtual {v3, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_14

    .line 118
    :cond_25
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    if-eqz v0, :cond_28

    .line 119
    const-string v0, "start upset merchandise"

    const-string v2, "[core][merchandise]"

    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 121
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    const-string v5, "oDiamond"

    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 122
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "upset oDiamond "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    :cond_26
    iget-object v4, v1, Ll/il8;->k:Ll/sry;

    invoke-virtual {v4, v3}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_15

    .line 124
    :cond_27
    const-string v0, "end upset merchandise"

    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    :cond_28
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    if-eqz v0, :cond_29

    .line 126
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    .line 127
    iget-object v3, v1, Ll/il8;->p:Ll/u6b0;

    invoke-virtual {v3, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_16

    .line 128
    :cond_29
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    if-eqz v0, :cond_2a

    .line 129
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 130
    iget-object v3, v1, Ll/il8;->q:Ll/qsb;

    invoke-virtual {v3, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_17

    .line 131
    :cond_2a
    iget-object v0, v13, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    if-eqz v0, :cond_2b

    .line 132
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 133
    iget-object v3, v1, Ll/il8;->r:Ll/jzj;

    invoke-virtual {v3, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    goto :goto_18

    .line 134
    :cond_2b
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Se()Lcom/p1/mobile/putong/data/ConversationCounter;

    move-result-object v0

    if-eqz v0, :cond_2c

    .line 135
    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 136
    :cond_2c
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    move-result-wide v1

    long-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 137
    :cond_2d
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v0

    if-eqz v0, :cond_2e

    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    iget v0, v0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    iget-object v1, v6, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    iget v1, v1, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    if-ge v0, v1, :cond_2e

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    const-string v1, "activity/poll"

    .line 139
    invoke-virtual {v0, v1, v8}, Lcom/tantanapp/common/network/RunnerProxy;->findRequest(Ljava/lang/String;I)Lrx/c;

    move-result-object v0

    if-nez v0, :cond_2e

    .line 140
    new-instance v0, Ll/yk8;

    invoke-direct {v0}, Ll/yk8;-><init>()V

    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 141
    :cond_2e
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    move-result-object v0

    new-instance v1, Ll/al8;

    invoke-direct {v1, v6}, Ll/al8;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    new-instance v2, Ll/bl8;

    invoke-direct {v2}, Ll/bl8;-><init>()V

    .line 142
    invoke-virtual {v0, v1, v2}, Ll/l9c;->A(Ll/x20;Ll/x20;)V

    :cond_2f
    return-void
.end method

.method public final M(Lio/requery/android/database/sqlite/SQLiteDatabase;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ALTER TABLE "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/il8;->m:Ll/mm6;

    .line 9
    .line 10
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " ADD COLUMN str_localMatchFrom_c TEXT"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/il8;->m:Ll/mm6;

    .line 33
    .line 34
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, " ADD COLUMN str_localNotificationStatus_c TEXT"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/il8;->m:Ll/mm6;

    .line 57
    .line 58
    iget-object v3, v3, Ll/wzh0;->d:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v3, " ADD COLUMN str_importance_c TEXT"

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Ll/il8;->m:Ll/mm6;

    .line 81
    .line 82
    iget-object v3, v3, Ll/wzh0;->d:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v3, " ADD COLUMN str_status_c TEXT"

    .line 88
    .line 89
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v4, p0, Ll/il8;->m:Ll/mm6;

    .line 105
    .line 106
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v4, " ADD COLUMN str_subtype_c TEXT"

    .line 112
    .line 113
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v4, p0, Ll/il8;->m:Ll/mm6;

    .line 129
    .line 130
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v4, " ADD COLUMN str_localBusinessTypes_c BLOB"

    .line 136
    .line 137
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget-object v5, p0, Ll/il8;->m:Ll/mm6;

    .line 153
    .line 154
    iget-object v5, v5, Ll/wzh0;->d:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v5, " ADD COLUMN str_localPlaceBan_c TEXT"

    .line 160
    .line 161
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object v5, p0, Ll/il8;->c:Ll/t600;

    .line 177
    .line 178
    iget-object v5, v5, Ll/wzh0;->d:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v5, " ADD COLUMN str_sentFrom_c TEXT"

    .line 184
    .line 185
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object v5, p0, Ll/il8;->c:Ll/t600;

    .line 201
    .line 202
    iget-object v5, v5, Ll/wzh0;->d:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-object v2, p0, Ll/il8;->c:Ll/t600;

    .line 223
    .line 224
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string v2, " ADD COLUMN str_localCallHandledStatus_c TEXT"

    .line 230
    .line 231
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    new-instance v0, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object v2, p0, Ll/il8;->c:Ll/t600;

    .line 247
    .line 248
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v2, " ADD COLUMN str_msgType_c TEXT"

    .line 254
    .line 255
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    .line 266
    .line 267
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    iget-object v2, p0, Ll/il8;->c:Ll/t600;

    .line 271
    .line 272
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v2, " ADD COLUMN str_messageType_c TEXT"

    .line 278
    .line 279
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    iget-object v2, p0, Ll/il8;->c:Ll/t600;

    .line 295
    .line 296
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    iget-object v2, p0, Ll/il8;->c:Ll/t600;

    .line 317
    .line 318
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    const-string v2, " ADD COLUMN str_channel_c TEXT"

    .line 324
    .line 325
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    new-instance v0, Ljava/lang/StringBuilder;

    .line 336
    .line 337
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    iget-object v2, p0, Ll/il8;->c:Ll/t600;

    .line 341
    .line 342
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 343
    .line 344
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_sentFrom_c TEXT"

    .line 358
    .line 359
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_localNotificationStatus_c TEXT"

    .line 363
    .line 364
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_localCallHandledStatus_c TEXT"

    .line 368
    .line 369
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_msgType_c TEXT"

    .line 373
    .line 374
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_messageType_c TEXT"

    .line 378
    .line 379
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_localBusinessTypes_c BLOB"

    .line 383
    .line 384
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_channel_c TEXT"

    .line 388
    .line 389
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    const-string v0, "ALTER TABLE greeting_messages ADD COLUMN str_status_c TEXT"

    .line 393
    .line 394
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    new-instance v0, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object v2, p0, Ll/il8;->e:Ll/wzh0;

    .line 403
    .line 404
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 405
    .line 406
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    const-string v2, " ADD COLUMN str_category_c TEXT"

    .line 410
    .line 411
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    new-instance v0, Ljava/lang/StringBuilder;

    .line 422
    .line 423
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    iget-object v4, p0, Ll/il8;->g:Ll/wzh0;

    .line 427
    .line 428
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    const-string v4, " ADD COLUMN str_source_c TEXT"

    .line 434
    .line 435
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    new-instance v0, Ljava/lang/StringBuilder;

    .line 446
    .line 447
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    iget-object v4, p0, Ll/il8;->h:Ll/wzh0;

    .line 451
    .line 452
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 453
    .line 454
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    const-string v4, " ADD COLUMN str_picVerificationInfo_status_c TEXT"

    .line 458
    .line 459
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    new-instance v0, Ljava/lang/StringBuilder;

    .line 470
    .line 471
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    iget-object v4, p0, Ll/il8;->h:Ll/wzh0;

    .line 475
    .line 476
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 477
    .line 478
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    const-string v4, " ADD COLUMN str_ageVerificationInfo_status_c TEXT"

    .line 482
    .line 483
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    new-instance v0, Ljava/lang/StringBuilder;

    .line 494
    .line 495
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    iget-object v4, p0, Ll/il8;->k:Ll/sry;

    .line 499
    .line 500
    iget-object v4, v4, Ll/wzh0;->d:Ljava/lang/String;

    .line 501
    .line 502
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    .line 507
    .line 508
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    new-instance v0, Ljava/lang/StringBuilder;

    .line 516
    .line 517
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 518
    .line 519
    .line 520
    iget-object v2, p0, Ll/il8;->k:Ll/sry;

    .line 521
    .line 522
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 523
    .line 524
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    const-string v2, " ADD COLUMN str_productType_c TEXT"

    .line 528
    .line 529
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 537
    .line 538
    .line 539
    new-instance v0, Ljava/lang/StringBuilder;

    .line 540
    .line 541
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    iget-object v2, p0, Ll/il8;->n:Ll/xu4;

    .line 545
    .line 546
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 547
    .line 548
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    .line 553
    .line 554
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 559
    .line 560
    .line 561
    new-instance v0, Ljava/lang/StringBuilder;

    .line 562
    .line 563
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    iget-object v2, p0, Ll/il8;->n:Ll/xu4;

    .line 567
    .line 568
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 569
    .line 570
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    const-string v2, " ADD COLUMN str_groupType_c TEXT"

    .line 574
    .line 575
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 583
    .line 584
    .line 585
    new-instance v0, Ljava/lang/StringBuilder;

    .line 586
    .line 587
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 588
    .line 589
    .line 590
    iget-object v2, p0, Ll/il8;->n:Ll/xu4;

    .line 591
    .line 592
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 593
    .line 594
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    const-string v2, " ADD COLUMN str_groupApply_status_c TEXT"

    .line 598
    .line 599
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    new-instance v0, Ljava/lang/StringBuilder;

    .line 610
    .line 611
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 612
    .line 613
    .line 614
    iget-object v2, p0, Ll/il8;->o:Ll/wu4;

    .line 615
    .line 616
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 617
    .line 618
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 619
    .line 620
    .line 621
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v0

    .line 628
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    new-instance v0, Ljava/lang/StringBuilder;

    .line 632
    .line 633
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    iget-object v2, p0, Ll/il8;->o:Ll/wu4;

    .line 637
    .line 638
    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    .line 639
    .line 640
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    .line 642
    .line 643
    const-string v2, " ADD COLUMN str_gender_c TEXT"

    .line 644
    .line 645
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v0

    .line 652
    invoke-virtual {p1, v0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 653
    .line 654
    .line 655
    new-instance v0, Ljava/lang/StringBuilder;

    .line 656
    .line 657
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    iget-object p0, p0, Ll/il8;->l:Ll/gk6;

    .line 661
    .line 662
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 663
    .line 664
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    const-string p0, " ADD COLUMN str_state_c TEXT"

    .line 668
    .line 669
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object p0

    .line 676
    invoke-virtual {p1, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    return-void
.end method

.method public bridge synthetic a(Lcom/p1/mobile/putong/data/Envelope;Lcom/tantanapp/common/data/BaseData;ZZZ)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/il8;->L(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/CoreData;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/16 p0, 0x4a

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "coreDb"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h()V
    .locals 12

    .line 1
    new-instance v0, Ll/xu4;

    .line 2
    .line 3
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroup;->DB_ADAPTER:Ll/vzf0;

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    const/16 v5, 0x3e8

    .line 7
    .line 8
    const-string v2, "chat_groups"

    .line 9
    .line 10
    move-object v1, p0

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/xu4;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 12
    .line 13
    .line 14
    move-object v7, v1

    .line 15
    iput-object v0, v7, Ll/il8;->n:Ll/xu4;

    .line 16
    .line 17
    new-instance v6, Ll/wu4;

    .line 18
    .line 19
    sget-object v9, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->DB_ADAPTER:Ll/vzf0;

    .line 20
    .line 21
    const/4 v10, 0x0

    .line 22
    const/16 v11, 0x3e8

    .line 23
    .line 24
    const-string v8, "chatGroupMembers"

    .line 25
    .line 26
    invoke-direct/range {v6 .. v11}, Ll/wu4;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 27
    .line 28
    .line 29
    iput-object v6, v7, Ll/il8;->o:Ll/wu4;

    .line 30
    .line 31
    new-instance v6, Ll/u6b0;

    .line 32
    .line 33
    sget-object v9, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->DB_ADAPTER:Ll/vzf0;

    .line 34
    .line 35
    const-string v8, "promotions"

    .line 36
    .line 37
    invoke-direct/range {v6 .. v11}, Ll/u6b0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 38
    .line 39
    .line 40
    iput-object v6, v7, Ll/il8;->p:Ll/u6b0;

    .line 41
    .line 42
    new-instance v6, Ll/qsb;

    .line 43
    .line 44
    sget-object v9, Lcom/p1/mobile/putong/core/data/Coupon;->DB_ADAPTER:Ll/vzf0;

    .line 45
    .line 46
    const/16 v11, 0x64

    .line 47
    .line 48
    const-string v8, "coupons"

    .line 49
    .line 50
    invoke-direct/range {v6 .. v11}, Ll/qsb;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 51
    .line 52
    .line 53
    iput-object v6, v7, Ll/il8;->q:Ll/qsb;

    .line 54
    .line 55
    new-instance v6, Ll/jzj;

    .line 56
    .line 57
    sget-object v9, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->DB_ADAPTER:Ll/vzf0;

    .line 58
    .line 59
    const/16 v11, 0xc8

    .line 60
    .line 61
    const-string v8, "coreGift"

    .line 62
    .line 63
    invoke-direct/range {v6 .. v11}, Ll/jzj;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 64
    .line 65
    .line 66
    iput-object v6, v7, Ll/il8;->r:Ll/jzj;

    .line 67
    .line 68
    new-instance v6, Ll/t600;

    .line 69
    .line 70
    sget-object v9, Lcom/p1/mobile/putong/core/data/Message;->DB_ADAPTER:Ll/vzf0;

    .line 71
    .line 72
    new-instance p0, Lcom/tantanapp/common/data/orm/Index;

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 75
    .line 76
    const/4 v1, 0x3

    .line 77
    new-array v2, v1, [Lcom/tantanapp/common/data/orm/Column;

    .line 78
    .line 79
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 80
    .line 81
    const/4 v4, 0x0

    .line 82
    aput-object v3, v2, v4

    .line 83
    .line 84
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 85
    .line 86
    const/4 v5, 0x1

    .line 87
    aput-object v3, v2, v5

    .line 88
    .line 89
    const/4 v3, 0x2

    .line 90
    aput-object v0, v2, v3

    .line 91
    .line 92
    invoke-direct {p0, v2}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 93
    .line 94
    .line 95
    new-instance v2, Lcom/tantanapp/common/data/orm/Index;

    .line 96
    .line 97
    new-array v1, v1, [Lcom/tantanapp/common/data/orm/Column;

    .line 98
    .line 99
    sget-object v8, Lcom/p1/mobile/putong/core/data/Message;->LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 100
    .line 101
    aput-object v8, v1, v4

    .line 102
    .line 103
    sget-object v8, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 104
    .line 105
    aput-object v8, v1, v5

    .line 106
    .line 107
    aput-object v0, v1, v3

    .line 108
    .line 109
    invoke-direct {v2, v1}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 110
    .line 111
    .line 112
    new-instance v1, Lcom/tantanapp/common/data/orm/Index;

    .line 113
    .line 114
    new-array v8, v3, [Lcom/tantanapp/common/data/orm/Column;

    .line 115
    .line 116
    sget-object v10, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 117
    .line 118
    aput-object v10, v8, v4

    .line 119
    .line 120
    aput-object v0, v8, v5

    .line 121
    .line 122
    invoke-direct {v1, v8}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 123
    .line 124
    .line 125
    filled-new-array {p0, v2, v1}, [Lcom/tantanapp/common/data/orm/Index;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    const/16 v11, 0x3e8

    .line 134
    .line 135
    const-string v8, "messages"

    .line 136
    .line 137
    invoke-direct/range {v6 .. v11}, Ll/t600;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 138
    .line 139
    .line 140
    iput-object v6, v7, Ll/il8;->c:Ll/t600;

    .line 141
    .line 142
    new-instance v6, Ll/mm6;

    .line 143
    .line 144
    sget-object v9, Lcom/p1/mobile/putong/core/data/Conversation;->DB_ADAPTER:Ll/vzf0;

    .line 145
    .line 146
    new-instance p0, Lcom/tantanapp/common/data/orm/Index;

    .line 147
    .line 148
    sget-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LATESTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 149
    .line 150
    new-array v1, v5, [Lcom/tantanapp/common/data/orm/Column;

    .line 151
    .line 152
    aput-object v0, v1, v4

    .line 153
    .line 154
    invoke-direct {p0, v1}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 155
    .line 156
    .line 157
    new-instance v1, Lcom/tantanapp/common/data/orm/Index;

    .line 158
    .line 159
    new-array v2, v3, [Lcom/tantanapp/common/data/orm/Column;

    .line 160
    .line 161
    sget-object v8, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALHASMESSAGE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 162
    .line 163
    aput-object v8, v2, v4

    .line 164
    .line 165
    aput-object v0, v2, v5

    .line 166
    .line 167
    invoke-direct {v1, v2}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 168
    .line 169
    .line 170
    new-instance v2, Lcom/tantanapp/common/data/orm/Index;

    .line 171
    .line 172
    new-array v3, v3, [Lcom/tantanapp/common/data/orm/Column;

    .line 173
    .line 174
    sget-object v8, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 175
    .line 176
    aput-object v8, v3, v4

    .line 177
    .line 178
    aput-object v0, v3, v5

    .line 179
    .line 180
    invoke-direct {v2, v3}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 181
    .line 182
    .line 183
    filled-new-array {p0, v1, v2}, [Lcom/tantanapp/common/data/orm/Index;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 188
    .line 189
    .line 190
    move-result-object v10

    .line 191
    const-string v8, "conversations"

    .line 192
    .line 193
    invoke-direct/range {v6 .. v11}, Ll/mm6;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 194
    .line 195
    .line 196
    iput-object v6, v7, Ll/il8;->m:Ll/mm6;

    .line 197
    .line 198
    new-instance v6, Ll/wzh0;

    .line 199
    .line 200
    sget-object v9, Lcom/p1/mobile/putong/data/DbLinks;->DB_ADAPTER:Ll/vzf0;

    .line 201
    .line 202
    const/4 v10, 0x0

    .line 203
    const-string v8, "message_links"

    .line 204
    .line 205
    invoke-direct/range {v6 .. v11}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 206
    .line 207
    .line 208
    iput-object v6, v7, Ll/il8;->d:Ll/wzh0;

    .line 209
    .line 210
    new-instance v6, Ll/wzh0;

    .line 211
    .line 212
    sget-object v9, Lcom/p1/mobile/putong/core/data/Question;->DB_ADAPTER:Ll/vzf0;

    .line 213
    .line 214
    const-string v8, "questions"

    .line 215
    .line 216
    invoke-direct/range {v6 .. v11}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 217
    .line 218
    .line 219
    iput-object v6, v7, Ll/il8;->e:Ll/wzh0;

    .line 220
    .line 221
    new-instance v6, Ll/uvv;

    .line 222
    .line 223
    sget-object v9, Lcom/p1/mobile/putong/core/data/Message;->DB_ADAPTER:Ll/vzf0;

    .line 224
    .line 225
    const-string v8, "localMessages"

    .line 226
    .line 227
    invoke-direct/range {v6 .. v11}, Ll/uvv;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 228
    .line 229
    .line 230
    iput-object v6, v7, Ll/il8;->f:Ll/uvv;

    .line 231
    .line 232
    new-instance v6, Ll/wzh0;

    .line 233
    .line 234
    sget-object v9, Lcom/p1/mobile/putong/core/data/Sticker;->DB_ADAPTER:Ll/vzf0;

    .line 235
    .line 236
    const-string v8, "stickers"

    .line 237
    .line 238
    invoke-direct/range {v6 .. v11}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 239
    .line 240
    .line 241
    iput-object v6, v7, Ll/il8;->g:Ll/wzh0;

    .line 242
    .line 243
    new-instance v6, Ll/wzh0;

    .line 244
    .line 245
    sget-object v9, Lcom/p1/mobile/putong/core/data/VerificationCenter;->DB_ADAPTER:Ll/vzf0;

    .line 246
    .line 247
    const-string v8, "verificationCenter"

    .line 248
    .line 249
    invoke-direct/range {v6 .. v11}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 250
    .line 251
    .line 252
    iput-object v6, v7, Ll/il8;->h:Ll/wzh0;

    .line 253
    .line 254
    new-instance v6, Ll/x090;

    .line 255
    .line 256
    sget-object v9, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->DB_ADAPTER:Ll/vzf0;

    .line 257
    .line 258
    const-string v8, "private_question"

    .line 259
    .line 260
    invoke-direct/range {v6 .. v11}, Ll/x090;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 261
    .line 262
    .line 263
    iput-object v6, v7, Ll/il8;->i:Ll/x090;

    .line 264
    .line 265
    new-instance v6, Ll/wzh0;

    .line 266
    .line 267
    sget-object v9, Lcom/p1/mobile/putong/core/data/UserPrivilege;->DB_ADAPTER:Ll/vzf0;

    .line 268
    .line 269
    const-string v8, "userPrivilege"

    .line 270
    .line 271
    invoke-direct/range {v6 .. v11}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 272
    .line 273
    .line 274
    iput-object v6, v7, Ll/il8;->j:Ll/wzh0;

    .line 275
    .line 276
    new-instance v6, Ll/sry;

    .line 277
    .line 278
    sget-object v9, Lcom/p1/mobile/putong/core/data/Merchandise;->DB_ADAPTER:Ll/vzf0;

    .line 279
    .line 280
    const/16 v11, 0x64

    .line 281
    .line 282
    const-string v8, "merchandises"

    .line 283
    .line 284
    invoke-direct/range {v6 .. v11}, Ll/sry;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 285
    .line 286
    .line 287
    iput-object v6, v7, Ll/il8;->k:Ll/sry;

    .line 288
    .line 289
    new-instance v6, Ll/gk6;

    .line 290
    .line 291
    sget-object v9, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->DB_ADAPTER:Ll/vzf0;

    .line 292
    .line 293
    const-string v8, "conversation_records"

    .line 294
    .line 295
    invoke-direct/range {v6 .. v11}, Ll/gk6;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 296
    .line 297
    .line 298
    iput-object v6, v7, Ll/il8;->l:Ll/gk6;

    .line 299
    .line 300
    new-instance v6, Ll/tv4;

    .line 301
    .line 302
    sget-object v9, Lcom/p1/mobile/putong/core/data/ChatHeat;->DB_ADAPTER:Ll/vzf0;

    .line 303
    .line 304
    const-string v8, "chatheat"

    .line 305
    .line 306
    invoke-direct/range {v6 .. v11}, Ll/tv4;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 307
    .line 308
    .line 309
    iput-object v6, v7, Ll/il8;->s:Ll/tv4;

    .line 310
    .line 311
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/h9c;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Ll/rrq;->i(Ll/gq2;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    .locals 8

    .line 1
    const-string p3, " ADD COLUMN source_c TEXT"

    const-string v0, " ADD COLUMN localExtraInfo_c TEXT"

    const-string v1, " WHERE id_c LIKE \'%greeting%\'"

    const-string v2, "DROP TABLE greeting_messages"

    const-string v3, "DROP TABLE "

    const-string v4, "CREATE TABLE IF NOT EXISTS "

    const-string v5, "DELETE FROM "

    const-string v6, "ALTER TABLE "

    packed-switch p2, :pswitch_data_0

    goto/16 :goto_0

    .line 2
    :pswitch_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->k:Ll/sry;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->k:Ll/sry;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " (_id INTEGER PRIMARY KEY,id_c TEXT,category_c INTEGER,quantity_c INTEGER,productType_c INTEGER,defaultStockKeepUnit_id_c TEXT,defaultStockKeepUnit_type_c TEXT,defaultStockKeepUnit_affiliateProducts_alipay_c TEXT,defaultStockKeepUnit_affiliateProducts_wechat_c TEXT,defaultStockKeepUnit_affiliateProducts_googleplay_c TEXT,defaultStockKeepUnit_affiliateProducts_huawei_c TEXT,defaultStockKeepUnit_prices_currencyCode_c TEXT,defaultStockKeepUnit_prices_currencySymbol_c TEXT,defaultStockKeepUnit_prices_price_c REAL,defaultStockKeepUnit_prices_unitPrice_c REAL,defaultStockKeepUnit_prices_originalPrice_c REAL,defaultStockKeepUnit_prices_originalUnitPrice_c REAL,defaultStockKeepUnit_prices_noneRenewalPrice_c REAL,defaultStockKeepUnit_prices_noneRenewalUnitPrice_c REAL,defaultStockKeepUnit_promotionDetail_promotionType_c TEXT,defaultStockKeepUnit_promotionDetail_beginTime_c REAL,defaultStockKeepUnit_promotionDetail_endTime_c REAL,defaultStockKeepUnit_promotionDetail_promotionPrice_c REAL,defaultStockKeepUnit_promotionDetail_promotionDuration_c INTEGER,defaultStockKeepUnit_promotionDetail_promotionState_c TEXT,defaultStockKeepUnit_promotionDetail_couponToken_c TEXT,defaultStockKeepUnit_promotionDetail_affiliate_c INTEGER,defaultStockKeepUnit_promotionDetail_subscriptionOnly_c INTEGER,defaultStockKeepUnit_promotionDetail_localCouponId_c TEXT,defaultStockKeepUnit_promotionDetail_localPromotionId_c TEXT,defaultStockKeepUnit_tracker_c TEXT,promotionStockKeepUnit_id_c TEXT,promotionStockKeepUnit_type_c TEXT,promotionStockKeepUnit_affiliateProducts_alipay_c TEXT,promotionStockKeepUnit_affiliateProducts_wechat_c TEXT,promotionStockKeepUnit_affiliateProducts_googleplay_c TEXT,promotionStockKeepUnit_affiliateProducts_huawei_c TEXT,promotionStockKeepUnit_prices_currencyCode_c TEXT,promotionStockKeepUnit_prices_currencySymbol_c TEXT,promotionStockKeepUnit_prices_price_c REAL,promotionStockKeepUnit_prices_unitPrice_c REAL,promotionStockKeepUnit_prices_originalPrice_c REAL,promotionStockKeepUnit_prices_originalUnitPrice_c REAL,promotionStockKeepUnit_prices_noneRenewalPrice_c REAL,promotionStockKeepUnit_prices_noneRenewalUnitPrice_c REAL,promotionStockKeepUnit_promotionDetail_promotionType_c TEXT,promotionStockKeepUnit_promotionDetail_beginTime_c REAL,promotionStockKeepUnit_promotionDetail_endTime_c REAL,promotionStockKeepUnit_promotionDetail_promotionPrice_c REAL,promotionStockKeepUnit_promotionDetail_promotionDuration_c INTEGER,promotionStockKeepUnit_promotionDetail_promotionState_c TEXT,promotionStockKeepUnit_promotionDetail_couponToken_c TEXT,promotionStockKeepUnit_promotionDetail_affiliate_c INTEGER,promotionStockKeepUnit_promotionDetail_subscriptionOnly_c INTEGER,promotionStockKeepUnit_promotionDetail_localCouponId_c TEXT,promotionStockKeepUnit_promotionDetail_localPromotionId_c TEXT,promotionStockKeepUnit_tracker_c TEXT)"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 4
    :pswitch_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_kankan_contents_c BLOB"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 5
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_kankan_resonance_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 6
    const-string p2, "CREATE TABLE IF NOT EXISTS kankans (_id INTEGER PRIMARY KEY,id_c TEXT,owner_c TEXT,value_c TEXT,textTheme_backgroundColor_c BLOB,textTheme_bottomColor_c TEXT,emotion_c BLOB,location_c BLOB,resonance_c BLOB,contents_c BLOB,createdTime_c REAL)"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 7
    :pswitch_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " WHERE convType_c=\'group\'"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 8
    :pswitch_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "  ADD COLUMN localAudioText_c BLOB"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 9
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->r:Ll/jzj;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN quota_c INTEGER"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 10
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->r:Ll/jzj;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN extra_messageTips_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 11
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->r:Ll/jzj;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN extra_noQuotaToast_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 12
    :pswitch_4
    const-string p2, "CREATE TABLE IF NOT EXISTS greeting_messages (_id INTEGER PRIMARY KEY,id_c TEXT,localCreatedTime_c INTEGER,localCreatedSession_c INTEGER,localInMoment_c INTEGER,localInConversation_c INTEGER,createdTime_c REAL,cid_c TEXT,media_c BLOB,sticker_c TEXT,question_c TEXT,sentFrom_c INTEGER,moment_c TEXT,answerOfMessage_c TEXT,owner_c TEXT,location_c BLOB,recalled_c INTEGER,value_c TEXT,localNotificationStatus_c INTEGER,likeOfMoment_c TEXT,localAnimationKey_c TEXT,api_only_accessory_c BLOB,giftRecords_c BLOB,call_c BLOB,localCallType_c TEXT,localCallStatus_c INTEGER,localCallHandledStatus_c INTEGER,localPrivateQuestions_c BLOB,letter_c BLOB,chatTyping_c INTEGER,localFailType_c INTEGER,recalledReason_c TEXT,recalledHint_c TEXT,msgType_c INTEGER,messageType_c INTEGER,additionalData_c BLOB,localSafetyReminder_c INTEGER,localSensitiveWordReminder_c INTEGER,msgData_c TEXT,localBusinessTypes_c BLOB,settings_anonymous_c INTEGER,channel_c INTEGER,notifiedUsers_c BLOB,status_c INTEGER,referenceMsgId_c TEXT,hostId_c TEXT,localRedPacketType_c TEXT,localAudioText_c BLOB,localGreetingId_c TEXT)"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN localGreetingId_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_kankan_greetingSummaryDetail_unseen_c INTEGER"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_kankan_greetingSummaryDetail_latestTime_c REAL"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 16
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_kankan_greetingSummaryDetail_latestUserId_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 17
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_kankan_greetingSummaryDetail_latestMessageId_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 18
    const-string p2, "ALTER TABLE kankans ADD COLUMN status_c TEXT"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 19
    :pswitch_5
    const-string p2, "ALTER TABLE kankans ADD COLUMN topic_c BLOB"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 20
    :pswitch_6
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_quickChat_bell_isInitiator_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_quickChat_bell_agree_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 22
    :pswitch_7
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN localMessageInsertReportHint_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 23
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN localNotifyMomentId_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 24
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN localInsertedMomentId_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 25
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " WHERE status_c=1"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 26
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->r:Ll/jzj;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 27
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->r:Ll/jzj;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,url_c TEXT,unitCoinPrice_c REAL,unitLikes_c INTEGER,dynamicGift_c INTEGER,dynamicURL_c TEXT,dynamicMD5_c TEXT,quota_c INTEGER,extra_messageTips_c TEXT,extra_noQuotaToast_c TEXT,extra_shopGuide_c TEXT,extra_blessingText_c TEXT)"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 28
    :pswitch_8
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->q:Ll/qsb;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN benefit_localBenefit_discountBenefit_showDiscount_c TEXT DEFAULT \'\'"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 29
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->q:Ll/qsb;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN benefit_localBenefit_discountBenefit_privilegesChange_c BLOB"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 30
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->q:Ll/qsb;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN benefit_localBenefit_discountBenefit_hasPrivilegesChange_c INTEGER DEFAULT 0"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 31
    :pswitch_9
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN read_c INTEGER"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 32
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN needRead_c INTEGER"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 33
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN extData_c BLOB"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    :pswitch_a
    invoke-virtual {p1, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 35
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->d:Ll/wzh0;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 36
    const-string p2, "CREATE TABLE IF NOT EXISTS greeting_messages (_id INTEGER PRIMARY KEY,id_c TEXT,localCreatedTime_c INTEGER,localCreatedSession_c INTEGER,localInMoment_c INTEGER,localInConversation_c INTEGER,createdTime_c REAL,cid_c TEXT,media_c BLOB,sticker_c TEXT,question_c TEXT,sentFrom_c INTEGER,moment_c TEXT,answerOfMessage_c TEXT,owner_c TEXT,location_c BLOB,recalled_c INTEGER,value_c TEXT,localNotificationStatus_c INTEGER,likeOfMoment_c TEXT,localAnimationKey_c TEXT,api_only_accessory_c BLOB,giftRecords_c BLOB,call_c BLOB,localCallType_c TEXT,localCallStatus_c INTEGER,localCallHandledStatus_c INTEGER,localPrivateQuestions_c BLOB,letter_c BLOB,chatTyping_c INTEGER,localFailType_c INTEGER,recalledReason_c TEXT,recalledHint_c TEXT,msgType_c INTEGER,messageType_c INTEGER,additionalData_c BLOB,localSafetyReminder_c INTEGER,localSensitiveWordReminder_c INTEGER,msgData_c TEXT,localBusinessTypes_c BLOB,settings_anonymous_c INTEGER,channel_c INTEGER,notifiedUsers_c BLOB,status_c INTEGER,referenceMsgId_c TEXT,hostId_c TEXT,localRedPacketType_c TEXT,localAudioText_c BLOB,localGreetingId_c TEXT,read_c INTEGER,needRead_c INTEGER,extData_c BLOB)"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 37
    :pswitch_b
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN fromConvType_c TEXT"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 38
    const-string p2, "ALTER TABLE greeting_messages ADD COLUMN fromConvType_c TEXT"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 39
    :pswitch_c
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " WHERE status_c = 3 OR status_c = 5"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 40
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN mm_c INTEGER"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 41
    :pswitch_d
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " WHERE messageType_c = 42"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 42
    :pswitch_e
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->c:Ll/t600;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 43
    const-string p2, "ALTER TABLE greeting_messages ADD COLUMN localExtraInfo_c TEXT"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 44
    :pswitch_f
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Ll/il8;->m:Ll/mm6;

    iget-object v7, v7, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " ADD COLUMN additional_quickChat_expire_c REAL"

    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p0, p1}, Ll/il8;->M(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    .line 46
    :pswitch_10
    invoke-virtual {p1, v2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Ll/il8;->d:Ll/wzh0;

    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 48
    :pswitch_11
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->c:Ll/t600;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN incTempInfo_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 49
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN intimacy_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 50
    :pswitch_12
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN quickChatProgress_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 51
    :pswitch_13
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->k:Ll/sry;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->q:Ll/qsb;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->k:Ll/sry;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " (_id INTEGER PRIMARY KEY,id_c TEXT,category_c INTEGER,quantity_c INTEGER,productType_c INTEGER,defaultStockKeepUnit_id_c TEXT,defaultStockKeepUnit_type_c TEXT,defaultStockKeepUnit_affiliateProducts_alipay_c TEXT,defaultStockKeepUnit_affiliateProducts_wechat_c TEXT,defaultStockKeepUnit_affiliateProducts_googleplay_c TEXT,defaultStockKeepUnit_affiliateProducts_huawei_c TEXT,defaultStockKeepUnit_prices_currencyCode_c TEXT,defaultStockKeepUnit_prices_currencySymbol_c TEXT,defaultStockKeepUnit_prices_price_c REAL,defaultStockKeepUnit_prices_unitPrice_c REAL,defaultStockKeepUnit_prices_originalPrice_c REAL,defaultStockKeepUnit_prices_originalUnitPrice_c REAL,defaultStockKeepUnit_prices_noneRenewalPrice_c REAL,defaultStockKeepUnit_prices_noneRenewalUnitPrice_c REAL,defaultStockKeepUnit_tracker_c TEXT,str_category_c TEXT,str_productType_c TEXT,localCoupons_c BLOB)"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 54
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->q:Ll/qsb;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,tags_c BLOB,couponType_c TEXT,ignoreBeginTime_c INTEGER,ignoreEndTime_c INTEGER,beginTime_c REAL,endTime_c REAL,condition_purchaseChannel_c BLOB,condition_skuIDs_c BLOB,condition_merchandiseIDs_c BLOB,benefit_localBenefit_benefitType_c TEXT,benefit_localBenefit_trialBenefit_trialDuration_c INTEGER,benefit_localBenefit_trialBenefit_discount_discountType_c TEXT,benefit_localBenefit_trialBenefit_discount_value_c INTEGER,benefit_localBenefit_trialBenefit_trialReplaceItemID_c INTEGER,benefit_localBenefit_trialBenefit_afterTrialDiscount_discountType_c TEXT,benefit_localBenefit_trialBenefit_afterTrialDiscount_value_c INTEGER,benefit_localBenefit_discountBenefit_discountType_c TEXT,benefit_localBenefit_discountBenefit_value_c INTEGER,userCouponID_c TEXT,couponID_c TEXT,benefit_localBenefit_discountBenefit_showDiscount_c TEXT,benefit_localBenefit_discountBenefit_privilegesChange_c BLOB,benefit_localBenefit_discountBenefit_hasPrivilegesChange_c INTEGER,localApplyPromotions_c BLOB)"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 55
    :pswitch_14
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN expiredTime_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 56
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN joinRemainedTime_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 57
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 58
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN token_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 59
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN groupTopic_id_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 60
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN groupTopic_owner_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 61
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN groupTopic_value_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 62
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN groupTopic_medias_c BLOB"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 63
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN upgraded_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 64
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN duration_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 65
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN group_source_c TEXT DEFAULT \'\'"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 66
    :pswitch_15
    const-string p2, "CREATE TABLE IF NOT EXISTS literaturesComments (_id INTEGER PRIMARY KEY,id_c TEXT,userID_c TEXT,literatureID_c TEXT,interestLevel_c TEXT,createdTime_c INTEGER,localLiteratures_c BLOB)"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 67
    const-string p2, "CREATE TABLE IF NOT EXISTS literatures (_id INTEGER PRIMARY KEY,id_c TEXT,title_c TEXT,category_c TEXT,author_c BLOB,headUrl_c TEXT,kinds_c BLOB,bgColor_c TEXT)"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 68
    :pswitch_16
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_quickChat_progress_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 69
    :pswitch_17
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_feedStateCounter_c BLOB"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 70
    :pswitch_18
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->r:Ll/jzj;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN extra_grayURL_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 71
    :pswitch_19
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_suggestedTimeLimitedMatch_c BLOB"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 72
    :pswitch_1a
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN joinCondition_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 73
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN onlineCount_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 74
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN adminLimit_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 75
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN permissions_canShareToWeChat_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 76
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN permissions_canShareToTantan_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 77
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN permissions_canChangeJoinCondition_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 78
    :pswitch_1b
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_kankan_greetingSummaryDetail_iconURL_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 79
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_kankan_greetingSummaryDetail_title_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 80
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_kankan_greetingSummaryDetail_subtitle_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 81
    :pswitch_1c
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_heartbeatMatch_c BLOB"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 82
    :pswitch_1d
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN hasLocalBreakIce_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 83
    :pswitch_1e
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_avatarSummary_c BLOB"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 84
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN additional_feedInteractionCounter_c BLOB"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 85
    :pswitch_1f
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->j:Ll/wzh0;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN content_unlimit_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 86
    :pswitch_20
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->m:Ll/mm6;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN localSpoofingNewTime_c REAL"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 87
    :pswitch_21
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->n:Ll/xu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN inModeration_nickName_c TEXT"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 88
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Ll/il8;->n:Ll/xu4;

    iget-object v2, v2, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ADD COLUMN inModeration_name_c TEXT"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 89
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Ll/il8;->n:Ll/xu4;

    iget-object v3, v3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ADD COLUMN inModeration_description_c TEXT"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 90
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Ll/il8;->o:Ll/wu4;

    iget-object v5, v5, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 91
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->o:Ll/wu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 92
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->o:Ll/wu4;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 93
    :pswitch_22
    const-string p2, "DROP TABLE literaturesComments"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 94
    const-string p2, "DROP TABLE literatures"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 95
    :pswitch_23
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->j:Ll/wzh0;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ADD COLUMN content_beginTime_c INTEGER"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 96
    :pswitch_24
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ll/il8;->e:Ll/wzh0;

    iget-object v1, v1, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 97
    :pswitch_25
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->s:Ll/tv4;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " (_id INTEGER PRIMARY KEY,id_c TEXT,degree_c REAL,levelUp_c INTEGER,specialRemind_c INTEGER,exclusiveChatInviteTime_c REAL,exclusiveChatInviteExpireTime_c REAL,exclusiveChatStartTime_c REAL,exclusiveChatEndTime_c REAL,showLevelDown_c INTEGER,tempDownDegree_c REAL)"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 98
    :pswitch_26
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->n:Ll/xu4;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN shareToken_c TEXT"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 99
    :pswitch_27
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN clearedTime_c REAL"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 100
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_liveVirtualVoice_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 101
    :pswitch_28
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_localMomentInfo_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 102
    :pswitch_29
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 103
    :pswitch_2a
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "UPDATE "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " SET level_c = 100 WHERE level_c = 1"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 104
    :pswitch_2b
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN lastActivityTime_c REAL"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 105
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_liveActivity_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 106
    :pswitch_2c
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_game_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 107
    :pswitch_2d
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_tag_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 108
    :pswitch_2e
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_chatAssistantQuestion_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 109
    :pswitch_2f
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_quickChat_guideFakeToGood_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 110
    :pswitch_30
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN otherStatus_c TEXT DEFAULT \'\'"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    :pswitch_31
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_continuousChat_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 112
    :pswitch_32
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->c:Ll/t600;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN riskTags_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 113
    :pswitch_33
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_pinChat_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 114
    :pswitch_34
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_reSwipe_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 115
    :pswitch_35
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_blindbox_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 116
    :pswitch_36
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_previewTexts_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 117
    :pswitch_37
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->k:Ll/sry;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN duration_times_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 118
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->k:Ll/sry;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN duration_timeUnit_c TEXT"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 119
    :pswitch_38
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->c:Ll/t600;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN localMyVisitorCount_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 120
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->c:Ll/t600;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN localMyVisitorHidden_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 121
    :pswitch_39
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->h:Ll/wzh0;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN str_ctdidVerificationInfo_status_c TEXT"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 122
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->h:Ll/wzh0;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN ctdidVerificationInfo_media_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 123
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->h:Ll/wzh0;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN ctdidVerificationInfo_status_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 124
    :pswitch_3a
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->k:Ll/sry;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN extra_discountText_c TEXT"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 125
    :pswitch_3b
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_greetingInfo_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 126
    :pswitch_3c
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->j:Ll/wzh0;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN content_refreshMaxRemaining_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 127
    :pswitch_3d
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_fateRadar_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 128
    :pswitch_3e
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN isFake_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 129
    :pswitch_3f
    const-string p2, "DROP TABLE kankans"

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 130
    :pswitch_40
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_lowPayOneside_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 131
    :pswitch_41
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_matchInfo_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 132
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_newMatch_labelExposureTime_c REAL DEFAULT 0"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 133
    :pswitch_42
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_loveLetter_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 134
    :pswitch_43
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->q:Ll/qsb;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN benefit_localBenefit_giftBenefit_discount_discountType_c TEXT"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 135
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->q:Ll/qsb;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN benefit_localBenefit_giftBenefit_discount_value_c INTEGER"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 136
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->q:Ll/qsb;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN benefit_localBenefit_giftBenefit_giveItemIDs_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 137
    :pswitch_44
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN localIsLimitedTrialSee_c INTEGER DEFAULT 0"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 138
    :pswitch_45
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_chatMM_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 139
    :pswitch_46
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_blackList_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 140
    :pswitch_47
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_messageRelate_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 141
    :pswitch_48
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Ll/il8;->m:Ll/mm6;

    iget-object p3, p3, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " ADD COLUMN additional_compliment_c BLOB"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 142
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Ll/il8;->m:Ll/mm6;

    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " ADD COLUMN additional_swiper_c BLOB"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 143
    :goto_0
    invoke-static {p1}, Ll/yg50;->g(Lio/requery/android/database/sqlite/SQLiteDatabase;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
    .end packed-switch
.end method
