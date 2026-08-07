.class Lcom/immomo/audioeffect/AudioEffect$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/audioeffect/AudioEffect$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/audioeffect/AudioEffect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/audioeffect/AudioEffect;


# direct methods
.method public constructor <init>(Lcom/immomo/audioeffect/AudioEffect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/audioeffect/AudioEffect$c;->a:Lcom/immomo/audioeffect/AudioEffect;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a([BI)[B
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect$c;->a:Lcom/immomo/audioeffect/AudioEffect;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/audioeffect/AudioEffect;->REVERB:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1, p1, p2}, Lcom/immomo/audioeffect/AudioEffect;->a(Lcom/immomo/audioeffect/AudioEffect;Ljava/lang/String;[BI)[B

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/immomo/audioeffect/AudioEffect$c;->a:Lcom/immomo/audioeffect/AudioEffect;

    .line 10
    .line 11
    iget-object p2, p0, Lcom/immomo/audioeffect/AudioEffect;->EQ:Ljava/lang/String;

    .line 12
    .line 13
    array-length v0, p1

    .line 14
    invoke-static {p0, p2, p1, v0}, Lcom/immomo/audioeffect/AudioEffect;->a(Lcom/immomo/audioeffect/AudioEffect;Ljava/lang/String;[BI)[B

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
