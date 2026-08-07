.class public Lcom/momosec/mmuid/network/exception/HttpBaseException;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public errorCode:I

.field public httpResultString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/momosec/mmuid/network/exception/HttpBaseException;->errorCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 10
    iput p2, p0, Lcom/momosec/mmuid/network/exception/HttpBaseException;->errorCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/momosec/mmuid/network/exception/HttpBaseException;->errorCode:I

    .line 5
    .line 6
    iput-object p3, p0, Lcom/momosec/mmuid/network/exception/HttpBaseException;->httpResultString:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lcom/momosec/mmuid/network/exception/HttpBaseException;->errorCode:I

    return-void
.end method
