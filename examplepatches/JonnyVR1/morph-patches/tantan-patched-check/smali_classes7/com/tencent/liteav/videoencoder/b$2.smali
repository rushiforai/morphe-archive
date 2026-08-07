.class Lcom/tencent/liteav/videoencoder/b$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/videoencoder/b;->a([BIIIJ)J
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:[B

.field final synthetic e:J

.field final synthetic f:Lcom/tencent/liteav/videoencoder/b;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/b;III[BJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/videoencoder/b$2;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/videoencoder/b$2;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/videoencoder/b$2;->c:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/videoencoder/b$2;->d:[B

    .line 10
    .line 11
    iput-wide p6, p0, Lcom/tencent/liteav/videoencoder/b$2;->e:J

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->n()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget v1, p0, Lcom/tencent/liteav/videoencoder/b$2;->a:I

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->o()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget v1, p0, Lcom/tencent/liteav/videoencoder/b$2;->b:I

    .line 34
    .line 35
    if-eq v0, v1, :cond_4

    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 61
    .line 62
    new-instance v2, Lcom/tencent/liteav/beauty/b/k;

    .line 63
    .line 64
    iget v3, p0, Lcom/tencent/liteav/videoencoder/b$2;->c:I

    .line 65
    .line 66
    invoke-direct {v2, v3}, Lcom/tencent/liteav/beauty/b/k;-><init>(I)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v2}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->a()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 83
    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    invoke-static {v2}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/basic/c/b;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/basic/c/b;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->c()V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 102
    .line 103
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/basic/c/b;)Lcom/tencent/liteav/basic/c/b;

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 107
    .line 108
    invoke-static {p0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    invoke-static {v2}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/4 v1, 0x1

    .line 117
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 121
    .line 122
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget v1, p0, Lcom/tencent/liteav/videoencoder/b$2;->a:I

    .line 127
    .line 128
    iget v2, p0, Lcom/tencent/liteav/videoencoder/b$2;->b:I

    .line 129
    .line 130
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/beauty/b/k;->a(II)V

    .line 131
    .line 132
    .line 133
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b$2;->d:[B

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/k;->a([B)V

    .line 142
    .line 143
    .line 144
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->a:I

    .line 145
    .line 146
    iget v1, p0, Lcom/tencent/liteav/videoencoder/b$2;->b:I

    .line 147
    .line 148
    const/4 v2, 0x0

    .line 149
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->q()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b$2;->f:Lcom/tencent/liteav/videoencoder/b;

    .line 166
    .line 167
    iget v3, p0, Lcom/tencent/liteav/videoencoder/b$2;->a:I

    .line 168
    .line 169
    iget v4, p0, Lcom/tencent/liteav/videoencoder/b$2;->b:I

    .line 170
    .line 171
    iget-wide v5, p0, Lcom/tencent/liteav/videoencoder/b$2;->e:J

    .line 172
    .line 173
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/liteav/videoencoder/b;->a(IIIJ)J

    .line 174
    .line 175
    .line 176
    return-void
.end method
