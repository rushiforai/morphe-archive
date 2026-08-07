.class public final Ll/q0e0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u001d\u0010\n\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ-\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u000e\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\u000c\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001d\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0011\u0010\u000bJ\u001d\u0010\u0012\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0012\u0010\u000b\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/q0e0;",
        "",
        "<init>",
        "()V",
        "",
        "l",
        "Lcom/p1/mobile/android/app/Act;",
        "context",
        "Lcom/p1/mobile/putong/core/ui/greet/d$a;",
        "builder",
        "g",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V",
        "Ll/y20;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "afterPaySuccess",
        "h",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;Ll/y20;)V",
        "k",
        "f",
        "message_intlGmsRelease"
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
.field public static final INSTANCE:Ll/q0e0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/q0e0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q0e0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/q0e0;->INSTANCE:Ll/q0e0;

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

.method public static a(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object p2, v0

    .line 17
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 30
    .line 31
    :cond_1
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->f()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->r(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 50
    .line 51
    .line 52
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    invoke-static {}, Ll/joa;->B3()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_4

    .line 61
    .line 62
    new-instance v0, Ll/vzd0;

    .line 63
    .line 64
    const/4 v4, 0x4

    .line 65
    const/4 v5, 0x0

    .line 66
    const/4 v3, 0x0

    .line 67
    move-object v2, p0

    .line 68
    move-object v1, p1

    .line 69
    invoke-direct/range {v0 .. v5}, Ll/vzd0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ll/vzd0;->show()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_4
    move-object v2, p0

    .line 77
    move-object v1, p1

    .line 78
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_5

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    :goto_1
    move-object v2, p0

    .line 96
    goto :goto_3

    .line 97
    :cond_5
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 98
    .line 99
    const-string p0, "card"

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-nez p0, :cond_6

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    goto :goto_2

    .line 116
    :cond_6
    const-string p0, "p_suggest_users_home_view"

    .line 117
    .line 118
    :goto_2
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const/4 p1, 0x1

    .line 123
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const-string p1, "%s,e_send_message,click"

    .line 128
    .line 129
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    goto :goto_1

    .line 134
    :goto_3
    invoke-static {}, Ll/joa;->I3()Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_7

    .line 139
    .line 140
    const-string p0, "\u4eca\u5929\u7684\u62a2\u5148\u544a\u767d\u5df2\u7528\u5b8c"

    .line 141
    .line 142
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->confession_first:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 155
    .line 156
    const/4 v4, 0x0

    .line 157
    const/4 v5, 0x0

    .line 158
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ds(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/q0e0;->i(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p2, 0x0

    .line 16
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->r(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 23
    .line 24
    .line 25
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/q0e0;->j(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p3, :cond_0

    .line 3
    .line 4
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    check-cast p3, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object p3, v0

    .line 17
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->f()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    sget-object v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 36
    .line 37
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    new-instance v1, Ll/m0e0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/m0e0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_4

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 64
    .line 65
    :cond_2
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    if-eqz p3, :cond_3

    .line 72
    .line 73
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 74
    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->f()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 82
    .line 83
    :cond_3
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->r(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 84
    .line 85
    .line 86
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    invoke-static {}, Ll/joa;->N3()Z

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    if-nez p3, :cond_8

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    invoke-interface {p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    if-eqz p3, :cond_5

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    if-nez p3, :cond_6

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_6
    sget-object p3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 126
    .line 127
    const-string p3, "card"

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    if-nez p3, :cond_7

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    goto :goto_1

    .line 144
    :cond_7
    const-string p0, "p_suggest_users_home_view"

    .line 145
    .line 146
    :goto_1
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    const/4 p3, 0x1

    .line 151
    invoke-static {p0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    const-string p3, "%s,e_send_message,click"

    .line 156
    .line 157
    invoke-static {p3, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->say_hi_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 170
    .line 171
    invoke-interface {p3, p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_8
    :goto_3
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 176
    .line 177
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    if-eqz p2, :cond_9

    .line 186
    .line 187
    new-instance v0, Ll/vzd0;

    .line 188
    .line 189
    const/4 v4, 0x4

    .line 190
    const/4 v5, 0x0

    .line 191
    const/4 v3, 0x0

    .line 192
    move-object v2, p0

    .line 193
    move-object v1, p1

    .line 194
    invoke-direct/range {v0 .. v5}, Ll/vzd0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Ll/vzd0;->show()V

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :cond_9
    move-object v2, p0

    .line 202
    move-object v1, p1

    .line 203
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/ui/greet/d;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public static final i(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/o0e0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/o0e0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static final j(Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->xm(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 8
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/greet/d$a;
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
    invoke-static {}, Ll/joa;->Q3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    :goto_0
    move-object v2, p0

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 33
    .line 34
    const-string p0, "card"

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const-string p0, "p_suggest_users_home_view"

    .line 52
    .line 53
    :goto_1
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 p2, 0x1

    .line 58
    invoke-static {p0, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p2, "%s,e_send_message,click"

    .line 63
    .line 64
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_0

    .line 69
    :goto_2
    invoke-static {}, Ll/joa;->P3()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    const-string p0, "\u4eca\u65e5\u6b21\u6570\u5df2\u7528\u5b8c\uff0c\u660e\u5929\u518d\u6765\u5427"

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->youth_find_partner:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 90
    .line 91
    const/4 v6, 0x0

    .line 92
    const/4 v7, 0x0

    .line 93
    const/4 v4, 0x0

    .line 94
    const/4 v5, 0x0

    .line 95
    move-object v1, p1

    .line 96
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Qs(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_3
    move-object v1, p1

    .line 101
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 104
    .line 105
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    const/4 v0, 0x0

    .line 110
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/j;->p5(Ljava/lang/String;Z)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance p1, Ll/if00;

    .line 119
    .line 120
    invoke-direct {p1}, Ll/if00;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    new-instance p1, Ll/p0e0;

    .line 128
    .line 129
    invoke-direct {p1, p2, v1}, Ll/p0e0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/greet/d$a;
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
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0}, Ll/q0e0;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;Ll/y20;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/greet/d$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/ui/greet/d$a;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/j;->p5(Ljava/lang/String;Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/if00;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/if00;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/l0e0;

    .line 34
    .line 35
    invoke-direct {v0, p2, p1, p3}, Ll/l0e0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/greet/d$a;
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
    invoke-static {}, Ll/joa;->B3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    :goto_0
    move-object v2, p0

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 33
    .line 34
    const-string p0, "card"

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const-string p0, "p_suggest_users_home_view"

    .line 52
    .line 53
    :goto_1
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 p2, 0x1

    .line 58
    invoke-static {p0, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p2, "%s,e_send_message,click"

    .line 63
    .line 64
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_0

    .line 69
    :goto_2
    invoke-static {}, Ll/joa;->I3()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    const-string p0, "\u4eca\u5929\u7684\u62a2\u5148\u544a\u767d\u5df2\u7528\u5b8c"

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->confession_first:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 90
    .line 91
    const/4 v4, 0x0

    .line 92
    const/4 v5, 0x0

    .line 93
    move-object v1, p1

    .line 94
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ds(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    move-object v1, p1

    .line 99
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 102
    .line 103
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    const/4 v0, 0x0

    .line 108
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/j;->p5(Ljava/lang/String;Z)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance p1, Ll/if00;

    .line 117
    .line 118
    invoke-direct {p1}, Ll/if00;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    new-instance p1, Ll/n0e0;

    .line 126
    .line 127
    invoke-direct {p1, p2, v1}, Ll/n0e0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    const-string v0, "https://static.tancdn.com/pe-webplatform/6Vkj-PyPISwgtkC-5PLdu3Q4.webp"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
