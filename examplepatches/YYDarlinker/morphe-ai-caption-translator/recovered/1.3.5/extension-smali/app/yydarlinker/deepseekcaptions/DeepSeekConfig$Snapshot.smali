.class final Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;
.super Ljava/lang/Object;
.source "DeepSeekConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Snapshot"
.end annotation


# instance fields
.field final apiKey:Ljava/lang/String;

.field final backgroundOpacity:I

.field final baseUrl:Ljava/lang/String;

.field final captionTextSize:I

.field final enabled:Z

.field final model:Ljava/lang/String;

.field final prompt:Ljava/lang/String;


# direct methods
.method constructor <init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .registers 8

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    .line 210
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    .line 211
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    .line 212
    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->prompt:Ljava/lang/String;

    .line 213
    iput p5, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->captionTextSize:I

    .line 214
    iput p6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->backgroundOpacity:I

    if-nez p7, :cond_13

    .line 215
    const-string p7, ""

    :cond_13
    iput-object p7, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method fingerprint()Ljava/lang/String;
    .registers 4

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->prompt:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method ready()Z
    .registers 2

    .line 219
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method
