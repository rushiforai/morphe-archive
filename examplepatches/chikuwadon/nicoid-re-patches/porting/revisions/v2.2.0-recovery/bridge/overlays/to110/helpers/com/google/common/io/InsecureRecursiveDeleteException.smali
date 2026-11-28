.class public final Lcom/google/common/io/InsecureRecursiveDeleteException;
.super Ljava/nio/file/FileSystemException;
.source "InsecureRecursiveDeleteException.java"


# static fields
.field private static final serialVersionUID:J = -0xb79698c5f2f93c6L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    const/4 v0, 0x0

    .line 47
    const-string v1, "unable to guarantee security of recursive delete"

    invoke-direct {p0, p1, v0, v1}, Ljava/nio/file/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
