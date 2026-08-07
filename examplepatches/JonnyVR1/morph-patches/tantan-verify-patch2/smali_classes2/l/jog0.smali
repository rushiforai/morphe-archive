.class public final Ll/jog0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nzg0;


# instance fields
.field public final synthetic a:Ll/mug0;


# direct methods
.method public constructor <init>(Ll/mug0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jog0;->a:Ll/mug0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jog0;->a:Ll/mug0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "onRecognizeSuccess:"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "DoubaoRealSudASRImpl"

    .line 11
    .line 12
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    const-string v0, "DoubaoRealSudASRImpl"

    .line 2
    .line 3
    const-string v1, "db asr onClosed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jog0;->a:Ll/mug0;

    .line 9
    .line 10
    iget-object v0, v0, Ll/mug0;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/jog0;->a:Ll/mug0;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Ll/mug0;->stopASR(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final c(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "db asr onFailure:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v2, "DoubaoRealSudASRImpl"

    .line 20
    .line 21
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/jog0;->a:Ll/mug0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/mug0;->a:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/jog0;->a:Ll/mug0;

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Ll/mug0;->h:Z

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, Ll/mug0;->stopASR(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final d(ZLjava/lang/String;Ljava/lang/String;JJ)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p3, "onText:"

    .line 4
    .line 5
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p3, "DoubaoRealSudASRImpl"

    .line 16
    .line 17
    invoke-static {p3, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/jog0;->a:Ll/mug0;

    .line 21
    .line 22
    iget-object p1, p1, Ll/mug0;->a:Ljava/lang/String;

    .line 23
    .line 24
    new-instance p3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string p4, "onText: "

    .line 27
    .line 28
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-static {p1, p3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/jog0;->a:Ll/mug0;

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->onRecognizingResult(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
