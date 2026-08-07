.class public Ll/mr3$a;
.super Ljava/io/OutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mr3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ByteStreams.nullOutputStream()"

    .line 2
    .line 3
    return-object p0
.end method

.method public write(I)V
    .locals 0

    .line 11
    return-void
.end method

.method public write([B)V
    .locals 0

    .line 10
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public write([BII)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    add-int/2addr p3, p2

    .line 5
    array-length p0, p1

    .line 6
    invoke-static {p2, p3, p0}, Ll/xn80;->u(III)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
