.class public Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static doConversationAction(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/live-chat/message-cells/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    new-array v0, v0, [Ll/st0;

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "action"

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "tailSeq"

    .line 37
    .line 38
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p1, p2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    const-string p1, "type"

    .line 53
    .line 54
    invoke-virtual {p0, p1, p4}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, ""

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->v(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public static getGuessLikeData()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;",
            ">;"
        }
    .end annotation

    .line 55
    const-string v0, ""

    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getGuessLikeData(Ljava/lang/String;)Lrx/c;

    move-result-object v0

    return-object v0
.end method

.method public static getGuessLikeData(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-distribution/suggested-detail?"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    new-array v0, v0, [Ll/st0;

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "source"

    .line 31
    .line 32
    const-string v1, "search"

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-class v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;

    .line 43
    .line 44
    const-string v1, "suggestedDetail"

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static getLikedVoiceRooms(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "/live-chat/message-cells"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "source"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->r(Ll/rnl;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/t7v;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/t7v;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static getNextPageSearchResult(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-distribution/search-detail?"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    new-array v0, v0, [Ll/st0;

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-class v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;

    .line 35
    .line 36
    const-string v1, "searchDetail"

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static getNextPageTabDetail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-distribution/refresh?source="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p2, "&tabId="

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "&"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 p1, 0x0

    .line 36
    new-array p1, p1, [Ll/st0;

    .line 37
    .line 38
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-class p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;

    .line 43
    .line 44
    const-string p2, "tabDetail"

    .line 45
    .line 46
    invoke-static {p1, p2}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static getSearchResult(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/search-detail"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "query"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-class v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;

    .line 29
    .line 30
    const-string v1, "searchDetail"

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static getTabDetail(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/tab-detail"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "tabId"

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "source"

    .line 14
    .line 15
    invoke-static {v1, p1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p0, p1}, [Ll/st0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-class p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;

    .line 28
    .line 29
    const-string v0, "tabDetail"

    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static getVoiceSummaryEntryData()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;",
            ">;"
        }
    .end annotation

    .line 38
    const-string v0, "/voice-distribution/summary"

    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    move-result-object v0

    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    move-result-object v0

    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    move-result-object v0

    .line 39
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    const-string v2, "summary"

    .line 40
    invoke-static {v1, v2}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    move-result-object v0

    return-object v0
.end method

.method public static getVoiceSummaryEntryData(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/summary"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "source"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-class v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 26
    .line 27
    const-string v1, "summary"

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static notifyLeaveVoiceSquare()V
    .locals 2

    .line 1
    const-string v0, "/voice-distribution/leaveSquare"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, ""

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static postClearSummaryEntryRedSpot()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/live-counters"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-class v1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 20
    .line 21
    invoke-static {v1}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, ""

    .line 26
    .line 27
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->x(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static requestEntrysSuggested(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-distribution/voiceLives?search=suggested&source="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-class v0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;

    .line 28
    .line 29
    const-string v1, "voiceLives"

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/h9t;->a(Ljava/lang/Class;Ljava/lang/String;)Ll/c9t;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static requestHeaders()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/head-entrys"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;

    .line 15
    .line 16
    invoke-static {v1}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0
.end method

.method public static requestRandom(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareSingleEntryBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/random-entry"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "tabId"

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ll/st0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-class v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareSingleEntryBean;

    .line 22
    .line 23
    const-string v1, "randomEntry"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static requestSuggestVoiceLive(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/voiceLives"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "search"

    .line 12
    .line 13
    const-string v2, "suggested"

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "source"

    .line 20
    .line 21
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "liveId"

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-class p1, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;

    .line 36
    .line 37
    const-string v0, "voiceLives"

    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/h9t;->a(Ljava/lang/Class;Ljava/lang/String;)Ll/c9t;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public static requestTab()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/tab-list"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;

    .line 15
    .line 16
    const-string v2, "tabList"

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/h9t;->a(Ljava/lang/Class;Ljava/lang/String;)Ll/c9t;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public static squarePopup()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-distribution/square-spec-channel-popup"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;

    .line 15
    .line 16
    const-string v2, "voiceSquareSpecChannelPopup"

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->s(Ll/rnl;Ll/wxr;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method
