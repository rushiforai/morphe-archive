.class Lcom/tencent/liteav/f$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/a/a$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/f;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/f;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/f;->a(Lcom/tencent/liteav/f;)Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;-><init>()V

    .line 12
    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput p1, v0, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;->retCode:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, -0x1

    .line 21
    iput p1, v0, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;->retCode:I

    .line 22
    .line 23
    :goto_0
    iput-object p2, v0, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;->descMsg:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p3, v0, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;->videoPath:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p4, v0, Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;->coverPath:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p1, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/tencent/liteav/f;->a(Lcom/tencent/liteav/f;)Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1, v0}, Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;->onRecordComplete(Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tencent/liteav/f;->b(Lcom/tencent/liteav/f;)Lcom/tencent/liteav/renderer/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const/4 p2, 0x0

    .line 45
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/renderer/a;->a(Lcom/tencent/liteav/renderer/g;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/tencent/liteav/f;->b(Lcom/tencent/liteav/f;)Lcom/tencent/liteav/renderer/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/renderer/a;->a(Lcom/tencent/liteav/renderer/a$a;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public a(J)V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    invoke-static {v0}, Lcom/tencent/liteav/f;->a(Lcom/tencent/liteav/f;)Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 59
    iget-object p0, p0, Lcom/tencent/liteav/f$2;->a:Lcom/tencent/liteav/f;

    invoke-static {p0}, Lcom/tencent/liteav/f;->a(Lcom/tencent/liteav/f;)Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;->onRecordProgress(J)V

    :cond_0
    return-void
.end method
