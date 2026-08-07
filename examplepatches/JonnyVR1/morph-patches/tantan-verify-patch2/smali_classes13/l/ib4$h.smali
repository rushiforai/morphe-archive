.class Ll/ib4$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ib4;->u2(Ll/omw;[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:Ll/ib4;


# direct methods
.method public constructor <init>(Ll/ib4;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ib4$h;->a:[B

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
    .locals 6

    .line 1
    const-string v0, "camera preview width "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 5
    .line 6
    invoke-static {v2}, Ll/ib4;->b2(Ll/ib4;)Ll/xpl;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v2, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 14
    .line 15
    iget v3, v2, Ll/ib4;->u:I

    .line 16
    .line 17
    add-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    iput v3, v2, Ll/ib4;->u:I

    .line 20
    .line 21
    invoke-static {v2}, Ll/ib4;->c2(Ll/ib4;)Ll/tow;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget v3, v3, Ll/tow;->e:I

    .line 26
    .line 27
    iget-object v4, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 28
    .line 29
    invoke-static {v4}, Ll/ib4;->c2(Ll/ib4;)Ll/tow;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget v4, v4, Ll/tow;->f:I

    .line 34
    .line 35
    invoke-virtual {v2, v3, v4}, Ll/wej;->setRenderSize(II)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 39
    .line 40
    invoke-static {v2}, Ll/ib4;->c2(Ll/ib4;)Ll/tow;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget v2, v2, Ll/tow;->e:I

    .line 45
    .line 46
    iget-object v3, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 47
    .line 48
    invoke-static {v3}, Ll/ib4;->c2(Ll/ib4;)Ll/tow;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget v3, v3, Ll/tow;->f:I

    .line 53
    .line 54
    mul-int/2addr v2, v3

    .line 55
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 60
    .line 61
    new-instance v5, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 67
    .line 68
    invoke-static {v0}, Ll/ib4;->c2(Ll/ib4;)Ll/tow;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget v0, v0, Ll/tow;->e:I

    .line 73
    .line 74
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v0, " height "

    .line 78
    .line 79
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 83
    .line 84
    invoke-static {v0}, Ll/ib4;->c2(Ll/ib4;)Ll/tow;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget v0, v0, Ll/tow;->f:I

    .line 89
    .line 90
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v0, "planerSize:"

    .line 94
    .line 95
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, " data length:"

    .line 102
    .line 103
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/ib4$h;->a:[B

    .line 107
    .line 108
    array-length v0, v0

    .line 109
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v3, v4, v0}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 120
    .line 121
    iget-object v0, v0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 122
    .line 123
    if-eqz v0, :cond_1

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-ge v0, v2, :cond_2

    .line 130
    .line 131
    :cond_1
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 132
    .line 133
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iput-object v3, v0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    :cond_2
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 140
    .line 141
    iget-object v0, v0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    if-eqz v0, :cond_3

    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    div-int/lit8 v3, v2, 0x2

    .line 150
    .line 151
    if-ge v0, v3, :cond_4

    .line 152
    .line 153
    :cond_3
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 154
    .line 155
    div-int/lit8 v3, v2, 0x2

    .line 156
    .line 157
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    iput-object v3, v0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    :cond_4
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 164
    .line 165
    iget-object v0, v0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    iget-object v3, p0, Ll/ib4$h;->a:[B

    .line 168
    .line 169
    invoke-virtual {v0, v3, v1, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 173
    .line 174
    iget-object v0, v0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 175
    .line 176
    iget-object v3, p0, Ll/ib4$h;->a:[B

    .line 177
    .line 178
    div-int/lit8 v4, v2, 0x2

    .line 179
    .line 180
    invoke-virtual {v0, v3, v2, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 184
    .line 185
    iget-object v0, v0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 191
    .line 192
    iget-object v0, v0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 193
    .line 194
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 198
    .line 199
    invoke-static {v0, v1}, Ll/ib4;->d2(Ll/ib4;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :catch_0
    iget-object p0, p0, Ll/ib4$h;->b:Ll/ib4;

    .line 204
    .line 205
    invoke-static {p0, v1}, Ll/ib4;->d2(Ll/ib4;Z)Z

    .line 206
    .line 207
    .line 208
    return-void
.end method
