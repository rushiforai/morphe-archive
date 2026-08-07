.class public Lcom/p1/mobile/putong/api/api/TantanException$Client$Unauthorized;
.super Lcom/tantanapp/common/network/ApiExcep$Client;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/TantanException$Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Unauthorized"
.end annotation


# direct methods
.method public constructor <init>(Ll/i5d0;)V
    .locals 1

    .line 1
    const-string v0, "unauthorized"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/common/network/ApiExcep$Client;-><init>(Ll/i5d0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
