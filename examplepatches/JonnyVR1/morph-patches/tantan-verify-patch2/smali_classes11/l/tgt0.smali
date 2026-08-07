.class public final Ll/tgt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/ugt0;


# direct methods
.method public constructor <init>(Ll/ugt0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/tgt0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/tgt0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/tgt0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Ll/tgt0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Ll/tgt0;->e:Ll/ugt0;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "event"

    .line 7
    .line 8
    const-string v2, "precacheCanceled"

    .line 9
    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v1, "src"

    .line 14
    .line 15
    iget-object v2, p0, Ll/tgt0;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/tgt0;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/tgt0;->b:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "cachedSrc"

    .line 31
    .line 32
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Ll/tgt0;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const-string v3, "internal"

    .line 42
    .line 43
    sparse-switch v2, :sswitch_data_0

    .line 44
    .line 45
    .line 46
    goto :goto_4

    .line 47
    :sswitch_0
    const-string v2, "noCacheDir"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_1
    const-string v2, "expireFailed"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    :goto_0
    const-string v3, "io"

    .line 65
    .line 66
    goto :goto_4

    .line 67
    :sswitch_2
    const-string v2, "error"

    .line 68
    .line 69
    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_4

    .line 73
    :sswitch_3
    const-string v2, "noop"

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :sswitch_4
    const-string v2, "externalAbort"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :sswitch_5
    const-string v2, "sizeExceeded"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    :goto_2
    const-string v3, "policy"

    .line 94
    .line 95
    goto :goto_4

    .line 96
    :sswitch_6
    const-string v2, "playerFailed"

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :sswitch_7
    const-string v2, "contentLengthMissing"

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :sswitch_8
    const-string v2, "downloadTimeout"

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_1

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :sswitch_9
    const-string v2, "inProgress"

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :sswitch_a
    const-string v2, "badUrl"

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_1

    .line 121
    .line 122
    :goto_3
    const-string v3, "network"

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :sswitch_b
    const-string v2, "interrupted"

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_1
    :goto_4
    const-string v1, "type"

    .line 129
    .line 130
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/tgt0;->c:Ljava/lang/String;

    .line 134
    .line 135
    const-string v2, "reason"

    .line 136
    .line 137
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Ll/tgt0;->d:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-nez v1, :cond_2

    .line 147
    .line 148
    iget-object v1, p0, Ll/tgt0;->d:Ljava/lang/String;

    .line 149
    .line 150
    const-string v2, "message"

    .line 151
    .line 152
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    :cond_2
    iget-object p0, p0, Ll/tgt0;->e:Ll/ugt0;

    .line 156
    .line 157
    const-string v1, "onPrecacheEvent"

    .line 158
    .line 159
    invoke-static {p0, v1, v0}, Ll/ugt0;->f(Ll/ugt0;Ljava/lang/String;Ljava/util/Map;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :sswitch_data_0
    .sparse-switch
        -0x7416d1be -> :sswitch_b
        -0x533f68d6 -> :sswitch_a
        -0x5049c18e -> :sswitch_9
        -0x36c40c47 -> :sswitch_8
        -0x274d4859 -> :sswitch_7
        -0x26475182 -> :sswitch_6
        -0x151a598c -> :sswitch_5
        -0x1e989db -> :sswitch_4
        0x33af62 -> :sswitch_3
        0x5c4d208 -> :sswitch_2
        0x2293ea3c -> :sswitch_1
        0x2b3e368c -> :sswitch_0
    .end sparse-switch
.end method
