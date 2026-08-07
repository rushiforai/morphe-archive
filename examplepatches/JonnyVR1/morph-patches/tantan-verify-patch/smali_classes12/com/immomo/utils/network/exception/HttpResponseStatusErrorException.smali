.class public Lcom/immomo/utils/network/exception/HttpResponseStatusErrorException;
.super Lcom/immomo/utils/network/exception/HttpBaseException;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public statusCode:I


# direct methods
.method public constructor <init>(I)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x25

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    new-array v1, v1, [B

    .line 25
    .line 26
    const/16 v2, 0x19

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    aput-byte v2, v1, v3

    .line 30
    .line 31
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0, v0}, Lcom/immomo/utils/network/exception/HttpBaseException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput p1, p0, Lcom/immomo/utils/network/exception/HttpResponseStatusErrorException;->statusCode:I

    .line 46
    .line 47
    return-void

    .line 48
    nop

    .line 49
    :array_0
    .array-data 1
        -0x29t
        -0x25t
        -0x60t
        -0x30t
        -0x26t
        -0x6t
        -0x28t
        -0x37t
        -0x7at
        -0x2ft
        -0x30t
        -0x1ct
        -0x2bt
        -0x3et
        -0x80t
        -0x21t
        -0x2bt
        -0x3dt
        -0x21t
        -0x26t
        -0x43t
        -0x21t
        -0x32t
        -0x2ft
        -0x29t
        -0x32t
        -0x44t
        -0x2et
        -0xft
        -0x18t
        -0x27t
        -0x1ft
        -0x44t
        -0x21t
        -0x32t
        -0xdt
        0x18t
    .end array-data
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    new-array v1, v1, [B

    .line 26
    .line 27
    fill-array-data v1, :array_0

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    new-array v1, v0, [B

    .line 42
    .line 43
    const/16 v3, 0x6b

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    aput-byte v3, v1, v4

    .line 47
    .line 48
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget p0, p0, Lcom/immomo/utils/network/exception/HttpResponseStatusErrorException;->statusCode:I

    .line 56
    .line 57
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    new-array p0, v0, [B

    .line 61
    .line 62
    const/16 v0, 0x6d

    .line 63
    .line 64
    aput-byte v0, p0, v4

    .line 65
    .line 66
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    nop

    .line 79
    :array_0
    .array-data 1
        0xat
        0x46t
    .end array-data
.end method
