.class public Lcom/p1/mobile/putong/core/api/CoreInnerPush;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;,
        Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;,
        Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->a:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->b:Ljava/util/HashMap;

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->c:Ljava/util/HashSet;

    .line 23
    .line 24
    const-wide/16 v0, -0x1

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->d:J

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->d:J

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public d()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->o8(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;->NEW_MSG:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c(Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->a:Lrx/subjects/b;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->da(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->a:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

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
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    new-instance v1, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "sender_name"

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string p2, "match_id"

    .line 39
    .line 40
    invoke-virtual {v1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    const-string p2, "msg_type"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 53
    .line 54
    const-string p1, "Receive new message"

    .line 55
    .line 56
    invoke-virtual {p0, p1, v1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v0, "text"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 13
    .line 14
    const-string v0, "audio"

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    const-string v0, "picture"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const-string p0, "photo"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 37
    .line 38
    const-string p1, "video"

    .line 39
    .line 40
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    return-object p1

    .line 47
    :cond_3
    const-string p0, "others"

    .line 48
    .line 49
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    const-wide v2, 0x12a05f200L

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-ltz v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->d:J

    .line 27
    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    cmp-long v2, v0, v2

    .line 31
    .line 32
    if-lez v2, :cond_2

    .line 33
    .line 34
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 35
    .line 36
    long-to-double v0, v0

    .line 37
    cmpg-double v0, v2, v0

    .line 38
    .line 39
    if-gez v0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->b:Ljava/util/HashMap;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->b:Ljava/util/HashMap;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 63
    .line 64
    const-string v1, "picture_compliment"

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    const-string v1, "free"

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->type:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/4 v1, 0x1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/h49;

    .line 125
    .line 126
    invoke-direct {v1, p0, p1}, Ll/h49;-><init>(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    :cond_5
    :goto_0
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/g49;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/g49;-><init>(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 9
    .line 10
    const-string v1, "\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001\u6d88\u606f\u5df2\u53d1\u9001"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->a:Lrx/subjects/b;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public l()V
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b(Z)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 8
    .line 9
    .line 10
    const-string v1, "test_countdown"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    const-wide/16 v4, 0xa

    .line 24
    .line 25
    rem-long/2addr v2, v4

    .line 26
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, ""

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "\u7279\u9080\u5609\u5bbe \u5df2\u5e2e\u4f60\u627e\u5230\u6709\u7f18\u7684\u5979\uff0c\u5feb\u53bb\u770b\u770b\u5427"

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "\u7279\u9080\u5609\u5bbe"

    .line 45
    .line 46
    filled-new-array {v2}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-string v3, "#ff5c31"

    .line 55
    .line 56
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x2

    .line 61
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-static {v1, v2, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;->COUNTDOWN_CONV_CREATE:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a(Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 78
    .line 79
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 80
    .line 81
    sget-object v4, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 82
    .line 83
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 84
    .line 85
    filled-new-array {v2, v3, v4, v5}, [Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d(Ljava/util/List;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 94
    .line 95
    .line 96
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 99
    .line 100
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->a:Lrx/subjects/b;

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->c:Ljava/util/HashSet;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 37
    .line 38
    const-string v1, "picture_compliment"

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->c:Ljava/util/HashSet;

    .line 48
    .line 49
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/i49;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1}, Ll/i49;-><init>(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    :cond_4
    :goto_0
    return-void
.end method
