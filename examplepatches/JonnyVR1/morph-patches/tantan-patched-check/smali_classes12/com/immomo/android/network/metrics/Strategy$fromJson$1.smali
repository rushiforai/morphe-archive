.class final Lcom/immomo/android/network/metrics/Strategy$fromJson$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/Strategy;->g(Ljava/lang/String;)Lcom/immomo/android/network/metrics/Strategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic $json:Ljava/lang/String;

.field final synthetic this$0:Lcom/immomo/android/network/metrics/Strategy;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/Strategy;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    iput-object p2, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->$json:Ljava/lang/String;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 202
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 11

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->$json:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 9
    .line 10
    const-string v2, "enabled"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/Strategy;->q(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 21
    .line 22
    const-string v2, "success_rate"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/Strategy;->t(I)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 32
    .line 33
    const-string v2, "error_rate"

    .line 34
    .line 35
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/Strategy;->s(I)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 43
    .line 44
    const-string v2, "error_max_time"

    .line 45
    .line 46
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/Strategy;->r(I)V

    .line 51
    .line 52
    .line 53
    const-string v1, "config_domains"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    iget-object v2, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/immomo/android/network/metrics/Strategy;->h()Ljava/util/Set;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    move v4, v3

    .line 75
    :goto_0
    if-ge v4, v2, :cond_0

    .line 76
    .line 77
    iget-object v5, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 78
    .line 79
    invoke-virtual {v5}, Lcom/immomo/android/network/metrics/Strategy;->h()Ljava/util/Set;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    add-int/lit8 v4, v4, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 97
    .line 98
    invoke-static {v1}, Lcom/immomo/android/network/metrics/Strategy;->a(Lcom/immomo/android/network/metrics/Strategy;)V

    .line 99
    .line 100
    .line 101
    const-string v1, "domains"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 108
    .line 109
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 110
    .line 111
    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    if-eqz v4, :cond_4

    .line 126
    .line 127
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    check-cast v4, Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    instance-of v6, v5, Lorg/json/JSONArray;

    .line 138
    .line 139
    if-eqz v6, :cond_1

    .line 140
    .line 141
    new-instance v6, Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .line 145
    .line 146
    check-cast v5, Lorg/json/JSONArray;

    .line 147
    .line 148
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    move v8, v3

    .line 153
    :goto_2
    if-ge v8, v7, :cond_3

    .line 154
    .line 155
    invoke-virtual {v5, v8}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 160
    .line 161
    .line 162
    invoke-static {v9}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v10

    .line 166
    if-nez v10, :cond_2

    .line 167
    .line 168
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    :cond_2
    add-int/lit8 v8, v8, 0x1

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_3
    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    .line 175
    .line 176
    .line 177
    move-result v5

    .line 178
    if-nez v5, :cond_1

    .line 179
    .line 180
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 181
    .line 182
    .line 183
    new-instance v5, Ll/d7e;

    .line 184
    .line 185
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    invoke-direct {v5, v6, v7}, Ll/d7e;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_4
    iget-object p0, p0, Lcom/immomo/android/network/metrics/Strategy$fromJson$1;->this$0:Lcom/immomo/android/network/metrics/Strategy;

    .line 197
    .line 198
    invoke-static {p0, v1}, Lcom/immomo/android/network/metrics/Strategy;->b(Lcom/immomo/android/network/metrics/Strategy;Ljava/util/Map;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method
