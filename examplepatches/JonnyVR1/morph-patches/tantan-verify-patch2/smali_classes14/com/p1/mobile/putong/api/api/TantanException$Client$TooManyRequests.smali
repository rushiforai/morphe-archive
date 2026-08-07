.class public Lcom/p1/mobile/putong/api/api/TantanException$Client$TooManyRequests;
.super Lcom/tantanapp/common/network/ApiExcep$Client;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/TantanException$Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TooManyRequests"
.end annotation


# instance fields
.field public final resetInSeconds:I


# direct methods
.method public constructor <init>(Ll/i5d0;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "too many requests. reset in "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/common/network/ApiExcep$Client;-><init>(Ll/i5d0;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput p2, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TooManyRequests;->resetInSeconds:I

    .line 19
    .line 20
    return-void
.end method
