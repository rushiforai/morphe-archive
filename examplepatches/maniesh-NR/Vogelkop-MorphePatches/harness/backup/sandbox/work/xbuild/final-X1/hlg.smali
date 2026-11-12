.class public final enum Lhlg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lhlg;

.field public static final enum b:Lhlg;

.field public static final enum c:Lhlg;

.field public static final enum d:Lhlg;

.field public static final enum e:Lhlg;

.field public static final enum f:Lhlg;

.field public static final enum g:Lhlg;

.field public static final synthetic h:[Lhlg;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lhlg;

    const-string v1, "N"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lhlg;->a:Lhlg;

    new-instance v1, Lhlg;

    const-string v2, "I"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lhlg;->b:Lhlg;

    new-instance v2, Lhlg;

    const-string v3, "V"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lhlg;->c:Lhlg;

    new-instance v3, Lhlg;

    const-string v4, "W"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lhlg;->d:Lhlg;

    new-instance v4, Lhlg;

    const-string v5, "F"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lhlg;->e:Lhlg;

    new-instance v5, Lhlg;

    const-string v6, "T"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lhlg;->f:Lhlg;

    new-instance v6, Lhlg;

    const-string v7, "C"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lhlg;->g:Lhlg;

    filled-new-array/range {v0 .. v6}, [Lhlg;

    move-result-object v0

    sput-object v0, Lhlg;->h:[Lhlg;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhlg;
    .registers 2

    const-class v0, Lhlg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhlg;

    return-object p0
.end method

.method public static values()[Lhlg;
    .registers 1

    sget-object v0, Lhlg;->h:[Lhlg;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhlg;

    return-object v0
.end method
