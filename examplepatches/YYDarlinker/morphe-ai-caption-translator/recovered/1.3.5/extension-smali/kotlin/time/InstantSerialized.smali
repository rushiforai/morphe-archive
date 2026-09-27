.class final Lkotlin/time/InstantSerialized;
.super Ljava/lang/Object;
.source "InstantJvm.kt"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/InstantSerialized$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000c\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\u0008\u0002\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001aB\u0019\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\t\u0008V\u00a2\u0006\u0004\u0008\u0006\u0010\u0008J\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\n\u0010\u0018\u001a\u00020\u0019H\u0082\u0080\u0004R\u001b\u0010\u0002\u001a\u00020\u0003X\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001b\u0010\u0004\u001a\u00020\u0005X\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u001b"
    }
    d2 = {
        "Lkotlin/time/InstantSerialized;",
        "Ljava/io/Externalizable;",
        "epochSeconds",
        "",
        "nanosecondsOfSecond",
        "",
        "<init>",
        "(JI)V",
        "()V",
        "getEpochSeconds",
        "()J",
        "setEpochSeconds",
        "(J)V",
        "getNanosecondsOfSecond",
        "()I",
        "setNanosecondsOfSecond",
        "(I)V",
        "writeExternal",
        "",
        "output",
        "Ljava/io/ObjectOutput;",
        "readExternal",
        "input",
        "Ljava/io/ObjectInput;",
        "readResolve",
        "",
        "Companion",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lkotlin/time/InstantSerialized$Companion;

.field private static final serialVersionUID:J


# instance fields
.field private epochSeconds:J

.field private nanosecondsOfSecond:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/time/InstantSerialized$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/time/InstantSerialized$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/time/InstantSerialized;->Companion:Lkotlin/time/InstantSerialized$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    .line 20
    invoke-direct {p0, v0, v1, v2}, Lkotlin/time/InstantSerialized;-><init>(JI)V

    return-void
.end method

.method public constructor <init>(JI)V
    .registers 4

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-wide p1, p0, Lkotlin/time/InstantSerialized;->epochSeconds:J

    .line 17
    iput p3, p0, Lkotlin/time/InstantSerialized;->nanosecondsOfSecond:I

    return-void
.end method

.method private final readResolve()Ljava/lang/Object;
    .registers 4

    .line 33
    sget-object v0, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    iget-wide v1, p0, Lkotlin/time/InstantSerialized;->epochSeconds:J

    iget p0, p0, Lkotlin/time/InstantSerialized;->nanosecondsOfSecond:I

    invoke-virtual {v0, v1, v2, p0}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final getEpochSeconds()J
    .registers 3

    .line 16
    iget-wide v0, p0, Lkotlin/time/InstantSerialized;->epochSeconds:J

    return-wide v0
.end method

.method public final getNanosecondsOfSecond()I
    .registers 1

    .line 17
    iget p0, p0, Lkotlin/time/InstantSerialized;->nanosecondsOfSecond:I

    return p0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lkotlin/time/InstantSerialized;->epochSeconds:J

    .line 29
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result p1

    iput p1, p0, Lkotlin/time/InstantSerialized;->nanosecondsOfSecond:I

    return-void
.end method

.method public final setEpochSeconds(J)V
    .registers 3

    .line 16
    iput-wide p1, p0, Lkotlin/time/InstantSerialized;->epochSeconds:J

    return-void
.end method

.method public final setNanosecondsOfSecond(I)V
    .registers 2

    .line 17
    iput p1, p0, Lkotlin/time/InstantSerialized;->nanosecondsOfSecond:I

    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 4

    const-string v0, "output"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    iget-wide v0, p0, Lkotlin/time/InstantSerialized;->epochSeconds:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 24
    iget p0, p0, Lkotlin/time/InstantSerialized;->nanosecondsOfSecond:I

    invoke-interface {p1, p0}, Ljava/io/ObjectOutput;->writeInt(I)V

    return-void
.end method
