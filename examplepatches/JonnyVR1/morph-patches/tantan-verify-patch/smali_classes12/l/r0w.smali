.class public final Ll/r0w;
.super Ll/b6k0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/b6k0<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u001f\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0002H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000b\u0010\u000c\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/r0w;",
        "Ll/b6k0;",
        "",
        "Ll/etl;",
        "repository",
        "<init>",
        "(Ll/etl;)V",
        "mac",
        "Lio/reactivex/Flowable;",
        "f",
        "(Ljava/lang/String;)Lio/reactivex/Flowable;",
        "d",
        "Ll/etl;",
        "getRepository",
        "()Ll/etl;",
        "MKFDT_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final d:Ll/etl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/etl;)V
    .locals 2
    .param p1    # Ll/etl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/hellogroup/common/thread/MMThreadExecutors;->INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/hellogroup/common/thread/MMThreadExecutors;->b()Ll/lxi0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0}, Lcom/hellogroup/common/thread/MMThreadExecutors;->a()Ll/tl80;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p0, v1, v0}, Ll/b6k0;-><init>(Ll/lxi0;Ll/tl80;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/r0w;->d:Ll/etl;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/Object;)Lio/reactivex/Flowable;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r0w;->f(Ljava/lang/String;)Lio/reactivex/Flowable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f(Ljava/lang/String;)Lio/reactivex/Flowable;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lio/reactivex/Flowable<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lio/reactivex/Flowable;->empty()Lio/reactivex/Flowable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/r0w;->d:Ll/etl;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/etl;->b(Ljava/lang/String;)Lio/reactivex/Flowable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
