.class public final enum Lat7;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lat7;

.field public static final enum b:Lat7;

.field public static final enum c:Lat7;

.field public static final enum d:Lat7;

.field public static final enum e:Lat7;

.field public static final enum f:Lat7;

.field public static final synthetic g:[Lat7;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lat7;

    const-string v1, "BLUR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lat7;->a:Lat7;

    new-instance v1, Lat7;

    const-string v2, "PEN"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lat7;->b:Lat7;

    new-instance v2, Lat7;

    const-string v3, "TEXT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lat7;->c:Lat7;

    new-instance v3, Lat7;

    const-string v4, "EMOJI"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lat7;->d:Lat7;

    new-instance v4, Lat7;

    const-string v5, "CUTOUT"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lat7;->e:Lat7;

    new-instance v5, Lat7;

    const-string v6, "VIEW"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lat7;->f:Lat7;

    new-instance v6, Lat7;

    const-string v7, "FREEZE"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array/range {v0 .. v6}, [Lat7;

    move-result-object v0

    sput-object v0, Lat7;->g:[Lat7;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lat7;
    .registers 2

    const-class v0, Lat7;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lat7;

    return-object p0
.end method

.method public static values()[Lat7;
    .registers 1

    sget-object v0, Lat7;->g:[Lat7;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lat7;

    return-object v0
.end method
