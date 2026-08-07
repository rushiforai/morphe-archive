.class public Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    .line 7
    .line 8
    return-void
.end method

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
.method public final write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of p1, p2, [I

    .line 12
    .line 13
    const/16 p3, 0x5d

    .line 14
    .line 15
    const/16 p4, 0x2c

    .line 16
    .line 17
    const/4 p5, 0x0

    .line 18
    const/16 v0, 0x5b

    .line 19
    .line 20
    if-eqz p1, :cond_3

    .line 21
    .line 22
    check-cast p2, [I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 25
    .line 26
    .line 27
    :goto_0
    array-length p1, p2

    .line 28
    if-ge p5, p1, :cond_2

    .line 29
    .line 30
    if-eqz p5, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    aget p1, p2, p5

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 p5, p5, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_3
    instance-of p1, p2, [S

    .line 48
    .line 49
    if-eqz p1, :cond_6

    .line 50
    .line 51
    check-cast p2, [S

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 54
    .line 55
    .line 56
    :goto_1
    array-length p1, p2

    .line 57
    if-ge p5, p1, :cond_5

    .line 58
    .line 59
    if-eqz p5, :cond_4

    .line 60
    .line 61
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 62
    .line 63
    .line 64
    :cond_4
    aget-short p1, p2, p5

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 p5, p5, 0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_6
    instance-of p1, p2, [J

    .line 77
    .line 78
    if-eqz p1, :cond_9

    .line 79
    .line 80
    check-cast p2, [J

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 83
    .line 84
    .line 85
    :goto_2
    array-length p1, p2

    .line 86
    if-ge p5, p1, :cond_8

    .line 87
    .line 88
    if-eqz p5, :cond_7

    .line 89
    .line 90
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 91
    .line 92
    .line 93
    :cond_7
    aget-wide v0, p2, p5

    .line 94
    .line 95
    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 96
    .line 97
    .line 98
    add-int/lit8 p5, p5, 0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_8
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_9
    instance-of p1, p2, [Z

    .line 106
    .line 107
    if-eqz p1, :cond_c

    .line 108
    .line 109
    check-cast p2, [Z

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 112
    .line 113
    .line 114
    :goto_3
    array-length p1, p2

    .line 115
    if-ge p5, p1, :cond_b

    .line 116
    .line 117
    if-eqz p5, :cond_a

    .line 118
    .line 119
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 120
    .line 121
    .line 122
    :cond_a
    aget-boolean p1, p2, p5

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Z)V

    .line 125
    .line 126
    .line 127
    add-int/lit8 p5, p5, 0x1

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_b
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_c
    instance-of p1, p2, [F

    .line 135
    .line 136
    if-eqz p1, :cond_10

    .line 137
    .line 138
    check-cast p2, [F

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 141
    .line 142
    .line 143
    :goto_4
    array-length p1, p2

    .line 144
    if-ge p5, p1, :cond_f

    .line 145
    .line 146
    if-eqz p5, :cond_d

    .line 147
    .line 148
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 149
    .line 150
    .line 151
    :cond_d
    aget p1, p2, p5

    .line 152
    .line 153
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_e

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 160
    .line 161
    .line 162
    goto :goto_5

    .line 163
    :cond_e
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 168
    .line 169
    .line 170
    :goto_5
    add-int/lit8 p5, p5, 0x1

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_f
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_10
    instance-of p1, p2, [D

    .line 178
    .line 179
    if-eqz p1, :cond_14

    .line 180
    .line 181
    check-cast p2, [D

    .line 182
    .line 183
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 184
    .line 185
    .line 186
    :goto_6
    array-length p1, p2

    .line 187
    if-ge p5, p1, :cond_13

    .line 188
    .line 189
    if-eqz p5, :cond_11

    .line 190
    .line 191
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 192
    .line 193
    .line 194
    :cond_11
    aget-wide v0, p2, p5

    .line 195
    .line 196
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_12

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 203
    .line 204
    .line 205
    goto :goto_7

    .line 206
    :cond_12
    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 211
    .line 212
    .line 213
    :goto_7
    add-int/lit8 p5, p5, 0x1

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_13
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_14
    instance-of p1, p2, [B

    .line 221
    .line 222
    if-eqz p1, :cond_15

    .line 223
    .line 224
    check-cast p2, [B

    .line 225
    .line 226
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeByteArray([B)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_15
    check-cast p2, [C

    .line 231
    .line 232
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString([C)V

    .line 233
    .line 234
    .line 235
    return-void
.end method
