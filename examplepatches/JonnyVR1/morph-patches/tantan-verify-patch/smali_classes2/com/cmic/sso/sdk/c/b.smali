.class public Lcom/cmic/sso/sdk/c/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;)Lcom/cmic/sso/sdk/c/c/c;
    .locals 0

    .line 177
    new-instance p0, Lcom/cmic/sso/sdk/c/c/c;

    invoke-direct {p0, p1, p4, p3, p2}, Lcom/cmic/sso/sdk/c/c/c;-><init>(Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const-string p1, "GET"

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 179
    const-string p1, "Content-Type"

    const-string p2, "application/x-www-form-urlencoded"

    invoke-virtual {p0, p1, p2}, Lcom/cmic/sso/sdk/c/c/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object p0
.end method


# virtual methods
.method public a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/b;Lcom/cmic/sso/sdk/a;)Lcom/cmic/sso/sdk/c/c/c;
    .locals 4

    .line 1
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/c/d/b;->b()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/cmic/sso/sdk/c/b;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string v1, "pplocation"

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/util/List;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-lez v3, :cond_0

    .line 29
    .line 30
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/cmic/sso/sdk/c/b;->a:Ljava/lang/String;

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/c/d/b;->a()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p3, p2}, Lcom/cmic/sso/sdk/e/q;->b(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string p2, "Location"

    .line 50
    .line 51
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/util/List;

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    move-object v1, v0

    .line 74
    check-cast v1, Ljava/util/List;

    .line 75
    .line 76
    :cond_2
    if-eqz v1, :cond_5

    .line 77
    .line 78
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-lez v0, :cond_5

    .line 83
    .line 84
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/lang/String;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/cmic/sso/sdk/c/b;->b:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_5

    .line 97
    .line 98
    const-string v0, "operatortype"

    .line 99
    .line 100
    const-string v1, "0"

    .line 101
    .line 102
    invoke-virtual {p3, v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "2"

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    const-string v0, "getUnicomMobile"

    .line 115
    .line 116
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    const-string v1, "3"

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_4

    .line 127
    .line 128
    const-string v0, "getTelecomMobile"

    .line 129
    .line 130
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_4
    const-string v0, "NONE"

    .line 135
    .line 136
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    :goto_0
    iget-object p3, p0, Lcom/cmic/sso/sdk/c/b;->b:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p2, p3}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    new-instance p2, Lcom/cmic/sso/sdk/c/b/c;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/c/c;->j()Lcom/cmic/sso/sdk/c/b/g;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    invoke-virtual {p3}, Lcom/cmic/sso/sdk/c/b/g;->a()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-direct {p2, p3}, Lcom/cmic/sso/sdk/c/b/c;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object p3, p0, Lcom/cmic/sso/sdk/c/b;->b:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/c/c;->f()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const-string v1, "GET"

    .line 164
    .line 165
    invoke-direct {p0, p3, v0, v1, p2}, Lcom/cmic/sso/sdk/c/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;)Lcom/cmic/sso/sdk/c/c/c;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/c/c;->g()Landroid/net/Network;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p0, p1}, Lcom/cmic/sso/sdk/c/c/c;->a(Landroid/net/Network;)V

    .line 174
    .line 175
    .line 176
    return-object p0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/b;->a:Ljava/lang/String;

    return-object p0
.end method

.method public b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/b;Lcom/cmic/sso/sdk/a;)Lcom/cmic/sso/sdk/c/c/c;
    .locals 3

    .line 1
    const-string v0, "operatortype"

    .line 2
    .line 3
    const-string v1, "0"

    .line 4
    .line 5
    invoke-virtual {p3, v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "2"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v0, "getNewUnicomPhoneNumberNotify"

    .line 18
    .line 19
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string v1, "3"

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string v0, "getNewTelecomPhoneNumberNotify"

    .line 32
    .line 33
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v0, "NONE"

    .line 38
    .line 39
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/c/d/b;->a()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {p3, v0}, Lcom/cmic/sso/sdk/e/q;->b(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Lcom/cmic/sso/sdk/c/b/d;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/c/c;->j()Lcom/cmic/sso/sdk/c/b/g;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/c/b/g;->a()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "1.0"

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/c/d/b;->c()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-direct {v0, v1, v2, p2}, Lcom/cmic/sso/sdk/c/b/d;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-string p2, "userCapaid"

    .line 73
    .line 74
    invoke-virtual {p3, p2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {v0, p2}, Lcom/cmic/sso/sdk/c/b/d;->c(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-string p2, "logintype"

    .line 82
    .line 83
    invoke-virtual {p3, p2}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    const/4 v1, 0x3

    .line 88
    const-string v2, "pre"

    .line 89
    .line 90
    if-eq p2, v1, :cond_3

    .line 91
    .line 92
    const-string p2, "isRisk"

    .line 93
    .line 94
    const/4 v1, 0x0

    .line 95
    invoke-virtual {p3, p2, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_2

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Lcom/cmic/sso/sdk/c/b/d;->b(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    const-string p2, "authz"

    .line 106
    .line 107
    invoke-virtual {v0, p2}, Lcom/cmic/sso/sdk/c/b/d;->b(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    invoke-virtual {v0, v2}, Lcom/cmic/sso/sdk/c/b/d;->b(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :goto_1
    iget-object p2, p0, Lcom/cmic/sso/sdk/c/b;->a:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/c/c;->f()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    const-string v1, "POST"

    .line 121
    .line 122
    invoke-direct {p0, p2, p3, v1, v0}, Lcom/cmic/sso/sdk/c/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;)Lcom/cmic/sso/sdk/c/c/c;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/c/c;->g()Landroid/net/Network;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p2, p1}, Lcom/cmic/sso/sdk/c/c/c;->a(Landroid/net/Network;)V

    .line 131
    .line 132
    .line 133
    const/4 p1, 0x0

    .line 134
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/b;->a:Ljava/lang/String;

    .line 135
    .line 136
    return-object p2
.end method
