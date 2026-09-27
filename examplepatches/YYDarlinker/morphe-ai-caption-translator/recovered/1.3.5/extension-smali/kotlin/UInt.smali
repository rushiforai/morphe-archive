.class public final Lkotlin/UInt;
.super Ljava/lang/Object;
.source "UInt.kt"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/UInt$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lkotlin/UInt;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008-\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0005\n\u0002\u0008\u0003\n\u0002\u0010\n\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u000b\n\u0002\u0010\u0007\n\u0002\u0008\u0003\n\u0002\u0010\u0006\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0018\u0002\u0008\u0087@\u0018\u0000 \u0081\u00012\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\u0081\u0001B\u0019\u0008A\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u001a\u0002\u0008\u0006\u001a\u0002\u0008\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J!\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\r\u0010\u000eJ!\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J!\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0000H\u0097\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J!\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J!\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u0019\u0010\u000eJ!\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u001a\u0010\u0012J!\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u001b\u0010\u0014J!\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\u001f\u0010\u000eJ!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008 \u0010\u0012J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008!\u0010\u0014J!\u0010\u001e\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\"\u0010\u001dJ!\u0010#\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008$\u0010\u000eJ!\u0010#\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008%\u0010\u0012J!\u0010#\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008&\u0010\u0014J!\u0010#\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008\'\u0010\u001dJ!\u0010(\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008)\u0010\u000eJ!\u0010(\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008*\u0010\u0012J!\u0010(\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008+\u0010\u0014J!\u0010(\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008,\u0010\u001dJ!\u0010-\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008.\u0010\u000eJ!\u0010-\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008/\u0010\u0012J!\u0010-\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00080\u0010\u0014J!\u0010-\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u008a\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00081\u0010\u001dJ!\u00102\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00083\u0010\u000eJ!\u00102\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00084\u0010\u0012J!\u00102\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00085\u0010\u0014J!\u00102\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00086\u0010\u001dJ!\u00107\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\u000cH\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u00088\u00109J!\u00107\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\u0010H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008:\u0010;J!\u00107\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008<\u0010\u0014J!\u00107\u001a\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u0015H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008=\u0010\u001dJ\u0015\u0010>\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000f\u00a2\u0006\u0004\u0008?\u0010\u0005J\u0015\u0010@\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000f\u00a2\u0006\u0004\u0008A\u0010\u0005J\u001d\u0010B\u001a\u00020C2\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u0002\u0008\u000f\u00a2\u0006\u0004\u0008D\u0010EJ=\u0010F\u001a\u00020C2\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008a\u0004b\u000c\u0008H\u0012\u0008\u0008I\u0012\u0004\u0008\u0008(Jb\u0010\u0008K\u0012\u000c\u0008L\u0012\u0008\u0008\u000cJ\u0004\u0008\t0Mb\u0002\u0008\u000f\u00a2\u0006\u0004\u0008G\u0010EJ!\u0010N\u001a\u00020\u00002\u0006\u0010O\u001a\u00020\u0003H\u0087\u008c\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008P\u0010\u0014J!\u0010Q\u001a\u00020\u00002\u0006\u0010O\u001a\u00020\u0003H\u0087\u008c\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008R\u0010\u0014J!\u0010S\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008c\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008T\u0010\u0014J!\u0010U\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008c\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008V\u0010\u0014J!\u0010W\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0000H\u0087\u008c\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008X\u0010\u0014J\u0019\u0010Y\u001a\u00020\u0000H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008Z\u0010\u0005J\u0019\u0010[\u001a\u00020\\H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008]\u0010^J\u0019\u0010_\u001a\u00020`H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008a\u0010bJ\u0019\u0010c\u001a\u00020\u0003H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008d\u0010\u0005J\u0019\u0010e\u001a\u00020fH\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008g\u0010hJ\u0019\u0010i\u001a\u00020\u000cH\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008j\u0010^J\u0019\u0010k\u001a\u00020\u0010H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008l\u0010bJ\u0019\u0010m\u001a\u00020\u0000H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008n\u0010\u0005J\u0019\u0010o\u001a\u00020\u0015H\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008p\u0010hJ\u0019\u0010q\u001a\u00020rH\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008s\u0010tJ\u0019\u0010u\u001a\u00020vH\u0087\u0088\u0004b\u0002\u0008\u000fb\u0002\u0008\u0006\u00a2\u0006\u0004\u0008w\u0010xJ\u0015\u0010y\u001a\u00020zH\u0097\u0080\u0004b\u0002\u0008\u0006\u00a2\u0006\u0004\u0008{\u0010|J\u0014\u0010}\u001a\u00020~2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u007fH\u00d6\u0083\u0004J\u000b\u0010\u0080\u0001\u001a\u00020\u0003H\u00d6\u0081\u0004R\u001b\u0010\u0002\u001a\u00020\u00038\u0000X\u0081\u0084\u0008r\u0002\u0008\u0007\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0008\u0010\t\u0088\u0001\u0002\u0092\u0001\u00020\u0003\u00ca\u0001\r\u0008H\u0012\t\u0008I\u0012\u0005\u0008\u0008(\u0083\u0001\u00ca\u0001\u0003\u0008\u0084\u0001\u00a8\u0006\u0082\u0001"
    }
    d2 = {
        "Lkotlin/UInt;",
        "",
        "data",
        "",
        "constructor-impl",
        "(I)I",
        "Lkotlin/internal/IntrinsicConstEvaluation;",
        "Lkotlin/PublishedApi;",
        "getData$annotations",
        "()V",
        "compareTo",
        "other",
        "Lkotlin/UByte;",
        "compareTo-7apg3OU",
        "(IB)I",
        "Lkotlin/internal/InlineOnly;",
        "Lkotlin/UShort;",
        "compareTo-xj2QHRw",
        "(IS)I",
        "compareTo-WZ4Q5Ns",
        "(II)I",
        "Lkotlin/ULong;",
        "compareTo-VKZWuLQ",
        "(IJ)I",
        "plus",
        "plus-7apg3OU",
        "plus-xj2QHRw",
        "plus-WZ4Q5Ns",
        "plus-VKZWuLQ",
        "(IJ)J",
        "minus",
        "minus-7apg3OU",
        "minus-xj2QHRw",
        "minus-WZ4Q5Ns",
        "minus-VKZWuLQ",
        "times",
        "times-7apg3OU",
        "times-xj2QHRw",
        "times-WZ4Q5Ns",
        "times-VKZWuLQ",
        "div",
        "div-7apg3OU",
        "div-xj2QHRw",
        "div-WZ4Q5Ns",
        "div-VKZWuLQ",
        "rem",
        "rem-7apg3OU",
        "rem-xj2QHRw",
        "rem-WZ4Q5Ns",
        "rem-VKZWuLQ",
        "floorDiv",
        "floorDiv-7apg3OU",
        "floorDiv-xj2QHRw",
        "floorDiv-WZ4Q5Ns",
        "floorDiv-VKZWuLQ",
        "mod",
        "mod-7apg3OU",
        "(IB)B",
        "mod-xj2QHRw",
        "(IS)S",
        "mod-WZ4Q5Ns",
        "mod-VKZWuLQ",
        "inc",
        "inc-pVg5ArA",
        "dec",
        "dec-pVg5ArA",
        "rangeTo",
        "Lkotlin/ranges/UIntRange;",
        "rangeTo-WZ4Q5Ns",
        "(II)Lkotlin/ranges/UIntRange;",
        "rangeUntil",
        "rangeUntil-WZ4Q5Ns",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.9",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/ExperimentalStdlibApi;",
        "shl",
        "bitCount",
        "shl-pVg5ArA",
        "shr",
        "shr-pVg5ArA",
        "and",
        "and-WZ4Q5Ns",
        "or",
        "or-WZ4Q5Ns",
        "xor",
        "xor-WZ4Q5Ns",
        "inv",
        "inv-pVg5ArA",
        "toByte",
        "",
        "toByte-impl",
        "(I)B",
        "toShort",
        "",
        "toShort-impl",
        "(I)S",
        "toInt",
        "toInt-impl",
        "toLong",
        "",
        "toLong-impl",
        "(I)J",
        "toUByte",
        "toUByte-w2LRezQ",
        "toUShort",
        "toUShort-Mh2AYeg",
        "toUInt",
        "toUInt-pVg5ArA",
        "toULong",
        "toULong-s-VKNKU",
        "toFloat",
        "",
        "toFloat-impl",
        "(I)F",
        "toDouble",
        "",
        "toDouble-impl",
        "(I)D",
        "toString",
        "",
        "toString-impl",
        "(I)Ljava/lang/String;",
        "equals",
        "",
        "",
        "hashCode",
        "Companion",
        "kotlin-stdlib",
        "1.5",
        "Lkotlin/jvm/JvmInline;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/jvm/JvmInline;
.end annotation


# static fields
.field public static final Companion:Lkotlin/UInt$Companion;

.field public static final MAX_VALUE:I = -0x1

.field public static final MIN_VALUE:I = 0x0

.field public static final SIZE_BITS:I = 0x20

.field public static final SIZE_BYTES:I = 0x4


# instance fields
.field private final data:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/UInt$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/UInt$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/UInt;->Companion:Lkotlin/UInt$Companion;

    return-void
.end method

.method private synthetic constructor <init>(I)V
    .registers 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkotlin/UInt;->data:I

    return-void
.end method

.method private static final and-WZ4Q5Ns(II)I
    .registers 2

    and-int/2addr p0, p1

    .line 305
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method public static final synthetic box-impl(I)Lkotlin/UInt;
    .registers 2

    new-instance v0, Lkotlin/UInt;

    invoke-direct {v0, p0}, Lkotlin/UInt;-><init>(I)V

    return-object v0
.end method

.method private static final compareTo-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 47
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result p0

    return p0
.end method

.method private static final compareTo-VKZWuLQ(IJ)I
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 75
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result p0

    return p0
.end method

.method private compareTo-WZ4Q5Ns(I)I
    .registers 2

    .line 66
    invoke-virtual {p0}, Lkotlin/UInt;->unbox-impl()I

    move-result p0

    invoke-static {p0, p1}, Lkotlin/UnsignedKt;->uintCompare(II)I

    move-result p0

    return p0
.end method

.method private static compareTo-WZ4Q5Ns(II)I
    .registers 2

    .line 66
    invoke-static {p0, p1}, Lkotlin/UnsignedKt;->uintCompare(II)I

    move-result p0

    return p0
.end method

.method private static final compareTo-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 56
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result p0

    return p0
.end method

.method public static constructor-impl(I)I
    .registers 1

    return p0
.end method

.method private static final dec-pVg5ArA(I)I
    .registers 1

    add-int/lit8 p0, p0, -0x1

    .line 266
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final div-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 131
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(II)I

    move-result p0

    return p0
.end method

.method private static final div-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 143
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final div-WZ4Q5Ns(II)I
    .registers 2

    .line 139
    invoke-static {p0, p1}, Lkotlin/UnsignedKt;->uintDivide-J1ME1BU(II)I

    move-result p0

    return p0
.end method

.method private static final div-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 135
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(II)I

    move-result p0

    return p0
.end method

.method public static equals-impl(ILjava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lkotlin/UInt;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p1, Lkotlin/UInt;

    invoke-virtual {p1}, Lkotlin/UInt;->unbox-impl()I

    move-result p1

    if-eq p0, p1, :cond_f

    return v1

    :cond_f
    const/4 p0, 0x1

    return p0
.end method

.method public static final equals-impl0(II)Z
    .registers 2

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method private static final floorDiv-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 185
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(II)I

    move-result p0

    return p0
.end method

.method private static final floorDiv-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 209
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final floorDiv-WZ4Q5Ns(II)I
    .registers 2

    .line 201
    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(II)I

    move-result p0

    return p0
.end method

.method private static final floorDiv-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 193
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(II)I

    move-result p0

    return p0
.end method

.method public static synthetic getData$annotations()V
    .registers 0

    return-void
.end method

.method public static hashCode-impl(I)I
    .registers 1

    return p0
.end method

.method private static final inc-pVg5ArA(I)I
    .registers 1

    add-int/lit8 p0, p0, 0x1

    .line 258
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final inv-pVg5ArA(I)I
    .registers 1

    not-int p0, p0

    .line 317
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final minus-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 97
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    sub-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final minus-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 109
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    sub-long/2addr v0, p1

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final minus-WZ4Q5Ns(II)I
    .registers 2

    sub-int/2addr p0, p1

    .line 105
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final minus-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 101
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    sub-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final mod-7apg3OU(IB)B
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 220
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p0

    int-to-byte p0, p0

    invoke-static {p0}, Lkotlin/UByte;->constructor-impl(B)B

    move-result p0

    return p0
.end method

.method private static final mod-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 250
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final mod-WZ4Q5Ns(II)I
    .registers 2

    .line 240
    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p0

    return p0
.end method

.method private static final mod-xj2QHRw(IS)S
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 230
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p0

    int-to-short p0, p0

    invoke-static {p0}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p0

    return p0
.end method

.method private static final or-WZ4Q5Ns(II)I
    .registers 2

    or-int/2addr p0, p1

    .line 309
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final plus-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 80
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    add-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final plus-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 92
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    add-long/2addr v0, p1

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final plus-WZ4Q5Ns(II)I
    .registers 2

    add-int/2addr p0, p1

    .line 88
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final plus-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 84
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    add-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final rangeTo-WZ4Q5Ns(II)Lkotlin/ranges/UIntRange;
    .registers 4

    .line 270
    new-instance v0, Lkotlin/ranges/UIntRange;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lkotlin/ranges/UIntRange;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method private static final rangeUntil-WZ4Q5Ns(II)Lkotlin/ranges/UIntRange;
    .registers 2

    .line 280
    invoke-static {p0, p1}, Lkotlin/ranges/URangesKt;->until-J1ME1BU(II)Lkotlin/ranges/UIntRange;

    move-result-object p0

    return-object p0
.end method

.method private static final rem-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 152
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p0

    return p0
.end method

.method private static final rem-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 176
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final rem-WZ4Q5Ns(II)I
    .registers 2

    .line 168
    invoke-static {p0, p1}, Lkotlin/UnsignedKt;->uintRemainder-J1ME1BU(II)I

    move-result p0

    return p0
.end method

.method private static final rem-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 160
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p0

    return p0
.end method

.method private static final shl-pVg5ArA(II)I
    .registers 2

    shl-int/2addr p0, p1

    .line 290
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final shr-pVg5ArA(II)I
    .registers 2

    ushr-int/2addr p0, p1

    .line 300
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final times-7apg3OU(IB)I
    .registers 2

    and-int/lit16 p1, p1, 0xff

    .line 114
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    mul-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final times-VKZWuLQ(IJ)J
    .registers 7

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 126
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    mul-long/2addr v0, p1

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final times-WZ4Q5Ns(II)I
    .registers 2

    mul-int/2addr p0, p1

    .line 122
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final times-xj2QHRw(IS)I
    .registers 3

    const v0, 0xffff

    and-int/2addr p1, v0

    .line 118
    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p1

    mul-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final toByte-impl(I)B
    .registers 1

    int-to-byte p0, p0

    return p0
.end method

.method private static final toDouble-impl(I)D
    .registers 3

    .line 421
    invoke-static {p0}, Lkotlin/UnsignedKt;->uintToDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method private static final toFloat-impl(I)F
    .registers 3

    .line 413
    invoke-static {p0}, Lkotlin/UnsignedKt;->uintToDouble(I)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private static final toInt-impl(I)I
    .registers 1

    return p0
.end method

.method private static final toLong-impl(I)J
    .registers 5

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private static final toShort-impl(I)S
    .registers 1

    int-to-short p0, p0

    return p0
.end method

.method public static toString-impl(I)Ljava/lang/String;
    .registers 5

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 424
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final toUByte-w2LRezQ(I)B
    .registers 1

    int-to-byte p0, p0

    .line 376
    invoke-static {p0}, Lkotlin/UByte;->constructor-impl(B)B

    move-result p0

    return p0
.end method

.method private static final toUInt-pVg5ArA(I)I
    .registers 1

    return p0
.end method

.method private static final toULong-s-VKNKU(I)J
    .registers 5

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 402
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    return-wide v0
.end method

.method private static final toUShort-Mh2AYeg(I)S
    .registers 1

    int-to-short p0, p0

    .line 387
    invoke-static {p0}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p0

    return p0
.end method

.method private static final xor-WZ4Q5Ns(II)I
    .registers 2

    xor-int/2addr p0, p1

    .line 313
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 14
    check-cast p1, Lkotlin/UInt;

    invoke-virtual {p1}, Lkotlin/UInt;->unbox-impl()I

    move-result p1

    invoke-virtual {p0}, Lkotlin/UInt;->unbox-impl()I

    move-result p0

    invoke-static {p0, p1}, Lkotlin/UnsignedKt;->uintCompare(II)I

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 2

    iget p0, p0, Lkotlin/UInt;->data:I

    invoke-static {p0, p1}, Lkotlin/UInt;->equals-impl(ILjava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .registers 1

    iget p0, p0, Lkotlin/UInt;->data:I

    invoke-static {p0}, Lkotlin/UInt;->hashCode-impl(I)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 424
    iget p0, p0, Lkotlin/UInt;->data:I

    invoke-static {p0}, Lkotlin/UInt;->toString-impl(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final synthetic unbox-impl()I
    .registers 1

    iget p0, p0, Lkotlin/UInt;->data:I

    return p0
.end method
