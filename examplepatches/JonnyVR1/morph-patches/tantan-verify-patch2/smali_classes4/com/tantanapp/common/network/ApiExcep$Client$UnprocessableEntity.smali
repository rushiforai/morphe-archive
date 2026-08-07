.class public Lcom/tantanapp/common/network/ApiExcep$Client$UnprocessableEntity;
.super Lcom/tantanapp/common/network/ApiExcep$Client;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/ApiExcep$Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UnprocessableEntity"
.end annotation


# direct methods
.method public constructor <init>(Ll/i5d0;)V
    .locals 1

    .line 1
    const-string v0, "unprocessable entity"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/common/network/ApiExcep$Client;-><init>(Ll/i5d0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
