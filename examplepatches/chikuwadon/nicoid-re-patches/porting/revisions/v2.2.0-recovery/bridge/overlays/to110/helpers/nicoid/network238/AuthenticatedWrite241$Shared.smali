.class final Lnicoid/network238/AuthenticatedWrite241$Shared;
.super Ljava/lang/Object;
.source "AuthenticatedWrite241.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/AuthenticatedWrite241;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Shared"
.end annotation


# static fields
.field static final CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 46
    invoke-static {}, Lnicoid/network238/AuthenticatedWrite241;->builder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/AuthenticatedWrite241$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
