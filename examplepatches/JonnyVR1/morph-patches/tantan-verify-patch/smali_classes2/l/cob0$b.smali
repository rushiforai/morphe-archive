.class Ll/cob0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cob0;->L(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroid/os/Bundle;

.field final synthetic b:Ll/cob0;


# direct methods
.method public constructor <init>(Ll/cob0;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cob0$b;->a:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Void;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cob0$b;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v1, "nm"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v0, v1

    .line 15
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 22
    .line 23
    invoke-static {v0}, Ll/cob0;->f(Ll/cob0;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v2, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 32
    .line 33
    invoke-static {v2}, Ll/cob0;->f(Ll/cob0;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "Push notification message is empty, not rendering"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 47
    .line 48
    invoke-static {v0}, Ll/cob0;->g(Ll/cob0;)Ll/bj2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v2, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 53
    .line 54
    invoke-static {v2}, Ll/cob0;->e(Ll/cob0;)Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v0, v2}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/h1c;->P()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/cob0$b;->a:Landroid/os/Bundle;

    .line 66
    .line 67
    const-string v2, "pf"

    .line 68
    .line 69
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_4

    .line 78
    .line 79
    iget-object p0, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 80
    .line 81
    invoke-static {p0}, Ll/cob0;->e(Ll/cob0;)Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {p0, v1, v0}, Ll/cob0;->Y(Landroid/content/Context;I)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    iget-object v0, p0, Ll/cob0$b;->a:Landroid/os/Bundle;

    .line 94
    .line 95
    const-string v1, "wzrk_pid"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v1, p0, Ll/cob0$b;->a:Landroid/os/Bundle;

    .line 102
    .line 103
    const-string v2, "wzrk_ttl"

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget-object v2, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 110
    .line 111
    invoke-static {v2}, Ll/cob0;->h(Ll/cob0;)Ll/oa5;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-interface {v2}, Ll/oa5;->c()J

    .line 116
    .line 117
    .line 118
    move-result-wide v2

    .line 119
    const-wide/32 v4, 0x54600

    .line 120
    .line 121
    .line 122
    add-long/2addr v2, v4

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v2

    .line 129
    :cond_2
    iget-object v4, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 130
    .line 131
    if-eqz v0, :cond_3

    .line 132
    .line 133
    invoke-static {v4}, Ll/cob0;->f(Ll/cob0;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    new-instance v5, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v6, "Storing Push Notification..."

    .line 144
    .line 145
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v6, " - with ttl - "

    .line 152
    .line 153
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v4, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object v1, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 167
    .line 168
    invoke-static {v1}, Ll/cob0;->g(Ll/cob0;)Ll/bj2;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iget-object p0, p0, Ll/cob0$b;->b:Ll/cob0;

    .line 173
    .line 174
    invoke-static {p0}, Ll/cob0;->e(Ll/cob0;)Landroid/content/Context;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-interface {v1, p0}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0, v0, v2, v3}, Ll/h1c;->O(Ljava/lang/String;J)V

    .line 183
    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_3
    invoke-static {v4}, Ll/cob0;->f(Ll/cob0;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    const-string v0, "Will not save Push Notification in DB due to invalid id, processCustomPushNotification"

    .line 195
    .line 196
    invoke-virtual {p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :cond_4
    :goto_1
    const/4 p0, 0x0

    .line 200
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cob0$b;->a()Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
