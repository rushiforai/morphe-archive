.class Lcom/immomo/momomediaext/MMLiveEngine$f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$f;->a(Ljava/lang/Object;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/immomo/momomediaext/MMLiveEngine$f;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$f;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->b:I

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->a:I

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    if-eq v0, v1, :cond_4

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/enw;->H(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v1, "onSurroundMusicPause:"

    .line 51
    .line 52
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->b:I

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 83
    .line 84
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Ll/enw;->J(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 91
    .line 92
    .line 93
    const-string p0, "onSurroundMusicStoped"

    .line 94
    .line 95
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 114
    .line 115
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 120
    .line 121
    invoke-virtual {v0, p0}, Ll/enw;->I(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 122
    .line 123
    .line 124
    const-string p0, "onSurroundMusicStart"

    .line 125
    .line 126
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_4
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 137
    .line 138
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->c:Lcom/immomo/momomediaext/MMLiveEngine$f;

    .line 143
    .line 144
    iget-object v1, v1, Lcom/immomo/momomediaext/MMLiveEngine$f;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 145
    .line 146
    invoke-static {v1}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iget-object v1, v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ll/enw;->F(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 153
    .line 154
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v1, "onSurroundMusicError:"

    .line 158
    .line 159
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$f$a;->b:I

    .line 163
    .line 164
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method
