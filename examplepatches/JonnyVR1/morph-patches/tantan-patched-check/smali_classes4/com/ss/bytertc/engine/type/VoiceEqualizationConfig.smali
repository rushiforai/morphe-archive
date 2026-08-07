.class public Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public frequency:Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;

.field public gain:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->frequency:Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->gain:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "the frequency: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->frequency:Lcom/ss/bytertc/engine/type/VoiceEqualizationBandFrequency;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", the gain: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/ss/bytertc/engine/type/VoiceEqualizationConfig;->gain:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
