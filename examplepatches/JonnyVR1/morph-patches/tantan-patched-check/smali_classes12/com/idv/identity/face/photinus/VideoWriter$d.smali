.class Lcom/idv/identity/face/photinus/VideoWriter$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/face/photinus/VideoWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field a:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

.field b:Landroid/net/Uri;

.field c:Ll/f6j;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    sget-object v0, Lcom/idv/identity/face/photinus/VideoWriter$RequestType;->rCloseMoveFile:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    iput-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$d;->a:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter$d;->b:Landroid/net/Uri;

    .line 5
    .line 6
    sget-object p1, Lcom/idv/identity/face/photinus/VideoWriter$RequestType;->rStartNewMovie:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter$d;->a:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ll/f6j;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter$d;->c:Ll/f6j;

    .line 13
    sget-object p1, Lcom/idv/identity/face/photinus/VideoWriter$RequestType;->rAddMovieFrame:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter$d;->a:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    return-void
.end method
