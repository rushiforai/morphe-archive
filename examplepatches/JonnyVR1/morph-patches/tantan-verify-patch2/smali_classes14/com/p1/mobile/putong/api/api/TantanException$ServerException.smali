.class public Lcom/p1/mobile/putong/api/api/TantanException$ServerException;
.super Lcom/tantanapp/common/network/ApiExcep$Server;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/TantanException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ServerException"
.end annotation


# instance fields
.field public final code:I

.field public final meta:Lcom/p1/mobile/putong/data/Meta;


# direct methods
.method public constructor <init>(Ll/i5d0;ILcom/p1/mobile/putong/data/Meta;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/network/ApiExcep$Server;-><init>(Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->code:I

    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 7
    .line 8
    return-void
.end method
