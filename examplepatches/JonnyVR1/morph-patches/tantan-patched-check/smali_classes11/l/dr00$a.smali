.class public final Ll/dr00$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dr00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/VideoCut;",
            ">;"
        }
    .end annotation
.end field

.field private d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

.field private e:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/AudioBackground;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dr00$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/moment/mediautils/cmds/AudioBackground;)Ll/dr00$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr00$a;->f:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/dr00$a;->f:Ljava/util/List;

    .line 11
    .line 12
    iget-object v0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 24
    .line 25
    iget-object v1, p0, Ll/dr00$a;->f:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->setAudioBackgrounds(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/dr00$a;->f:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public b(Ljava/lang/String;FIIZ)Ll/dr00$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setBgPath(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setRatio(F)V

    .line 10
    .line 11
    .line 12
    int-to-long p1, p3

    .line 13
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setStart(J)V

    .line 14
    .line 15
    .line 16
    int-to-long p1, p4

    .line 17
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setEnd(J)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p5}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setCycle(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/dr00$a;->a(Lcom/immomo/moment/mediautils/cmds/AudioBackground;)Ll/dr00$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public c(Ljava/util/Collection;)Ll/dr00$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/immomo/moment/mediautils/cmds/VideoCut;",
            ">;)",
            "Ll/dr00$a;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/dr00$a;->c:Ljava/util/List;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/dr00$a;->c:Ljava/util/List;

    .line 13
    .line 14
    iget-object v0, p0, Ll/dr00$a;->b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/dr00$a;->b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/dr00$a;->b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 26
    .line 27
    iget-object v1, p0, Ll/dr00$a;->c:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setVideoCuts(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Ll/dr00$a;->c:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    :cond_2
    return-object p0
.end method

.method public final d()Lcom/immomo/moment/mediautils/cmds/EffectModel;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/EffectModel;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/dr00$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->setMediaPath(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/dr00$a;->b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/dr00$a;->b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 21
    .line 22
    :cond_0
    iget-object v1, p0, Ll/dr00$a;->b:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->setVideoEffects(Lcom/immomo/moment/mediautils/cmds/VideoEffects;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    new-instance v1, Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->setAudioEffects(Lcom/immomo/moment/mediautils/cmds/AudioEffects;)V

    .line 41
    .line 42
    .line 43
    return-object v0
.end method

.method public e(FZ)Ll/dr00$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr00$a;->e:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/dr00$a;->e:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 11
    .line 12
    iget-object v0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/dr00$a;->d:Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 24
    .line 25
    iget-object v1, p0, Ll/dr00$a;->e:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->setAudioSource(Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/dr00$a;->e:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->b(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/dr00$a;->e:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 36
    .line 37
    invoke-virtual {p2, p1}, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->c(F)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method
