.class public Lcom/tantanapp/common/network/ApiExcep$Client;
.super Lcom/tantanapp/common/network/ApiExcep;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/ApiExcep;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Client"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/network/ApiExcep$Client$UnprocessableEntity;,
        Lcom/tantanapp/common/network/ApiExcep$Client$ImATeapot;,
        Lcom/tantanapp/common/network/ApiExcep$Client$UnsupportedMediaType;,
        Lcom/tantanapp/common/network/ApiExcep$Client$Gone;,
        Lcom/tantanapp/common/network/ApiExcep$Client$Conflict;,
        Lcom/tantanapp/common/network/ApiExcep$Client$MethodNotAllowed;,
        Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;,
        Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;,
        Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;,
        Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;,
        Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;,
        Lcom/tantanapp/common/network/ApiExcep$Client$RequestEntityTooLarge;
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/i5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/common/network/ApiExcep;-><init>(Ll/i5d0;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
