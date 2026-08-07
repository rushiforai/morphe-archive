.class public Lcom/p1/mobile/putong/core/api/y;
.super Lcom/p1/mobile/putong/core/api/a;
.source "SourceFile"


# static fields
.field public static Q:Z

.field public static R:Z

.field public static S:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z2(ZZZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 9
    .line 10
    invoke-virtual {p1, p5}, Ll/jan;->Q3(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 17
    .line 18
    invoke-virtual {p1, p5}, Ll/lqb;->l5(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    if-eqz p2, :cond_3

    .line 23
    .line 24
    const-string p1, "coin"

    .line 25
    .line 26
    iget-object p2, p3, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 37
    .line 38
    invoke-virtual {p1, p5}, Ll/lqb;->l5(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/joa;->n3()V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    invoke-virtual {p1, p5, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    :goto_0
    new-instance p1, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object p2, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const-string p3, "disliked"

    .line 66
    .line 67
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    const-string p3, "Action on Swipe page"

    .line 72
    .line 73
    const-string p5, "Action"

    .line 74
    .line 75
    if-eqz p2, :cond_4

    .line 76
    .line 77
    const-string p0, "Dislike"

    .line 78
    .line 79
    invoke-virtual {p1, p5, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 83
    .line 84
    invoke-virtual {p0, p3, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    if-nez p0, :cond_9

    .line 89
    .line 90
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string p2, "superliked"

    .line 97
    .line 98
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_5

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p2, "liked"

    .line 112
    .line 113
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_6

    .line 118
    .line 119
    const-string p0, "Like"

    .line 120
    .line 121
    invoke-virtual {p1, p5, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 125
    .line 126
    invoke-virtual {p0, p3, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_6
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string p2, "default"

    .line 137
    .line 138
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-eqz p0, :cond_7

    .line 143
    .line 144
    const-string p0, "Return to the previous"

    .line 145
    .line 146
    invoke-virtual {p1, p5, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 150
    .line 151
    invoke-virtual {p0, p3, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_7
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    const-string p1, "blocked"

    .line 162
    .line 163
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_8

    .line 168
    .line 169
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 170
    .line 171
    const-string p1, "Unmatch"

    .line 172
    .line 173
    invoke-virtual {p0, p1, v0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 174
    .line 175
    .line 176
    :cond_8
    return-void

    .line 177
    :cond_9
    :goto_1
    const-string p0, "Superlike"

    .line 178
    .line 179
    invoke-virtual {p1, p5, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 183
    .line 184
    invoke-virtual {p0, p3, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/y;->f3(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "/relationships/"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {p2}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1, p2}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object p2, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Relationship;->toJson()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p2, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/x1d0$a;->m(Ll/z1d0;)Ll/x1d0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static synthetic c3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/y;->l3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/iwa;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/iwa;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic d3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/relationships/"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "?user_id="

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Relationship;->toJson()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/x1d0$a;->m(Ll/z1d0;)Ll/x1d0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/String;)Ll/x1d0;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/api/y;->f3(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Ll/x1d0$a;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "/"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, "/special-relationships/"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->w2(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Relationship;->toJson()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v0, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Ll/x1d0$a;->m(Ll/z1d0;)Ll/x1d0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static f3(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Ll/x1d0$a;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/x1d0$a;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/api/y;->S:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    const/4 v4, 0x1

    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/ak20;->c()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/high16 v5, -0x80000000

    .line 18
    .line 19
    and-int/2addr v2, v5

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    move v2, v4

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v2, v3

    .line 25
    :goto_0
    sput v2, Lcom/p1/mobile/putong/core/api/y;->S:I

    .line 26
    .line 27
    :cond_1
    :goto_1
    const-wide/16 v5, 0x2f

    .line 28
    .line 29
    rem-long v5, v0, v5

    .line 30
    .line 31
    const-wide/16 v7, 0x1

    .line 32
    .line 33
    cmp-long v2, v5, v7

    .line 34
    .line 35
    if-eqz v2, :cond_9

    .line 36
    .line 37
    sget v2, Lcom/p1/mobile/putong/core/api/y;->S:I

    .line 38
    .line 39
    const-wide/16 v5, 0x7

    .line 40
    .line 41
    if-ne v2, v4, :cond_2

    .line 42
    .line 43
    rem-long v9, v0, v5

    .line 44
    .line 45
    cmp-long v9, v9, v7

    .line 46
    .line 47
    if-eqz v9, :cond_3

    .line 48
    .line 49
    :cond_2
    if-ne v2, v3, :cond_9

    .line 50
    .line 51
    rem-long v5, v0, v5

    .line 52
    .line 53
    cmp-long v2, v5, v7

    .line 54
    .line 55
    if-eqz v2, :cond_9

    .line 56
    .line 57
    :cond_3
    sget-boolean v2, Lcom/p1/mobile/putong/core/api/y;->Q:Z

    .line 58
    .line 59
    const-wide/16 v5, 0xb

    .line 60
    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    rem-long v9, v0, v5

    .line 64
    .line 65
    cmp-long v9, v9, v7

    .line 66
    .line 67
    if-eqz v9, :cond_5

    .line 68
    .line 69
    :cond_4
    if-nez v2, :cond_9

    .line 70
    .line 71
    rem-long v5, v0, v5

    .line 72
    .line 73
    cmp-long v2, v5, v7

    .line 74
    .line 75
    if-eqz v2, :cond_9

    .line 76
    .line 77
    :cond_5
    sget-boolean v2, Lcom/p1/mobile/putong/core/api/y;->R:Z

    .line 78
    .line 79
    const-wide/16 v5, 0x13

    .line 80
    .line 81
    if-eqz v2, :cond_6

    .line 82
    .line 83
    rem-long v9, v0, v5

    .line 84
    .line 85
    cmp-long v9, v9, v7

    .line 86
    .line 87
    if-eqz v9, :cond_7

    .line 88
    .line 89
    :cond_6
    if-nez v2, :cond_9

    .line 90
    .line 91
    rem-long v5, v0, v5

    .line 92
    .line 93
    cmp-long v2, v5, v7

    .line 94
    .line 95
    if-eqz v2, :cond_9

    .line 96
    .line 97
    :cond_7
    long-to-double v0, v0

    .line 98
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    if-eqz p1, :cond_8

    .line 107
    .line 108
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_8

    .line 121
    .line 122
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Ljava/util/Map$Entry;

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Ljava/lang/String;

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_8
    return-object p0

    .line 145
    :cond_9
    add-long/2addr v0, v7

    .line 146
    goto :goto_1
.end method

.method public static g3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "blocked"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/y;->k3(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static h3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "liked"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/y;->k3(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static i3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "liked"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/core/api/y;->k3(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static j3(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "liked"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/y;->h3(Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ll/ewa;

    .line 27
    .line 28
    invoke-direct {v2, p0, v0}, Ll/ewa;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static k3(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/RelationshipStatus;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 13
    .line 14
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 25
    .line 26
    :cond_0
    new-instance p1, Ll/si20;

    .line 27
    .line 28
    new-instance p2, Ll/dwa;

    .line 29
    .line 30
    invoke-direct {p2, p0, v0}, Ll/dwa;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->UNIT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 34
    .line 35
    invoke-direct {p1, p2, p0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static l3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/y;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/y;->n3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static n3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Z)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 12
    .line 13
    const-string v2, "superLiked"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {p3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    move v3, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v3, v0

    .line 28
    :goto_0
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ig()Z

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    if-eqz p3, :cond_1

    .line 43
    .line 44
    move p3, v1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move p3, v0

    .line 47
    :goto_1
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 56
    .line 57
    const-string v4, "letter"

    .line 58
    .line 59
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    move v5, v1

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    move v5, v0

    .line 72
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v5, :cond_4

    .line 81
    .line 82
    invoke-static {}, Ll/joa;->E3()Z

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    if-eqz p3, :cond_3

    .line 87
    .line 88
    const-string p3, "privilege"

    .line 89
    .line 90
    iput-object p3, p1, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_3
    const-string p3, "coin"

    .line 94
    .line 95
    iput-object p3, p1, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_4
    if-eqz p3, :cond_5

    .line 99
    .line 100
    if-eqz v4, :cond_5

    .line 101
    .line 102
    const-string p3, "diamond"

    .line 103
    .line 104
    iput-object p3, p1, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 105
    .line 106
    :cond_5
    :goto_3
    new-instance p3, Ll/ti20;

    .line 107
    .line 108
    new-instance v0, Ll/gwa;

    .line 109
    .line 110
    invoke-direct {v0, p1, p2, p0}, Ll/gwa;-><init>(Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-direct {p3, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 114
    .line 115
    .line 116
    new-instance v2, Ll/hwa;

    .line 117
    .line 118
    move-object v7, p1

    .line 119
    move-object v6, p1

    .line 120
    invoke-direct/range {v2 .. v7}, Ll/hwa;-><init>(ZZZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/Relationship;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p3, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    return-object p0
.end method

.method public static o3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "disliked"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/y;->p3(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static p3(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/RelationshipStatus;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 13
    .line 14
    :cond_0
    new-instance p1, Ll/ti20;

    .line 15
    .line 16
    new-instance p2, Ll/fwa;

    .line 17
    .line 18
    invoke-direct {p2, v0, p0}, Ll/fwa;-><init>(Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p1, p2}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 22
    .line 23
    .line 24
    return-object p1
.end method
