.class public Ll/fyl0;
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

.method public static a(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;",
            ">;"
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
    const-string v1, "search"

    .line 8
    .line 9
    const-string v2, "suggested"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "page"

    .line 16
    .line 17
    const-string v3, "voice_room"

    .line 18
    .line 19
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "action"

    .line 24
    .line 25
    const-string v4, "stopped"

    .line 26
    .line 27
    invoke-static {v3, v4}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "source"

    .line 32
    .line 33
    invoke-static {v4, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v4, "oldLiveIds"

    .line 38
    .line 39
    invoke-static {v4, p1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {v1, v2, v3, p0, p1}, [Ll/st0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Ll/d9t;

    .line 52
    .line 53
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;

    .line 54
    .line 55
    const-string v1, "suggestedStopped"

    .line 56
    .line 57
    invoke-direct {p1, v0, v1}, Ll/d9t;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "requestEndSuggest"

    .line 61
    .line 62
    invoke-static {p0, v0, p1}, Ll/vrv;->v(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
