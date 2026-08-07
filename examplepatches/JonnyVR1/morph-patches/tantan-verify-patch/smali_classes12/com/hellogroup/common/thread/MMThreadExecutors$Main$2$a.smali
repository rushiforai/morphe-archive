.class final Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tl80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2;->invoke()Ll/tl80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0002\u001a\n \u0001*\u0004\u0018\u00010\u00000\u0000H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Lio/reactivex/Scheduler;",
        "kotlin.jvm.PlatformType",
        "a",
        "()Lio/reactivex/Scheduler;"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2$a;

    invoke-direct {v0}, Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2$a;-><init>()V

    sput-object v0, Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2$a;->INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lio/reactivex/Scheduler;
    .locals 0

    .line 1
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
