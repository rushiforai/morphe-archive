.class public Lorg/spongycastle/crypto/tls/AlertDescription;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final access_denied:S = 0x31s

.field public static final bad_certificate:S = 0x2as

.field public static final bad_certificate_hash_value:S = 0x72s

.field public static final bad_certificate_status_response:S = 0x71s

.field public static final bad_record_mac:S = 0x14s

.field public static final certificate_expired:S = 0x2ds

.field public static final certificate_revoked:S = 0x2cs

.field public static final certificate_unknown:S = 0x2es

.field public static final certificate_unobtainable:S = 0x6fs

.field public static final close_notify:S = 0x0s

.field public static final decode_error:S = 0x32s

.field public static final decompression_failure:S = 0x1es

.field public static final decrypt_error:S = 0x33s

.field public static final decryption_failed:S = 0x15s

.field public static final export_restriction:S = 0x3cs

.field public static final handshake_failure:S = 0x28s

.field public static final illegal_parameter:S = 0x2fs

.field public static final inappropriate_fallback:S = 0x56s

.field public static final insufficient_security:S = 0x47s

.field public static final internal_error:S = 0x50s

.field public static final no_certificate:S = 0x29s

.field public static final no_renegotiation:S = 0x64s

.field public static final protocol_version:S = 0x46s

.field public static final record_overflow:S = 0x16s

.field public static final unexpected_message:S = 0xas

.field public static final unknown_ca:S = 0x30s

.field public static final unknown_psk_identity:S = 0x73s

.field public static final unrecognized_name:S = 0x70s

.field public static final unsupported_certificate:S = 0x2bs

.field public static final unsupported_extension:S = 0x6es

.field public static final user_canceled:S = 0x5as


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

.method public static getName(S)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_9

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    if-eq p0, v0, :cond_8

    .line 6
    .line 7
    const/16 v0, 0x1e

    .line 8
    .line 9
    if-eq p0, v0, :cond_7

    .line 10
    .line 11
    const/16 v0, 0x3c

    .line 12
    .line 13
    if-eq p0, v0, :cond_6

    .line 14
    .line 15
    const/16 v0, 0x50

    .line 16
    .line 17
    if-eq p0, v0, :cond_5

    .line 18
    .line 19
    const/16 v0, 0x56

    .line 20
    .line 21
    if-eq p0, v0, :cond_4

    .line 22
    .line 23
    const/16 v0, 0x5a

    .line 24
    .line 25
    if-eq p0, v0, :cond_3

    .line 26
    .line 27
    const/16 v0, 0x64

    .line 28
    .line 29
    if-eq p0, v0, :cond_2

    .line 30
    .line 31
    const/16 v0, 0x46

    .line 32
    .line 33
    if-eq p0, v0, :cond_1

    .line 34
    .line 35
    const/16 v0, 0x47

    .line 36
    .line 37
    if-eq p0, v0, :cond_0

    .line 38
    .line 39
    packed-switch p0, :pswitch_data_0

    .line 40
    .line 41
    .line 42
    packed-switch p0, :pswitch_data_1

    .line 43
    .line 44
    .line 45
    packed-switch p0, :pswitch_data_2

    .line 46
    .line 47
    .line 48
    const-string p0, "UNKNOWN"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_0
    const-string p0, "unknown_psk_identity"

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_1
    const-string p0, "bad_certificate_hash_value"

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_2
    const-string p0, "bad_certificate_status_response"

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_3
    const-string p0, "unrecognized_name"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_4
    const-string p0, "certificate_unobtainable"

    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_5
    const-string p0, "unsupported_extension"

    .line 67
    .line 68
    return-object p0

    .line 69
    :pswitch_6
    const-string p0, "decrypt_error"

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_7
    const-string p0, "decode_error"

    .line 73
    .line 74
    return-object p0

    .line 75
    :pswitch_8
    const-string p0, "access_denied"

    .line 76
    .line 77
    return-object p0

    .line 78
    :pswitch_9
    const-string p0, "unknown_ca"

    .line 79
    .line 80
    return-object p0

    .line 81
    :pswitch_a
    const-string p0, "illegal_parameter"

    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_b
    const-string p0, "certificate_unknown"

    .line 85
    .line 86
    return-object p0

    .line 87
    :pswitch_c
    const-string p0, "certificate_expired"

    .line 88
    .line 89
    return-object p0

    .line 90
    :pswitch_d
    const-string p0, "certificate_revoked"

    .line 91
    .line 92
    return-object p0

    .line 93
    :pswitch_e
    const-string p0, "unsupported_certificate"

    .line 94
    .line 95
    return-object p0

    .line 96
    :pswitch_f
    const-string p0, "bad_certificate"

    .line 97
    .line 98
    return-object p0

    .line 99
    :pswitch_10
    const-string p0, "no_certificate"

    .line 100
    .line 101
    return-object p0

    .line 102
    :pswitch_11
    const-string p0, "handshake_failure"

    .line 103
    .line 104
    return-object p0

    .line 105
    :pswitch_12
    const-string p0, "record_overflow"

    .line 106
    .line 107
    return-object p0

    .line 108
    :pswitch_13
    const-string p0, "decryption_failed"

    .line 109
    .line 110
    return-object p0

    .line 111
    :pswitch_14
    const-string p0, "bad_record_mac"

    .line 112
    .line 113
    return-object p0

    .line 114
    :cond_0
    const-string p0, "insufficient_security"

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_1
    const-string p0, "protocol_version"

    .line 118
    .line 119
    return-object p0

    .line 120
    :cond_2
    const-string p0, "no_renegotiation"

    .line 121
    .line 122
    return-object p0

    .line 123
    :cond_3
    const-string p0, "user_canceled"

    .line 124
    .line 125
    return-object p0

    .line 126
    :cond_4
    const-string p0, "inappropriate_fallback"

    .line 127
    .line 128
    return-object p0

    .line 129
    :cond_5
    const-string p0, "internal_error"

    .line 130
    .line 131
    return-object p0

    .line 132
    :cond_6
    const-string p0, "export_restriction"

    .line 133
    .line 134
    return-object p0

    .line 135
    :cond_7
    const-string p0, "decompression_failure"

    .line 136
    .line 137
    return-object p0

    .line 138
    :cond_8
    const-string p0, "unexpected_message"

    .line 139
    .line 140
    return-object p0

    .line 141
    :cond_9
    const-string p0, "close_notify"

    .line 142
    .line 143
    return-object p0

    .line 144
    nop

    .line 145
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :pswitch_data_1
    .packed-switch 0x28
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    :pswitch_data_2
    .packed-switch 0x6e
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getText(S)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/AlertDescription;->getName(S)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "("

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, ")"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
