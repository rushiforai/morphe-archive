.class public Lcom/immomo/utils/network/exception/NetworkUnavailableException;
.super Lcom/immomo/utils/network/exception/HttpBaseException;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x21

    .line 17
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/immomo/utils/network/exception/HttpBaseException;-><init>(Ljava/lang/String;)V

    return-void

    nop

    :array_0
    .array-data 1
        -0x2bt
        -0x25t
        -0x5et
        -0x2et
        -0x18t
        -0x15t
        -0x29t
        -0x25t
        -0x60t
        -0x30t
        -0x26t
        -0x6t
        -0x2ct
        -0x22t
        -0x44t
        -0x2et
        -0x12t
        -0x37t
        -0x29t
        -0xet
        -0x67t
        -0x28t
        -0x23t
        -0x16t
        -0x28t
        -0x37t
        -0x7at
        -0x2ft
        -0x3et
        -0x1at
        -0x2at
        -0x7t
        -0x6ct
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/16 p1, 0x21

    .line 2
    .line 3
    new-array p1, p1, [B

    .line 4
    .line 5
    fill-array-data p1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0, p1}, Lcom/immomo/utils/network/exception/HttpBaseException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    nop

    .line 17
    :array_0
    .array-data 1
        -0x2bt
        -0x25t
        -0x5et
        -0x2et
        -0x18t
        -0x15t
        -0x29t
        -0x25t
        -0x60t
        -0x30t
        -0x26t
        -0x6t
        -0x2ct
        -0x22t
        -0x44t
        -0x2et
        -0x12t
        -0x37t
        -0x29t
        -0xet
        -0x67t
        -0x28t
        -0x23t
        -0x16t
        -0x28t
        -0x37t
        -0x7at
        -0x2ft
        -0x3et
        -0x1at
        -0x2at
        -0x7t
        -0x6ct
    .end array-data
.end method
