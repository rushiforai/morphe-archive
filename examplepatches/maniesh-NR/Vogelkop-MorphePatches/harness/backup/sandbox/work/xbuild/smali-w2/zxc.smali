.class public final enum Lzxc;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lxeb;


# static fields
.field public static final enum b:Lzxc;

.field public static final enum c:Lzxc;

.field public static final enum d:Lzxc;

.field public static final enum e:Lzxc;

.field public static final synthetic f:[Lzxc;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lzxc;

    const-string v1, "LOCATION_MODE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lzxc;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzxc;->b:Lzxc;

    new-instance v1, Lzxc;

    const-string v2, "LOCATION_MODE_AUTO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lzxc;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lzxc;->c:Lzxc;

    new-instance v2, Lzxc;

    const-string v3, "LOCATION_MODE_MANUAL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lzxc;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lzxc;->d:Lzxc;

    new-instance v3, Lzxc;

    const/4 v4, 0x3

    const/4 v5, -0x1

    const-string v6, "UNRECOGNIZED"

    invoke-direct {v3, v6, v4, v5}, Lzxc;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lzxc;->e:Lzxc;

    filled-new-array {v0, v1, v2, v3}, [Lzxc;

    move-result-object v0

    sput-object v0, Lzxc;->f:[Lzxc;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lzxc;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzxc;
    .registers 2

    const-class v0, Lzxc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lzxc;

    return-object p0
.end method

.method public static values()[Lzxc;
    .registers 1

    sget-object v0, Lzxc;->f:[Lzxc;

    invoke-virtual {v0}, [Lzxc;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzxc;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .registers 2

    sget-object v0, Lzxc;->e:Lzxc;

    if-eq p0, v0, :cond_7

    iget p0, p0, Lzxc;->a:I

    return p0

    :cond_7
    const-string p0, "Can\'t get the number of an unknown enum value."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
