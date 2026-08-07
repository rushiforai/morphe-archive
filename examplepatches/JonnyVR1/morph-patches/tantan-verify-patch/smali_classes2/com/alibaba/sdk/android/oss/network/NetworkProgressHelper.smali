.class public Lcom/alibaba/sdk/android/oss/network/NetworkProgressHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static addProgressRequestBody(Ljava/io/InputStream;JLjava/lang/String;Lcom/alibaba/sdk/android/oss/network/ExecutionContext;)Lcom/alibaba/sdk/android/oss/network/ProgressTouchableRequestBody;
    .locals 6

    .line 1
    new-instance v0, Lcom/alibaba/sdk/android/oss/network/ProgressTouchableRequestBody;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/alibaba/sdk/android/oss/network/ProgressTouchableRequestBody;-><init>(Ljava/io/InputStream;JLjava/lang/String;Lcom/alibaba/sdk/android/oss/network/ExecutionContext;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static addProgressResponseListener(Ll/rg50;Lcom/alibaba/sdk/android/oss/network/ExecutionContext;)Ll/rg50;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rg50;->v()Ll/rg50$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/alibaba/sdk/android/oss/network/NetworkProgressHelper$1;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/alibaba/sdk/android/oss/network/NetworkProgressHelper$1;-><init>(Lcom/alibaba/sdk/android/oss/network/ExecutionContext;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/rg50$b;->b(Ll/azm;)Ll/rg50$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/rg50$b;->c()Ll/rg50;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
