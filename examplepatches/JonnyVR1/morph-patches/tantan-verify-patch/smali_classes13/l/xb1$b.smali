.class Ll/xb1$b;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xb1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ll/xb1;


# direct methods
.method private constructor <init>(Ll/xb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/xb1;Ll/xb1$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/xb1$b;-><init>(Ll/xb1;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x3
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xb1;->a(Ll/xb1;)Landroid/media/AudioTrack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/xb1$b$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/xb1$b$a;-><init>(Ll/xb1$b;)V

    .line 13
    .line 14
    .line 15
    :goto_0
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 16
    .line 17
    invoke-static {v1}, Ll/xb1;->c(Ll/xb1;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 22
    .line 23
    if-nez v1, :cond_3

    .line 24
    .line 25
    invoke-static {v2}, Ll/xb1;->d(Ll/xb1;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 32
    .line 33
    invoke-static {v1}, Ll/xb1;->a(Ll/xb1;)Landroid/media/AudioTrack;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 41
    .line 42
    invoke-static {v1}, Ll/xb1;->a(Ll/xb1;)Landroid/media/AudioTrack;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V

    .line 47
    .line 48
    .line 49
    :try_start_0
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 50
    .line 51
    invoke-static {v1}, Ll/xb1;->f(Ll/xb1;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x2

    .line 56
    if-ne v1, v2, :cond_0

    .line 57
    .line 58
    const/16 v1, 0xc

    .line 59
    .line 60
    :goto_1
    move v6, v1

    .line 61
    goto :goto_2

    .line 62
    :cond_0
    const/4 v1, 0x4

    .line 63
    goto :goto_1

    .line 64
    :goto_2
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 65
    .line 66
    invoke-static {v1}, Ll/xb1;->g(Ll/xb1;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const/16 v3, 0x10

    .line 71
    .line 72
    if-ne v1, v3, :cond_1

    .line 73
    .line 74
    :goto_3
    move v7, v2

    .line 75
    goto :goto_4

    .line 76
    :cond_1
    const/4 v2, 0x3

    .line 77
    goto :goto_3

    .line 78
    :goto_4
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 79
    .line 80
    invoke-static {v1}, Ll/xb1;->j(Ll/xb1;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-static {v2, v6, v7}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-static {v1, v2}, Ll/xb1;->i(Ll/xb1;I)I

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 92
    .line 93
    new-instance v3, Landroid/media/AudioTrack;

    .line 94
    .line 95
    iget-object v2, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 96
    .line 97
    invoke-static {v2}, Ll/xb1;->k(Ll/xb1;)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    iget-object v2, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 102
    .line 103
    invoke-static {v2}, Ll/xb1;->j(Ll/xb1;)I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    iget-object v2, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 108
    .line 109
    invoke-static {v2}, Ll/xb1;->h(Ll/xb1;)I

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    const/4 v9, 0x1

    .line 114
    invoke-direct/range {v3 .. v9}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 115
    .line 116
    .line 117
    invoke-static {v1, v3}, Ll/xb1;->b(Ll/xb1;Landroid/media/AudioTrack;)Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 121
    .line 122
    invoke-static {v1}, Ll/xb1;->a(Ll/xb1;)Landroid/media/AudioTrack;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Landroid/media/AudioTrack;->play()V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 130
    .line 131
    const/4 v2, 0x0

    .line 132
    invoke-static {v1, v2}, Ll/xb1;->e(Ll/xb1;Z)Z

    .line 133
    .line 134
    .line 135
    goto :goto_5

    .line 136
    :catch_0
    iget-object p0, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 137
    .line 138
    const/4 v0, 0x0

    .line 139
    invoke-static {p0, v0}, Ll/xb1;->b(Ll/xb1;Landroid/media/AudioTrack;)Landroid/media/AudioTrack;

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    :goto_5
    iget-object v1, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 144
    .line 145
    invoke-static {v1}, Ll/xb1;->l(Ll/xb1;)Ll/ra1;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1, v0}, Ll/ra1;->c(Ll/ra1$a;)V

    .line 150
    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_3
    invoke-static {v2}, Ll/xb1;->a(Ll/xb1;)Landroid/media/AudioTrack;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 159
    .line 160
    .line 161
    return-void
.end method
