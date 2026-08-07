.class public abstract Ll/zox0;
.super Ll/xox0;
.source "SourceFile"

# interfaces
.implements Ll/fyr0;


# instance fields
.field public k:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "mvhd"

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/xox0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final f()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xox0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xox0;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p0, Ll/zox0;->k:I

    .line 9
    .line 10
    return p0
.end method

.method public final g(Ljava/nio/ByteBuffer;)J
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/eyr0;->c(B)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/zox0;->k:I

    .line 10
    .line 11
    invoke-static {p1}, Ll/eyr0;->d(Ljava/nio/ByteBuffer;)I

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 15
    .line 16
    .line 17
    const-wide/16 p0, 0x4

    .line 18
    .line 19
    return-wide p0
.end method
