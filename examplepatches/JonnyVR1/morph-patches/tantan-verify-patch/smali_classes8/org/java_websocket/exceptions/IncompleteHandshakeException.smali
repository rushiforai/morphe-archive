.class public Lorg/java_websocket/exceptions/IncompleteHandshakeException;
.super Ljava/lang/RuntimeException;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x6db9dfe70a9994e4L


# instance fields
.field private preferedSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/java_websocket/exceptions/IncompleteHandshakeException;->preferedSize:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 9
    iput p1, p0, Lorg/java_websocket/exceptions/IncompleteHandshakeException;->preferedSize:I

    return-void
.end method


# virtual methods
.method public getPreferedSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/java_websocket/exceptions/IncompleteHandshakeException;->preferedSize:I

    .line 2
    .line 3
    return p0
.end method
