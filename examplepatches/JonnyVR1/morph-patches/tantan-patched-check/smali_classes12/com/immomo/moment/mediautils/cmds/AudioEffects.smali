.class public Lcom/immomo/moment/mediautils/cmds/AudioEffects;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;
    }
.end annotation


# instance fields
.field private audioBackgrounds:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bg"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/AudioBackground;",
            ">;"
        }
    .end annotation
.end field

.field private audioSource:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "source"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAudioBackgrounds()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/AudioBackground;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->audioBackgrounds:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioSource()Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->audioSource:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAudioBackgrounds(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/AudioBackground;",
            ">;)V"
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->audioBackgrounds:Ljava/util/List;

    return-void
.end method

.method public varargs setAudioBackgrounds([Lcom/immomo/moment/mediautils/cmds/AudioBackground;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->audioBackgrounds:Ljava/util/List;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    array-length v1, p1

    .line 16
    if-ge v0, v1, :cond_2

    .line 17
    .line 18
    aget-object v1, p1, v0

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->audioBackgrounds:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    :goto_1
    return-void
.end method

.method public setAudioSource(Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->audioSource:Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 2
    .line 3
    return-void
.end method
