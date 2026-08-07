.class public final Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;",
        "",
        "()V",
        "DEFAULT_HTTP_FACTORY",
        "Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;",
        "getDEFAULT_HTTP_FACTORY",
        "()Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getDEFAULT_HTTP_FACTORY()Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->access$getDEFAULT_HTTP_FACTORY$cp()Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
