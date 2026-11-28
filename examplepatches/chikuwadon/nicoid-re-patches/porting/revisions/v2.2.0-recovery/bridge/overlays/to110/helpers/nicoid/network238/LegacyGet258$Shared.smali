.class Lnicoid/network238/LegacyGet258$Shared;
.super Ljava/lang/Object;
.source "LegacyGet258.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/LegacyGet258;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Shared"
.end annotation


# static fields
.field static final CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

.field static final COMMENT_READ:Lnicoid/network238/okhttp3/OkHttpClient;

.field static final DOWNLOAD:Lnicoid/network238/okhttp3/OkHttpClient;

.field static final SESSION:Lnicoid/network238/okhttp3/OkHttpClient;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 28
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    const-wide/16 v1, 0xd

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide/16 v1, 0xa

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    .line 29
    sget-object v0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Lnicoid/network238/AuthenticatedWrite241$SingleSend;

    invoke-direct {v1}, Lnicoid/network238/AuthenticatedWrite241$SingleSend;-><init>()V

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/LegacyGet258$Shared;->SESSION:Lnicoid/network238/okhttp3/OkHttpClient;

    .line 30
    sget-object v0, Lnicoid/network238/LegacyGet258$Shared;->SESSION:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x12

    invoke-virtual {v0, v2, v3, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/LegacyGet258$Shared;->COMMENT_READ:Lnicoid/network238/okhttp3/OkHttpClient;

    .line 31
    sget-object v0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/LegacyGet258$Shared;->DOWNLOAD:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
