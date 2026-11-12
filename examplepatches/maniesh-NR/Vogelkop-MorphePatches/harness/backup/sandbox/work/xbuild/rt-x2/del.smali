.class public final enum Ldel;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lxeb;


# static fields
.field public static final enum b:Ldel;

.field public static final enum c:Ldel;

.field public static final enum d:Ldel;

.field public static final enum e:Ldel;

.field public static final synthetic f:[Ldel;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Ldel;

    const-string v1, "TEMPERATURE_UNIT_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Ldel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Ldel;->b:Ldel;

    new-instance v1, Ldel;

    const-string v2, "TEMPERATURE_UNIT_CELSIUS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Ldel;-><init>(Ljava/lang/String;II)V

    sput-object v1, Ldel;->c:Ldel;

    new-instance v2, Ldel;

    const-string v3, "TEMPERATURE_UNIT_FAHRENHEIT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Ldel;-><init>(Ljava/lang/String;II)V

    sput-object v2, Ldel;->d:Ldel;

    new-instance v3, Ldel;

    const/4 v4, 0x3

    const/4 v5, -0x1

    const-string v6, "UNRECOGNIZED"

    invoke-direct {v3, v6, v4, v5}, Ldel;-><init>(Ljava/lang/String;II)V

    sput-object v3, Ldel;->e:Ldel;

    filled-new-array {v0, v1, v2, v3}, [Ldel;

    move-result-object v0

    sput-object v0, Ldel;->f:[Ldel;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Ldel;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldel;
    .registers 2

    const-class v0, Ldel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldel;

    return-object p0
.end method

.method public static values()[Ldel;
    .registers 1

    sget-object v0, Ldel;->f:[Ldel;

    invoke-virtual {v0}, [Ldel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldel;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .registers 2

    sget-object v0, Ldel;->e:Ldel;

    if-eq p0, v0, :cond_7

    iget p0, p0, Ldel;->a:I

    return p0

    :cond_7
    const-string p0, "Can\'t get the number of an unknown enum value."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
