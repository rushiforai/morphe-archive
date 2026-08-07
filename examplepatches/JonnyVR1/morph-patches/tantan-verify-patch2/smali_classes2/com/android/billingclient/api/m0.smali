.class final Lcom/android/billingclient/api/m0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Lcom/android/billingclient/api/l0;
    .locals 5

    .line 1
    sget-object p1, Lcom/android/billingclient/api/h0;->k:Lcom/android/billingclient/api/d;

    .line 2
    .line 3
    const-string v0, "BillingClient"

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p2, "%s got null owned items list"

    .line 12
    .line 13
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 21
    .line 22
    const/16 p2, 0x36

    .line 23
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/p;->b(Landroid/os/Bundle;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/p;->g(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {}, Lcom/android/billingclient/api/d;->c()Lcom/android/billingclient/api/d$a;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3, v1}, Lcom/android/billingclient/api/d$a;->c(I)Lcom/android/billingclient/api/d$a;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v2}, Lcom/android/billingclient/api/d$a;->b(Ljava/lang/String;)Lcom/android/billingclient/api/d$a;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/android/billingclient/api/d$a;->a()Lcom/android/billingclient/api/d;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "%s failed. Response code: %s"

    .line 61
    .line 62
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 70
    .line 71
    const/16 p1, 0x17

    .line 72
    .line 73
    invoke-direct {p0, v2, p1}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 74
    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_1
    const-string v1, "INAPP_PURCHASE_ITEM_LIST"

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_6

    .line 84
    .line 85
    const-string v2, "INAPP_PURCHASE_DATA_LIST"

    .line 86
    .line 87
    invoke-virtual {p0, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-eqz v3, :cond_6

    .line 92
    .line 93
    const-string v3, "INAPP_DATA_SIGNATURE_LIST"

    .line 94
    .line 95
    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-nez v4, :cond_2

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    if-nez v1, :cond_3

    .line 115
    .line 116
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string p2, "Bundle returned from %s contains null SKUs list."

    .line 121
    .line 122
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 130
    .line 131
    const/16 p2, 0x38

    .line 132
    .line 133
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 134
    .line 135
    .line 136
    return-object p0

    .line 137
    :cond_3
    if-nez v2, :cond_4

    .line 138
    .line 139
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const-string p2, "Bundle returned from %s contains null purchases list."

    .line 144
    .line 145
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 153
    .line 154
    const/16 p2, 0x39

    .line 155
    .line 156
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 157
    .line 158
    .line 159
    return-object p0

    .line 160
    :cond_4
    if-nez p0, :cond_5

    .line 161
    .line 162
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    const-string p2, "Bundle returned from %s contains null signatures list."

    .line 167
    .line 168
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 176
    .line 177
    const/16 p2, 0x3a

    .line 178
    .line 179
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 180
    .line 181
    .line 182
    return-object p0

    .line 183
    :cond_5
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 184
    .line 185
    sget-object p1, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 186
    .line 187
    const/4 p2, 0x1

    .line 188
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 189
    .line 190
    .line 191
    return-object p0

    .line 192
    :cond_6
    :goto_0
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    const-string p2, "Bundle returned from %s doesn\'t contain required fields."

    .line 197
    .line 198
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    new-instance p0, Lcom/android/billingclient/api/l0;

    .line 206
    .line 207
    const/16 p2, 0x37

    .line 208
    .line 209
    invoke-direct {p0, p1, p2}, Lcom/android/billingclient/api/l0;-><init>(Lcom/android/billingclient/api/d;I)V

    .line 210
    .line 211
    .line 212
    return-object p0
.end method
