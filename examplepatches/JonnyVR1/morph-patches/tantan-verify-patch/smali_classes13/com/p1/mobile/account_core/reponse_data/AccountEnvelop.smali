.class public Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public data:Lcom/p1/mobile/account_core/reponse_data/Data;

.field public extra:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public meta:Lcom/p1/mobile/account_core/reponse_data/Meta;


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


# virtual methods
.method public fillExtraData()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->stage:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 14
    .line 15
    const-string v1, "stage"

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    new-instance v2, Ll/l01;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/l01;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v2, v0, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->stage:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance v0, Ll/l01;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/account_core/reponse_data/Data;->stage:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 63
    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    new-instance v0, Ll/l01;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 72
    .line 73
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 74
    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->finishedStages:Ljava/util/List;

    .line 78
    .line 79
    if-eqz v0, :cond_5

    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-lez v0, :cond_5

    .line 86
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/account_core/reponse_data/Data;->finishedStages:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_4

    .line 105
    .line 106
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, ","

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 122
    .line 123
    const-string v2, "finished_stages"

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 133
    .line 134
    if-eqz v0, :cond_7

    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 137
    .line 138
    if-eqz v0, :cond_7

    .line 139
    .line 140
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-lez v0, :cond_7

    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 149
    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    iget-object v1, v0, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 153
    .line 154
    if-nez v1, :cond_6

    .line 155
    .line 156
    new-instance v1, Ll/l01;

    .line 157
    .line 158
    invoke-direct {v1}, Ll/l01;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v1, v0, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 162
    .line 163
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 164
    .line 165
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 166
    .line 167
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 170
    .line 171
    invoke-interface {v0, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 172
    .line 173
    .line 174
    :cond_7
    return-void
.end method
