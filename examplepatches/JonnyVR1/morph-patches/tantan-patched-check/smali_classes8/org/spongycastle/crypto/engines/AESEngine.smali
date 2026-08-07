.class public Lorg/spongycastle/crypto/engines/AESEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x10

.field private static final S:[B

.field private static final Si:[B

.field private static final T0:[I

.field private static final Tinv0:[I

.field private static final m1:I = -0x7f7f7f80

.field private static final m2:I = 0x7f7f7f7f

.field private static final m3:I = 0x1b

.field private static final m4:I = -0x3f3f3f40

.field private static final m5:I = 0x3f3f3f3f

.field private static final rcon:[I


# instance fields
.field private C0:I

.field private C1:I

.field private C2:I

.field private C3:I

.field private ROUNDS:I

.field private WorkingKey:[[I

.field private forEncryption:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lorg/spongycastle/crypto/engines/AESEngine;->S:[B

    .line 9
    .line 10
    new-array v1, v0, [B

    .line 11
    .line 12
    fill-array-data v1, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v1, Lorg/spongycastle/crypto/engines/AESEngine;->Si:[B

    .line 16
    .line 17
    const/16 v1, 0x1e

    .line 18
    .line 19
    new-array v1, v1, [I

    .line 20
    .line 21
    fill-array-data v1, :array_2

    .line 22
    .line 23
    .line 24
    sput-object v1, Lorg/spongycastle/crypto/engines/AESEngine;->rcon:[I

    .line 25
    .line 26
    new-array v1, v0, [I

    .line 27
    .line 28
    fill-array-data v1, :array_3

    .line 29
    .line 30
    .line 31
    sput-object v1, Lorg/spongycastle/crypto/engines/AESEngine;->T0:[I

    .line 32
    .line 33
    new-array v0, v0, [I

    .line 34
    .line 35
    fill-array-data v0, :array_4

    .line 36
    .line 37
    .line 38
    sput-object v0, Lorg/spongycastle/crypto/engines/AESEngine;->Tinv0:[I

    .line 39
    .line 40
    return-void

    .line 41
    :array_0
    .array-data 1
        0x63t
        0x7ct
        0x77t
        0x7bt
        -0xet
        0x6bt
        0x6ft
        -0x3bt
        0x30t
        0x1t
        0x67t
        0x2bt
        -0x2t
        -0x29t
        -0x55t
        0x76t
        -0x36t
        -0x7et
        -0x37t
        0x7dt
        -0x6t
        0x59t
        0x47t
        -0x10t
        -0x53t
        -0x2ct
        -0x5et
        -0x51t
        -0x64t
        -0x5ct
        0x72t
        -0x40t
        -0x49t
        -0x3t
        -0x6dt
        0x26t
        0x36t
        0x3ft
        -0x9t
        -0x34t
        0x34t
        -0x5bt
        -0x1bt
        -0xft
        0x71t
        -0x28t
        0x31t
        0x15t
        0x4t
        -0x39t
        0x23t
        -0x3dt
        0x18t
        -0x6at
        0x5t
        -0x66t
        0x7t
        0x12t
        -0x80t
        -0x1et
        -0x15t
        0x27t
        -0x4et
        0x75t
        0x9t
        -0x7dt
        0x2ct
        0x1at
        0x1bt
        0x6et
        0x5at
        -0x60t
        0x52t
        0x3bt
        -0x2at
        -0x4dt
        0x29t
        -0x1dt
        0x2ft
        -0x7ct
        0x53t
        -0x2ft
        0x0t
        -0x13t
        0x20t
        -0x4t
        -0x4ft
        0x5bt
        0x6at
        -0x35t
        -0x42t
        0x39t
        0x4at
        0x4ct
        0x58t
        -0x31t
        -0x30t
        -0x11t
        -0x56t
        -0x5t
        0x43t
        0x4dt
        0x33t
        -0x7bt
        0x45t
        -0x7t
        0x2t
        0x7ft
        0x50t
        0x3ct
        -0x61t
        -0x58t
        0x51t
        -0x5dt
        0x40t
        -0x71t
        -0x6et
        -0x63t
        0x38t
        -0xbt
        -0x44t
        -0x4at
        -0x26t
        0x21t
        0x10t
        -0x1t
        -0xdt
        -0x2et
        -0x33t
        0xct
        0x13t
        -0x14t
        0x5ft
        -0x69t
        0x44t
        0x17t
        -0x3ct
        -0x59t
        0x7et
        0x3dt
        0x64t
        0x5dt
        0x19t
        0x73t
        0x60t
        -0x7ft
        0x4ft
        -0x24t
        0x22t
        0x2at
        -0x70t
        -0x78t
        0x46t
        -0x12t
        -0x48t
        0x14t
        -0x22t
        0x5et
        0xbt
        -0x25t
        -0x20t
        0x32t
        0x3at
        0xat
        0x49t
        0x6t
        0x24t
        0x5ct
        -0x3et
        -0x2dt
        -0x54t
        0x62t
        -0x6ft
        -0x6bt
        -0x1ct
        0x79t
        -0x19t
        -0x38t
        0x37t
        0x6dt
        -0x73t
        -0x2bt
        0x4et
        -0x57t
        0x6ct
        0x56t
        -0xct
        -0x16t
        0x65t
        0x7at
        -0x52t
        0x8t
        -0x46t
        0x78t
        0x25t
        0x2et
        0x1ct
        -0x5at
        -0x4ct
        -0x3at
        -0x18t
        -0x23t
        0x74t
        0x1ft
        0x4bt
        -0x43t
        -0x75t
        -0x76t
        0x70t
        0x3et
        -0x4bt
        0x66t
        0x48t
        0x3t
        -0xat
        0xet
        0x61t
        0x35t
        0x57t
        -0x47t
        -0x7at
        -0x3ft
        0x1dt
        -0x62t
        -0x1ft
        -0x8t
        -0x68t
        0x11t
        0x69t
        -0x27t
        -0x72t
        -0x6ct
        -0x65t
        0x1et
        -0x79t
        -0x17t
        -0x32t
        0x55t
        0x28t
        -0x21t
        -0x74t
        -0x5ft
        -0x77t
        0xdt
        -0x41t
        -0x1at
        0x42t
        0x68t
        0x41t
        -0x67t
        0x2dt
        0xft
        -0x50t
        0x54t
        -0x45t
        0x16t
    .end array-data

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    :array_1
    .array-data 1
        0x52t
        0x9t
        0x6at
        -0x2bt
        0x30t
        0x36t
        -0x5bt
        0x38t
        -0x41t
        0x40t
        -0x5dt
        -0x62t
        -0x7ft
        -0xdt
        -0x29t
        -0x5t
        0x7ct
        -0x1dt
        0x39t
        -0x7et
        -0x65t
        0x2ft
        -0x1t
        -0x79t
        0x34t
        -0x72t
        0x43t
        0x44t
        -0x3ct
        -0x22t
        -0x17t
        -0x35t
        0x54t
        0x7bt
        -0x6ct
        0x32t
        -0x5at
        -0x3et
        0x23t
        0x3dt
        -0x12t
        0x4ct
        -0x6bt
        0xbt
        0x42t
        -0x6t
        -0x3dt
        0x4et
        0x8t
        0x2et
        -0x5ft
        0x66t
        0x28t
        -0x27t
        0x24t
        -0x4et
        0x76t
        0x5bt
        -0x5et
        0x49t
        0x6dt
        -0x75t
        -0x2ft
        0x25t
        0x72t
        -0x8t
        -0xat
        0x64t
        -0x7at
        0x68t
        -0x68t
        0x16t
        -0x2ct
        -0x5ct
        0x5ct
        -0x34t
        0x5dt
        0x65t
        -0x4at
        -0x6et
        0x6ct
        0x70t
        0x48t
        0x50t
        -0x3t
        -0x13t
        -0x47t
        -0x26t
        0x5et
        0x15t
        0x46t
        0x57t
        -0x59t
        -0x73t
        -0x63t
        -0x7ct
        -0x70t
        -0x28t
        -0x55t
        0x0t
        -0x74t
        -0x44t
        -0x2dt
        0xat
        -0x9t
        -0x1ct
        0x58t
        0x5t
        -0x48t
        -0x4dt
        0x45t
        0x6t
        -0x30t
        0x2ct
        0x1et
        -0x71t
        -0x36t
        0x3ft
        0xft
        0x2t
        -0x3ft
        -0x51t
        -0x43t
        0x3t
        0x1t
        0x13t
        -0x76t
        0x6bt
        0x3at
        -0x6ft
        0x11t
        0x41t
        0x4ft
        0x67t
        -0x24t
        -0x16t
        -0x69t
        -0xet
        -0x31t
        -0x32t
        -0x10t
        -0x4ct
        -0x1at
        0x73t
        -0x6at
        -0x54t
        0x74t
        0x22t
        -0x19t
        -0x53t
        0x35t
        -0x7bt
        -0x1et
        -0x7t
        0x37t
        -0x18t
        0x1ct
        0x75t
        -0x21t
        0x6et
        0x47t
        -0xft
        0x1at
        0x71t
        0x1dt
        0x29t
        -0x3bt
        -0x77t
        0x6ft
        -0x49t
        0x62t
        0xet
        -0x56t
        0x18t
        -0x42t
        0x1bt
        -0x4t
        0x56t
        0x3et
        0x4bt
        -0x3at
        -0x2et
        0x79t
        0x20t
        -0x66t
        -0x25t
        -0x40t
        -0x2t
        0x78t
        -0x33t
        0x5at
        -0xct
        0x1ft
        -0x23t
        -0x58t
        0x33t
        -0x78t
        0x7t
        -0x39t
        0x31t
        -0x4ft
        0x12t
        0x10t
        0x59t
        0x27t
        -0x80t
        -0x14t
        0x5ft
        0x60t
        0x51t
        0x7ft
        -0x57t
        0x19t
        -0x4bt
        0x4at
        0xdt
        0x2dt
        -0x1bt
        0x7at
        -0x61t
        -0x6dt
        -0x37t
        -0x64t
        -0x11t
        -0x60t
        -0x20t
        0x3bt
        0x4dt
        -0x52t
        0x2at
        -0xbt
        -0x50t
        -0x38t
        -0x15t
        -0x45t
        0x3ct
        -0x7dt
        0x53t
        -0x67t
        0x61t
        0x17t
        0x2bt
        0x4t
        0x7et
        -0x46t
        0x77t
        -0x2at
        0x26t
        -0x1ft
        0x69t
        0x14t
        0x63t
        0x55t
        0x21t
        0xct
        0x7dt
    .end array-data

    :array_2
    .array-data 4
        0x1
        0x2
        0x4
        0x8
        0x10
        0x20
        0x40
        0x80
        0x1b
        0x36
        0x6c
        0xd8
        0xab
        0x4d
        0x9a
        0x2f
        0x5e
        0xbc
        0x63
        0xc6
        0x97
        0x35
        0x6a
        0xd4
        0xb3
        0x7d
        0xfa
        0xef
        0xc5
        0x91
    .end array-data

    :array_3
    .array-data 4
        -0x5a9c9c3a
        -0x7b838308
        -0x66888812
        -0x7284840a
        0xdf2f2ff
        -0x4294942a
        -0x4e909022
        0x54c5c591
        0x50303060
        0x3010102
        -0x56989832
        0x7d2b2b56
        0x19fefee7
        0x62d7d7b5
        -0x195454b3
        -0x65898914
        0x45caca8f
        -0x627d7de1
        0x40c9c989
        -0x78828206
        0x15fafaef
        -0x14a6a64e
        -0x36b8b872
        0xbf0f0fb
        -0x135252bf
        0x67d4d4b3
        -0x25d5da1
        -0x155050bb
        -0x406363dd
        -0x85b5bad
        -0x698d8d1c
        0x5bc0c09b
        -0x3d48488b
        0x1cfdfde1
        -0x516c6cc3
        0x6a26264c
        0x5a36366c
        0x413f3f7e
        0x2f7f7f5
        0x4fcccc83
        0x5c343468
        -0xb5a5aaf
        0x34e5e5d1
        0x8f1f1f9
        -0x6c8e8e1e
        0x73d8d8ab
        0x53313162
        0x3f15152a
        0xc040408
        0x52c7c795
        0x65232346
        0x5ec3c39d
        0x28181830
        -0x5e6969c9
        0xf05050a
        -0x4a6565d1
        0x907070e
        0x36121224
        -0x647f7fe5
        0x3de2e2df
        0x26ebebcd
        0x6927274e
        -0x324d4d81
        -0x608a8a16
        0x1b090912
        -0x617c7ce3
        0x742c2c58
        0x2e1a1a34
        0x2d1b1b36
        -0x4d919124
        -0x11a5a54c
        -0x45f5fa5
        -0x9adad5c
        0x4d3b3b76    # 1.9632726E8f
        0x61d6d6b7
        -0x314c4c83
        0x7b292952
        0x3ee3e3dd
        0x712f2f5e
        -0x687b7bed
        -0xaacac5a
        0x68d1d1b9
        0x0
        0x2cededc1
        0x60202040
        0x1ffcfce3
        -0x374e4e87
        -0x12a4a44a
        -0x4195952c
        0x46cbcb8d
        -0x26414199
        0x4b393972    # 1.2138866E7f
        -0x21b5b56c
        -0x2bb3b368
        -0x17a7a750
        0x4acfcf85    # 6809538.5f
        0x6bd0d0bb
        0x2aefefc5
        -0x1a5555b1
        0x16fbfbed
        -0x3abcbc7a
        -0x28b2b266
        0x55333366
        -0x6b7a7aef
        -0x30baba76
        0x10f9f9e9
        0x6020204
        -0x7e808002
        -0xfafaf60
        0x443c3c78
        -0x456060db
        -0x1c5757b5
        -0xcaeae5e
        -0x15c5ca3
        -0x3fbfbf80
        -0x757070fb
        -0x526d6dc1
        -0x436262df
        0x48383870    # 188641.75f
        0x4f5f5f1
        -0x2043439d
        -0x3e494989
        0x75dadaaf
        0x63212142
        0x30101020
        0x1affffe5
        0xef3f3fd
        0x6dd2d2bf
        0x4ccdcd81    # 1.0789991E8f
        0x140c0c18
        0x35131326
        0x2fececc3
        -0x1ea0a042
        -0x5d6868cb
        -0x33bbbb78    # -5.14504E7f
        0x3917172e
        0x57c4c493
        -0xd5858ab
        -0x7d818104
        0x473d3d7a
        -0x539b9b38
        -0x18a2a246
        0x2b191932
        -0x6a8c8c1a
        -0x5f9f9f40
        -0x677e7ee7
        -0x2eb0b062
        0x7fdcdca3
        0x66222244
        0x7e2a2a54
        -0x546f6fc5
        -0x7c7777f5
        -0x35b9b974    # -3248547.0f
        0x29eeeec7
        -0x2c474795
        0x3c141428
        0x79dedea7
        -0x1da1a144
        0x1d0b0b16
        0x76dbdbad
        0x3be0e0db
        0x56323264
        0x4e3a3a74
        0x1e0a0a14
        -0x24b6b66e
        0xa06060c
        0x6c242448
        -0x1ba3a348
        0x5dc2c29f
        0x6ed3d3bd
        -0x105353bd
        -0x599d9d3c
        -0x576e6ec7
        -0x5b6a6acf
        0x37e4e4d3
        -0x7486860e
        0x32e7e7d5
        0x43c8c88b
        0x5937376e
        -0x48929226
        -0x737272ff
        0x64d5d5b1
        -0x2db1b164
        -0x1f5656b7
        -0x4b939328
        -0x5a9a954
        0x7f4f4f3
        0x25eaeacf
        -0x509a9a36
        -0x7185850c
        -0x165151b9
        0x18080810
        -0x2a454591
        -0x77878710
        0x6f25254a
        0x722e2e5c
        0x241c1c38
        -0xe5959a9
        -0x384b4b8d
        0x51c6c697
        0x23e8e8cb
        0x7cdddda1
        -0x638b8b18
        0x211f1f3e
        -0x22b4b46a
        -0x2342429f
        -0x797474f3
        -0x7a7575f1
        -0x6f8f8f20
        0x423e3e7c
        -0x3b4a4a8f
        -0x55999934
        -0x27b7b770
        0x5030306
        0x1f6f6f7
        0x120e0e1c
        -0x5c9e9e3e
        0x5f35356a
        -0x6a8a852
        -0x2f464697
        -0x6e7979e9
        0x58c1c199
        0x271d1d3a
        -0x466161d9
        0x38e1e1d9
        0x13f8f8eb
        -0x4c6767d5
        0x33111122
        -0x4496962e
        0x70d9d9a9
        -0x767171f9
        -0x586b6bcd
        -0x496464d3
        0x221e1e3c
        -0x6d7878eb
        0x20e9e9c9
        0x49cece87
        -0xaaaa56
        0x78282850
        0x7adfdfa5
        -0x707373fd
        -0x75e5ea7
        -0x7f7676f7
        0x170d0d1a
        -0x2540409b
        0x31e6e6d7
        -0x39bdbd7c
        -0x47979730
        -0x3cbebe7e
        -0x4f6666d7
        0x772d2d5a
        0x110f0f1e
        -0x344f4f85    # -2.315903E7f
        -0x3abab58
        -0x29444493
        0x3a16162c
    .end array-data

    :array_4
    .array-data 4
        0x50a7f451
        0x5365417e
        -0x3c5be8e6
        -0x69a1d8c6
        -0x349454c5    # -1.5444795E7f
        -0xeba62e1
        -0x54a70554
        -0x6cfc1cb5
        0x55fa3020
        -0x9928953
        -0x6e893378
        0x254c02f5
        -0x3281ab1
        -0x2834d53b
        -0x7fbbcada
        -0x705c9d4b
        0x495ab1de    # 895773.9f
        0x671bba25
        -0x67f115bb
        -0x1e3f01a3
        0x2752fc3
        0x12f04c81
        -0x5c68b973
        -0x39062c95
        -0x18a070fd
        -0x6a636deb
        -0x14859241
        -0x25a6ad6b
        0x2d83bed4
        -0x2cde8ba8
        0x2969e049
        0x44c8c98e
        0x6a89c275
        0x78798ef4
        0x6b3e5899
        -0x228e46d9
        -0x49b01e42
        0x17ad88f0
        0x66ac20c9
        -0x4bc53183
        0x184adf63
        -0x7dcee51b
        0x60335197
        0x457f5362
        -0x1f889b4f
        -0x7b519445
        0x1ca081fe
        -0x6bd4f707
        0x58684870
        0x19fd458f
        -0x7893216c
        -0x480784ae
        0x23d373ab
        -0x1dfdb48e
        0x578f1fe3
        0x2aab5566
        0x728ebb2
        0x3c2b52f
        -0x65843a7a
        -0x5af7c82d
        -0xd78d7d0
        -0x4d5a40dd
        -0x4595fcfe
        0x5c8216ed
        0x2b1ccf8a
        -0x6d4b8659
        -0xf0df80d
        -0x5e1d96b2
        -0x320b259b
        -0x2a41fafa
        0x1f6234d1
        -0x7501593c
        -0x62acd1cc
        -0x5faa0c5e
        0x32e18a05
        0x75ebf6a4
        0x39ec830b
        -0x55109fc0
        0x69f715e
        0x51106ebd
        -0x675dec2
        0x3d06dd96
        -0x51fac123
        0x46bde64d
        -0x4a72ab6f
        0x55dc471
        0x6fd40604
        -0xeaafa0
        0x24fb9819
        -0x6816422a
        -0x33bcbf77    # -5.1184164E7f
        0x779ed967
        -0x42bd1750
        -0x777476f9
        0x385b19e7
        -0x24113787
        0x470a7ca1
        -0x16f0bd84
        -0x36e17b08    # -649295.5f
        0x0
        -0x7c797ff7
        0x48ed2b32
        -0x538feee2
        0x4e725a6c
        -0x400f103
        0x5638850f
        0x1ed5ae3d
        0x27392d36
        0x64d90f0a
        0x21a65c68
        -0x2eaba465
        0x3a2e3624
        -0x4e98f5f4
        0xfe75793
        -0x2d69114c
        -0x616e64e5
        0x4fc5c080
        -0x5ddf239f
        0x694b775a
        0x161a121c
        0xaba93e2
        -0x1ad55f40
        0x43e0223c
        0x1d171b12    # 1.9998679E-21f
        0xb0d090e
        -0x5238740e
        -0x465749d3
        -0x3756e1ec
        -0x7ae60ea9
        0x4c0775af    # 3.5509948E7f
        -0x44226612
        -0x29f805d
        -0x60d9fe09
        -0x430a8da4
        -0x3ac499bc
        0x347efb5b
        0x7629438b
        -0x2339dc35
        0x68fcedb6
        0x63f1e4b8
        -0x3523ce29    # -7215339.5f
        0x10856342
        0x40229713
        0x2011c684
        0x7d244a85
        -0x7c2442e
        0x1132f9ae
        0x6da129c7
        0x4b2f9e1d    # 1.1509277E7f
        -0xccf4d24    # -1.3999511E31f
        -0x13ad79f3
        -0x2f1c3e89
        0x6c16b32b
        -0x66468f57
        -0x5b76bef
        0x2264e947
        -0x3b730358
        0x1a3ff0a0
        -0x27d382aa
        -0x106fccde
        -0x38b1b679
        -0x3e2ec727
        -0x15d3574
        0x360bd498
        -0x307e0a5a
        0x28de7aa5
        0x268eb7da
        -0x5b4052c1
        -0x1b62c5d4
        0xd927850
        -0x6433a096
        0x62467e54
        -0x3dec720a
        -0x17472770
        0x5ef7392e
        -0xa503c7e
        -0x417fa261
        0x7c93d069
        -0x56d22a91
        -0x4cedda31
        0x3b99acc8
        -0x5882e7f0
        0x6e639ce8
        0x7bbb3bdb
        0x97826cd
        -0xbe7a692
        0x1b79aec
        -0x5765b07d
        0x656e95e6
        0x7ee6ffaa
        0x8cfbc21
        -0x1917ea11
        -0x26641846
        -0x31c990b6
        -0x2bf66016
        -0x29834fd7
        -0x504d5bcf
        0x31233f2a
        0x3094a5c6
        -0x3f995dcb
        0x37bc4e74
        -0x59357d04
        -0x4f2f6f20
        0x15d8a733
        0x4a9804f1    # 4981368.5f
        -0x82513bf
        0xe50cd7f
        0x2ff69117
        -0x7229b28a
        0x4db0ef43    # 3.7105878E8f
        0x544daacc
        -0x20fb691c
        -0x1c4a2e62
        0x1b886a4c
        -0x47e0d33f
        0x7f516546
        0x4ea5e9d    # 5.5100024E-36f
        0x5d358c01
        0x737487fa
        0x2e410bfb
        0x5a1d67b3
        0x52d2db92
        0x335610e9
        0x1347d66d
        -0x739e2866
        0x7a0ca137
        -0x71eb07a7
        -0x76c3ec15
        -0x11d85632
        0x35c961b7
        -0x121ae31f
        0x3cb1477a
        0x59dfd29c
        0x3f73f255
        0x79ce1418
        -0x40c8388d
        -0x153208ad
        0x5baafd5f
        0x146f3ddf
        -0x7924bb88
        -0x7e0c5036
        0x3ec468b9
        0x2c342438
        0x5f40a3c2
        0x72c31d16
        0xc25e2bc
        -0x74b6c3d8
        0x41950dff
        0x7101a839
        -0x214cf3f8
        -0x631b4b28
        -0x6f3ea99c
        0x6184cb7b
        0x70b632d5
        0x745c6c48
        0x4257b8d0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->WorkingKey:[[I

    .line 6
    .line 7
    return-void
.end method

.method private static FFmulX(I)I
    .locals 2

    const v0, 0x7f7f7f7f

    and-int/2addr v0, p0

    shl-int/lit8 v0, v0, 0x1

    const v1, -0x7f7f7f80

    and-int/2addr p0, v1

    ushr-int/lit8 p0, p0, 0x7

    mul-int/lit8 p0, p0, 0x1b

    xor-int/2addr p0, v0

    return p0
.end method

.method private static FFmulX2(I)I
    .locals 2

    const v0, 0x3f3f3f3f

    and-int/2addr v0, p0

    shl-int/lit8 v0, v0, 0x2

    const v1, -0x3f3f3f40

    and-int/2addr p0, v1

    ushr-int/lit8 v1, p0, 0x1

    xor-int/2addr p0, v1

    ushr-int/lit8 v1, p0, 0x2

    xor-int/2addr v0, v1

    ushr-int/lit8 p0, p0, 0x5

    xor-int/2addr p0, v0

    return p0
.end method

.method private decryptBlock([[I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 4
    .line 5
    iget v2, v0, Lorg/spongycastle/crypto/engines/AESEngine;->ROUNDS:I

    .line 6
    .line 7
    aget-object v3, p1, v2

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    aget v5, v3, v4

    .line 11
    .line 12
    xor-int/2addr v1, v5

    .line 13
    iget v5, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    aget v7, v3, v6

    .line 17
    .line 18
    xor-int/2addr v5, v7

    .line 19
    iget v7, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 20
    .line 21
    const/4 v8, 0x2

    .line 22
    aget v9, v3, v8

    .line 23
    .line 24
    xor-int/2addr v7, v9

    .line 25
    sub-int/2addr v2, v6

    .line 26
    iget v9, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 27
    .line 28
    const/4 v10, 0x3

    .line 29
    aget v3, v3, v10

    .line 30
    .line 31
    xor-int/2addr v3, v9

    .line 32
    :goto_0
    const/16 v9, 0x10

    .line 33
    .line 34
    const/16 v11, 0x18

    .line 35
    .line 36
    const/16 v12, 0x8

    .line 37
    .line 38
    if-le v2, v6, :cond_0

    .line 39
    .line 40
    sget-object v13, Lorg/spongycastle/crypto/engines/AESEngine;->Tinv0:[I

    .line 41
    .line 42
    and-int/lit16 v14, v1, 0xff

    .line 43
    .line 44
    aget v14, v13, v14

    .line 45
    .line 46
    shr-int/lit8 v15, v3, 0x8

    .line 47
    .line 48
    and-int/lit16 v15, v15, 0xff

    .line 49
    .line 50
    aget v15, v13, v15

    .line 51
    .line 52
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 53
    .line 54
    .line 55
    move-result v15

    .line 56
    xor-int/2addr v14, v15

    .line 57
    shr-int/lit8 v15, v7, 0x10

    .line 58
    .line 59
    and-int/lit16 v15, v15, 0xff

    .line 60
    .line 61
    aget v15, v13, v15

    .line 62
    .line 63
    invoke-static {v15, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 64
    .line 65
    .line 66
    move-result v15

    .line 67
    xor-int/2addr v14, v15

    .line 68
    shr-int/lit8 v15, v5, 0x18

    .line 69
    .line 70
    and-int/lit16 v15, v15, 0xff

    .line 71
    .line 72
    aget v15, v13, v15

    .line 73
    .line 74
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 75
    .line 76
    .line 77
    move-result v15

    .line 78
    xor-int/2addr v14, v15

    .line 79
    aget-object v15, p1, v2

    .line 80
    .line 81
    aget v15, v15, v4

    .line 82
    .line 83
    xor-int/2addr v14, v15

    .line 84
    and-int/lit16 v15, v5, 0xff

    .line 85
    .line 86
    aget v15, v13, v15

    .line 87
    .line 88
    move/from16 v16, v4

    .line 89
    .line 90
    shr-int/lit8 v4, v1, 0x8

    .line 91
    .line 92
    and-int/lit16 v4, v4, 0xff

    .line 93
    .line 94
    aget v4, v13, v4

    .line 95
    .line 96
    invoke-static {v4, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    xor-int/2addr v4, v15

    .line 101
    shr-int/lit8 v15, v3, 0x10

    .line 102
    .line 103
    and-int/lit16 v15, v15, 0xff

    .line 104
    .line 105
    aget v15, v13, v15

    .line 106
    .line 107
    invoke-static {v15, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 108
    .line 109
    .line 110
    move-result v15

    .line 111
    xor-int/2addr v4, v15

    .line 112
    shr-int/lit8 v15, v7, 0x18

    .line 113
    .line 114
    and-int/lit16 v15, v15, 0xff

    .line 115
    .line 116
    aget v15, v13, v15

    .line 117
    .line 118
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 119
    .line 120
    .line 121
    move-result v15

    .line 122
    xor-int/2addr v4, v15

    .line 123
    aget-object v15, p1, v2

    .line 124
    .line 125
    aget v15, v15, v6

    .line 126
    .line 127
    xor-int/2addr v4, v15

    .line 128
    and-int/lit16 v15, v7, 0xff

    .line 129
    .line 130
    aget v15, v13, v15

    .line 131
    .line 132
    move/from16 v17, v6

    .line 133
    .line 134
    shr-int/lit8 v6, v5, 0x8

    .line 135
    .line 136
    and-int/lit16 v6, v6, 0xff

    .line 137
    .line 138
    aget v6, v13, v6

    .line 139
    .line 140
    invoke-static {v6, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    xor-int/2addr v6, v15

    .line 145
    shr-int/lit8 v15, v1, 0x10

    .line 146
    .line 147
    and-int/lit16 v15, v15, 0xff

    .line 148
    .line 149
    aget v15, v13, v15

    .line 150
    .line 151
    invoke-static {v15, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 152
    .line 153
    .line 154
    move-result v15

    .line 155
    xor-int/2addr v6, v15

    .line 156
    shr-int/lit8 v15, v3, 0x18

    .line 157
    .line 158
    and-int/lit16 v15, v15, 0xff

    .line 159
    .line 160
    aget v15, v13, v15

    .line 161
    .line 162
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 163
    .line 164
    .line 165
    move-result v15

    .line 166
    xor-int/2addr v6, v15

    .line 167
    aget-object v15, p1, v2

    .line 168
    .line 169
    aget v15, v15, v8

    .line 170
    .line 171
    xor-int/2addr v6, v15

    .line 172
    and-int/lit16 v3, v3, 0xff

    .line 173
    .line 174
    aget v3, v13, v3

    .line 175
    .line 176
    shr-int/lit8 v7, v7, 0x8

    .line 177
    .line 178
    and-int/lit16 v7, v7, 0xff

    .line 179
    .line 180
    aget v7, v13, v7

    .line 181
    .line 182
    invoke-static {v7, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 183
    .line 184
    .line 185
    move-result v7

    .line 186
    xor-int/2addr v3, v7

    .line 187
    shr-int/lit8 v5, v5, 0x10

    .line 188
    .line 189
    and-int/lit16 v5, v5, 0xff

    .line 190
    .line 191
    aget v5, v13, v5

    .line 192
    .line 193
    invoke-static {v5, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    xor-int/2addr v3, v5

    .line 198
    shr-int/lit8 v1, v1, 0x18

    .line 199
    .line 200
    and-int/lit16 v1, v1, 0xff

    .line 201
    .line 202
    aget v1, v13, v1

    .line 203
    .line 204
    invoke-static {v1, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    xor-int/2addr v1, v3

    .line 209
    add-int/lit8 v3, v2, -0x1

    .line 210
    .line 211
    aget-object v5, p1, v2

    .line 212
    .line 213
    aget v5, v5, v10

    .line 214
    .line 215
    xor-int/2addr v1, v5

    .line 216
    and-int/lit16 v5, v14, 0xff

    .line 217
    .line 218
    aget v5, v13, v5

    .line 219
    .line 220
    shr-int/lit8 v7, v1, 0x8

    .line 221
    .line 222
    and-int/lit16 v7, v7, 0xff

    .line 223
    .line 224
    aget v7, v13, v7

    .line 225
    .line 226
    invoke-static {v7, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 227
    .line 228
    .line 229
    move-result v7

    .line 230
    xor-int/2addr v5, v7

    .line 231
    shr-int/lit8 v7, v6, 0x10

    .line 232
    .line 233
    and-int/lit16 v7, v7, 0xff

    .line 234
    .line 235
    aget v7, v13, v7

    .line 236
    .line 237
    invoke-static {v7, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 238
    .line 239
    .line 240
    move-result v7

    .line 241
    xor-int/2addr v5, v7

    .line 242
    shr-int/lit8 v7, v4, 0x18

    .line 243
    .line 244
    and-int/lit16 v7, v7, 0xff

    .line 245
    .line 246
    aget v7, v13, v7

    .line 247
    .line 248
    invoke-static {v7, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 249
    .line 250
    .line 251
    move-result v7

    .line 252
    xor-int/2addr v5, v7

    .line 253
    aget-object v7, p1, v3

    .line 254
    .line 255
    aget v7, v7, v16

    .line 256
    .line 257
    xor-int/2addr v5, v7

    .line 258
    and-int/lit16 v7, v4, 0xff

    .line 259
    .line 260
    aget v7, v13, v7

    .line 261
    .line 262
    shr-int/lit8 v15, v14, 0x8

    .line 263
    .line 264
    and-int/lit16 v15, v15, 0xff

    .line 265
    .line 266
    aget v15, v13, v15

    .line 267
    .line 268
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 269
    .line 270
    .line 271
    move-result v15

    .line 272
    xor-int/2addr v7, v15

    .line 273
    shr-int/lit8 v15, v1, 0x10

    .line 274
    .line 275
    and-int/lit16 v15, v15, 0xff

    .line 276
    .line 277
    aget v15, v13, v15

    .line 278
    .line 279
    invoke-static {v15, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 280
    .line 281
    .line 282
    move-result v15

    .line 283
    xor-int/2addr v7, v15

    .line 284
    shr-int/lit8 v15, v6, 0x18

    .line 285
    .line 286
    and-int/lit16 v15, v15, 0xff

    .line 287
    .line 288
    aget v15, v13, v15

    .line 289
    .line 290
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 291
    .line 292
    .line 293
    move-result v15

    .line 294
    xor-int/2addr v7, v15

    .line 295
    aget-object v15, p1, v3

    .line 296
    .line 297
    aget v15, v15, v17

    .line 298
    .line 299
    xor-int/2addr v7, v15

    .line 300
    and-int/lit16 v15, v6, 0xff

    .line 301
    .line 302
    aget v15, v13, v15

    .line 303
    .line 304
    move/from16 v18, v8

    .line 305
    .line 306
    shr-int/lit8 v8, v4, 0x8

    .line 307
    .line 308
    and-int/lit16 v8, v8, 0xff

    .line 309
    .line 310
    aget v8, v13, v8

    .line 311
    .line 312
    invoke-static {v8, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 313
    .line 314
    .line 315
    move-result v8

    .line 316
    xor-int/2addr v8, v15

    .line 317
    shr-int/lit8 v15, v14, 0x10

    .line 318
    .line 319
    and-int/lit16 v15, v15, 0xff

    .line 320
    .line 321
    aget v15, v13, v15

    .line 322
    .line 323
    invoke-static {v15, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 324
    .line 325
    .line 326
    move-result v15

    .line 327
    xor-int/2addr v8, v15

    .line 328
    shr-int/lit8 v15, v1, 0x18

    .line 329
    .line 330
    and-int/lit16 v15, v15, 0xff

    .line 331
    .line 332
    aget v15, v13, v15

    .line 333
    .line 334
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 335
    .line 336
    .line 337
    move-result v15

    .line 338
    xor-int/2addr v8, v15

    .line 339
    aget-object v15, p1, v3

    .line 340
    .line 341
    aget v15, v15, v18

    .line 342
    .line 343
    xor-int/2addr v8, v15

    .line 344
    and-int/lit16 v1, v1, 0xff

    .line 345
    .line 346
    aget v1, v13, v1

    .line 347
    .line 348
    shr-int/2addr v6, v12

    .line 349
    and-int/lit16 v6, v6, 0xff

    .line 350
    .line 351
    aget v6, v13, v6

    .line 352
    .line 353
    invoke-static {v6, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 354
    .line 355
    .line 356
    move-result v6

    .line 357
    xor-int/2addr v1, v6

    .line 358
    shr-int/2addr v4, v9

    .line 359
    and-int/lit16 v4, v4, 0xff

    .line 360
    .line 361
    aget v4, v13, v4

    .line 362
    .line 363
    invoke-static {v4, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 364
    .line 365
    .line 366
    move-result v4

    .line 367
    xor-int/2addr v1, v4

    .line 368
    shr-int/lit8 v4, v14, 0x18

    .line 369
    .line 370
    and-int/lit16 v4, v4, 0xff

    .line 371
    .line 372
    aget v4, v13, v4

    .line 373
    .line 374
    invoke-static {v4, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 375
    .line 376
    .line 377
    move-result v4

    .line 378
    xor-int/2addr v1, v4

    .line 379
    add-int/lit8 v2, v2, -0x2

    .line 380
    .line 381
    aget-object v3, p1, v3

    .line 382
    .line 383
    aget v3, v3, v10

    .line 384
    .line 385
    xor-int/2addr v3, v1

    .line 386
    move v1, v5

    .line 387
    move v5, v7

    .line 388
    move v7, v8

    .line 389
    move/from16 v4, v16

    .line 390
    .line 391
    move/from16 v6, v17

    .line 392
    .line 393
    move/from16 v8, v18

    .line 394
    .line 395
    goto/16 :goto_0

    .line 396
    .line 397
    :cond_0
    move/from16 v16, v4

    .line 398
    .line 399
    move/from16 v17, v6

    .line 400
    .line 401
    move/from16 v18, v8

    .line 402
    .line 403
    sget-object v4, Lorg/spongycastle/crypto/engines/AESEngine;->Tinv0:[I

    .line 404
    .line 405
    and-int/lit16 v6, v1, 0xff

    .line 406
    .line 407
    aget v6, v4, v6

    .line 408
    .line 409
    shr-int/lit8 v8, v3, 0x8

    .line 410
    .line 411
    and-int/lit16 v8, v8, 0xff

    .line 412
    .line 413
    aget v8, v4, v8

    .line 414
    .line 415
    invoke-static {v8, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 416
    .line 417
    .line 418
    move-result v8

    .line 419
    xor-int/2addr v6, v8

    .line 420
    shr-int/lit8 v8, v7, 0x10

    .line 421
    .line 422
    and-int/lit16 v8, v8, 0xff

    .line 423
    .line 424
    aget v8, v4, v8

    .line 425
    .line 426
    invoke-static {v8, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 427
    .line 428
    .line 429
    move-result v8

    .line 430
    xor-int/2addr v6, v8

    .line 431
    shr-int/lit8 v8, v5, 0x18

    .line 432
    .line 433
    and-int/lit16 v8, v8, 0xff

    .line 434
    .line 435
    aget v8, v4, v8

    .line 436
    .line 437
    invoke-static {v8, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 438
    .line 439
    .line 440
    move-result v8

    .line 441
    xor-int/2addr v6, v8

    .line 442
    aget-object v8, p1, v2

    .line 443
    .line 444
    aget v8, v8, v16

    .line 445
    .line 446
    xor-int/2addr v6, v8

    .line 447
    and-int/lit16 v8, v5, 0xff

    .line 448
    .line 449
    aget v8, v4, v8

    .line 450
    .line 451
    shr-int/lit8 v13, v1, 0x8

    .line 452
    .line 453
    and-int/lit16 v13, v13, 0xff

    .line 454
    .line 455
    aget v13, v4, v13

    .line 456
    .line 457
    invoke-static {v13, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 458
    .line 459
    .line 460
    move-result v13

    .line 461
    xor-int/2addr v8, v13

    .line 462
    shr-int/lit8 v13, v3, 0x10

    .line 463
    .line 464
    and-int/lit16 v13, v13, 0xff

    .line 465
    .line 466
    aget v13, v4, v13

    .line 467
    .line 468
    invoke-static {v13, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 469
    .line 470
    .line 471
    move-result v13

    .line 472
    xor-int/2addr v8, v13

    .line 473
    shr-int/lit8 v13, v7, 0x18

    .line 474
    .line 475
    and-int/lit16 v13, v13, 0xff

    .line 476
    .line 477
    aget v13, v4, v13

    .line 478
    .line 479
    invoke-static {v13, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 480
    .line 481
    .line 482
    move-result v13

    .line 483
    xor-int/2addr v8, v13

    .line 484
    aget-object v13, p1, v2

    .line 485
    .line 486
    aget v13, v13, v17

    .line 487
    .line 488
    xor-int/2addr v8, v13

    .line 489
    and-int/lit16 v13, v7, 0xff

    .line 490
    .line 491
    aget v13, v4, v13

    .line 492
    .line 493
    shr-int/lit8 v14, v5, 0x8

    .line 494
    .line 495
    and-int/lit16 v14, v14, 0xff

    .line 496
    .line 497
    aget v14, v4, v14

    .line 498
    .line 499
    invoke-static {v14, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 500
    .line 501
    .line 502
    move-result v14

    .line 503
    xor-int/2addr v13, v14

    .line 504
    shr-int/lit8 v14, v1, 0x10

    .line 505
    .line 506
    and-int/lit16 v14, v14, 0xff

    .line 507
    .line 508
    aget v14, v4, v14

    .line 509
    .line 510
    invoke-static {v14, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 511
    .line 512
    .line 513
    move-result v14

    .line 514
    xor-int/2addr v13, v14

    .line 515
    shr-int/lit8 v14, v3, 0x18

    .line 516
    .line 517
    and-int/lit16 v14, v14, 0xff

    .line 518
    .line 519
    aget v14, v4, v14

    .line 520
    .line 521
    invoke-static {v14, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 522
    .line 523
    .line 524
    move-result v14

    .line 525
    xor-int/2addr v13, v14

    .line 526
    aget-object v14, p1, v2

    .line 527
    .line 528
    aget v14, v14, v18

    .line 529
    .line 530
    xor-int/2addr v13, v14

    .line 531
    and-int/lit16 v3, v3, 0xff

    .line 532
    .line 533
    aget v3, v4, v3

    .line 534
    .line 535
    shr-int/2addr v7, v12

    .line 536
    and-int/lit16 v7, v7, 0xff

    .line 537
    .line 538
    aget v7, v4, v7

    .line 539
    .line 540
    invoke-static {v7, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 541
    .line 542
    .line 543
    move-result v7

    .line 544
    xor-int/2addr v3, v7

    .line 545
    shr-int/2addr v5, v9

    .line 546
    and-int/lit16 v5, v5, 0xff

    .line 547
    .line 548
    aget v5, v4, v5

    .line 549
    .line 550
    invoke-static {v5, v9}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 551
    .line 552
    .line 553
    move-result v5

    .line 554
    xor-int/2addr v3, v5

    .line 555
    shr-int/2addr v1, v11

    .line 556
    and-int/lit16 v1, v1, 0xff

    .line 557
    .line 558
    aget v1, v4, v1

    .line 559
    .line 560
    invoke-static {v1, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    xor-int/2addr v1, v3

    .line 565
    aget-object v2, p1, v2

    .line 566
    .line 567
    aget v2, v2, v10

    .line 568
    .line 569
    xor-int/2addr v1, v2

    .line 570
    sget-object v2, Lorg/spongycastle/crypto/engines/AESEngine;->Si:[B

    .line 571
    .line 572
    and-int/lit16 v3, v6, 0xff

    .line 573
    .line 574
    aget-byte v3, v2, v3

    .line 575
    .line 576
    and-int/lit16 v3, v3, 0xff

    .line 577
    .line 578
    shr-int/lit8 v4, v1, 0x8

    .line 579
    .line 580
    and-int/lit16 v4, v4, 0xff

    .line 581
    .line 582
    aget-byte v4, v2, v4

    .line 583
    .line 584
    and-int/lit16 v4, v4, 0xff

    .line 585
    .line 586
    shl-int/2addr v4, v12

    .line 587
    xor-int/2addr v3, v4

    .line 588
    shr-int/lit8 v4, v13, 0x10

    .line 589
    .line 590
    and-int/lit16 v4, v4, 0xff

    .line 591
    .line 592
    aget-byte v4, v2, v4

    .line 593
    .line 594
    and-int/lit16 v4, v4, 0xff

    .line 595
    .line 596
    shl-int/2addr v4, v9

    .line 597
    xor-int/2addr v3, v4

    .line 598
    shr-int/lit8 v4, v8, 0x18

    .line 599
    .line 600
    and-int/lit16 v4, v4, 0xff

    .line 601
    .line 602
    aget-byte v4, v2, v4

    .line 603
    .line 604
    shl-int/2addr v4, v11

    .line 605
    xor-int/2addr v3, v4

    .line 606
    aget-object v4, p1, v16

    .line 607
    .line 608
    aget v5, v4, v16

    .line 609
    .line 610
    xor-int/2addr v3, v5

    .line 611
    iput v3, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 612
    .line 613
    and-int/lit16 v3, v8, 0xff

    .line 614
    .line 615
    aget-byte v3, v2, v3

    .line 616
    .line 617
    and-int/lit16 v3, v3, 0xff

    .line 618
    .line 619
    shr-int/lit8 v5, v6, 0x8

    .line 620
    .line 621
    and-int/lit16 v5, v5, 0xff

    .line 622
    .line 623
    aget-byte v5, v2, v5

    .line 624
    .line 625
    and-int/lit16 v5, v5, 0xff

    .line 626
    .line 627
    shl-int/2addr v5, v12

    .line 628
    xor-int/2addr v3, v5

    .line 629
    shr-int/lit8 v5, v1, 0x10

    .line 630
    .line 631
    and-int/lit16 v5, v5, 0xff

    .line 632
    .line 633
    aget-byte v5, v2, v5

    .line 634
    .line 635
    and-int/lit16 v5, v5, 0xff

    .line 636
    .line 637
    shl-int/2addr v5, v9

    .line 638
    xor-int/2addr v3, v5

    .line 639
    shr-int/lit8 v5, v13, 0x18

    .line 640
    .line 641
    and-int/lit16 v5, v5, 0xff

    .line 642
    .line 643
    aget-byte v5, v2, v5

    .line 644
    .line 645
    shl-int/2addr v5, v11

    .line 646
    xor-int/2addr v3, v5

    .line 647
    aget v5, v4, v17

    .line 648
    .line 649
    xor-int/2addr v3, v5

    .line 650
    iput v3, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 651
    .line 652
    and-int/lit16 v3, v13, 0xff

    .line 653
    .line 654
    aget-byte v3, v2, v3

    .line 655
    .line 656
    and-int/lit16 v3, v3, 0xff

    .line 657
    .line 658
    shr-int/lit8 v5, v8, 0x8

    .line 659
    .line 660
    and-int/lit16 v5, v5, 0xff

    .line 661
    .line 662
    aget-byte v5, v2, v5

    .line 663
    .line 664
    and-int/lit16 v5, v5, 0xff

    .line 665
    .line 666
    shl-int/2addr v5, v12

    .line 667
    xor-int/2addr v3, v5

    .line 668
    shr-int/lit8 v5, v6, 0x10

    .line 669
    .line 670
    and-int/lit16 v5, v5, 0xff

    .line 671
    .line 672
    aget-byte v5, v2, v5

    .line 673
    .line 674
    and-int/lit16 v5, v5, 0xff

    .line 675
    .line 676
    shl-int/2addr v5, v9

    .line 677
    xor-int/2addr v3, v5

    .line 678
    shr-int/lit8 v5, v1, 0x18

    .line 679
    .line 680
    and-int/lit16 v5, v5, 0xff

    .line 681
    .line 682
    aget-byte v5, v2, v5

    .line 683
    .line 684
    shl-int/2addr v5, v11

    .line 685
    xor-int/2addr v3, v5

    .line 686
    aget v5, v4, v18

    .line 687
    .line 688
    xor-int/2addr v3, v5

    .line 689
    iput v3, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 690
    .line 691
    and-int/lit16 v1, v1, 0xff

    .line 692
    .line 693
    aget-byte v1, v2, v1

    .line 694
    .line 695
    and-int/lit16 v1, v1, 0xff

    .line 696
    .line 697
    shr-int/lit8 v3, v13, 0x8

    .line 698
    .line 699
    and-int/lit16 v3, v3, 0xff

    .line 700
    .line 701
    aget-byte v3, v2, v3

    .line 702
    .line 703
    and-int/lit16 v3, v3, 0xff

    .line 704
    .line 705
    shl-int/2addr v3, v12

    .line 706
    xor-int/2addr v1, v3

    .line 707
    shr-int/lit8 v3, v8, 0x10

    .line 708
    .line 709
    and-int/lit16 v3, v3, 0xff

    .line 710
    .line 711
    aget-byte v3, v2, v3

    .line 712
    .line 713
    and-int/lit16 v3, v3, 0xff

    .line 714
    .line 715
    shl-int/2addr v3, v9

    .line 716
    xor-int/2addr v1, v3

    .line 717
    shr-int/lit8 v3, v6, 0x18

    .line 718
    .line 719
    and-int/lit16 v3, v3, 0xff

    .line 720
    .line 721
    aget-byte v2, v2, v3

    .line 722
    .line 723
    shl-int/2addr v2, v11

    .line 724
    xor-int/2addr v1, v2

    .line 725
    aget v2, v4, v10

    .line 726
    .line 727
    xor-int/2addr v1, v2

    .line 728
    iput v1, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 729
    .line 730
    return-void
.end method

.method private encryptBlock([[I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v3, p1, v2

    .line 7
    .line 8
    aget v4, v3, v2

    .line 9
    .line 10
    xor-int/2addr v1, v4

    .line 11
    iget v4, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    aget v6, v3, v5

    .line 15
    .line 16
    xor-int/2addr v4, v6

    .line 17
    iget v6, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 18
    .line 19
    const/4 v7, 0x2

    .line 20
    aget v8, v3, v7

    .line 21
    .line 22
    xor-int/2addr v6, v8

    .line 23
    iget v8, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 24
    .line 25
    const/4 v9, 0x3

    .line 26
    aget v3, v3, v9

    .line 27
    .line 28
    xor-int/2addr v3, v8

    .line 29
    move v8, v5

    .line 30
    :goto_0
    iget v10, v0, Lorg/spongycastle/crypto/engines/AESEngine;->ROUNDS:I

    .line 31
    .line 32
    sub-int/2addr v10, v5

    .line 33
    const/16 v11, 0x10

    .line 34
    .line 35
    const/16 v12, 0x18

    .line 36
    .line 37
    const/16 v13, 0x8

    .line 38
    .line 39
    if-ge v8, v10, :cond_0

    .line 40
    .line 41
    sget-object v10, Lorg/spongycastle/crypto/engines/AESEngine;->T0:[I

    .line 42
    .line 43
    and-int/lit16 v14, v1, 0xff

    .line 44
    .line 45
    aget v14, v10, v14

    .line 46
    .line 47
    shr-int/lit8 v15, v4, 0x8

    .line 48
    .line 49
    and-int/lit16 v15, v15, 0xff

    .line 50
    .line 51
    aget v15, v10, v15

    .line 52
    .line 53
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 54
    .line 55
    .line 56
    move-result v15

    .line 57
    xor-int/2addr v14, v15

    .line 58
    shr-int/lit8 v15, v6, 0x10

    .line 59
    .line 60
    and-int/lit16 v15, v15, 0xff

    .line 61
    .line 62
    aget v15, v10, v15

    .line 63
    .line 64
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 65
    .line 66
    .line 67
    move-result v15

    .line 68
    xor-int/2addr v14, v15

    .line 69
    shr-int/lit8 v15, v3, 0x18

    .line 70
    .line 71
    and-int/lit16 v15, v15, 0xff

    .line 72
    .line 73
    aget v15, v10, v15

    .line 74
    .line 75
    invoke-static {v15, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 76
    .line 77
    .line 78
    move-result v15

    .line 79
    xor-int/2addr v14, v15

    .line 80
    aget-object v15, p1, v8

    .line 81
    .line 82
    aget v15, v15, v2

    .line 83
    .line 84
    xor-int/2addr v14, v15

    .line 85
    and-int/lit16 v15, v4, 0xff

    .line 86
    .line 87
    aget v15, v10, v15

    .line 88
    .line 89
    move/from16 v16, v2

    .line 90
    .line 91
    shr-int/lit8 v2, v6, 0x8

    .line 92
    .line 93
    and-int/lit16 v2, v2, 0xff

    .line 94
    .line 95
    aget v2, v10, v2

    .line 96
    .line 97
    invoke-static {v2, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    xor-int/2addr v2, v15

    .line 102
    shr-int/lit8 v15, v3, 0x10

    .line 103
    .line 104
    and-int/lit16 v15, v15, 0xff

    .line 105
    .line 106
    aget v15, v10, v15

    .line 107
    .line 108
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 109
    .line 110
    .line 111
    move-result v15

    .line 112
    xor-int/2addr v2, v15

    .line 113
    shr-int/lit8 v15, v1, 0x18

    .line 114
    .line 115
    and-int/lit16 v15, v15, 0xff

    .line 116
    .line 117
    aget v15, v10, v15

    .line 118
    .line 119
    invoke-static {v15, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 120
    .line 121
    .line 122
    move-result v15

    .line 123
    xor-int/2addr v2, v15

    .line 124
    aget-object v15, p1, v8

    .line 125
    .line 126
    aget v15, v15, v5

    .line 127
    .line 128
    xor-int/2addr v2, v15

    .line 129
    and-int/lit16 v15, v6, 0xff

    .line 130
    .line 131
    aget v15, v10, v15

    .line 132
    .line 133
    move/from16 v17, v5

    .line 134
    .line 135
    shr-int/lit8 v5, v3, 0x8

    .line 136
    .line 137
    and-int/lit16 v5, v5, 0xff

    .line 138
    .line 139
    aget v5, v10, v5

    .line 140
    .line 141
    invoke-static {v5, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    xor-int/2addr v5, v15

    .line 146
    shr-int/lit8 v15, v1, 0x10

    .line 147
    .line 148
    and-int/lit16 v15, v15, 0xff

    .line 149
    .line 150
    aget v15, v10, v15

    .line 151
    .line 152
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 153
    .line 154
    .line 155
    move-result v15

    .line 156
    xor-int/2addr v5, v15

    .line 157
    shr-int/lit8 v15, v4, 0x18

    .line 158
    .line 159
    and-int/lit16 v15, v15, 0xff

    .line 160
    .line 161
    aget v15, v10, v15

    .line 162
    .line 163
    invoke-static {v15, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 164
    .line 165
    .line 166
    move-result v15

    .line 167
    xor-int/2addr v5, v15

    .line 168
    aget-object v15, p1, v8

    .line 169
    .line 170
    aget v15, v15, v7

    .line 171
    .line 172
    xor-int/2addr v5, v15

    .line 173
    and-int/lit16 v3, v3, 0xff

    .line 174
    .line 175
    aget v3, v10, v3

    .line 176
    .line 177
    shr-int/lit8 v1, v1, 0x8

    .line 178
    .line 179
    and-int/lit16 v1, v1, 0xff

    .line 180
    .line 181
    aget v1, v10, v1

    .line 182
    .line 183
    invoke-static {v1, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    xor-int/2addr v1, v3

    .line 188
    shr-int/lit8 v3, v4, 0x10

    .line 189
    .line 190
    and-int/lit16 v3, v3, 0xff

    .line 191
    .line 192
    aget v3, v10, v3

    .line 193
    .line 194
    invoke-static {v3, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    xor-int/2addr v1, v3

    .line 199
    shr-int/lit8 v3, v6, 0x18

    .line 200
    .line 201
    and-int/lit16 v3, v3, 0xff

    .line 202
    .line 203
    aget v3, v10, v3

    .line 204
    .line 205
    invoke-static {v3, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    xor-int/2addr v1, v3

    .line 210
    add-int/lit8 v3, v8, 0x1

    .line 211
    .line 212
    aget-object v4, p1, v8

    .line 213
    .line 214
    aget v4, v4, v9

    .line 215
    .line 216
    xor-int/2addr v1, v4

    .line 217
    and-int/lit16 v4, v14, 0xff

    .line 218
    .line 219
    aget v4, v10, v4

    .line 220
    .line 221
    shr-int/lit8 v6, v2, 0x8

    .line 222
    .line 223
    and-int/lit16 v6, v6, 0xff

    .line 224
    .line 225
    aget v6, v10, v6

    .line 226
    .line 227
    invoke-static {v6, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 228
    .line 229
    .line 230
    move-result v6

    .line 231
    xor-int/2addr v4, v6

    .line 232
    shr-int/lit8 v6, v5, 0x10

    .line 233
    .line 234
    and-int/lit16 v6, v6, 0xff

    .line 235
    .line 236
    aget v6, v10, v6

    .line 237
    .line 238
    invoke-static {v6, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    xor-int/2addr v4, v6

    .line 243
    shr-int/lit8 v6, v1, 0x18

    .line 244
    .line 245
    and-int/lit16 v6, v6, 0xff

    .line 246
    .line 247
    aget v6, v10, v6

    .line 248
    .line 249
    invoke-static {v6, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 250
    .line 251
    .line 252
    move-result v6

    .line 253
    xor-int/2addr v4, v6

    .line 254
    aget-object v6, p1, v3

    .line 255
    .line 256
    aget v6, v6, v16

    .line 257
    .line 258
    xor-int/2addr v4, v6

    .line 259
    and-int/lit16 v6, v2, 0xff

    .line 260
    .line 261
    aget v6, v10, v6

    .line 262
    .line 263
    shr-int/lit8 v15, v5, 0x8

    .line 264
    .line 265
    and-int/lit16 v15, v15, 0xff

    .line 266
    .line 267
    aget v15, v10, v15

    .line 268
    .line 269
    invoke-static {v15, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 270
    .line 271
    .line 272
    move-result v15

    .line 273
    xor-int/2addr v6, v15

    .line 274
    shr-int/lit8 v15, v1, 0x10

    .line 275
    .line 276
    and-int/lit16 v15, v15, 0xff

    .line 277
    .line 278
    aget v15, v10, v15

    .line 279
    .line 280
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 281
    .line 282
    .line 283
    move-result v15

    .line 284
    xor-int/2addr v6, v15

    .line 285
    shr-int/lit8 v15, v14, 0x18

    .line 286
    .line 287
    and-int/lit16 v15, v15, 0xff

    .line 288
    .line 289
    aget v15, v10, v15

    .line 290
    .line 291
    invoke-static {v15, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 292
    .line 293
    .line 294
    move-result v15

    .line 295
    xor-int/2addr v6, v15

    .line 296
    aget-object v15, p1, v3

    .line 297
    .line 298
    aget v15, v15, v17

    .line 299
    .line 300
    xor-int/2addr v6, v15

    .line 301
    and-int/lit16 v15, v5, 0xff

    .line 302
    .line 303
    aget v15, v10, v15

    .line 304
    .line 305
    move/from16 v18, v7

    .line 306
    .line 307
    shr-int/lit8 v7, v1, 0x8

    .line 308
    .line 309
    and-int/lit16 v7, v7, 0xff

    .line 310
    .line 311
    aget v7, v10, v7

    .line 312
    .line 313
    invoke-static {v7, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 314
    .line 315
    .line 316
    move-result v7

    .line 317
    xor-int/2addr v7, v15

    .line 318
    shr-int/lit8 v15, v14, 0x10

    .line 319
    .line 320
    and-int/lit16 v15, v15, 0xff

    .line 321
    .line 322
    aget v15, v10, v15

    .line 323
    .line 324
    invoke-static {v15, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 325
    .line 326
    .line 327
    move-result v15

    .line 328
    xor-int/2addr v7, v15

    .line 329
    shr-int/lit8 v15, v2, 0x18

    .line 330
    .line 331
    and-int/lit16 v15, v15, 0xff

    .line 332
    .line 333
    aget v15, v10, v15

    .line 334
    .line 335
    invoke-static {v15, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 336
    .line 337
    .line 338
    move-result v15

    .line 339
    xor-int/2addr v7, v15

    .line 340
    aget-object v15, p1, v3

    .line 341
    .line 342
    aget v15, v15, v18

    .line 343
    .line 344
    xor-int/2addr v7, v15

    .line 345
    and-int/lit16 v1, v1, 0xff

    .line 346
    .line 347
    aget v1, v10, v1

    .line 348
    .line 349
    shr-int/2addr v14, v13

    .line 350
    and-int/lit16 v14, v14, 0xff

    .line 351
    .line 352
    aget v14, v10, v14

    .line 353
    .line 354
    invoke-static {v14, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 355
    .line 356
    .line 357
    move-result v14

    .line 358
    xor-int/2addr v1, v14

    .line 359
    shr-int/2addr v2, v11

    .line 360
    and-int/lit16 v2, v2, 0xff

    .line 361
    .line 362
    aget v2, v10, v2

    .line 363
    .line 364
    invoke-static {v2, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 365
    .line 366
    .line 367
    move-result v2

    .line 368
    xor-int/2addr v1, v2

    .line 369
    shr-int/lit8 v2, v5, 0x18

    .line 370
    .line 371
    and-int/lit16 v2, v2, 0xff

    .line 372
    .line 373
    aget v2, v10, v2

    .line 374
    .line 375
    invoke-static {v2, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 376
    .line 377
    .line 378
    move-result v2

    .line 379
    xor-int/2addr v1, v2

    .line 380
    add-int/lit8 v8, v8, 0x2

    .line 381
    .line 382
    aget-object v2, p1, v3

    .line 383
    .line 384
    aget v2, v2, v9

    .line 385
    .line 386
    xor-int v3, v1, v2

    .line 387
    .line 388
    move v1, v4

    .line 389
    move v4, v6

    .line 390
    move v6, v7

    .line 391
    move/from16 v2, v16

    .line 392
    .line 393
    move/from16 v5, v17

    .line 394
    .line 395
    move/from16 v7, v18

    .line 396
    .line 397
    goto/16 :goto_0

    .line 398
    .line 399
    :cond_0
    move/from16 v16, v2

    .line 400
    .line 401
    move/from16 v17, v5

    .line 402
    .line 403
    move/from16 v18, v7

    .line 404
    .line 405
    sget-object v2, Lorg/spongycastle/crypto/engines/AESEngine;->T0:[I

    .line 406
    .line 407
    and-int/lit16 v5, v1, 0xff

    .line 408
    .line 409
    aget v5, v2, v5

    .line 410
    .line 411
    shr-int/lit8 v7, v4, 0x8

    .line 412
    .line 413
    and-int/lit16 v7, v7, 0xff

    .line 414
    .line 415
    aget v7, v2, v7

    .line 416
    .line 417
    invoke-static {v7, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 418
    .line 419
    .line 420
    move-result v7

    .line 421
    xor-int/2addr v5, v7

    .line 422
    shr-int/lit8 v7, v6, 0x10

    .line 423
    .line 424
    and-int/lit16 v7, v7, 0xff

    .line 425
    .line 426
    aget v7, v2, v7

    .line 427
    .line 428
    invoke-static {v7, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 429
    .line 430
    .line 431
    move-result v7

    .line 432
    xor-int/2addr v5, v7

    .line 433
    shr-int/lit8 v7, v3, 0x18

    .line 434
    .line 435
    and-int/lit16 v7, v7, 0xff

    .line 436
    .line 437
    aget v7, v2, v7

    .line 438
    .line 439
    invoke-static {v7, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 440
    .line 441
    .line 442
    move-result v7

    .line 443
    xor-int/2addr v5, v7

    .line 444
    aget-object v7, p1, v8

    .line 445
    .line 446
    aget v7, v7, v16

    .line 447
    .line 448
    xor-int/2addr v5, v7

    .line 449
    and-int/lit16 v7, v4, 0xff

    .line 450
    .line 451
    aget v7, v2, v7

    .line 452
    .line 453
    shr-int/lit8 v10, v6, 0x8

    .line 454
    .line 455
    and-int/lit16 v10, v10, 0xff

    .line 456
    .line 457
    aget v10, v2, v10

    .line 458
    .line 459
    invoke-static {v10, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 460
    .line 461
    .line 462
    move-result v10

    .line 463
    xor-int/2addr v7, v10

    .line 464
    shr-int/lit8 v10, v3, 0x10

    .line 465
    .line 466
    and-int/lit16 v10, v10, 0xff

    .line 467
    .line 468
    aget v10, v2, v10

    .line 469
    .line 470
    invoke-static {v10, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 471
    .line 472
    .line 473
    move-result v10

    .line 474
    xor-int/2addr v7, v10

    .line 475
    shr-int/lit8 v10, v1, 0x18

    .line 476
    .line 477
    and-int/lit16 v10, v10, 0xff

    .line 478
    .line 479
    aget v10, v2, v10

    .line 480
    .line 481
    invoke-static {v10, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 482
    .line 483
    .line 484
    move-result v10

    .line 485
    xor-int/2addr v7, v10

    .line 486
    aget-object v10, p1, v8

    .line 487
    .line 488
    aget v10, v10, v17

    .line 489
    .line 490
    xor-int/2addr v7, v10

    .line 491
    and-int/lit16 v10, v6, 0xff

    .line 492
    .line 493
    aget v10, v2, v10

    .line 494
    .line 495
    shr-int/lit8 v14, v3, 0x8

    .line 496
    .line 497
    and-int/lit16 v14, v14, 0xff

    .line 498
    .line 499
    aget v14, v2, v14

    .line 500
    .line 501
    invoke-static {v14, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 502
    .line 503
    .line 504
    move-result v14

    .line 505
    xor-int/2addr v10, v14

    .line 506
    shr-int/lit8 v14, v1, 0x10

    .line 507
    .line 508
    and-int/lit16 v14, v14, 0xff

    .line 509
    .line 510
    aget v14, v2, v14

    .line 511
    .line 512
    invoke-static {v14, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 513
    .line 514
    .line 515
    move-result v14

    .line 516
    xor-int/2addr v10, v14

    .line 517
    shr-int/lit8 v14, v4, 0x18

    .line 518
    .line 519
    and-int/lit16 v14, v14, 0xff

    .line 520
    .line 521
    aget v14, v2, v14

    .line 522
    .line 523
    invoke-static {v14, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 524
    .line 525
    .line 526
    move-result v14

    .line 527
    xor-int/2addr v10, v14

    .line 528
    aget-object v14, p1, v8

    .line 529
    .line 530
    aget v14, v14, v18

    .line 531
    .line 532
    xor-int/2addr v10, v14

    .line 533
    and-int/lit16 v3, v3, 0xff

    .line 534
    .line 535
    aget v3, v2, v3

    .line 536
    .line 537
    shr-int/2addr v1, v13

    .line 538
    and-int/lit16 v1, v1, 0xff

    .line 539
    .line 540
    aget v1, v2, v1

    .line 541
    .line 542
    invoke-static {v1, v12}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 543
    .line 544
    .line 545
    move-result v1

    .line 546
    xor-int/2addr v1, v3

    .line 547
    shr-int/lit8 v3, v4, 0x10

    .line 548
    .line 549
    and-int/lit16 v3, v3, 0xff

    .line 550
    .line 551
    aget v3, v2, v3

    .line 552
    .line 553
    invoke-static {v3, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 554
    .line 555
    .line 556
    move-result v3

    .line 557
    xor-int/2addr v1, v3

    .line 558
    shr-int/lit8 v3, v6, 0x18

    .line 559
    .line 560
    and-int/lit16 v3, v3, 0xff

    .line 561
    .line 562
    aget v2, v2, v3

    .line 563
    .line 564
    invoke-static {v2, v13}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 565
    .line 566
    .line 567
    move-result v2

    .line 568
    xor-int/2addr v1, v2

    .line 569
    add-int/lit8 v2, v8, 0x1

    .line 570
    .line 571
    aget-object v3, p1, v8

    .line 572
    .line 573
    aget v3, v3, v9

    .line 574
    .line 575
    xor-int/2addr v1, v3

    .line 576
    sget-object v3, Lorg/spongycastle/crypto/engines/AESEngine;->S:[B

    .line 577
    .line 578
    and-int/lit16 v4, v5, 0xff

    .line 579
    .line 580
    aget-byte v4, v3, v4

    .line 581
    .line 582
    and-int/lit16 v4, v4, 0xff

    .line 583
    .line 584
    shr-int/lit8 v6, v7, 0x8

    .line 585
    .line 586
    and-int/lit16 v6, v6, 0xff

    .line 587
    .line 588
    aget-byte v6, v3, v6

    .line 589
    .line 590
    and-int/lit16 v6, v6, 0xff

    .line 591
    .line 592
    shl-int/2addr v6, v13

    .line 593
    xor-int/2addr v4, v6

    .line 594
    shr-int/lit8 v6, v10, 0x10

    .line 595
    .line 596
    and-int/lit16 v6, v6, 0xff

    .line 597
    .line 598
    aget-byte v6, v3, v6

    .line 599
    .line 600
    and-int/lit16 v6, v6, 0xff

    .line 601
    .line 602
    shl-int/2addr v6, v11

    .line 603
    xor-int/2addr v4, v6

    .line 604
    shr-int/lit8 v6, v1, 0x18

    .line 605
    .line 606
    and-int/lit16 v6, v6, 0xff

    .line 607
    .line 608
    aget-byte v6, v3, v6

    .line 609
    .line 610
    shl-int/2addr v6, v12

    .line 611
    xor-int/2addr v4, v6

    .line 612
    aget-object v2, p1, v2

    .line 613
    .line 614
    aget v6, v2, v16

    .line 615
    .line 616
    xor-int/2addr v4, v6

    .line 617
    iput v4, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 618
    .line 619
    and-int/lit16 v4, v7, 0xff

    .line 620
    .line 621
    aget-byte v4, v3, v4

    .line 622
    .line 623
    and-int/lit16 v4, v4, 0xff

    .line 624
    .line 625
    shr-int/lit8 v6, v10, 0x8

    .line 626
    .line 627
    and-int/lit16 v6, v6, 0xff

    .line 628
    .line 629
    aget-byte v6, v3, v6

    .line 630
    .line 631
    and-int/lit16 v6, v6, 0xff

    .line 632
    .line 633
    shl-int/2addr v6, v13

    .line 634
    xor-int/2addr v4, v6

    .line 635
    shr-int/lit8 v6, v1, 0x10

    .line 636
    .line 637
    and-int/lit16 v6, v6, 0xff

    .line 638
    .line 639
    aget-byte v6, v3, v6

    .line 640
    .line 641
    and-int/lit16 v6, v6, 0xff

    .line 642
    .line 643
    shl-int/2addr v6, v11

    .line 644
    xor-int/2addr v4, v6

    .line 645
    shr-int/lit8 v6, v5, 0x18

    .line 646
    .line 647
    and-int/lit16 v6, v6, 0xff

    .line 648
    .line 649
    aget-byte v6, v3, v6

    .line 650
    .line 651
    shl-int/2addr v6, v12

    .line 652
    xor-int/2addr v4, v6

    .line 653
    aget v6, v2, v17

    .line 654
    .line 655
    xor-int/2addr v4, v6

    .line 656
    iput v4, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 657
    .line 658
    and-int/lit16 v4, v10, 0xff

    .line 659
    .line 660
    aget-byte v4, v3, v4

    .line 661
    .line 662
    and-int/lit16 v4, v4, 0xff

    .line 663
    .line 664
    shr-int/lit8 v6, v1, 0x8

    .line 665
    .line 666
    and-int/lit16 v6, v6, 0xff

    .line 667
    .line 668
    aget-byte v6, v3, v6

    .line 669
    .line 670
    and-int/lit16 v6, v6, 0xff

    .line 671
    .line 672
    shl-int/2addr v6, v13

    .line 673
    xor-int/2addr v4, v6

    .line 674
    shr-int/lit8 v6, v5, 0x10

    .line 675
    .line 676
    and-int/lit16 v6, v6, 0xff

    .line 677
    .line 678
    aget-byte v6, v3, v6

    .line 679
    .line 680
    and-int/lit16 v6, v6, 0xff

    .line 681
    .line 682
    shl-int/2addr v6, v11

    .line 683
    xor-int/2addr v4, v6

    .line 684
    shr-int/lit8 v6, v7, 0x18

    .line 685
    .line 686
    and-int/lit16 v6, v6, 0xff

    .line 687
    .line 688
    aget-byte v6, v3, v6

    .line 689
    .line 690
    shl-int/2addr v6, v12

    .line 691
    xor-int/2addr v4, v6

    .line 692
    aget v6, v2, v18

    .line 693
    .line 694
    xor-int/2addr v4, v6

    .line 695
    iput v4, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 696
    .line 697
    and-int/lit16 v1, v1, 0xff

    .line 698
    .line 699
    aget-byte v1, v3, v1

    .line 700
    .line 701
    and-int/lit16 v1, v1, 0xff

    .line 702
    .line 703
    shr-int/lit8 v4, v5, 0x8

    .line 704
    .line 705
    and-int/lit16 v4, v4, 0xff

    .line 706
    .line 707
    aget-byte v4, v3, v4

    .line 708
    .line 709
    and-int/lit16 v4, v4, 0xff

    .line 710
    .line 711
    shl-int/2addr v4, v13

    .line 712
    xor-int/2addr v1, v4

    .line 713
    shr-int/lit8 v4, v7, 0x10

    .line 714
    .line 715
    and-int/lit16 v4, v4, 0xff

    .line 716
    .line 717
    aget-byte v4, v3, v4

    .line 718
    .line 719
    and-int/lit16 v4, v4, 0xff

    .line 720
    .line 721
    shl-int/2addr v4, v11

    .line 722
    xor-int/2addr v1, v4

    .line 723
    shr-int/lit8 v4, v10, 0x18

    .line 724
    .line 725
    and-int/lit16 v4, v4, 0xff

    .line 726
    .line 727
    aget-byte v3, v3, v4

    .line 728
    .line 729
    shl-int/2addr v3, v12

    .line 730
    xor-int/2addr v1, v3

    .line 731
    aget v2, v2, v9

    .line 732
    .line 733
    xor-int/2addr v1, v2

    .line 734
    iput v1, v0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 735
    .line 736
    return-void
.end method

.method private generateWorkingKey([BZ)[[I
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/16 v4, 0x10

    .line 8
    .line 9
    if-lt v2, v4, :cond_8

    .line 10
    .line 11
    const/16 v5, 0x20

    .line 12
    .line 13
    if-gt v2, v5, :cond_8

    .line 14
    .line 15
    and-int/lit8 v5, v2, 0x7

    .line 16
    .line 17
    if-nez v5, :cond_8

    .line 18
    .line 19
    const/4 v5, 0x2

    .line 20
    ushr-int/2addr v2, v5

    .line 21
    add-int/lit8 v6, v2, 0x6

    .line 22
    .line 23
    iput v6, v0, Lorg/spongycastle/crypto/engines/AESEngine;->ROUNDS:I

    .line 24
    .line 25
    add-int/lit8 v6, v2, 0x7

    .line 26
    .line 27
    new-array v7, v5, [I

    .line 28
    .line 29
    const/4 v8, 0x1

    .line 30
    const/4 v9, 0x4

    .line 31
    aput v9, v7, v8

    .line 32
    .line 33
    const/4 v10, 0x0

    .line 34
    aput v6, v7, v10

    .line 35
    .line 36
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 37
    .line 38
    invoke-static {v6, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    check-cast v6, [[I

    .line 43
    .line 44
    const/16 v7, 0xc

    .line 45
    .line 46
    const/16 v11, 0x8

    .line 47
    .line 48
    const/4 v12, 0x3

    .line 49
    if-eq v2, v9, :cond_4

    .line 50
    .line 51
    const/16 v13, 0x14

    .line 52
    .line 53
    const/4 v14, 0x6

    .line 54
    if-eq v2, v14, :cond_2

    .line 55
    .line 56
    if-ne v2, v11, :cond_1

    .line 57
    .line 58
    invoke-static {v1, v10}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    aget-object v3, v6, v10

    .line 63
    .line 64
    aput v2, v3, v10

    .line 65
    .line 66
    invoke-static {v1, v9}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    aget-object v14, v6, v10

    .line 71
    .line 72
    aput v3, v14, v8

    .line 73
    .line 74
    invoke-static {v1, v11}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 75
    .line 76
    .line 77
    move-result v14

    .line 78
    aget-object v15, v6, v10

    .line 79
    .line 80
    aput v14, v15, v5

    .line 81
    .line 82
    invoke-static {v1, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    aget-object v15, v6, v10

    .line 87
    .line 88
    aput v7, v15, v12

    .line 89
    .line 90
    invoke-static {v1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    aget-object v15, v6, v8

    .line 95
    .line 96
    aput v4, v15, v10

    .line 97
    .line 98
    invoke-static {v1, v13}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 99
    .line 100
    .line 101
    move-result v13

    .line 102
    aget-object v15, v6, v8

    .line 103
    .line 104
    aput v13, v15, v8

    .line 105
    .line 106
    const/16 v15, 0x18

    .line 107
    .line 108
    invoke-static {v1, v15}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 109
    .line 110
    .line 111
    move-result v15

    .line 112
    aget-object v16, v6, v8

    .line 113
    .line 114
    aput v15, v16, v5

    .line 115
    .line 116
    move/from16 v16, v5

    .line 117
    .line 118
    const/16 v5, 0x1c

    .line 119
    .line 120
    invoke-static {v1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    aget-object v5, v6, v8

    .line 125
    .line 126
    aput v1, v5, v12

    .line 127
    .line 128
    move/from16 v17, v8

    .line 129
    .line 130
    move/from16 v18, v17

    .line 131
    .line 132
    move/from16 v5, v16

    .line 133
    .line 134
    :goto_0
    const/16 v8, 0xe

    .line 135
    .line 136
    if-ge v5, v8, :cond_0

    .line 137
    .line 138
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 139
    .line 140
    .line 141
    move-result v8

    .line 142
    invoke-static {v8}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    xor-int v8, v8, v17

    .line 147
    .line 148
    shl-int/lit8 v17, v17, 0x1

    .line 149
    .line 150
    xor-int/2addr v2, v8

    .line 151
    aget-object v8, v6, v5

    .line 152
    .line 153
    aput v2, v8, v10

    .line 154
    .line 155
    xor-int/2addr v3, v2

    .line 156
    aput v3, v8, v18

    .line 157
    .line 158
    xor-int/2addr v14, v3

    .line 159
    aput v14, v8, v16

    .line 160
    .line 161
    xor-int/2addr v7, v14

    .line 162
    aput v7, v8, v12

    .line 163
    .line 164
    invoke-static {v7}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 165
    .line 166
    .line 167
    move-result v8

    .line 168
    xor-int/2addr v4, v8

    .line 169
    add-int/lit8 v8, v5, 0x1

    .line 170
    .line 171
    aget-object v8, v6, v8

    .line 172
    .line 173
    aput v4, v8, v10

    .line 174
    .line 175
    xor-int/2addr v13, v4

    .line 176
    aput v13, v8, v18

    .line 177
    .line 178
    xor-int/2addr v15, v13

    .line 179
    aput v15, v8, v16

    .line 180
    .line 181
    xor-int/2addr v1, v15

    .line 182
    aput v1, v8, v12

    .line 183
    .line 184
    add-int/lit8 v5, v5, 0x2

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_0
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    invoke-static {v1}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    xor-int v1, v1, v17

    .line 196
    .line 197
    xor-int/2addr v1, v2

    .line 198
    aget-object v2, v6, v8

    .line 199
    .line 200
    aput v1, v2, v10

    .line 201
    .line 202
    xor-int/2addr v1, v3

    .line 203
    aput v1, v2, v18

    .line 204
    .line 205
    xor-int/2addr v1, v14

    .line 206
    aput v1, v2, v16

    .line 207
    .line 208
    xor-int/2addr v1, v7

    .line 209
    aput v1, v2, v12

    .line 210
    .line 211
    goto/16 :goto_3

    .line 212
    .line 213
    :cond_1
    const-string v0, "Should never get here"

    .line 214
    .line 215
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-object v3

    .line 219
    :cond_2
    move/from16 v16, v5

    .line 220
    .line 221
    move/from16 v18, v8

    .line 222
    .line 223
    invoke-static {v1, v10}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    aget-object v3, v6, v10

    .line 228
    .line 229
    aput v2, v3, v10

    .line 230
    .line 231
    invoke-static {v1, v9}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    aget-object v5, v6, v10

    .line 236
    .line 237
    aput v3, v5, v18

    .line 238
    .line 239
    invoke-static {v1, v11}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    aget-object v8, v6, v10

    .line 244
    .line 245
    aput v5, v8, v16

    .line 246
    .line 247
    invoke-static {v1, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 248
    .line 249
    .line 250
    move-result v8

    .line 251
    aget-object v14, v6, v10

    .line 252
    .line 253
    aput v8, v14, v12

    .line 254
    .line 255
    invoke-static {v1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    aget-object v14, v6, v18

    .line 260
    .line 261
    aput v4, v14, v10

    .line 262
    .line 263
    invoke-static {v1, v13}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    aget-object v13, v6, v18

    .line 268
    .line 269
    aput v1, v13, v18

    .line 270
    .line 271
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 272
    .line 273
    .line 274
    move-result v13

    .line 275
    invoke-static {v13}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 276
    .line 277
    .line 278
    move-result v13

    .line 279
    xor-int/lit8 v13, v13, 0x1

    .line 280
    .line 281
    xor-int/2addr v2, v13

    .line 282
    aget-object v13, v6, v18

    .line 283
    .line 284
    aput v2, v13, v16

    .line 285
    .line 286
    xor-int/2addr v3, v2

    .line 287
    aput v3, v13, v12

    .line 288
    .line 289
    xor-int/2addr v5, v3

    .line 290
    aget-object v13, v6, v16

    .line 291
    .line 292
    aput v5, v13, v10

    .line 293
    .line 294
    xor-int/2addr v8, v5

    .line 295
    aput v8, v13, v18

    .line 296
    .line 297
    xor-int/2addr v4, v8

    .line 298
    aput v4, v13, v16

    .line 299
    .line 300
    xor-int/2addr v1, v4

    .line 301
    aput v1, v13, v12

    .line 302
    .line 303
    move v13, v12

    .line 304
    move/from16 v14, v16

    .line 305
    .line 306
    :goto_1
    if-ge v13, v7, :cond_3

    .line 307
    .line 308
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 309
    .line 310
    .line 311
    move-result v15

    .line 312
    invoke-static {v15}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 313
    .line 314
    .line 315
    move-result v15

    .line 316
    xor-int/2addr v15, v14

    .line 317
    shl-int/lit8 v17, v14, 0x1

    .line 318
    .line 319
    xor-int/2addr v2, v15

    .line 320
    aget-object v15, v6, v13

    .line 321
    .line 322
    aput v2, v15, v10

    .line 323
    .line 324
    xor-int/2addr v3, v2

    .line 325
    aput v3, v15, v18

    .line 326
    .line 327
    xor-int/2addr v5, v3

    .line 328
    aput v5, v15, v16

    .line 329
    .line 330
    xor-int/2addr v8, v5

    .line 331
    aput v8, v15, v12

    .line 332
    .line 333
    xor-int/2addr v4, v8

    .line 334
    add-int/lit8 v15, v13, 0x1

    .line 335
    .line 336
    aget-object v19, v6, v15

    .line 337
    .line 338
    aput v4, v19, v10

    .line 339
    .line 340
    xor-int/2addr v1, v4

    .line 341
    aput v1, v19, v18

    .line 342
    .line 343
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 344
    .line 345
    .line 346
    move-result v19

    .line 347
    invoke-static/range {v19 .. v19}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 348
    .line 349
    .line 350
    move-result v19

    .line 351
    xor-int v17, v19, v17

    .line 352
    .line 353
    shl-int/lit8 v14, v14, 0x2

    .line 354
    .line 355
    xor-int v2, v2, v17

    .line 356
    .line 357
    aget-object v15, v6, v15

    .line 358
    .line 359
    aput v2, v15, v16

    .line 360
    .line 361
    xor-int/2addr v3, v2

    .line 362
    aput v3, v15, v12

    .line 363
    .line 364
    xor-int/2addr v5, v3

    .line 365
    add-int/lit8 v15, v13, 0x2

    .line 366
    .line 367
    aget-object v15, v6, v15

    .line 368
    .line 369
    aput v5, v15, v10

    .line 370
    .line 371
    xor-int/2addr v8, v5

    .line 372
    aput v8, v15, v18

    .line 373
    .line 374
    xor-int/2addr v4, v8

    .line 375
    aput v4, v15, v16

    .line 376
    .line 377
    xor-int/2addr v1, v4

    .line 378
    aput v1, v15, v12

    .line 379
    .line 380
    add-int/lit8 v13, v13, 0x3

    .line 381
    .line 382
    goto :goto_1

    .line 383
    :cond_3
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    invoke-static {v1}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    xor-int/2addr v1, v14

    .line 392
    xor-int/2addr v1, v2

    .line 393
    aget-object v2, v6, v7

    .line 394
    .line 395
    aput v1, v2, v10

    .line 396
    .line 397
    xor-int/2addr v1, v3

    .line 398
    aput v1, v2, v18

    .line 399
    .line 400
    xor-int/2addr v1, v5

    .line 401
    aput v1, v2, v16

    .line 402
    .line 403
    xor-int/2addr v1, v8

    .line 404
    aput v1, v2, v12

    .line 405
    .line 406
    goto :goto_3

    .line 407
    :cond_4
    move/from16 v16, v5

    .line 408
    .line 409
    move/from16 v18, v8

    .line 410
    .line 411
    invoke-static {v1, v10}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 412
    .line 413
    .line 414
    move-result v2

    .line 415
    aget-object v3, v6, v10

    .line 416
    .line 417
    aput v2, v3, v10

    .line 418
    .line 419
    invoke-static {v1, v9}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    aget-object v4, v6, v10

    .line 424
    .line 425
    aput v3, v4, v18

    .line 426
    .line 427
    invoke-static {v1, v11}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 428
    .line 429
    .line 430
    move-result v4

    .line 431
    aget-object v5, v6, v10

    .line 432
    .line 433
    aput v4, v5, v16

    .line 434
    .line 435
    invoke-static {v1, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    aget-object v5, v6, v10

    .line 440
    .line 441
    aput v1, v5, v12

    .line 442
    .line 443
    move/from16 v5, v18

    .line 444
    .line 445
    :goto_2
    const/16 v7, 0xa

    .line 446
    .line 447
    if-gt v5, v7, :cond_5

    .line 448
    .line 449
    invoke-static {v1, v11}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 450
    .line 451
    .line 452
    move-result v7

    .line 453
    invoke-static {v7}, Lorg/spongycastle/crypto/engines/AESEngine;->subWord(I)I

    .line 454
    .line 455
    .line 456
    move-result v7

    .line 457
    sget-object v8, Lorg/spongycastle/crypto/engines/AESEngine;->rcon:[I

    .line 458
    .line 459
    add-int/lit8 v13, v5, -0x1

    .line 460
    .line 461
    aget v8, v8, v13

    .line 462
    .line 463
    xor-int/2addr v7, v8

    .line 464
    xor-int/2addr v2, v7

    .line 465
    aget-object v7, v6, v5

    .line 466
    .line 467
    aput v2, v7, v10

    .line 468
    .line 469
    xor-int/2addr v3, v2

    .line 470
    aput v3, v7, v18

    .line 471
    .line 472
    xor-int/2addr v4, v3

    .line 473
    aput v4, v7, v16

    .line 474
    .line 475
    xor-int/2addr v1, v4

    .line 476
    aput v1, v7, v12

    .line 477
    .line 478
    add-int/lit8 v5, v5, 0x1

    .line 479
    .line 480
    goto :goto_2

    .line 481
    :cond_5
    :goto_3
    if-nez p2, :cond_7

    .line 482
    .line 483
    move/from16 v8, v18

    .line 484
    .line 485
    :goto_4
    iget v1, v0, Lorg/spongycastle/crypto/engines/AESEngine;->ROUNDS:I

    .line 486
    .line 487
    if-ge v8, v1, :cond_7

    .line 488
    .line 489
    move v1, v10

    .line 490
    :goto_5
    if-ge v1, v9, :cond_6

    .line 491
    .line 492
    aget-object v2, v6, v8

    .line 493
    .line 494
    aget v3, v2, v1

    .line 495
    .line 496
    invoke-static {v3}, Lorg/spongycastle/crypto/engines/AESEngine;->inv_mcol(I)I

    .line 497
    .line 498
    .line 499
    move-result v3

    .line 500
    aput v3, v2, v1

    .line 501
    .line 502
    add-int/lit8 v1, v1, 0x1

    .line 503
    .line 504
    goto :goto_5

    .line 505
    :cond_6
    add-int/lit8 v8, v8, 0x1

    .line 506
    .line 507
    goto :goto_4

    .line 508
    :cond_7
    return-object v6

    .line 509
    :cond_8
    const-string v0, "Key length not 128/192/256 bits."

    .line 510
    .line 511
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    return-object v3
.end method

.method private static inv_mcol(I)I
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {p0, v0}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/2addr v0, p0

    .line 8
    invoke-static {v0}, Lorg/spongycastle/crypto/engines/AESEngine;->FFmulX(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    xor-int/2addr p0, v1

    .line 13
    invoke-static {p0}, Lorg/spongycastle/crypto/engines/AESEngine;->FFmulX2(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    xor-int/2addr v0, v1

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/engines/AESEngine;->shift(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    xor-int/2addr v0, v1

    .line 25
    xor-int/2addr p0, v0

    .line 26
    return p0
.end method

.method private packBlock([BI)V
    .locals 4

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 4
    .line 5
    int-to-byte v2, v1

    .line 6
    aput-byte v2, p1, p2

    .line 7
    .line 8
    add-int/lit8 v2, p2, 0x2

    .line 9
    .line 10
    shr-int/lit8 v3, v1, 0x8

    .line 11
    .line 12
    int-to-byte v3, v3

    .line 13
    aput-byte v3, p1, v0

    .line 14
    .line 15
    add-int/lit8 v0, p2, 0x3

    .line 16
    .line 17
    shr-int/lit8 v3, v1, 0x10

    .line 18
    .line 19
    int-to-byte v3, v3

    .line 20
    aput-byte v3, p1, v2

    .line 21
    .line 22
    add-int/lit8 v2, p2, 0x4

    .line 23
    .line 24
    shr-int/lit8 v1, v1, 0x18

    .line 25
    .line 26
    int-to-byte v1, v1

    .line 27
    aput-byte v1, p1, v0

    .line 28
    .line 29
    add-int/lit8 v0, p2, 0x5

    .line 30
    .line 31
    iget v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 32
    .line 33
    int-to-byte v3, v1

    .line 34
    aput-byte v3, p1, v2

    .line 35
    .line 36
    add-int/lit8 v2, p2, 0x6

    .line 37
    .line 38
    shr-int/lit8 v3, v1, 0x8

    .line 39
    .line 40
    int-to-byte v3, v3

    .line 41
    aput-byte v3, p1, v0

    .line 42
    .line 43
    add-int/lit8 v0, p2, 0x7

    .line 44
    .line 45
    shr-int/lit8 v3, v1, 0x10

    .line 46
    .line 47
    int-to-byte v3, v3

    .line 48
    aput-byte v3, p1, v2

    .line 49
    .line 50
    add-int/lit8 v2, p2, 0x8

    .line 51
    .line 52
    shr-int/lit8 v1, v1, 0x18

    .line 53
    .line 54
    int-to-byte v1, v1

    .line 55
    aput-byte v1, p1, v0

    .line 56
    .line 57
    add-int/lit8 v0, p2, 0x9

    .line 58
    .line 59
    iget v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 60
    .line 61
    int-to-byte v3, v1

    .line 62
    aput-byte v3, p1, v2

    .line 63
    .line 64
    add-int/lit8 v2, p2, 0xa

    .line 65
    .line 66
    shr-int/lit8 v3, v1, 0x8

    .line 67
    .line 68
    int-to-byte v3, v3

    .line 69
    aput-byte v3, p1, v0

    .line 70
    .line 71
    add-int/lit8 v0, p2, 0xb

    .line 72
    .line 73
    shr-int/lit8 v3, v1, 0x10

    .line 74
    .line 75
    int-to-byte v3, v3

    .line 76
    aput-byte v3, p1, v2

    .line 77
    .line 78
    add-int/lit8 v2, p2, 0xc

    .line 79
    .line 80
    shr-int/lit8 v1, v1, 0x18

    .line 81
    .line 82
    int-to-byte v1, v1

    .line 83
    aput-byte v1, p1, v0

    .line 84
    .line 85
    add-int/lit8 v0, p2, 0xd

    .line 86
    .line 87
    iget p0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 88
    .line 89
    int-to-byte v1, p0

    .line 90
    aput-byte v1, p1, v2

    .line 91
    .line 92
    add-int/lit8 v1, p2, 0xe

    .line 93
    .line 94
    shr-int/lit8 v2, p0, 0x8

    .line 95
    .line 96
    int-to-byte v2, v2

    .line 97
    aput-byte v2, p1, v0

    .line 98
    .line 99
    add-int/lit8 p2, p2, 0xf

    .line 100
    .line 101
    shr-int/lit8 v0, p0, 0x10

    .line 102
    .line 103
    int-to-byte v0, v0

    .line 104
    aput-byte v0, p1, v1

    .line 105
    .line 106
    shr-int/lit8 p0, p0, 0x18

    .line 107
    .line 108
    int-to-byte p0, p0

    .line 109
    aput-byte p0, p1, p2

    .line 110
    .line 111
    return-void
.end method

.method private static shift(II)I
    .locals 1

    ushr-int v0, p0, p1

    neg-int p1, p1

    shl-int/2addr p0, p1

    or-int/2addr p0, v0

    return p0
.end method

.method private static subWord(I)I
    .locals 3

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/engines/AESEngine;->S:[B

    .line 2
    .line 3
    and-int/lit16 v1, p0, 0xff

    .line 4
    .line 5
    aget-byte v1, v0, v1

    .line 6
    .line 7
    and-int/lit16 v1, v1, 0xff

    .line 8
    .line 9
    shr-int/lit8 v2, p0, 0x8

    .line 10
    .line 11
    and-int/lit16 v2, v2, 0xff

    .line 12
    .line 13
    aget-byte v2, v0, v2

    .line 14
    .line 15
    and-int/lit16 v2, v2, 0xff

    .line 16
    .line 17
    shl-int/lit8 v2, v2, 0x8

    .line 18
    .line 19
    or-int/2addr v1, v2

    .line 20
    shr-int/lit8 v2, p0, 0x10

    .line 21
    .line 22
    and-int/lit16 v2, v2, 0xff

    .line 23
    .line 24
    aget-byte v2, v0, v2

    .line 25
    .line 26
    and-int/lit16 v2, v2, 0xff

    .line 27
    .line 28
    shl-int/lit8 v2, v2, 0x10

    .line 29
    .line 30
    or-int/2addr v1, v2

    .line 31
    shr-int/lit8 p0, p0, 0x18

    .line 32
    .line 33
    and-int/lit16 p0, p0, 0xff

    .line 34
    .line 35
    aget-byte p0, v0, p0

    .line 36
    .line 37
    shl-int/lit8 p0, p0, 0x18

    .line 38
    .line 39
    or-int/2addr p0, v1

    .line 40
    return p0
.end method

.method private unpackBlock([BI)V
    .locals 3

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    aget-byte v1, p1, p2

    .line 4
    .line 5
    and-int/lit16 v1, v1, 0xff

    .line 6
    .line 7
    iput v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 8
    .line 9
    add-int/lit8 v2, p2, 0x2

    .line 10
    .line 11
    aget-byte v0, p1, v0

    .line 12
    .line 13
    and-int/lit16 v0, v0, 0xff

    .line 14
    .line 15
    shl-int/lit8 v0, v0, 0x8

    .line 16
    .line 17
    or-int/2addr v0, v1

    .line 18
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 19
    .line 20
    add-int/lit8 v1, p2, 0x3

    .line 21
    .line 22
    aget-byte v2, p1, v2

    .line 23
    .line 24
    and-int/lit16 v2, v2, 0xff

    .line 25
    .line 26
    shl-int/lit8 v2, v2, 0x10

    .line 27
    .line 28
    or-int/2addr v0, v2

    .line 29
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 30
    .line 31
    add-int/lit8 v2, p2, 0x4

    .line 32
    .line 33
    aget-byte v1, p1, v1

    .line 34
    .line 35
    shl-int/lit8 v1, v1, 0x18

    .line 36
    .line 37
    or-int/2addr v0, v1

    .line 38
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C0:I

    .line 39
    .line 40
    add-int/lit8 v0, p2, 0x5

    .line 41
    .line 42
    aget-byte v1, p1, v2

    .line 43
    .line 44
    and-int/lit16 v1, v1, 0xff

    .line 45
    .line 46
    iput v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 47
    .line 48
    add-int/lit8 v2, p2, 0x6

    .line 49
    .line 50
    aget-byte v0, p1, v0

    .line 51
    .line 52
    and-int/lit16 v0, v0, 0xff

    .line 53
    .line 54
    shl-int/lit8 v0, v0, 0x8

    .line 55
    .line 56
    or-int/2addr v0, v1

    .line 57
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 58
    .line 59
    add-int/lit8 v1, p2, 0x7

    .line 60
    .line 61
    aget-byte v2, p1, v2

    .line 62
    .line 63
    and-int/lit16 v2, v2, 0xff

    .line 64
    .line 65
    shl-int/lit8 v2, v2, 0x10

    .line 66
    .line 67
    or-int/2addr v0, v2

    .line 68
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 69
    .line 70
    add-int/lit8 v2, p2, 0x8

    .line 71
    .line 72
    aget-byte v1, p1, v1

    .line 73
    .line 74
    shl-int/lit8 v1, v1, 0x18

    .line 75
    .line 76
    or-int/2addr v0, v1

    .line 77
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C1:I

    .line 78
    .line 79
    add-int/lit8 v0, p2, 0x9

    .line 80
    .line 81
    aget-byte v1, p1, v2

    .line 82
    .line 83
    and-int/lit16 v1, v1, 0xff

    .line 84
    .line 85
    iput v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 86
    .line 87
    add-int/lit8 v2, p2, 0xa

    .line 88
    .line 89
    aget-byte v0, p1, v0

    .line 90
    .line 91
    and-int/lit16 v0, v0, 0xff

    .line 92
    .line 93
    shl-int/lit8 v0, v0, 0x8

    .line 94
    .line 95
    or-int/2addr v0, v1

    .line 96
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 97
    .line 98
    add-int/lit8 v1, p2, 0xb

    .line 99
    .line 100
    aget-byte v2, p1, v2

    .line 101
    .line 102
    and-int/lit16 v2, v2, 0xff

    .line 103
    .line 104
    shl-int/lit8 v2, v2, 0x10

    .line 105
    .line 106
    or-int/2addr v0, v2

    .line 107
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 108
    .line 109
    add-int/lit8 v2, p2, 0xc

    .line 110
    .line 111
    aget-byte v1, p1, v1

    .line 112
    .line 113
    shl-int/lit8 v1, v1, 0x18

    .line 114
    .line 115
    or-int/2addr v0, v1

    .line 116
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C2:I

    .line 117
    .line 118
    add-int/lit8 v0, p2, 0xd

    .line 119
    .line 120
    aget-byte v1, p1, v2

    .line 121
    .line 122
    and-int/lit16 v1, v1, 0xff

    .line 123
    .line 124
    iput v1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 125
    .line 126
    add-int/lit8 v2, p2, 0xe

    .line 127
    .line 128
    aget-byte v0, p1, v0

    .line 129
    .line 130
    and-int/lit16 v0, v0, 0xff

    .line 131
    .line 132
    shl-int/lit8 v0, v0, 0x8

    .line 133
    .line 134
    or-int/2addr v0, v1

    .line 135
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 136
    .line 137
    add-int/lit8 p2, p2, 0xf

    .line 138
    .line 139
    aget-byte v1, p1, v2

    .line 140
    .line 141
    and-int/lit16 v1, v1, 0xff

    .line 142
    .line 143
    shl-int/lit8 v1, v1, 0x10

    .line 144
    .line 145
    or-int/2addr v0, v1

    .line 146
    iput v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 147
    .line 148
    aget-byte p1, p1, p2

    .line 149
    .line 150
    shl-int/lit8 p1, p1, 0x18

    .line 151
    .line 152
    or-int/2addr p1, v0

    .line 153
    iput p1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->C3:I

    .line 154
    .line 155
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "AES"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/crypto/engines/AESEngine;->generateWorkingKey([BZ)[[I

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/AESEngine;->WorkingKey:[[I

    .line 16
    .line 17
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->forEncryption:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "invalid parameter passed to AES init - "

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public processBlock([BI[BI)I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->WorkingKey:[[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x10

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x10

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/AESEngine;->forEncryption:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/AESEngine;->unpackBlock([BI)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->WorkingKey:[[I

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/AESEngine;->encryptBlock([[I)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, p3, p4}, Lorg/spongycastle/crypto/engines/AESEngine;->packBlock([BI)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/AESEngine;->unpackBlock([BI)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/AESEngine;->WorkingKey:[[I

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/AESEngine;->decryptBlock([[I)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, p3, p4}, Lorg/spongycastle/crypto/engines/AESEngine;->packBlock([BI)V

    .line 41
    .line 42
    .line 43
    :goto_0
    const/16 p0, 0x10

    .line 44
    .line 45
    return p0

    .line 46
    :cond_1
    const-string p0, "output buffer too short"

    .line 47
    .line 48
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return v1

    .line 52
    :cond_2
    const-string p0, "input buffer too short"

    .line 53
    .line 54
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return v1

    .line 58
    :cond_3
    const-string p0, "AES engine not initialised"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return v1
.end method

.method public reset()V
    .locals 0

    return-void
.end method
