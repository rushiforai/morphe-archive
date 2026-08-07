.class public final Ll/v1z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/l3z0;

.field public final b:Ll/sft0;

.field public c:I

.field public d:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;


# direct methods
.method public constructor <init>(Ll/l3z0;Ll/sft0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/v1z0;->c:I

    .line 6
    .line 7
    sget-object v0, Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;->UNKNOWN:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 8
    .line 9
    iput-object v0, p0, Ll/v1z0;->d:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 10
    .line 11
    iput-object p1, p0, Ll/v1z0;->a:Ll/l3z0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/v1z0;->b:Ll/sft0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()Ll/n6z0;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/consent_sdk/zzg;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v1z0;->b:Ll/sft0;

    .line 2
    .line 3
    iget v0, v0, Ll/sft0;->f:I

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    move v1, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    iget-object v4, p0, Ll/v1z0;->a:Ll/l3z0;

    .line 15
    .line 16
    invoke-static {v4}, Ll/l3z0;->c(Ll/l3z0;)Ll/tqr0;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v4, v1}, Ll/tqr0;->f(Z)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v0, -0x1

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v0, :cond_b

    .line 27
    .line 28
    const/4 v0, 0x3

    .line 29
    const-string v5, "Invalid response from server."

    .line 30
    .line 31
    const/4 v6, 0x2

    .line 32
    packed-switch v1, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    new-instance p0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 36
    .line 37
    invoke-direct {p0, v3, v5}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :pswitch_0
    iget-object p0, p0, Ll/v1z0;->b:Ll/sft0;

    .line 42
    .line 43
    new-instance v1, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 44
    .line 45
    iget-object p0, p0, Ll/sft0;->c:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v2, "Publisher misconfiguration: "

    .line 52
    .line 53
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-direct {v1, v0, p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw v1

    .line 61
    :pswitch_1
    iget-object p0, p0, Ll/v1z0;->b:Ll/sft0;

    .line 62
    .line 63
    new-instance v0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 64
    .line 65
    iget-object p0, p0, Ll/sft0;->c:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v1, "Invalid response from server: "

    .line 72
    .line 73
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-direct {v0, v3, p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw v0

    .line 81
    :pswitch_2
    iput v3, p0, Ll/v1z0;->c:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :pswitch_3
    iput v6, p0, Ll/v1z0;->c:I

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :pswitch_4
    iput v0, p0, Ll/v1z0;->c:I

    .line 88
    .line 89
    :goto_1
    iget-object v0, p0, Ll/v1z0;->b:Ll/sft0;

    .line 90
    .line 91
    iget v1, v0, Ll/sft0;->g:I

    .line 92
    .line 93
    add-int/lit8 v7, v1, -0x1

    .line 94
    .line 95
    if-eqz v1, :cond_a

    .line 96
    .line 97
    if-eq v7, v3, :cond_2

    .line 98
    .line 99
    if-ne v7, v6, :cond_1

    .line 100
    .line 101
    sget-object v1, Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;->NOT_REQUIRED:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 102
    .line 103
    iput-object v1, p0, Ll/v1z0;->d:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 107
    .line 108
    invoke-direct {p0, v3, v5}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p0

    .line 112
    :cond_2
    sget-object v1, Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;->REQUIRED:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 113
    .line 114
    iput-object v1, p0, Ll/v1z0;->d:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 115
    .line 116
    :goto_2
    iget-object v1, v0, Ll/sft0;->a:Ljava/lang/String;

    .line 117
    .line 118
    if-nez v1, :cond_3

    .line 119
    .line 120
    move-object v5, v4

    .line 121
    goto :goto_3

    .line 122
    :cond_3
    new-instance v5, Ll/eos0;

    .line 123
    .line 124
    iget-object v7, v0, Ll/sft0;->b:Ljava/lang/String;

    .line 125
    .line 126
    invoke-direct {v5, v7, v1}, Ll/eos0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :goto_3
    iget-object v1, p0, Ll/v1z0;->a:Ll/l3z0;

    .line 130
    .line 131
    invoke-static {v1}, Ll/l3z0;->c(Ll/l3z0;)Ll/tqr0;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    new-instance v7, Ljava/util/HashSet;

    .line 136
    .line 137
    iget-object v0, v0, Ll/sft0;->d:Ljava/util/List;

    .line 138
    .line 139
    invoke-direct {v7, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v7}, Ll/tqr0;->h(Ljava/util/Set;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/v1z0;->b:Ll/sft0;

    .line 146
    .line 147
    iget-object v0, v0, Ll/sft0;->e:Ljava/util/List;

    .line 148
    .line 149
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_9

    .line 158
    .line 159
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    check-cast v1, Ll/jet0;

    .line 164
    .line 165
    iget v7, v1, Ll/jet0;->b:I

    .line 166
    .line 167
    add-int/lit8 v8, v7, -0x1

    .line 168
    .line 169
    if-eqz v7, :cond_8

    .line 170
    .line 171
    if-eqz v8, :cond_5

    .line 172
    .line 173
    if-eq v8, v3, :cond_7

    .line 174
    .line 175
    if-eq v8, v6, :cond_6

    .line 176
    .line 177
    :cond_5
    move-object v7, v4

    .line 178
    goto :goto_5

    .line 179
    :cond_6
    const-string v7, "clear"

    .line 180
    .line 181
    goto :goto_5

    .line 182
    :cond_7
    const-string v7, "write"

    .line 183
    .line 184
    :goto_5
    if-eqz v7, :cond_4

    .line 185
    .line 186
    iget-object v8, p0, Ll/v1z0;->a:Ll/l3z0;

    .line 187
    .line 188
    invoke-static {v8}, Ll/l3z0;->a(Ll/l3z0;)Ll/m1v0;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    iget-object v1, v1, Ll/jet0;->a:Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {v8}, Ll/l3z0;->b(Ll/l3z0;)Ll/cor0;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    new-array v10, v3, [Ll/l4u0;

    .line 199
    .line 200
    aput-object v8, v10, v2

    .line 201
    .line 202
    invoke-virtual {v9, v7, v1, v10}, Ll/m1v0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/l4u0;)V

    .line 203
    .line 204
    .line 205
    goto :goto_4

    .line 206
    :cond_8
    throw v4

    .line 207
    :cond_9
    new-instance v0, Ll/n6z0;

    .line 208
    .line 209
    iget v1, p0, Ll/v1z0;->c:I

    .line 210
    .line 211
    iget-object p0, p0, Ll/v1z0;->d:Lcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;

    .line 212
    .line 213
    invoke-direct {v0, v1, p0, v5, v4}, Ll/n6z0;-><init>(ILcom/google/android/ump/ConsentInformation$PrivacyOptionsRequirementStatus;Ll/eos0;Ll/d5z0;)V

    .line 214
    .line 215
    .line 216
    return-object v0

    .line 217
    :cond_a
    throw v4

    .line 218
    :cond_b
    throw v4

    .line 219
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
