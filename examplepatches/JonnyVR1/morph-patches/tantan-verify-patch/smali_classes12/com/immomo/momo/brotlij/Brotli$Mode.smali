.class public final enum Lcom/immomo/momo/brotlij/Brotli$Mode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momo/brotlij/Brotli;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momo/brotlij/Brotli$Mode;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/immomo/momo/brotlij/Brotli$Mode;",
        "",
        "mode",
        "",
        "(Ljava/lang/String;II)V",
        "getMode",
        "()I",
        "setMode",
        "(I)V",
        "GENERIC",
        "TEXT",
        "FONT",
        "brotlij_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momo/brotlij/Brotli$Mode;

.field public static final enum FONT:Lcom/immomo/momo/brotlij/Brotli$Mode;

.field public static final enum GENERIC:Lcom/immomo/momo/brotlij/Brotli$Mode;

.field public static final enum TEXT:Lcom/immomo/momo/brotlij/Brotli$Mode;


# instance fields
.field private mode:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 2
    .line 3
    const-string v1, "GENERIC"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/immomo/momo/brotlij/Brotli$Mode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/momo/brotlij/Brotli$Mode;->GENERIC:Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 12
    .line 13
    const-string v2, "TEXT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/immomo/momo/brotlij/Brotli$Mode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/immomo/momo/brotlij/Brotli$Mode;->TEXT:Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 20
    .line 21
    new-instance v2, Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 22
    .line 23
    const-string v3, "FONT"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/immomo/momo/brotlij/Brotli$Mode;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/immomo/momo/brotlij/Brotli$Mode;->FONT:Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/immomo/momo/brotlij/Brotli$Mode;->$VALUES:[Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/immomo/momo/brotlij/Brotli$Mode;->mode:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momo/brotlij/Brotli$Mode;
    .locals 1

    const-class v0, Lcom/immomo/momo/brotlij/Brotli$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/momo/brotlij/Brotli$Mode;

    return-object p0
.end method

.method public static values()[Lcom/immomo/momo/brotlij/Brotli$Mode;
    .locals 1

    sget-object v0, Lcom/immomo/momo/brotlij/Brotli$Mode;->$VALUES:[Lcom/immomo/momo/brotlij/Brotli$Mode;

    invoke-virtual {v0}, [Lcom/immomo/momo/brotlij/Brotli$Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/momo/brotlij/Brotli$Mode;

    return-object v0
.end method


# virtual methods
.method public final getMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momo/brotlij/Brotli$Mode;->mode:I

    .line 2
    .line 3
    return p0
.end method

.method public final setMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momo/brotlij/Brotli$Mode;->mode:I

    .line 2
    .line 3
    return-void
.end method
