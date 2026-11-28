.class final Lnicoid/network238/StreamConnection256$Shared;
.super Ljava/lang/Object;
.source "StreamConnection256.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/StreamConnection256;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Shared"
.end annotation


# static fields
.field static final CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 30
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/StreamConnection256$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
