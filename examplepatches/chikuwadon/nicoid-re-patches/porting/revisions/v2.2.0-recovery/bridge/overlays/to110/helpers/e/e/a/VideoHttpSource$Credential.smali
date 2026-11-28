.class final Le/e/a/VideoHttpSource$Credential;
.super Ljava/lang/Object;
.source "VideoHttpSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoHttpSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Credential"
.end annotation


# instance fields
.field final client:Lnicoid/network238/okhttp3/OkHttpClient;

.field final cookie:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Le/e/a/VideoHttpSource$Credential;->cookie:Ljava/lang/String;

    invoke-static {}, Le/e/a/VideoHttpSource;->newSessionClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Le/e/a/VideoHttpSource$Credential;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method
