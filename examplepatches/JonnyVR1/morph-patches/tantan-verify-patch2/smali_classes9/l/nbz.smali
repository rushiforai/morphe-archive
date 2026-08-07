.class public Ll/nbz;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static b:Z

.field public static c:Z

.field public static d:Z

.field public static e:Ll/jxd0;

.field public static f:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "fake_debug_conv"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/nbz;->e:Ll/jxd0;

    .line 11
    .line 12
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

.method public static synthetic A(Ll/clz;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p0, v0, v1}, Ll/nbz;->s2(Ll/clz;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic A0(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 20
    .line 21
    const-string p1, "default"

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->state:Ljava/lang/String;

    .line 24
    .line 25
    const-string p1, "\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c?"

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->title:Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "\u6211\u60f3\u53bb\u5317\u4eac\uff0c\u4e4b\u524d\u53bb\u5317\u4eac\u7684\u65f6\u5019\u6ca1\u6709\u53bb\u5929\u5b89\u95e8\u770b\u770b\uff0c\u5f88\u53ef\u60dc\uff5e"

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->answer:Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic A1(Ll/clz;ZZ)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/s7z;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/s7z;-><init>(Ll/clz;ZZ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static A2(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/h7z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/h7z;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic B(Ll/clz;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v1, Ll/o5z;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/o5z;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p0, v1}, Ll/r97;->J5(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic B0(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 22
    .line 23
    xor-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    const-wide/16 v2, -0x1

    .line 26
    .line 27
    invoke-static {v0, v1, p0, v2, v3}, Ll/nbz;->C2(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic B1(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "love_letter"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/n5z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/n5z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static B2(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/w6z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/w6z;-><init>(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic C(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "local_add_tags_guide"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic C0(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "local_send_tags_text"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic C1(Ll/clz;ZZ)V
    .locals 1

    .line 1
    new-instance v0, Ll/l7z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/l7z;-><init>(Ll/clz;ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static C2(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V
    .locals 6

    .line 1
    new-instance v0, Ll/x6z;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move-wide v4, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/x6z;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic D(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nbz$k;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/nbz$k;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u804a\u5929\u52a9\u624b\u65b0\u95ee\u9898\u5f15\u5bfc\u6d88\u606f"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/nbz$l;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/nbz$l;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u63d2\u5165\u804a\u5929-\u4e0d\u80fd\u7acb\u5373\u56de\u590d"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/nbz$m;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/nbz$m;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v1, "\u63d2\u5165\u804a\u5929-\u4e0d\u80fd\u7acb\u5373\u56de\u590d \u6e05\u7406\u6570\u636e"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/nbz$n;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/nbz$n;-><init>(Ll/clz;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "\u5220\u9664\u804a\u5929\u52a9\u624b\u65b0\u95ee\u9898\u5f15\u5bfc\u6d88\u606f"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/nbz$o;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Ll/nbz$o;-><init>(Ll/clz;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "\u63d2\u5165\u804a\u5929\u52a9\u624b\u95ee\u9898\u6d88\u606f-\u4e3b\u6001-\u4ee3\u53d1"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/nbz$p;

    .line 75
    .line 76
    invoke-direct {v0, p1}, Ll/nbz$p;-><init>(Ll/clz;)V

    .line 77
    .line 78
    .line 79
    const-string v1, "\u63d2\u5165\u804a\u5929\u52a9\u624b\u95ee\u9898\u6d88\u606f-\u4e3b\u6001"

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/nbz$q;

    .line 89
    .line 90
    invoke-direct {v0, p1}, Ll/nbz$q;-><init>(Ll/clz;)V

    .line 91
    .line 92
    .line 93
    const-string v1, "\u63d2\u5165\u804a\u5929\u52a9\u624b\u95ee\u9898\u6d88\u606f-\u5ba2\u6001"

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    new-instance v0, Ll/nbz$a;

    .line 103
    .line 104
    invoke-direct {v0, p1}, Ll/nbz$a;-><init>(Ll/clz;)V

    .line 105
    .line 106
    .line 107
    const-string v1, "\u6210\u4e3a\u963b\u585e\u914d\u5bf9"

    .line 108
    .line 109
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/nbz$b;

    .line 117
    .line 118
    invoke-direct {v0, p1}, Ll/nbz$b;-><init>(Ll/clz;)V

    .line 119
    .line 120
    .line 121
    const-string v1, "\u63d2\u5165\u963b\u585e\u6d88\u606f"

    .line 122
    .line 123
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v1, "fake conv Debug"

    .line 133
    .line 134
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sget-object v1, Ll/nbz;->e:Ll/jxd0;

    .line 138
    .line 139
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ll/nbz$c;

    .line 151
    .line 152
    invoke-direct {v1}, Ll/nbz$c;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public static synthetic D0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->new_()Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->enable:Z

    .line 7
    .line 8
    const-string v1, "wooden-fish"

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->name:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "https://static.tancdn.com/pe-webplatform/VKRa4WNsZMi1ArZrPBt_xziW.webp"

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->icon:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "http://m.staging2.p1staff.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/knockWoodenFish/index.html?speed=true&_bid=1003873&hideNavigationBar=1&hideNotch=1&unread=1&otherUserId"

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->link:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/g;->oq(Lcom/p1/mobile/putong/core/data/ChatGameInfo;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic D1(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/tcz;->z(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static D2(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    new-instance v0, Ll/a7z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/a7z;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic E(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/tcz;->F(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E0(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/tcz;->x(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic E1(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "icebreak_qa"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/p5z;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Ll/p5z;-><init>(Ll/clz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic F(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 24
    .line 25
    const-string p1, "default"

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->state:Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c?"

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->title:Ljava/lang/String;

    .line 32
    .line 33
    const-string p1, "\u6211\u60f3\u53bb\u5317\u4eac\uff0c\u4e4b\u524d\u53bb\u5317\u4eac\u7684\u65f6\u5019\u6ca1\u6709\u53bb\u5929\u5b89\u95e8\u770b\u770b\uff0c\u5f88\u53ef\u60dc\uff5e"

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->answer:Ljava/lang/String;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic F0(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0, v0}, Ll/tcz;->D(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic F1(Ll/clz;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    const/4 v2, 0x5

    .line 4
    const/4 v3, 0x2

    .line 5
    invoke-static {p0, v3, v0, v1, v2}, Ll/nbz;->y2(Ll/clz;IJI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic G()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->J1:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->I1:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->H1:Ll/vxd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->N1:Ll/vxd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->M1:Ll/byd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->L1:Ll/vxd0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 53
    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->G1:Ll/jxd0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/jxd0;->clear()Z

    .line 62
    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->K1:Ll/byd0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 71
    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->PrologueNotResponseGuideLastShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->clear()V

    .line 76
    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->ProloguesEnterChatCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->clear()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic G0(Ll/clz;Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance p1, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x1e

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    add-int/lit8 p1, p1, 0xa

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-ge v1, p1, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/nbz;->v2()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic G1(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/laz;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/laz;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u5f15\u5bfc"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic H(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u5927\u5495\u5495\u5495\u9e21"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p0, v2, v0, v1, v1}, Ll/tcz;->K(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic H0(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/tcz;->N(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic H1(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/b7z;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/b7z;-><init>(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic I(Ll/clz;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/f7z;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/f7z;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/nbz;->z2(Ljava/lang/String;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic I0(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u54c8\u54c8\u54c8\u54c8"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/tcz;->L(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic I1(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 8
    .line 9
    const-string v2, "messageDetail"

    .line 10
    .line 11
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/QuestionnaireScene;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/QuestionnaireScene;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v1, v2, v3}, Ll/icb;->c3(Lcom/p1/mobile/putong/core/data/QuestionnaireScene;Lcom/p1/mobile/putong/core/data/QuestionnaireStrategy;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/i7z;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/i7z;-><init>(Ll/clz;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/j7z;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/j7z;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic J(Ll/clz;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p0, v0, v1}, Ll/nbz;->s2(Ll/clz;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/p;->V:Ll/wyd0;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/p;->U:Ll/vxd0;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic J1(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 16
    .line 17
    const-string v2, "opened"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->owner:Ljava/lang/String;

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic K(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/c7z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/c7z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic K0()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/d3z;->w:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput-boolean v0, Ll/d3z;->w:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic K1(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/m7z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/m7z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic L(Ll/clz;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->lh(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic L0(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 16
    .line 17
    const-string v2, "default"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 28
    .line 29
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->owner:Ljava/lang/String;

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic L1(Ll/clz;)V
    .locals 3

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    const-wide/16 v1, 0x320

    .line 4
    .line 5
    invoke-static {p0, v0, v1, v2}, Ll/nbz;->x2(Ll/clz;IJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic M(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 16
    .line 17
    const-string v2, "opened"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 28
    .line 29
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->owner:Ljava/lang/String;

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic M0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M1(Ll/clz;)V
    .locals 3

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    const-wide/16 v1, 0x3e8

    .line 4
    .line 5
    invoke-static {p0, v0, v1, v2}, Ll/nbz;->x2(Ll/clz;IJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic N(Ll/clz;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "common_tip_box_v2"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/nbz$d;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/nbz$d;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic N0(Ll/clz;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    const/4 v2, 0x5

    .line 4
    const/4 v3, 0x1

    .line 5
    invoke-static {p0, v3, v0, v1, v2}, Ll/nbz;->y2(Ll/clz;IJI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic N1(Ll/clz;)V
    .locals 3

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    const-wide/16 v1, 0x5dc

    .line 4
    .line 5
    invoke-static {p0, v0, v1, v2}, Ll/nbz;->x2(Ll/clz;IJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic O(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/iaz;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/iaz;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u804a\u5929\u9875\u5f15\u5bfc"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic O0(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "icebreak_qa"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/q6z;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Ll/q6z;-><init>(Ll/clz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic O1(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 24
    .line 25
    const-string p1, "replied"

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->state:Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c?"

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->title:Ljava/lang/String;

    .line 32
    .line 33
    const-string p1, "\u6211\u60f3\u53bb\u5317\u4eac\uff0c\u4e4b\u524d\u53bb\u5317\u4eac\u7684\u65f6\u5019\u6ca1\u6709\u53bb\u5929\u5b89\u95e8\u770b\u770b\uff0c\u5f88\u53ef\u60dc\uff5e"

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->answer:Ljava/lang/String;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic P(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "icebreak_qa"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/e6z;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Ll/e6z;-><init>(Ll/clz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic P0(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/y6z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/y6z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic P1(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic Q()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Q0(ILl/clz;Ljava/lang/Object;)V
    .locals 0

    .line 1
    sget p2, Ll/nbz;->f:I

    .line 2
    .line 3
    rem-int/2addr p2, p0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/d3z;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/d3z;->n0()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    add-int/lit8 p0, p0, -0x1

    .line 25
    .line 26
    if-ne p2, p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/d3z;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/d3z;->o0()V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    sget p0, Ll/nbz;->f:I

    .line 46
    .line 47
    add-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    sput p0, Ll/nbz;->f:I

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic Q1(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/nbz;->B2(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic R(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/i8z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/i8z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic R0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->LoveLetterGuideShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->LoveLetterGuideShowCount:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic R1(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "icebreak_qa"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/u6z;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Ll/u6z;-><init>(Ll/clz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic S(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "local_invitation_for_authentication"

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic S0(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/yxz;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/yxz;->p5(Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic S1(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "local_ideal_enquiry"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/d6z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/d6z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic T(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/h5z;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/h5z;-><init>(Ll/clz;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic T0(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u79fb\u51fa\u7fa4\u6210\u5458"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Ll/tcz;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic T1(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/n7z;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/n7z;-><init>(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic U(Ll/clz;)V
    .locals 1

    .line 1
    new-instance v0, Ll/c9z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c9z;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic U0(Ll/clz;)V
    .locals 1

    .line 1
    const-string v0, "\u5237\u65b0\u4e00\u6b21"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/qzz;->j0()Ll/g900;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/l900;->y()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic U1(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/d7z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/d7z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic V(Ll/clz;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Prologue;->new_()Lcom/p1/mobile/putong/core/data/Prologue;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "\u54c8\u55bd\uff0c\u6211\u5728\u4e92\u8054\u7f51\u5de5\u4f5c\uff0c\u559c\u6b22\u8fd0\u52a8\uff0c\u4f60\u5e73\u65f6\u4e60\u60ef\u5e72\u4e9b\u4ec0\u4e48\u5462\uff1f"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Prologue;->value:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/yxz;

    .line 14
    .line 15
    filled-new-array {v0}, [Lcom/p1/mobile/putong/core/data/Prologue;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ll/yxz;->l5(Ljava/util/List;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic V0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/nbz;->a:Z

    .line 3
    .line 4
    sput-boolean v0, Ll/nbz;->b:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    sput-boolean v1, Ll/nbz;->c:Z

    .line 8
    .line 9
    sput-boolean v0, Ll/nbz;->d:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic V1(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const-string v0, "\u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\u3002"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->new_()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 24
    .line 25
    const-string p1, "replied"

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic W(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->s()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic W0(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->A()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic W1(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/nbz;->w2(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic X(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/tcz;->J(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic X0(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "love_letter"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/s5z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/s5z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/t5z;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/t5z;-><init>(Ll/clz;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic X1(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 20
    .line 21
    const-string p1, "replied"

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->state:Ljava/lang/String;

    .line 24
    .line 25
    const-string p1, "\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c\u56fd\u5e86\u5047\u671f\u4f60\u60f3\u53bb\u54ea\u4e2a\u57ce\u5e02\u65c5\u884c?"

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->title:Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "\u6211\u60f3\u53bb\u5317\u4eac\uff0c\u4e4b\u524d\u53bb\u5317\u4eac\u7684\u65f6\u5019\u6ca1\u6709\u53bb\u5929\u5b89\u95e8\u770b\u770b\uff0c\u5f88\u53ef\u60dc\uff5e"

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->answer:Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic Y(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Y0(Ll/clz;)V
    .locals 1

    .line 1
    new-instance v0, Ll/v6z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/v6z;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic Y1(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/nbz;->w2(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic Z(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "local_send_artwork_text"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic Z0(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/nbz;->B2(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic Z1(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "local_invitation_for_authentication"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a0(Ll/clz;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 8
    .line 9
    const-string v1, "love_letter_guide"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "https://auto.tancdn.com/v1/raw/b85c8506-c4f2-4c1e-b58a-d190831361e514.zip"

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "75e0a50d8f7865f421315e24a56d0573"

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "IMMEDIATE"

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/CoreGiftPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->priority:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 28
    .line 29
    const-string v1, "https://auto.tancdn.com/v1/raw/905dfc67-da0a-4ec5-8ade-1192b8efd6ef12.svga"

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, v0}, Ll/uie;->f(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 45
    .line 46
    new-instance v1, Ll/f6z;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/f6z;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a1(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/d3z;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a2(Ll/clz;)V
    .locals 1

    .line 1
    instance-of v0, p0, Ll/tvz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tvz;->Ug()Ll/jxd0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jxd0;->clear()Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/tcz;->M(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b0(Ll/clz;)V
    .locals 1

    .line 1
    new-instance v0, Ll/w5z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w5z;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b1(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/jaz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/jaz;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x1f4

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b2(Ljava/lang/String;Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 29
    .line 30
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic c(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nbz$e;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/nbz$e;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u81ea\u5df1\u7684\u98ce\u9669\u63d0\u793a"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/nbz$f;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/nbz$f;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u63d2\u5165\u522b\u4eba\u7684\u98ce\u9669\u63d0\u9192"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/nbz$g;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/nbz$g;-><init>(Ll/clz;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "\u63d2\u5165\u81ea\u5df1\u7684\u4fb5\u72af\u63d0\u793a"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/nbz$h;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/nbz$h;-><init>(Ll/clz;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "\u63d2\u5165\u522b\u4eba\u7684\u4fb5\u72af\u63d0\u9192"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic c0(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "ai_picture_query_auth"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/f5z;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Ll/f5z;-><init>(Ll/clz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic c1(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0xa

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "\u8f93\u5165\u65f6\u95f4"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/w1e$b;->r(Ljava/lang/String;)Ll/w1e$b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/r6z;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/r6z;-><init>(Ll/clz;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic c2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "\u8bbe\u7f6e\u6216\u8005\u8fd8\u539f\u5fc3\u52a8\u7c7b\u578b\uff1a"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/faz;

    .line 27
    .line 28
    invoke-direct {v1, p1}, Ll/faz;-><init>(Ll/clz;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "\u8bbe\u7f6e\u6210\u7537\u6027\u6216\u8005\u5973\u6027:"

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 52
    .line 53
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/gaz;

    .line 63
    .line 64
    invoke-direct {v1, p1}, Ll/gaz;-><init>(Ll/clz;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "\u8bbe\u7f6e\u62102\u5206\u949f\u6709\u6548\u671f :"

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 88
    .line 89
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/haz;

    .line 99
    .line 100
    invoke-direct {v1, p1}, Ll/haz;-><init>(Ll/clz;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static synthetic d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/nbz;->a:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    sput-boolean v0, Ll/nbz;->b:Z

    .line 6
    .line 7
    sput-boolean v0, Ll/nbz;->c:Z

    .line 8
    .line 9
    sput-boolean v0, Ll/nbz;->d:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d0(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/c5z;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/c5z;-><init>(Ll/clz;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic d1(Ll/clz;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p0, p1}, Ll/nbz;->A2(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d2(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/tcz;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/q7z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/q7z;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->U1:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object v1, v1, Ll/dkb;->U1:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic e1(Ll/clz;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 7
    .line 8
    iget-object v0, v0, Ll/icb;->V:Ll/byd0;

    .line 9
    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u2:Ll/icb;

    .line 24
    .line 25
    iget-object v0, v0, Ll/icb;->W:Ll/vxd0;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 34
    .line 35
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->nh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic e2(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u95ea\u804a\u63d0\u793a"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Ll/tcz;->G(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const-wide/16 v2, -0x1

    .line 17
    .line 18
    invoke-static {v0, p0, v1, v2, v3}, Ll/nbz;->C2(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic f0(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "love_letter"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/d5z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/d5z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/e5z;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/e5z;-><init>(Ll/clz;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic f1(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const-string v0, "\u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\u3002"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->new_()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 28
    .line 29
    const-string p1, "opened"

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic f2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/clz;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0, v0}, Ll/nbz;->s2(Ll/clz;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic g0(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->l()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic g1(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "love_letter"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/z5z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/z5z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/a6z;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/a6z;-><init>(Ll/clz;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic g2(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Mo(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGame;->new_()Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 24
    .line 25
    const-string v1, "\u65b0\u6e38\u620f"

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationGame;->gameText:Ljava/lang/String;

    .line 28
    .line 29
    const/16 v1, 0xa

    .line 30
    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ConversationGame;->gameUnread:I

    .line 32
    .line 33
    const-string v1, "#33b5e5"

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationGame;->gameTextColor:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "wooden-fish"

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationGame;->gameName:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic h(Ll/clz;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    const/4 v2, 0x5

    .line 4
    const/16 v3, 0x28

    .line 5
    .line 6
    invoke-static {p0, v3, v0, v1, v2}, Ll/nbz;->y2(Ll/clz;IJI)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic h0(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 16
    .line 17
    const-string v2, "opened"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 28
    .line 29
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->owner:Ljava/lang/String;

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic h1()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h2(Ll/clz;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->jh(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic i(Ll/clz;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0, v0}, Ll/nbz;->s2(Ll/clz;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic i0(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "love_letter"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/b6z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/b6z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/c6z;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/c6z;-><init>(Ll/clz;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic i1(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/k7z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/k7z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic i2(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nbz;->m2(ZLjava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i5z;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/i5z;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u4f53\u9a8c\u95ee\u5377\u6d88\u606f"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/j5z;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/j5z;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u5220\u9664\u4f53\u9a8c\u95ee\u5377\u6d88\u606f"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/k5z;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/k5z;-><init>(Ll/clz;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "\u6e05\u9664\u4f53\u9a8c\u95ee\u5377\u8be5\u4f1a\u8bdd\u663e\u793a\u8bb0\u5f55"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v1, "\u4f53\u9a8c\u95ee\u5377\u8f6e\u6570="

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    instance-of v1, p1, Ll/tvz;

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    move-object v1, p1

    .line 58
    check-cast v1, Ll/tvz;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/tvz;->Tg()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const/4 v1, 0x0

    .line 66
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/l5z;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/l5z;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 7
    .line 8
    const-string v1, "heartbeatMatch"

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 15
    .line 16
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    const-wide/32 v4, 0xea60

    .line 23
    .line 24
    .line 25
    add-long/2addr v2, v4

    .line 26
    long-to-double v2, v2

    .line 27
    iput-wide v2, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 32
    .line 33
    invoke-static {}, Ll/pzi0;->o()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    const-wide/32 v4, 0x36ee80

    .line 38
    .line 39
    .line 40
    sub-long/2addr v2, v4

    .line 41
    long-to-double v2, v2

    .line 42
    iput-wide v2, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 47
    .line 48
    iput v0, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 49
    .line 50
    const-string v0, "[\u563f\u54c8]"

    .line 51
    .line 52
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "\u4f60\u597d"

    .line 55
    .line 56
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 59
    .line 60
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic j1(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/g5z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/g5z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static bridge synthetic j2(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nbz;->q2(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic k(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oaz;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/oaz;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u4e0d\u826f\u4fe1\u606f\u5f39\u6846"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/zaz;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/zaz;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "Dialog1"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/abz;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/abz;-><init>(Ll/clz;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "Dialog2"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/bbz;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/bbz;-><init>(Ll/clz;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "Dialog3"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/cbz;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Ll/cbz;-><init>(Ll/clz;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "Dialog4"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/dbz;

    .line 75
    .line 76
    invoke-direct {v0, p1}, Ll/dbz;-><init>(Ll/clz;)V

    .line 77
    .line 78
    .line 79
    const-string v1, "Dialog5"

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/ebz;

    .line 89
    .line 90
    invoke-direct {v0, p1}, Ll/ebz;-><init>(Ll/clz;)V

    .line 91
    .line 92
    .line 93
    const-string v1, "Dialog6"

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    new-instance v0, Ll/fbz;

    .line 103
    .line 104
    invoke-direct {v0, p1}, Ll/fbz;-><init>(Ll/clz;)V

    .line 105
    .line 106
    .line 107
    const-string v1, "Dialog7"

    .line 108
    .line 109
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/gbz;

    .line 117
    .line 118
    invoke-direct {v0, p1}, Ll/gbz;-><init>(Ll/clz;)V

    .line 119
    .line 120
    .line 121
    const-string v1, "Dialog8"

    .line 122
    .line 123
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/hbz;

    .line 131
    .line 132
    invoke-direct {v0, p1}, Ll/hbz;-><init>(Ll/clz;)V

    .line 133
    .line 134
    .line 135
    const-string v1, "Dialog9"

    .line 136
    .line 137
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    new-instance v0, Ll/paz;

    .line 145
    .line 146
    invoke-direct {v0, p1}, Ll/paz;-><init>(Ll/clz;)V

    .line 147
    .line 148
    .line 149
    const-string v1, "Dialog10"

    .line 150
    .line 151
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    new-instance v0, Ll/qaz;

    .line 159
    .line 160
    invoke-direct {v0, p1}, Ll/qaz;-><init>(Ll/clz;)V

    .line 161
    .line 162
    .line 163
    const-string v1, "Dialog11"

    .line 164
    .line 165
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    new-instance v0, Ll/raz;

    .line 173
    .line 174
    invoke-direct {v0, p1}, Ll/raz;-><init>(Ll/clz;)V

    .line 175
    .line 176
    .line 177
    const-string v1, "Dialog12"

    .line 178
    .line 179
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    new-instance v0, Ll/saz;

    .line 187
    .line 188
    invoke-direct {v0, p1}, Ll/saz;-><init>(Ll/clz;)V

    .line 189
    .line 190
    .line 191
    const-string v1, "Dialog13"

    .line 192
    .line 193
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    new-instance v0, Ll/taz;

    .line 201
    .line 202
    invoke-direct {v0, p1}, Ll/taz;-><init>(Ll/clz;)V

    .line 203
    .line 204
    .line 205
    const-string v1, "Dialog14"

    .line 206
    .line 207
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    new-instance v0, Ll/uaz;

    .line 215
    .line 216
    invoke-direct {v0, p1}, Ll/uaz;-><init>(Ll/clz;)V

    .line 217
    .line 218
    .line 219
    const-string v1, "Dialog15"

    .line 220
    .line 221
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    new-instance v0, Ll/vaz;

    .line 229
    .line 230
    invoke-direct {v0, p1}, Ll/vaz;-><init>(Ll/clz;)V

    .line 231
    .line 232
    .line 233
    const-string v1, "Dialog16"

    .line 234
    .line 235
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    new-instance v0, Ll/waz;

    .line 243
    .line 244
    invoke-direct {v0, p1}, Ll/waz;-><init>(Ll/clz;)V

    .line 245
    .line 246
    .line 247
    const-string v1, "Dialog17"

    .line 248
    .line 249
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    new-instance v0, Ll/yaz;

    .line 257
    .line 258
    invoke-direct {v0, p1}, Ll/yaz;-><init>(Ll/clz;)V

    .line 259
    .line 260
    .line 261
    const-string v1, "Dialog18"

    .line 262
    .line 263
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 275
    .line 276
    .line 277
    return-void
.end method

.method public static synthetic k0(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0xa

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "\u8f93\u5165\u6df1\u5ea6"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/w1e$b;->r(Ljava/lang/String;)Ll/w1e$b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/v5z;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/v5z;-><init>(Ll/clz;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic k1(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 16
    .line 17
    const-string v2, "opened"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->owner:Ljava/lang/String;

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static k2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;",
            "Ll/clz;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k8z;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/k8z;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u63d2\u5165Ai\u6743\u9650\u9080\u8bf7"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic l(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u5927\u5927\u5495\u5495\u9e21"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1, v1, v1}, Ll/tcz;->C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/l4g0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic l0(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e9z;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/e9z;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u6807\u7b7e\u5f15\u5bfc"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/g9z;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/g9z;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u63d2\u5165\u4e66\u5f71\u5267\u5f15\u5bfc"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/h9z;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/h9z;-><init>(Ll/clz;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "\u63d2\u5165\u53d1\u9001\u6807\u7b7e\u6587\u6848\u540e\u7684\u63d0\u793a"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/i9z;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/i9z;-><init>(Ll/clz;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "\u63d2\u5165\u53d1\u9001\u4e66\u5f71\u5267\u6587\u6848\u540e\u7684\u63d0\u793a"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/j9z;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/j9z;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v1, "\u4e66\u5f71\u5267\u5f15\u5bfc\u4e00\u5929\u9650\u5236\u91cd\u7f6e"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic l1(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 16
    .line 17
    const-string v2, "default"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->owner:Ljava/lang/String;

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static l2(Lcom/p1/mobile/android/app/Act;Ll/clz;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v1, Ll/qec0;->u1:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    sget v0, Ll/edc0;->Q3:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/Button;

    .line 32
    .line 33
    sget v1, Ll/edc0;->z:I

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Landroid/widget/Button;

    .line 40
    .line 41
    sget v2, Ll/edc0;->c4:I

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Landroid/widget/Button;

    .line 48
    .line 49
    sget v3, Ll/edc0;->z4:I

    .line 50
    .line 51
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Landroid/widget/Button;

    .line 56
    .line 57
    sget v4, Ll/edc0;->q0:I

    .line 58
    .line 59
    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Landroid/widget/Button;

    .line 64
    .line 65
    sget v4, Ll/edc0;->X3:I

    .line 66
    .line 67
    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, Landroid/widget/Button;

    .line 72
    .line 73
    sget v5, Ll/edc0;->Z3:I

    .line 74
    .line 75
    invoke-virtual {p0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    check-cast v5, Landroid/widget/Button;

    .line 80
    .line 81
    sget v6, Ll/edc0;->a4:I

    .line 82
    .line 83
    invoke-virtual {p0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    check-cast v6, Landroid/widget/Button;

    .line 88
    .line 89
    sget v7, Ll/edc0;->Y3:I

    .line 90
    .line 91
    invoke-virtual {p0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Landroid/widget/Button;

    .line 96
    .line 97
    new-instance v7, Ll/h6z;

    .line 98
    .line 99
    invoke-direct {v7, p1}, Ll/h6z;-><init>(Ll/clz;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v6, v7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    new-instance v6, Ll/j6z;

    .line 106
    .line 107
    invoke-direct {v6, p1}, Ll/j6z;-><init>(Ll/clz;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p0, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Ll/k6z;

    .line 114
    .line 115
    invoke-direct {p0, p1}, Ll/k6z;-><init>(Ll/clz;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v4, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    new-instance p0, Ll/l6z;

    .line 122
    .line 123
    invoke-direct {p0, p1}, Ll/l6z;-><init>(Ll/clz;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v5, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    new-instance p0, Ll/m6z;

    .line 130
    .line 131
    invoke-direct {p0, p1}, Ll/m6z;-><init>(Ll/clz;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    new-instance p0, Ll/n6z;

    .line 138
    .line 139
    invoke-direct {p0, p1}, Ll/n6z;-><init>(Ll/clz;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    new-instance p0, Ll/o6z;

    .line 146
    .line 147
    invoke-direct {p0, p1}, Ll/o6z;-><init>(Ll/clz;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v2, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    new-instance p0, Ll/p6z;

    .line 154
    .line 155
    invoke-direct {p0, p1}, Ll/p6z;-><init>(Ll/clz;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v3, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public static synthetic m(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->d()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic m0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m1(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/qzz;->j0()Ll/g900;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/l900;->y()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static m2(ZLjava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "harass_alert"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object p0, p1

    .line 34
    :goto_0
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->new_()Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 47
    .line 48
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 51
    .line 52
    const-string v3, "default"

    .line 53
    .line 54
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->status:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "111111"

    .line 57
    .line 58
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->triggeredMsgID:Ljava/lang/String;

    .line 59
    .line 60
    long-to-double v3, v1

    .line 61
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 62
    .line 63
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 64
    .line 65
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 66
    .line 67
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 68
    .line 69
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 70
    .line 71
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-static {p0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 100
    .line 101
    const-string p0, "\u60a8\u53d1\u9001\u7684\u5185\u5bb9\u6d89\u5acc\u8fdd\u53cd<a href = \"tantan://webview?url=http://lp.tantanapp.com/rule_zh_cn/ \">\u300a\u63a2\u63a2\u884c\u4e3a\u89c4\u8303\u300b\u3002 </a>\u8bf7\u534f\u52a9\u9075\u5b88\u5e73\u53f0\u89c4\u5b9a\u548c\u793e\u4ea4\u793c\u4eea\uff0c\u611f\u8c22\u60a8\u7684\u7406\u89e3\u548c\u652f\u6301\n"

    .line 102
    .line 103
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public static synthetic n(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    const-string p0, "\u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\u3002"

    .line 10
    .line 11
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->new_()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 28
    .line 29
    const-string p1, "default"

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic n0(Ljava/lang/String;I)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    const-wide/32 v3, 0x927c0

    .line 24
    .line 25
    .line 26
    sub-long/2addr v1, v3

    .line 27
    long-to-double v1, v1

    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    long-to-double v1, v1

    .line 35
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 36
    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    long-to-double v1, v1

    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 43
    .line 44
    invoke-static {}, Ll/pzi0;->o()J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    const-wide/32 v3, 0xea60

    .line 49
    .line 50
    .line 51
    int-to-long p0, p1

    .line 52
    mul-long/2addr p0, v3

    .line 53
    add-long/2addr v1, p0

    .line 54
    long-to-double p0, v1

    .line 55
    iput-wide p0, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 56
    .line 57
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 58
    .line 59
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic n1(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static n2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;",
            "Ll/clz;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k9z;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/k9z;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u67e5\u8be2\u7406\u60f3\u578b\u95ee\u8be2"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/l9z;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/l9z;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "\u6e05\u7a7a\u7406\u60f3\u578b\u6570\u636e"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/m9z;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/m9z;-><init>(Ll/clz;)V

    .line 32
    .line 33
    .line 34
    const-string p1, "\u5f00\u573a\u767d"

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/n9z;

    .line 44
    .line 45
    invoke-direct {p1}, Ll/n9z;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v0, "\u6e05\u9664\u5f00\u573a\u767d\u5c55\u793a\u6b21\u6570"

    .line 49
    .line 50
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic o(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 22
    .line 23
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic o0(Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iwl;->v()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic o1(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/o9z;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/o9z;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u6211\u53d1\u8d77\u7684\u9080\u8bf7\u5df2\u7ecf\u63a5\u53d7"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/p9z;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/p9z;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u63d2\u5165\u5bf9\u65b9\u53d1\u8d77\u7684\u9080\u8bf7\u5df2\u7ecf\u63a5\u53d7"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/r9z;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/r9z;-><init>(Ll/clz;)V

    .line 35
    .line 36
    .line 37
    const-string v1, "\u63d2\u5165\u6211\u53d1\u8d77\u7684\u9080\u8bf7\u672a\u63a5\u53d7"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/s9z;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/s9z;-><init>(Ll/clz;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "\u63d2\u5165\u5bf9\u65b9\u53d1\u8d77\u7684\u9080\u8bf7\u672a\u63a5\u53d7"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/t9z;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Ll/t9z;-><init>(Ll/clz;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "\u5f00\u542f\u4e13\u5c5e\u63d0\u9192"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/u9z;

    .line 75
    .line 76
    invoke-direct {v0, p1}, Ll/u9z;-><init>(Ll/clz;)V

    .line 77
    .line 78
    .line 79
    const-string v1, "\u5173\u95ed\u4e13\u5c5e\u63d0\u9192"

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/v9z;

    .line 89
    .line 90
    invoke-direct {v0, p1}, Ll/v9z;-><init>(Ll/clz;)V

    .line 91
    .line 92
    .line 93
    const-string v1, "\u5f00\u59cb\u4e13\u5c5e\u804a\u5929"

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    new-instance v0, Ll/w9z;

    .line 103
    .line 104
    invoke-direct {v0, p1}, Ll/w9z;-><init>(Ll/clz;)V

    .line 105
    .line 106
    .line 107
    const-string v1, "\u5f00\u59cb\u5347\u6e29\u52a8\u753b"

    .line 108
    .line 109
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/x9z;

    .line 117
    .line 118
    invoke-direct {v0, p1}, Ll/x9z;-><init>(Ll/clz;)V

    .line 119
    .line 120
    .line 121
    const-string v1, "\u5173\u95ed\u5347\u6e29\u52a8\u753b"

    .line 122
    .line 123
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/y9z;

    .line 131
    .line 132
    invoke-direct {v0, p1}, Ll/y9z;-><init>(Ll/clz;)V

    .line 133
    .line 134
    .line 135
    const-string v1, "\u8bbe\u7f6e\u6df1\u5ea6"

    .line 136
    .line 137
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public static o2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;",
            "Ll/clz;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/aaz;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/aaz;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u5f15\u5bfc\u8ba4\u8bc1-\u9080\u8bf7-\u63d2\u5165"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/caz;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/caz;-><init>(Ll/clz;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "\u5f15\u5bfc\u8ba4\u8bc1-\u9080\u8bf7-\u5220\u9664"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/daz;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/daz;-><init>(Ll/clz;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "\u5f15\u5bfc\u8ba4\u8bc1-\u53bb\u8ba4\u8bc1-\u63d2\u5165"

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/eaz;

    .line 44
    .line 45
    invoke-direct {v0, p1}, Ll/eaz;-><init>(Ll/clz;)V

    .line 46
    .line 47
    .line 48
    const-string p1, "\u5f15\u5bfc\u8ba4\u8bc1-\u53bb\u8ba4\u8bc1-\u5220\u9664"

    .line 49
    .line 50
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic p(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/tcz;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic p0(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 22
    .line 23
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    invoke-static {v0, v1, p0, v2, v3}, Ll/nbz;->C2(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic p1(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "local_add_artwork_guide"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static p2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;",
            "Ll/clz;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l8z;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/l8z;-><init>(Ll/clz;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u60c5\u4e66\u5f15\u5bfc"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/s8z;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/s8z;-><init>(Ll/clz;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "\u63d2\u5165\u60c5\u4e66\u6d88\u606f_\u5bf9\u65b9-\u672a\u62c6"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/t8z;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/t8z;-><init>(Ll/clz;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "\u63d2\u5165\u60c5\u4e66\u6d88\u606f_\u6211\u65b9-\u672a\u62c6"

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/v8z;

    .line 44
    .line 45
    invoke-direct {v0, p1}, Ll/v8z;-><init>(Ll/clz;)V

    .line 46
    .line 47
    .line 48
    const-string v1, "\u63d2\u5165\u60c5\u4e66\u6d88\u606f_\u5bf9\u65b9-\u5df2\u62c6"

    .line 49
    .line 50
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/w8z;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/w8z;-><init>(Ll/clz;)V

    .line 60
    .line 61
    .line 62
    const-string v1, "\u63d2\u5165\u60c5\u4e66\u6d88\u606f_\u6211\u65b9-\u5df2\u62c6"

    .line 63
    .line 64
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/x8z;

    .line 72
    .line 73
    invoke-direct {v0, p1}, Ll/x8z;-><init>(Ll/clz;)V

    .line 74
    .line 75
    .line 76
    const-string v1, "\u60c5\u4e66\u66f4\u65b0Conversation_\u6211\u65b9-\u5df2\u62c6"

    .line 77
    .line 78
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/y8z;

    .line 86
    .line 87
    invoke-direct {v0, p1}, Ll/y8z;-><init>(Ll/clz;)V

    .line 88
    .line 89
    .line 90
    const-string v1, "\u60c5\u4e66\u66f4\u65b0Conversation_\u5bf9\u65b9-\u5df2\u62c6"

    .line 91
    .line 92
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    new-instance v0, Ll/z8z;

    .line 100
    .line 101
    invoke-direct {v0, p1}, Ll/z8z;-><init>(Ll/clz;)V

    .line 102
    .line 103
    .line 104
    const-string v1, "\u63d2\u5165\u60c5\u4e66\u6d88\u606f_\u5df2\u56de\u590d"

    .line 105
    .line 106
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    new-instance v0, Ll/a9z;

    .line 114
    .line 115
    invoke-direct {v0, p1}, Ll/a9z;-><init>(Ll/clz;)V

    .line 116
    .line 117
    .line 118
    const-string v1, "\u60c5\u4e66\u5f15\u5bfc\u52a8\u753b"

    .line 119
    .line 120
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    new-instance v0, Ll/b9z;

    .line 128
    .line 129
    invoke-direct {v0, p1}, Ll/b9z;-><init>(Ll/clz;)V

    .line 130
    .line 131
    .line 132
    const-string v1, "\u60c5\u4e66\u8ba4\u8bc1"

    .line 133
    .line 134
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    new-instance v0, Ll/m8z;

    .line 142
    .line 143
    invoke-direct {v0}, Ll/m8z;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v1, "\u60c5\u4e66\u6a21\u62df\u5237\u65b0\u5165\u53e3"

    .line 147
    .line 148
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    new-instance v0, Ll/n8z;

    .line 156
    .line 157
    invoke-direct {v0}, Ll/n8z;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string v1, "\u6e05\u7a7a\u60c5\u4e66\u6570\u636e"

    .line 161
    .line 162
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    new-instance v0, Ll/o8z;

    .line 170
    .line 171
    invoke-direct {v0, p1}, Ll/o8z;-><init>(Ll/clz;)V

    .line 172
    .line 173
    .line 174
    const-string v1, "\u63d2\u5165\u4ea4\u6362\u7b54\u6848-\u81ea\u5df1-\u5bf9\u65b9\u672a\u56de\u590d"

    .line 175
    .line 176
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    new-instance v0, Ll/p8z;

    .line 184
    .line 185
    invoke-direct {v0, p1}, Ll/p8z;-><init>(Ll/clz;)V

    .line 186
    .line 187
    .line 188
    const-string v1, "\u63d2\u5165\u4ea4\u6362\u7b54\u6848-\u81ea\u5df1-\u5bf9\u65b9\u5df2\u56de\u590d"

    .line 189
    .line 190
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    new-instance v0, Ll/q8z;

    .line 198
    .line 199
    invoke-direct {v0, p1}, Ll/q8z;-><init>(Ll/clz;)V

    .line 200
    .line 201
    .line 202
    const-string v1, "\u63d2\u5165\u4ea4\u6362\u7b54\u6848-\u5bf9\u65b9-\u81ea\u5df1\u672a\u56de\u7b54"

    .line 203
    .line 204
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    new-instance v0, Ll/r8z;

    .line 212
    .line 213
    invoke-direct {v0, p1}, Ll/r8z;-><init>(Ll/clz;)V

    .line 214
    .line 215
    .line 216
    const-string p1, "\u63d2\u5165\u4ea4\u6362\u7b54\u6848-\u5bf9\u65b9-\u81ea\u5df1\u5df2\u56de\u7b54"

    .line 217
    .line 218
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public static synthetic q(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    const-string v0, "{\"fitIdeals\":[{\"id\":1,\"name\":\"\u6027\u683c\u597d\"},{\"id\":2,\"name\":\"\u54c8\u54c8\u54c8\"},{\"id\":3,\"name\":\"\u7231\u7c98\u4eba\"},{\"id\":4,\"name\":\"\u8eab\u6750\u597d\"},{\"id\":5,\"name\":\"\u7231\u7761\u89c9\"},{\"id\":6,\"name\":\"\u5927\u80c3\u738b\"}],\"fitIdealDetails\":[{\"id\":1,\"name\":\"180cm\"},{\"id\":1,\"name\":\"\u4eba\u95f4\u6e29\u67d4\"}],\"highlightProfiles\":{\"profile\":[\"height\",\"university\"],\"tags\":[{\"id\":1,\"name\":\"\u4eba\u95f4\u6e29\u67d4\"},{\"id\":1,\"name\":\"\u4eba\u95f4\u6e29\u67d4\"}]},\"highlightIdeals\":[{\"id\":1,\"name\":\"\u6027\u683c\u597d\"}],\"targetFitIdeals\":[{\"id\":1,\"name\":\"\u6027\u683c\u597d\"}]}"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IdealInfo;->toJson()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    :catch_0
    return-void
.end method

.method public static synthetic q0(Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/tcz;->y(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q1(Ljava/util/ArrayList;Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nbz$i;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/nbz$i;-><init>(Ll/clz;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63d2\u5165\u53d1\u9001\u65b9\u6d88\u606f\u63d0\u9192"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/nbz$j;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/nbz$j;-><init>(Ll/clz;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u63d2\u5165\u63a5\u53d7\u65b9\u6d88\u606f\u63d0\u9192"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static q2(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageExtData;->new_()Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatTips;->new_()Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 16
    .line 17
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->new_()Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "\u6ce8\u610f\uff1a\u68c0\u6d4b\u5230\u5bf9\u65b9\u53ef\u80fd\u4f7f\u7528\u5176\u4ed6\u6e20\u9053\u8bc8\u9a97\uff0c\u5e7f\u544a\u7b49\u4e0d\u826f\u884c\u4e3a\uff0c\u8bf7\u52ff\u8f7b\u4fe1\u3002\u4f60\u53ef\u5728\u53f3\u4e0a\u89d2\u89e3\u9664\u914d\u5bf9\u5e76<a href = \"tantan://msgReport?uid="

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "&conType=hitModelMessage&value=severeAd\">\u533f\u540d\u4e3e\u62a5</a>\u3002"

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->new_()Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 54
    .line 55
    const-string p1, "\u60a8\u53d1\u9001\u7684\u5185\u5bb9\u6d89\u5acc\u8fdd\u53cd<a href = \"tantan://webview?url=http://lp.tantanapp.com/rule_zh_cn/\">\u300a\u63a2\u63a2\u884c\u4e3a\u89c4\u8303\u300b\u3002 </a>\u8bf7\u534f\u52a9\u9075\u5b88\u5e73\u53f0\u89c4\u5b9a\u548c\u793e\u4ea4\u793c\u4eea\uff0c\u611f\u8c22\u60a8\u7684\u7406\u89e3\u548c\u652f\u6301\n"

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 58
    .line 59
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic r(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    const-string p0, "\u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\u3002"

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->new_()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 24
    .line 25
    const-string p1, "default"

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic r0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic r1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/nbz;->a:Z

    .line 3
    .line 4
    sput-boolean v0, Ll/nbz;->b:Z

    .line 5
    .line 6
    sput-boolean v0, Ll/nbz;->c:Z

    .line 7
    .line 8
    sput-boolean v0, Ll/nbz;->d:Z

    .line 9
    .line 10
    return-void
.end method

.method public static r2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;",
            "Ll/clz;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h8z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/h8z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u98ce\u9669\u63d0\u9192\u6d88\u606f"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic s(Ll/clz;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    const-string v1, "\u7ea6\u5417"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Ll/u1z;->q2(Landroid/text/Editable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "heartbeatMatch"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "default"

    .line 11
    .line 12
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 17
    .line 18
    iput-boolean p2, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 19
    .line 20
    const-wide/16 v0, -0x1

    .line 21
    .line 22
    cmp-long p2, p3, v0

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide p2

    .line 30
    const-wide/32 v0, 0x5265c00

    .line 31
    .line 32
    .line 33
    add-long/2addr p2, v0

    .line 34
    long-to-double p2, p2

    .line 35
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 39
    .line 40
    .line 41
    move-result-wide p2

    .line 42
    const-wide/32 v0, 0x927c0

    .line 43
    .line 44
    .line 45
    add-long/2addr p2, v0

    .line 46
    long-to-double p2, p2

    .line 47
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 48
    .line 49
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide p2

    .line 57
    const-wide/32 v0, 0x36ee80

    .line 58
    .line 59
    .line 60
    sub-long/2addr p2, v0

    .line 61
    long-to-double p2, p2

    .line 62
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 65
    .line 66
    iget-object p1, p1, Ll/il8;->m:Ll/mm6;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static synthetic s1(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "local_love_letter_guide"

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/u5z;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/u5z;-><init>(Ll/clz;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static s2(Ll/clz;ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/r5z;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/r5z;-><init>(Ll/clz;ZZ)V

    .line 8
    .line 9
    .line 10
    const-wide/16 p0, 0x3e8

    .line 11
    .line 12
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic t()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/nbz;->a:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    sput-boolean v1, Ll/nbz;->b:Z

    .line 6
    .line 7
    sput-boolean v0, Ll/nbz;->c:Z

    .line 8
    .line 9
    sput-boolean v0, Ll/nbz;->d:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic t0(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "common_tip_box_v2"

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic t1(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/y5z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/y5z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static t2(Ljava/util/ArrayList;Ll/clz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;",
            "Ll/clz;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/naz;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/naz;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u4f53\u9a8c\u95ee\u5377"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic u(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const-string v0, "\u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\u3002\n \u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong \n \u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\n \u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\n \u4f60 \u6839\u672c\u5c31\u4e0d\u7231\u6211\uff0c\u4f60\u8ddf\u672c\u5c31\u4e0ddong\u7231\u60c5\uff0chuo\u8bb8\u6211\u4e5f\u4e0ddong\n"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->new_()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 24
    .line 25
    const-string p1, "opened"

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic u0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->m3:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic u1(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/z9z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/z9z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x1f4

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static u2(Ll/clz;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/clz;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/b5z;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/b5z;-><init>(Ll/clz;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "list layout"

    .line 12
    .line 13
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/x5z;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/x5z;-><init>(Ll/clz;)V

    .line 23
    .line 24
    .line 25
    const-string v2, "\u6e05\u7a7a\u7126\u70b9"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "\u5f3a\u5236\u5f00\u59cb\u5173\u95ed\u8bed\u97f3\u6c14\u6ce1\uff1a"

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-boolean v2, Ll/d3z;->w:Z

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    new-instance v2, Ll/z7z;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/z7z;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/a8z;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/a8z;-><init>(Ll/clz;)V

    .line 65
    .line 66
    .line 67
    const-string v2, "\u5c55\u793a\u8ba4\u8bc1\u6c14\u6ce1\uff1a"

    .line 68
    .line 69
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    new-instance v1, Ll/b8z;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/b8z;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v2, "\u6e05\u9664\u901a\u77e5\u63d0\u793a\uff1a"

    .line 82
    .line 83
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    new-instance v1, Ll/c8z;

    .line 91
    .line 92
    invoke-direct {v1}, Ll/c8z;-><init>()V

    .line 93
    .line 94
    .line 95
    const-string v2, "\u6253\u5f00\u901a\u77e5\u63d0\u793a1\uff1a"

    .line 96
    .line 97
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    new-instance v1, Ll/d8z;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/d8z;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v2, "\u6253\u5f00\u901a\u77e5\u63d0\u793a2\uff1a"

    .line 110
    .line 111
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance v1, Ll/e8z;

    .line 119
    .line 120
    invoke-direct {v1}, Ll/e8z;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v2, "\u6253\u5f00\u901a\u77e5\u63d0\u793a3\uff1a"

    .line 124
    .line 125
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    new-instance v1, Ll/f8z;

    .line 133
    .line 134
    invoke-direct {v1}, Ll/f8z;-><init>()V

    .line 135
    .line 136
    .line 137
    const-string v2, "\u6253\u5f00\u901a\u77e5\u63d0\u793a4\uff1a"

    .line 138
    .line 139
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    new-instance v1, Ll/g8z;

    .line 147
    .line 148
    invoke-direct {v1, p0}, Ll/g8z;-><init>(Ll/clz;)V

    .line 149
    .line 150
    .line 151
    const-string v2, "\u8fde\u7eed\u53d1\u9001\u8bed\u97f320X1500"

    .line 152
    .line 153
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    new-instance v1, Ll/y7z;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/y7z;-><init>(Ll/clz;)V

    .line 163
    .line 164
    .line 165
    const-string v2, "\u8fde\u7eed\u53d1\u9001\u8bed\u97f340X1000"

    .line 166
    .line 167
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    new-instance v1, Ll/j8z;

    .line 175
    .line 176
    invoke-direct {v1, p0}, Ll/j8z;-><init>(Ll/clz;)V

    .line 177
    .line 178
    .line 179
    const-string v2, "\u8fde\u7eed\u53d1\u9001\u8bed\u97f340X800"

    .line 180
    .line 181
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    new-instance v1, Ll/u8z;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/u8z;-><init>(Ll/clz;)V

    .line 191
    .line 192
    .line 193
    const-string v2, "\u8fde\u7eed\u53d1\u9001\u8bed\u97f340X800\uff0c\u5feb\u901f\u653e\u5f00"

    .line 194
    .line 195
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    new-instance v1, Ll/f9z;

    .line 203
    .line 204
    invoke-direct {v1, p0}, Ll/f9z;-><init>(Ll/clz;)V

    .line 205
    .line 206
    .line 207
    const-string v2, "\u8fde\u7eed\u53d1\u9001\u8bed\u97f31X200\uff0c\u5feb\u901f\u653e\u5f00"

    .line 208
    .line 209
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    new-instance v1, Ll/q9z;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/q9z;-><init>(Ll/clz;)V

    .line 219
    .line 220
    .line 221
    const-string v2, "\u8fde\u7eed\u53d1\u9001\u8bed\u97f32X200\uff0c\u5feb\u901f\u653e\u5f00"

    .line 222
    .line 223
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    new-instance v1, Ll/baz;

    .line 231
    .line 232
    invoke-direct {v1, v0, p0}, Ll/baz;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 233
    .line 234
    .line 235
    const-string v2, "\u6d88\u606f\u76f8\u5173\u5f39\u6846"

    .line 236
    .line 237
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    new-instance v1, Ll/maz;

    .line 245
    .line 246
    invoke-direct {v1, v0, p0}, Ll/maz;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 247
    .line 248
    .line 249
    const-string v2, "\u5fc3\u52a8\u4fe1\u53f7\u76f8\u5173"

    .line 250
    .line 251
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    new-instance v1, Ll/xaz;

    .line 259
    .line 260
    invoke-direct {v1, p0}, Ll/xaz;-><init>(Ll/clz;)V

    .line 261
    .line 262
    .line 263
    const-string v2, "notify delay 5s"

    .line 264
    .line 265
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    new-instance v1, Ll/ibz;

    .line 273
    .line 274
    invoke-direct {v1, p0}, Ll/ibz;-><init>(Ll/clz;)V

    .line 275
    .line 276
    .line 277
    const-string v2, "\u6253\u5f00TantanList\u6d4b\u8bd5\u4efb\u52a1"

    .line 278
    .line 279
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    new-instance v1, Ll/m5z;

    .line 287
    .line 288
    invoke-direct {v1}, Ll/m5z;-><init>()V

    .line 289
    .line 290
    .line 291
    const-string v2, "\u6253\u5f00\u6e38\u620f\u5165\u53e3"

    .line 292
    .line 293
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    new-instance v1, Ll/i6z;

    .line 301
    .line 302
    invoke-direct {v1, p0}, Ll/i6z;-><init>(Ll/clz;)V

    .line 303
    .line 304
    .line 305
    const-string v2, "\u4fee\u6539\u6e38\u620f\u4fe1\u606f"

    .line 306
    .line 307
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    new-instance v1, Ll/t6z;

    .line 315
    .line 316
    invoke-direct {v1}, Ll/t6z;-><init>()V

    .line 317
    .line 318
    .line 319
    const-string v2, "\u6e05\u9664\u6e38\u620f\u7ea2\u70b9"

    .line 320
    .line 321
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    new-instance v1, Ll/e7z;

    .line 329
    .line 330
    invoke-direct {v1, v0, p0}, Ll/e7z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 331
    .line 332
    .line 333
    const-string v2, "\u5fc3\u52a8\u4fe1\u53f7\u5f15\u5bfc\u6807\u7b7e"

    .line 334
    .line 335
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    new-instance v1, Ll/p7z;

    .line 343
    .line 344
    invoke-direct {v1, v0, p0}, Ll/p7z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 345
    .line 346
    .line 347
    const-string v2, "\u914d\u5bf9\u5f15\u5bfc\u5bf9\u8bdd"

    .line 348
    .line 349
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    new-instance v1, Ll/u7z;

    .line 357
    .line 358
    invoke-direct {v1, v0, p0}, Ll/u7z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 359
    .line 360
    .line 361
    const-string v2, "\u5347\u6e29"

    .line 362
    .line 363
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    new-instance v1, Ll/v7z;

    .line 371
    .line 372
    invoke-direct {v1, v0, p0}, Ll/v7z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 373
    .line 374
    .line 375
    const-string v2, "\u5f15\u5bfc\u6dfb\u52a0\u6807\u7b7e\u53ca\u4e66\u5f71\u5267"

    .line 376
    .line 377
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    new-instance v1, Ll/w7z;

    .line 385
    .line 386
    invoke-direct {v1, v0, p0}, Ll/w7z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 387
    .line 388
    .line 389
    const-string v2, "\u72b6\u6001\u4ee3\u53d1"

    .line 390
    .line 391
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    new-instance v1, Ll/x7z;

    .line 399
    .line 400
    invoke-direct {v1, v0, p0}, Ll/x7z;-><init>(Ljava/util/ArrayList;Ll/clz;)V

    .line 401
    .line 402
    .line 403
    const-string v2, "\u804a\u5929\u52a9\u624b"

    .line 404
    .line 405
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    invoke-static {v0, p0}, Ll/nbz;->r2(Ljava/util/ArrayList;Ll/clz;)V

    .line 413
    .line 414
    .line 415
    invoke-static {v0, p0}, Ll/nbz;->k2(Ljava/util/ArrayList;Ll/clz;)V

    .line 416
    .line 417
    .line 418
    invoke-static {v0, p0}, Ll/nbz;->n2(Ljava/util/ArrayList;Ll/clz;)V

    .line 419
    .line 420
    .line 421
    invoke-static {v0, p0}, Ll/nbz;->t2(Ljava/util/ArrayList;Ll/clz;)V

    .line 422
    .line 423
    .line 424
    invoke-static {v0, p0}, Ll/nbz;->p2(Ljava/util/ArrayList;Ll/clz;)V

    .line 425
    .line 426
    .line 427
    invoke-static {v0, p0}, Ll/nbz;->o2(Ljava/util/ArrayList;Ll/clz;)V

    .line 428
    .line 429
    .line 430
    return-object v0
.end method

.method public static synthetic v(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/kaz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/kaz;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x9c4

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic v0(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    new-instance p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterContent;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v0, "\u5199\u5c01\u60c5\u4e66\u7ed9\u4ed6\u5427"

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->title:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "\u4f60\u4eec\u6700\u8fd1\u804a\u5929\u9891\u7e41\uff0c\u5199\u5c01\u60c5\u4e66\u8868\u8fbe\u4f60\u7684\u5fc3\u610f"

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->subTitle:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->toJson()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic v1(Ll/clz;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Ll/nbz;->l2(Lcom/p1/mobile/android/app/Act;Ll/clz;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static v2()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x27

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/lit16 v1, v1, 0xb0

    .line 17
    .line 18
    const/16 v2, 0x61

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/lit16 v0, v0, 0xa1

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/Integer;->byteValue()B

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/Integer;->byteValue()B

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v2, 0x2

    .line 47
    new-array v2, v2, [B

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    aput-byte v1, v2, v3

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    aput-byte v0, v2, v1

    .line 54
    .line 55
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, "GBK"

    .line 58
    .line 59
    invoke-direct {v0, v2, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-object v0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    const-string v0, "a"

    .line 68
    .line 69
    return-object v0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V
    .locals 7

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/r7z;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move v3, p1

    .line 9
    move v4, p2

    .line 10
    move-wide v5, p3

    .line 11
    invoke-direct/range {v1 .. v6}, Ll/r7z;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic w0(Ll/clz;ZZ)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "exclusive_chat_invite"

    .line 30
    .line 31
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 36
    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    long-to-double v2, v2

    .line 42
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    :goto_0
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 83
    .line 84
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 85
    .line 86
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->new_()Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 97
    .line 98
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 99
    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {}, Ll/pzi0;->o()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    long-to-double v1, v1

    .line 107
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 108
    .line 109
    invoke-static {}, Ll/pzi0;->o()J

    .line 110
    .line 111
    .line 112
    move-result-wide v1

    .line 113
    const-wide/32 v3, 0xafc80

    .line 114
    .line 115
    .line 116
    add-long/2addr v1, v3

    .line 117
    long-to-double v1, v1

    .line 118
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 119
    .line 120
    const/16 p1, 0xa

    .line 121
    .line 122
    iput p1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 123
    .line 124
    if-eqz p2, :cond_1

    .line 125
    .line 126
    invoke-static {}, Ll/pzi0;->o()J

    .line 127
    .line 128
    .line 129
    move-result-wide p1

    .line 130
    long-to-double p1, p1

    .line 131
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 132
    .line 133
    invoke-static {}, Ll/pzi0;->o()J

    .line 134
    .line 135
    .line 136
    move-result-wide p1

    .line 137
    add-long/2addr p1, v3

    .line 138
    long-to-double p1, p1

    .line 139
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatEndTime:D

    .line 140
    .line 141
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 142
    .line 143
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public static synthetic w1(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/g7z;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/g7z;-><init>(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static w2(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/q5z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/q5z;-><init>(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic x(Ljava/lang/String;Ll/y20;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/t7z;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/t7z;-><init>(Ljava/lang/String;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic x0(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/z6z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/z6z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic x1(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/s6z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/s6z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static x2(Ll/clz;IJ)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Ll/nbz;->y2(Ll/clz;IJI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic y(Ll/clz;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "local_ux_questionnaire"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "local_ux_questionnaire_tip"

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic y0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/nbz;->a:Z

    .line 3
    .line 4
    sput-boolean v0, Ll/nbz;->b:Z

    .line 5
    .line 6
    sput-boolean v0, Ll/nbz;->c:Z

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    sput-boolean v0, Ll/nbz;->d:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic y1(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/g6z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/g6z;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static y2(Ll/clz;IJI)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Ll/nbz;->f:I

    .line 3
    .line 4
    mul-int/2addr p1, p4

    .line 5
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-static {p2, p3, v0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p2, p3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2, p1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Ll/d9z;

    .line 32
    .line 33
    invoke-direct {p2, p4, p0}, Ll/d9z;-><init>(ILl/clz;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic z(Ll/clz;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 27
    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/String;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-static {p0, p1, v0}, Ll/tcz;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method public static synthetic z0(Ll/clz;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 27
    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/String;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0, p1}, Ll/tcz;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public static synthetic z1(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 22
    .line 23
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static z2(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/o7z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/o7z;-><init>(Ljava/lang/String;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
