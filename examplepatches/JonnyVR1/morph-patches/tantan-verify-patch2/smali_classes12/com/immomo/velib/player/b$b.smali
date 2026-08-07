.class Lcom/immomo/velib/player/b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/velib/player/b;->f(Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/velib/anim/model/VideoEffectModel;

.field final synthetic b:Ll/dam;

.field final synthetic c:Lcom/immomo/velib/player/b;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/b$b;->c:Lcom/immomo/velib/player/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/velib/player/b$b;->b:Ll/dam;

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
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, v2}, Lcom/immomo/velib/anim/model/Element;->setType(I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-boolean v2, v1, Lcom/immomo/velib/anim/model/Element;->useCircle:Z

    .line 33
    .line 34
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->c:Lcom/immomo/velib/player/b;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    iget-object v4, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 49
    .line 50
    invoke-virtual {v4}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    iget-object v5, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 55
    .line 56
    invoke-virtual {v5}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getOriginVideoWidth()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-static {v1, v2, v3, v4, v5}, Lcom/immomo/velib/player/b;->b(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/Element;III)Ll/dkl0;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/4 v2, 0x2

    .line 84
    invoke-virtual {v1, v2}, Lcom/immomo/velib/anim/model/Element;->setType(I)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/immomo/velib/player/b$b;->c:Lcom/immomo/velib/player/b;

    .line 88
    .line 89
    iget-object v2, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget-object v3, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 96
    .line 97
    invoke-virtual {v3}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getWidth()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    iget-object v4, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 102
    .line 103
    invoke-virtual {v4}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    iget-object v5, p0, Lcom/immomo/velib/player/b$b;->a:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 108
    .line 109
    invoke-virtual {v5}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getOriginVideoWidth()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    invoke-static {v1, v2, v3, v4, v5}, Lcom/immomo/velib/player/b;->b(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/Element;III)Ll/dkl0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    if-eqz v1, :cond_1

    .line 118
    .line 119
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_1
    iget-object p0, p0, Lcom/immomo/velib/player/b$b;->b:Ll/dam;

    .line 123
    .line 124
    invoke-interface {p0, v0}, Ll/dam;->onEffectElementComplete(Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method
