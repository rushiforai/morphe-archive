.class Ll/wc4$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wc4;->s2(Ll/omw;[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:Ll/wc4;


# direct methods
.method public constructor <init>(Ll/wc4;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wc4$j;->a:[B

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
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wc4;->b2(Ll/wc4;)Ll/ja4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/ja4;->f()Ll/xpl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 15
    .line 16
    iget v1, v0, Ll/wc4;->s:I

    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    iput v1, v0, Ll/wc4;->s:I

    .line 21
    .line 22
    invoke-static {v0}, Ll/wc4;->c2(Ll/wc4;)Ll/tow;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget v1, v1, Ll/tow;->e:I

    .line 27
    .line 28
    iget-object v2, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 29
    .line 30
    invoke-static {v2}, Ll/wc4;->c2(Ll/wc4;)Ll/tow;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget v2, v2, Ll/tow;->f:I

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Ll/wej;->setRenderSize(II)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 40
    .line 41
    invoke-static {v0}, Ll/wc4;->c2(Ll/wc4;)Ll/tow;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget v0, v0, Ll/tow;->e:I

    .line 46
    .line 47
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 48
    .line 49
    invoke-static {v1}, Ll/wc4;->c2(Ll/wc4;)Ll/tow;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget v1, v1, Ll/tow;->f:I

    .line 54
    .line 55
    mul-int/2addr v0, v1

    .line 56
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v3, "camera preview width "

    .line 63
    .line 64
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 68
    .line 69
    invoke-static {v3}, Ll/wc4;->c2(Ll/wc4;)Ll/tow;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget v3, v3, Ll/tow;->e:I

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v3, " height "

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object v3, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 84
    .line 85
    invoke-static {v3}, Ll/wc4;->c2(Ll/wc4;)Ll/tow;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iget v3, v3, Ll/tow;->f:I

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v3, "planerSize:"

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v3, " data length:"

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Ll/wc4$j;->a:[B

    .line 108
    .line 109
    array-length v3, v3

    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    const-string v3, "Pipeline_Normal_pip->PIPLINE"

    .line 118
    .line 119
    invoke-virtual {v1, v3, v2}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 123
    .line 124
    iget-object v1, v1, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    if-eqz v1, :cond_1

    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-ge v1, v0, :cond_2

    .line 133
    .line 134
    :cond_1
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 135
    .line 136
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, v1, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    :cond_2
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 143
    .line 144
    iget-object v1, v1, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 145
    .line 146
    if-eqz v1, :cond_3

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    div-int/lit8 v2, v0, 0x2

    .line 153
    .line 154
    if-ge v1, v2, :cond_4

    .line 155
    .line 156
    :cond_3
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 157
    .line 158
    div-int/lit8 v2, v0, 0x2

    .line 159
    .line 160
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    iput-object v2, v1, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    :cond_4
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 167
    .line 168
    iget-object v1, v1, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    iget-object v2, p0, Ll/wc4$j;->a:[B

    .line 171
    .line 172
    const/4 v3, 0x0

    .line 173
    invoke-virtual {v1, v2, v3, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 177
    .line 178
    iget-object v1, v1, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    iget-object v2, p0, Ll/wc4$j;->a:[B

    .line 181
    .line 182
    div-int/lit8 v4, v0, 0x2

    .line 183
    .line 184
    invoke-virtual {v1, v2, v0, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 188
    .line 189
    iget-object v0, v0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 190
    .line 191
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 195
    .line 196
    iget-object v0, v0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 197
    .line 198
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Ll/wc4$j;->b:Ll/wc4;

    .line 202
    .line 203
    invoke-static {p0, v3}, Ll/wc4;->d2(Ll/wc4;Z)Z

    .line 204
    .line 205
    .line 206
    return-void
.end method
