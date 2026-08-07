.class Lcom/tencent/liteav/videoencoder/b$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/videoencoder/b;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/videoencoder/b;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    const/16 v1, 0x453

    .line 4
    .line 5
    const-string v2, "Switches from software encoding to hardware encoding"

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/c;->setListener(Lcom/tencent/liteav/videoencoder/d;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/tencent/liteav/videoencoder/c;->stop()V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 38
    .line 39
    new-instance v1, Lcom/tencent/liteav/videoencoder/a;

    .line 40
    .line 41
    invoke-direct {v1}, Lcom/tencent/liteav/videoencoder/a;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/videoencoder/c;)Lcom/tencent/liteav/videoencoder/c;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;I)I

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->g(Lcom/tencent/liteav/videoencoder/b;)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    int-to-long v1, v1

    .line 60
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/16 v2, 0xfa7

    .line 65
    .line 66
    invoke-virtual {v0, v2, v1}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 76
    .line 77
    invoke-static {v1}, Lcom/tencent/liteav/videoencoder/b;->h(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/c;->start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->e(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/d;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 99
    .line 100
    invoke-static {v1}, Lcom/tencent/liteav/videoencoder/b;->e(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/d;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/c;->setListener(Lcom/tencent/liteav/videoencoder/d;)V

    .line 105
    .line 106
    .line 107
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->f(Lcom/tencent/liteav/videoencoder/b;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 122
    .line 123
    invoke-static {v1}, Lcom/tencent/liteav/videoencoder/b;->f(Lcom/tencent/liteav/videoencoder/b;)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/c;->setBitrate(I)V

    .line 128
    .line 129
    .line 130
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 131
    .line 132
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/b;->d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b$7;->a:Lcom/tencent/liteav/videoencoder/b;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method
