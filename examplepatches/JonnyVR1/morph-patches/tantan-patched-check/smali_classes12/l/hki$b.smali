.class Ll/hki$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hki;->h(Landroid/content/Context;Ll/hki$d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/hki$d;

.field final synthetic b:Ll/hki;


# direct methods
.method public constructor <init>(Ll/hki;Ll/hki$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hki$b;->b:Ll/hki;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hki$b;->a:Ll/hki$d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/hki$b;->b:Ll/hki;

    .line 12
    .line 13
    invoke-static {v2}, Ll/hki;->a(Ll/hki;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x0

    .line 22
    move v4, v3

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-eqz v5, :cond_4

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    check-cast v5, Ll/hki$c;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 36
    .line 37
    .line 38
    const-string v6, "result"

    .line 39
    .line 40
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    new-instance v6, Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v7, "fileName"

    .line 51
    .line 52
    iget-object v8, v5, Ll/hki$c;->c:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string v7, "fileContent"

    .line 58
    .line 59
    iget-object v8, v5, Ll/hki$c;->d:[B

    .line 60
    .line 61
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    const-string v7, "ossConfig"

    .line 65
    .line 66
    iget-object v8, v5, Ll/hki$c;->e:Lcom/idv/identity/platform/config/OSSConfig;

    .line 67
    .line 68
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    const-string v7, "callback"

    .line 72
    .line 73
    new-instance v8, Ll/hki$b$a;

    .line 74
    .line 75
    invoke-direct {v8, p0, v1, v5, v0}, Ll/hki$b$a;-><init>(Ll/hki$b;Ljava/util/Map;Ll/hki$c;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/t33;->c()Ll/t33;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    const-string v8, "callback"

    .line 86
    .line 87
    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v8

    .line 91
    check-cast v8, Ll/l1;

    .line 92
    .line 93
    invoke-virtual {v7, v6, v8}, Ll/t33;->a(Ljava/util/Map;Ll/l1;)Z

    .line 94
    .line 95
    .line 96
    monitor-enter v0

    .line 97
    :try_start_0
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 98
    .line 99
    .line 100
    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 101
    if-nez v6, :cond_1

    .line 102
    .line 103
    const-wide/16 v6, 0x4e20

    .line 104
    .line 105
    :try_start_1
    invoke-virtual {v0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    .line 107
    .line 108
    :catchall_0
    :cond_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 109
    const-string v6, "result"

    .line 110
    .line 111
    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    if-eqz v6, :cond_2

    .line 116
    .line 117
    instance-of v7, v6, Ljava/lang/Boolean;

    .line 118
    .line 119
    if-eqz v7, :cond_2

    .line 120
    .line 121
    check-cast v6, Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-eqz v6, :cond_2

    .line 128
    .line 129
    add-int/lit8 v3, v3, 0x1

    .line 130
    .line 131
    iget-object v6, p0, Ll/hki$b;->a:Ll/hki$d;

    .line 132
    .line 133
    if-eqz v6, :cond_0

    .line 134
    .line 135
    iget v4, v5, Ll/hki$c;->a:I

    .line 136
    .line 137
    iget-object v7, v5, Ll/hki$c;->b:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v5, v5, Ll/hki$c;->c:Ljava/lang/String;

    .line 140
    .line 141
    invoke-interface {v6, v4, v7, v5}, Ll/hki$d;->b(ILjava/lang/String;Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    goto :goto_0

    .line 146
    :cond_2
    iget-object v0, p0, Ll/hki$b;->a:Ll/hki$d;

    .line 147
    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    iget v2, v5, Ll/hki$c;->a:I

    .line 151
    .line 152
    iget-object v4, v5, Ll/hki$c;->b:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v5, v5, Ll/hki$c;->c:Ljava/lang/String;

    .line 155
    .line 156
    const-string v6, "msg"

    .line 157
    .line 158
    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    check-cast v6, Ljava/lang/String;

    .line 163
    .line 164
    invoke-interface {v0, v2, v4, v5, v6}, Ll/hki$d;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    :cond_3
    const-string v0, "ossConfig"

    .line 169
    .line 170
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    goto :goto_1

    .line 174
    :catchall_1
    move-exception p0

    .line 175
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 176
    throw p0

    .line 177
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/hki$b;->a:Ll/hki$d;

    .line 178
    .line 179
    if-eqz v0, :cond_5

    .line 180
    .line 181
    if-nez v4, :cond_5

    .line 182
    .line 183
    iget-object p0, p0, Ll/hki$b;->b:Ll/hki;

    .line 184
    .line 185
    invoke-static {p0}, Ll/hki;->a(Ll/hki;)Ljava/util/ArrayList;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-interface {v0, p0, v3}, Ll/hki$d;->c(II)V

    .line 194
    .line 195
    .line 196
    :cond_5
    return-void
.end method
