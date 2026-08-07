.class Lcom/tencent/iliveroom/a/a$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->startRemoteRender(JLandroid/view/TextureView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Landroid/view/TextureView;

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;JLandroid/view/TextureView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/iliveroom/a/a$4;->b:Landroid/view/TextureView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 9
    .line 10
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-static {v0, v1, v3}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$4;->b:Landroid/view/TextureView;

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 39
    .line 40
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 57
    .line 58
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/tencent/iliveroom/a/a$a;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a$a;->b()V

    .line 69
    .line 70
    .line 71
    :cond_1
    new-instance v0, Lcom/tencent/iliveroom/a/a$a;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 74
    .line 75
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 76
    .line 77
    iget-object v5, p0, Lcom/tencent/iliveroom/a/a$4;->b:Landroid/view/TextureView;

    .line 78
    .line 79
    invoke-direct {v0, v1, v3, v4, v5}, Lcom/tencent/iliveroom/a/a$a;-><init>(Lcom/tencent/iliveroom/a/a;JLandroid/view/TextureView;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 83
    .line 84
    invoke-static {v1}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 89
    .line 90
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a$a;->a()Landroid/view/Surface;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 104
    .line 105
    new-instance v3, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 111
    .line 112
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a$a;->a()Landroid/view/Surface;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/4 v4, 0x0

    .line 127
    invoke-static {v1, v3, v4, v0}, Lcom/tencent/iliveroom/a/a;->h(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$4;->c:Lcom/tencent/iliveroom/a/a;

    .line 131
    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    iget-wide v5, p0, Lcom/tencent/iliveroom/a/a$4;->a:J

    .line 138
    .line 139
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a$4;->b:Landroid/view/TextureView;

    .line 150
    .line 151
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$4;->b:Landroid/view/TextureView;

    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    invoke-static {v0, v1, v4, v2, p0}, Lcom/tencent/iliveroom/a/a;->e(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V

    .line 162
    .line 163
    .line 164
    :cond_2
    :goto_0
    return-void
.end method
