.class Lcom/tencent/iliveroom/a/a$40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->onVideoQosChanged(IIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;IIIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$40;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/iliveroom/a/a$40;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/iliveroom/a/a$40;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/iliveroom/a/a$40;->d:I

    .line 10
    .line 11
    iput p6, p0, Lcom/tencent/iliveroom/a/a$40;->e:I

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
    .locals 5

    .line 1
    iget v0, p0, Lcom/tencent/iliveroom/a/a$40;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 7
    .line 8
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 9
    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->b:I

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->P(Lcom/tencent/iliveroom/a/a;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ne v1, v0, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/tencent/iliveroom/a/a$40;->c:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tencent/iliveroom/a/a;->Q(Lcom/tencent/iliveroom/a/a;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 31
    .line 32
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->b:I

    .line 33
    .line 34
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;I)I

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 38
    .line 39
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->c:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;I)I

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 45
    .line 46
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 47
    .line 48
    iget-object v2, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->Q(Lcom/tencent/iliveroom/a/a;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 57
    .line 58
    invoke-static {v3}, Lcom/tencent/iliveroom/a/a;->P(Lcom/tencent/iliveroom/a/a;)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {v1, v2, v0, v3}, Lcom/tencent/iliveroom/a/c/e;->onRoomVideoQosChanged(Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->R(Lcom/tencent/iliveroom/a/a;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->d:I

    .line 72
    .line 73
    if-ne v0, v1, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->S(Lcom/tencent/iliveroom/a/a;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->e:I

    .line 82
    .line 83
    if-eq v0, v1, :cond_3

    .line 84
    .line 85
    :cond_2
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 86
    .line 87
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->d:I

    .line 88
    .line 89
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->d(Lcom/tencent/iliveroom/a/a;I)I

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 93
    .line 94
    iget v1, p0, Lcom/tencent/iliveroom/a/a$40;->e:I

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;I)I

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$40;->f:Lcom/tencent/iliveroom/a/a;

    .line 100
    .line 101
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 104
    .line 105
    iget-wide v2, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 106
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v4, "\u89c6\u9891\u5206\u8fa8\u7387\u6539\u53d8 w:"

    .line 110
    .line 111
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget v4, p0, Lcom/tencent/iliveroom/a/a$40;->d:I

    .line 115
    .line 116
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v4, " h:"

    .line 120
    .line 121
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget p0, p0, Lcom/tencent/iliveroom/a/a$40;->e:I

    .line 125
    .line 126
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const/16 v0, 0x32d0

    .line 134
    .line 135
    invoke-virtual {v1, v2, v3, v0, p0}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    return-void
.end method
