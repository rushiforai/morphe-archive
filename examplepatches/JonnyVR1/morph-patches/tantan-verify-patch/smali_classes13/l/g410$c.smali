.class Ll/g410$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->z(Ll/gfj;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/pipline/MomoInterface/MomoCodec;

.field final synthetic b:Ll/uow;

.field final synthetic c:Ll/gfj;

.field final synthetic d:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;Ll/gfj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$c;->d:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 4
    .line 5
    iput-object p3, p0, Ll/g410$c;->b:Ll/uow;

    .line 6
    .line 7
    iput-object p4, p0, Ll/g410$c;->c:Ll/gfj;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g410$c;->d:Ll/g410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "mProcessingPipeline.runOnDraw codecFilter.isCameraCodec"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 19
    .line 20
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->r1()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ",mpCodec:"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/g410$c;->b:Ll/uow;

    .line 33
    .line 34
    iget-boolean v2, v2, Ll/uow;->G0:Z

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "MomoPiplineImpl"

    .line 44
    .line 45
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 53
    .line 54
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->r1()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Ll/g410$c;->b:Ll/uow;

    .line 61
    .line 62
    iget-boolean v0, v0, Ll/uow;->G0:Z

    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    iget-object v0, p0, Ll/g410$c;->d:Ll/g410;

    .line 68
    .line 69
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 70
    .line 71
    iget-object v1, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 72
    .line 73
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/g410$c;->d:Ll/g410;

    .line 81
    .line 82
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 83
    .line 84
    iget-object p0, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 85
    .line 86
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Ll/rsy;->addTarget(Ll/dfj;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/g410$c;->d:Ll/g410;

    .line 95
    .line 96
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 97
    .line 98
    iget-object v1, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 99
    .line 100
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/g410$c;->d:Ll/g410;

    .line 108
    .line 109
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 110
    .line 111
    iget-object p0, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 112
    .line 113
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Ll/rsy;->Q1(Ll/dfj;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    iget-object v0, p0, Ll/g410$c;->c:Ll/gfj;

    .line 122
    .line 123
    iget-object v1, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 124
    .line 125
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/g410$c;->c:Ll/gfj;

    .line 133
    .line 134
    iget-object p0, p0, Ll/g410$c;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 135
    .line 136
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method
