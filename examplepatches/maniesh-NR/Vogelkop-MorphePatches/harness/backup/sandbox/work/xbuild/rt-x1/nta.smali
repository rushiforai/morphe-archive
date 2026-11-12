.class public final enum Lnta;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lnta;

.field public static final enum b:Lnta;

.field public static final enum c:Lnta;

.field public static final enum d:Lnta;

.field public static final enum e:Lnta;

.field public static final enum f:Lnta;

.field public static final synthetic g:[Lnta;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lnta;

    const-string v1, "Initial"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnta;->a:Lnta;

    new-instance v1, Lnta;

    const-string v2, "Moving"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnta;->b:Lnta;

    new-instance v2, Lnta;

    const-string v3, "Spinning"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lnta;->c:Lnta;

    new-instance v3, Lnta;

    const-string v4, "Disappearing"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lnta;->d:Lnta;

    new-instance v4, Lnta;

    const-string v5, "Docking"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lnta;->e:Lnta;

    new-instance v5, Lnta;

    const-string v6, "Gone"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lnta;->f:Lnta;

    filled-new-array/range {v0 .. v5}, [Lnta;

    move-result-object v0

    sput-object v0, Lnta;->g:[Lnta;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnta;
    .registers 2

    const-class v0, Lnta;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnta;

    return-object p0
.end method

.method public static values()[Lnta;
    .registers 1

    sget-object v0, Lnta;->g:[Lnta;

    invoke-virtual {v0}, [Lnta;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnta;

    return-object v0
.end method
