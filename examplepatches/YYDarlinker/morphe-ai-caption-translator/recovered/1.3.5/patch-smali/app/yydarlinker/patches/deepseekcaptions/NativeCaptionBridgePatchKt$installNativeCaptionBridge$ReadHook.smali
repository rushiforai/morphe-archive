.class public final Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;
.super Ljava/lang/Object;
.source "NativeCaptionBridgePatch.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt;->installNativeCaptionBridge(Lapp/morphe/patcher/patch/BytecodePatchContext;ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReadHook"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0011\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\u008a\u0008\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0013\u001a\u00020\u0005H\u00c6\u0003J6\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0005H\u00c6\u0001\u00a2\u0006\u0002\u0010\u0015J\u0014\u0010\u0016\u001a\u00020\u00172\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u0019\u001a\u00020\u0005H\u00d6\u0081\u0004J\n\u0010\u001a\u001a\u00020\u001bH\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\r\u00a8\u0006\u001c"
    }
    d2 = {
        "app/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook",
        "",
        "m",
        "Lcom/android/tools/smali/dexlib2/iface/Method;",
        "index",
        "",
        "dest",
        "receiver",
        "<init>",
        "(Lcom/android/tools/smali/dexlib2/iface/Method;III)V",
        "getM",
        "()Lcom/android/tools/smali/dexlib2/iface/Method;",
        "getIndex",
        "()I",
        "getDest",
        "getReceiver",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "(Lcom/android/tools/smali/dexlib2/iface/Method;III)Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
        "",
        "app.yydarlinker:patches"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final dest:I

.field private final index:I

.field private final m:Lcom/android/tools/smali/dexlib2/iface/Method;

.field private final receiver:I


# direct methods
.method public constructor <init>(Lcom/android/tools/smali/dexlib2/iface/Method;III)V
    .registers 6

    const-string v0, "m"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 366
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    iput p2, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    iput p3, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    iput p4, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    return-void
.end method

.method public static synthetic copy$default(Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;Lcom/android/tools/smali/dexlib2/iface/Method;IIIILjava/lang/Object;)Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;
    .registers 7

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_6

    iget-object p1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    :cond_6
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_c

    iget p2, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    :cond_c
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_12

    iget p3, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    :cond_12
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_18

    iget p4, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    :cond_18
    invoke-virtual {p0, p1, p2, p3, p4}, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->copy(Lcom/android/tools/smali/dexlib2/iface/Method;III)Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/android/tools/smali/dexlib2/iface/Method;
    .registers 1

    iget-object p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    return-object p0
.end method

.method public final component2()I
    .registers 1

    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    return p0
.end method

.method public final component3()I
    .registers 1

    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    return p0
.end method

.method public final component4()I
    .registers 1

    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    return p0
.end method

.method public final copy(Lcom/android/tools/smali/dexlib2/iface/Method;III)Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;
    .registers 5

    const-string p0, "m"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;

    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;-><init>(Lcom/android/tools/smali/dexlib2/iface/Method;III)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;

    iget-object v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    iget-object v3, p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    iget v3, p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    iget v3, p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    iget p1, p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    if-eq p0, p1, :cond_2c

    return v2

    :cond_2c
    return v0
.end method

.method public final getDest()I
    .registers 1

    .line 366
    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    return p0
.end method

.method public final getIndex()I
    .registers 1

    .line 366
    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    return p0
.end method

.method public final getM()Lcom/android/tools/smali/dexlib2/iface/Method;
    .registers 1

    .line 366
    iget-object p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    return-object p0
.end method

.method public final getReceiver()I
    .registers 1

    .line 366
    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    return p0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    iget-object v0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->m:Lcom/android/tools/smali/dexlib2/iface/Method;

    iget v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->index:I

    iget v2, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->dest:I

    iget p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->receiver:I

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ReadHook(m="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", index="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", dest="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", receiver="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
