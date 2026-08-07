.class public Ll/vhw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mrl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a([B)[B
    .locals 1

    .line 1
    invoke-static {}, Lnet/jpountz/lz4/LZ4Factory;->fastestInstance()Lnet/jpountz/lz4/LZ4Factory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lnet/jpountz/lz4/LZ4Factory;->safeDecompressor()Lnet/jpountz/lz4/LZ4SafeDecompressor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const v0, 0x19000

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lnet/jpountz/lz4/LZ4SafeDecompressor;->decompress([BI)[B

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
