.class public Lcom/momosec/mmuid/network/exception/HttpsCertificateException;
.super Lcom/momosec/mmuid/network/exception/HttpBaseException;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/fiw;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/momosec/mmuid/R$string;->e:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0, v0, p1}, Lcom/momosec/mmuid/network/exception/HttpBaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p2, p1}, Lcom/momosec/mmuid/network/exception/HttpBaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
