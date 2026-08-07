.class public final Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;
.super Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 A2\u00020\u0001:\u0001AB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0015\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u000bH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJA\u0010\u0014\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u000b2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u000eH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00160\u000bH\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\rJ\u000f\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ#\u0010\"\u001a\u00020!2\u0006\u0010\u001e\u001a\u00020\u001d2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u00080\u001f\u00a2\u0006\u0004\u0008\"\u0010#J\u0015\u0010%\u001a\u00020\u00082\u0006\u0010$\u001a\u00020\u0018\u00a2\u0006\u0004\u0008%\u0010&J\r\u0010\'\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\'\u0010\u001cR\u0016\u0010(\u001a\u00020\u00188\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008(\u0010)R$\u0010+\u001a\u0004\u0018\u00010*8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008+\u0010,\u001a\u0004\u0008-\u0010.\"\u0004\u0008/\u00100R\u0014\u00102\u001a\u0002018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00082\u00103R$\u00104\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00084\u00105\u001a\u0004\u00086\u00107\"\u0004\u00088\u0010\nR\u0014\u0010:\u001a\u0002098\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008:\u0010;R\u0014\u0010<\u001a\u00020\u001d8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008<\u0010=R\u0016\u0010@\u001a\u0004\u0018\u00010\u000f8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008>\u0010?\u00a8\u0006B"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;",
        "Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "Ll/p5u;",
        "liveSuggestInfo",
        "",
        "checkNullData",
        "(Ll/p5u;)V",
        "Lrx/c;",
        "getZip",
        "()Lrx/c;",
        "",
        "",
        "stoppedLiveIds",
        "categories",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
        "curLives",
        "replaceStoppedLives",
        "(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lrx/c;",
        "Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;",
        "loadLiveBannersOb",
        "",
        "intlFeedRule",
        "()Z",
        "getData",
        "()V",
        "",
        "retainSeconds",
        "Lkotlin/Function0;",
        "doOnSuccess",
        "Ll/kcg0;",
        "remainOfficialTime",
        "(JLkotlin/jvm/functions/Function0;)Ll/kcg0;",
        "disableFilterRepeat",
        "loadNextPage",
        "(Z)V",
        "updateCurrentLiveInfo",
        "loadingNext",
        "Z",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
        "liveSquareTab",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
        "getLiveSquareTab",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
        "setLiveSquareTab",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V",
        "",
        "limit",
        "I",
        "info",
        "Ll/p5u;",
        "getInfo",
        "()Ll/p5u;",
        "setInfo",
        "Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;",
        "taskQueue",
        "Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;",
        "mergeAndDropDelay",
        "J",
        "getExtraQueryList",
        "()Ljava/lang/String;",
        "extraQueryList",
        "Companion",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final TYPE_LOAD_ALL:Ljava/lang/String; = "TYPE_LOAD_ALL"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final TYPE_LOAD_MORE:Ljava/lang/String; = "TYPE_LOAD_MORE"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final TYPE_LOAD_NORMAL:Ljava/lang/String; = "TYPE_LOAD_NORMAL"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private info:Ll/p5u;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final limit:I

.field private liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private loadingNext:Z

.field private final mergeAndDropDelay:J

.field private final taskQueue:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->Companion:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug$Companion;

    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 2
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    sget p1, Ll/y6u;->a:I

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->limit:I

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 12
    .line 13
    const-string v0, "LiveSquareSuggest"

    .line 14
    .line 15
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->taskQueue:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 19
    .line 20
    const-wide/16 v0, 0xbb8

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->mergeAndDropDelay:J

    .line 23
    .line 24
    return-void
.end method

.method private final checkNullData(Ll/p5u;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p1, "Null SuggestInfo"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static f(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Lkotlin/jvm/functions/Function0;Ll/p5u;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->checkNullData(Ll/p5u;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "TYPE_LOAD_NORMAL"

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private final getExtraQueryList()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "square-multi-call"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "liveTabSource=live-independent-multi-call"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, "liveTabSource=live-independent-tab-suggested"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method private final getZip()Lrx/c;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/p5u;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 6
    .line 7
    :goto_0
    move-object v2, v0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :goto_1
    iget v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->limit:I

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->getExtraQueryList()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v7

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->intlFeedRule()Z

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    const-string v1, "suggested"

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-static/range {v1 .. v8}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveListV2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->loadLiveBannersOb()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v1, Ll/x4u;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/x4u;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/y4u;

    .line 40
    .line 41
    invoke-direct {v2, v1}, Ll/y4u;-><init>(Lkotlin/jvm/functions/Function2;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, p0, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method private static final getZip$lambda$0$0(Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->removeLiveGroupBanners()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "videoChat"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private final intlFeedRule()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6s;->G0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static j(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->getZip()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static k(Lkotlin/jvm/functions/Function2;Ljava/lang/Object;Ljava/lang/Object;)Ll/p5u;
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/p5u;

    .line 6
    .line 7
    return-object p0
.end method

.method public static l(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->complete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final loadLiveBannersOb()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object v0, v1

    .line 10
    :goto_0
    const-string v2, "square-suggested"

    .line 11
    .line 12
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    move-object v0, v1

    .line 26
    :goto_1
    const-string v2, "square-newcomer"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 43
    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_3
    move-object v0, v1

    .line 50
    :goto_2
    if-eqz p0, :cond_4

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 53
    .line 54
    :cond_4
    const-string p0, "live-independent-tab"

    .line 55
    .line 56
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveBanners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance v0, Ll/m5u;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/m5u;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/util/List;Ll/p5u;)Lrx/c;
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, v0, Ll/ubu;->a:Ljava/util/List;

    .line 15
    .line 16
    iget-object v2, p2, Ll/ubu;->a:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p2, v0, v2}, Ll/ubu;->q(Ljava/util/List;Ljava/util/List;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Ll/ubu;->E(Ljava/util/List;I)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static n(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->loadingNext:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static o(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static p(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/util/List;)Lrx/c;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-nez v4, :cond_1

    .line 35
    .line 36
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 37
    .line 38
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v4, v3}, Ll/ubu;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->getRecommendCategory()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/16 v4, 0xa

    .line 72
    .line 73
    if-lt v3, v4, :cond_0

    .line 74
    .line 75
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_3

    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_3
    invoke-direct {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->replaceStoppedLives(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public static q(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static r(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "TYPE_LOAD_NORMAL"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->mergeAndDropDelay:J

    .line 9
    .line 10
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/z4u;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/z4u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method private final replaceStoppedLives(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;)",
            "Lrx/c<",
            "Ll/p5u;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->intlFeedRule()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->refreshStoppedLivesV2(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/n5u;

    .line 17
    .line 18
    invoke-direct {p2, p0, p3}, Ll/n5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ll/o5u;

    .line 22
    .line 23
    invoke-direct {p0, p2}, Ll/o5u;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public static s(Ll/p5u;Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;)Ll/p5u;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;->banners:Ljava/util/List;

    .line 7
    .line 8
    check-cast v0, Ljava/util/Collection;

    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;->banners:Ljava/util/List;

    .line 17
    .line 18
    check-cast v0, Ljava/util/Collection;

    .line 19
    .line 20
    new-instance v1, Ll/g5u;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/g5u;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;->banners:Ljava/util/List;

    .line 29
    .line 30
    check-cast v0, Ljava/util/Collection;

    .line 31
    .line 32
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/p5u;->c:Ljava/util/List;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;->banners:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    check-cast p1, Ljava/util/Collection;

    .line 46
    .line 47
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    return-object p0
.end method

.method public static t(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static u(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method private static final updateCurrentLiveInfo$lambda$4$0(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, p1}, Ll/ubu;->y(Ll/ubu;)Ll/ubu;

    .line 7
    .line 8
    .line 9
    const-string p1, "TYPE_LOAD_NORMAL"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;ZLl/p5u;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2, p1}, Ll/ubu;->x(Ll/ubu;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->checkNullData(Ll/p5u;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->loadingNext:Z

    .line 15
    .line 16
    const-string p1, "TYPE_LOAD_MORE"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->taskQueue:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->getZip()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/16 v1, 0x64

    .line 8
    .line 9
    const-string v2, "loadSuggestInfo"

    .line 10
    .line 11
    invoke-virtual {v0, v2, p0, v1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->f(Ljava/lang/String;Lrx/c;I)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static x(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->checkNullData(Ll/p5u;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "TYPE_LOAD_ALL"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->updateCurrentLiveInfo$lambda$4$0(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->getZip$lambda$0$0(Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;)V

    return-void
.end method


# virtual methods
.method public getData()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->loading()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/u4u;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/u4u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/f5u;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/f5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/h5u;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/h5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 30
    .line 31
    .line 32
    new-instance v3, Ll/i5u;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Ll/i5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final getInfo()Ll/p5u;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLiveSquareTab()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    return-object p0
.end method

.method public final loadNextPage(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ubu;->t()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->loadingNext:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->loadingNext:Z

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 29
    .line 30
    move-object v3, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    move-object v3, v1

    .line 33
    :goto_0
    iget v5, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->limit:I

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/ubu;->r()Lcom/p1/mobile/putong/data/Pagination;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    iget-object v0, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 47
    .line 48
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->getExtraQueryList()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->intlFeedRule()Z

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const-string v2, "suggested"

    .line 59
    .line 60
    const-string v4, ""

    .line 61
    .line 62
    const/4 v7, 0x0

    .line 63
    invoke-static/range {v2 .. v9}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveListV2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/v4u;

    .line 83
    .line 84
    invoke-direct {v1, p0, p1}, Ll/v4u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Z)V

    .line 85
    .line 86
    .line 87
    new-instance p1, Ll/w4u;

    .line 88
    .line 89
    invoke-direct {p1, p0}, Ll/w4u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_1
    return-void
.end method

.method public final remainOfficialTime(JLkotlin/jvm/functions/Function0;)Ll/kcg0;
    .locals 1
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Ll/kcg0;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 5
    .line 6
    invoke-static {p1, p2, v0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Ll/j5u;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/j5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/k5u;

    .line 16
    .line 17
    invoke-direct {v0, p2}, Ll/k5u;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/l5u;

    .line 40
    .line 41
    invoke-direct {p2, p0, p3}, Ll/l5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Lkotlin/jvm/functions/Function0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public final setInfo(Ll/p5u;)V
    .locals 0
    .param p1    # Ll/p5u;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    return-void
.end method

.method public final setLiveSquareTab(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->liveSquareTab:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    return-void
.end method

.method public final updateCurrentLiveInfo()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object v0, v0, Ll/ubu;->a:Ljava/util/List;

    .line 9
    .line 10
    check-cast v0, Ljava/util/Collection;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->info:Ll/p5u;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget-object v0, v0, Ll/ubu;->a:Ljava/util/List;

    .line 25
    .line 26
    check-cast v0, Ljava/util/Collection;

    .line 27
    .line 28
    new-instance v1, Ll/a5u;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/a5u;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/b5u;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/b5u;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/16 v1, 0x64

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->intlFeedRule()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->queryCurrentLivesInfo(Ljava/util/List;Z)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/c5u;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/c5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 70
    .line 71
    .line 72
    new-instance v2, Ll/d5u;

    .line 73
    .line 74
    invoke-direct {v2, v1}, Ll/d5u;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/e5u;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/e5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    :cond_1
    :goto_0
    return-void
.end method
