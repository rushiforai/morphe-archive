.class public Lcom/android/volley/VolleyError;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final networkResponse:Ll/cl20;

.field private networkTimeMs:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/volley/VolleyError;->networkResponse:Ll/cl20;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/volley/VolleyError;->networkResponse:Ll/cl20;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/android/volley/VolleyError;->networkResponse:Ll/cl20;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/volley/VolleyError;->networkResponse:Ll/cl20;

    return-void
.end method

.method public constructor <init>(Ll/cl20;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/android/volley/VolleyError;->networkResponse:Ll/cl20;

    return-void
.end method


# virtual methods
.method public getNetworkTimeMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/volley/VolleyError;->networkTimeMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setNetworkTimeMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/volley/VolleyError;->networkTimeMs:J

    .line 2
    .line 3
    return-void
.end method
