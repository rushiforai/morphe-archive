.class Ll/cu10$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kpw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cu10;->s0(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ll/lpw;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/lpw;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:J

.field final synthetic d:Ll/cu10;


# direct methods
.method public constructor <init>(Ll/cu10;Ll/lpw;Ljava/lang/String;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10$c;->d:Ll/cu10;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cu10$c;->a:Ll/lpw;

    .line 4
    .line 5
    iput-object p3, p0, Ll/cu10$c;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p4, p0, Ll/cu10$c;->c:J

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    const-string v0, "RecoderUtils"

    .line 2
    .line 3
    const-string v1, "Splicing process finished !"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cu10$c;->a:Ll/lpw;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/16 v1, 0x64

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/lpw;->b(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/cu10$c;->a:Ll/lpw;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/lpw;->c()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cu10$c;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Ll/cu10;->d(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-wide v3, p0, Ll/cu10$c;->c:J

    .line 40
    .line 41
    sub-long/2addr v0, v3

    .line 42
    invoke-virtual {v2, v0, v1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraEncoderTime(J)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public onProcessProgress(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Process "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RecoderUtils"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/cu10$c;->a:Ll/lpw;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/high16 v0, 0x42c80000    # 100.0f

    .line 25
    .line 26
    mul-float/2addr p1, v0

    .line 27
    float-to-int p1, p1

    .line 28
    const/16 v0, 0x64

    .line 29
    .line 30
    if-le p1, v0, :cond_0

    .line 31
    .line 32
    move p1, v0

    .line 33
    :cond_0
    invoke-interface {p0, p1}, Ll/lpw;->b(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
