.class final Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RetryInterceptor"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0002\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;",
        "Ll/azm;",
        "",
        "maxRetry",
        "<init>",
        "(I)V",
        "Ll/azm$a;",
        "chain",
        "Ll/i5d0;",
        "intercept",
        "(Ll/azm$a;)Ll/i5d0;",
        "I",
        "getMaxRetry",
        "()I",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final maxRetry:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 11
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;->maxRetry:I

    return-void
.end method

.method public synthetic constructor <init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getMaxRetry()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;->maxRetry:I

    .line 2
    .line 3
    return p0
.end method

.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 6
    .param p1    # Ll/azm$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/azm$a;->request()Ll/x1d0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, -0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    move-object v3, v2

    .line 11
    :goto_0
    add-int/lit8 v4, v1, 0x1

    .line 12
    .line 13
    iget v5, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;->maxRetry:I

    .line 14
    .line 15
    if-ge v1, v5, :cond_3

    .line 16
    .line 17
    :try_start_0
    invoke-interface {p1, v0}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    .line 18
    .line 19
    .line 20
    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    goto :goto_1

    .line 22
    :catch_0
    move-exception v1

    .line 23
    iget v5, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;->maxRetry:I

    .line 24
    .line 25
    if-ge v4, v5, :cond_2

    .line 26
    .line 27
    :goto_1
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {v3}, Ll/i5d0;->I()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v5, 0x1

    .line 34
    if-ne v1, v5, :cond_0

    .line 35
    .line 36
    return-object v3

    .line 37
    :cond_0
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {v3}, Ll/i5d0;->close()V

    .line 40
    .line 41
    .line 42
    :cond_1
    move v1, v4

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    throw v1

    .line 45
    :cond_3
    const-string p0, "\u7f51\u7edc\u8bf7\u6c42\u5f02\u5e38"

    .line 46
    .line 47
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v2
.end method
