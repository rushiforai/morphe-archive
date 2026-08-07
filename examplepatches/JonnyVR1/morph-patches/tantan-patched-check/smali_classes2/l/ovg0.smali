.class public final Ll/ovg0;
.super Ll/ewg0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/ewg0;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/phg0;->c:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rrg0;->b(Ljava/nio/ByteBuffer;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p0, LSudthrow/Sudfor;

    .line 11
    .line 12
    const/16 v0, 0x3ef

    .line 13
    .line 14
    const-string v1, "Received text is no valid utf8 string!"

    .line 15
    .line 16
    invoke-direct {p0, v0, v1}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method
