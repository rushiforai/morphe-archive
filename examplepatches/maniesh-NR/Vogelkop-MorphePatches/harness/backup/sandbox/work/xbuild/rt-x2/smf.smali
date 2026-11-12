.class public final enum Lsmf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lsmf;

.field public static final enum b:Lsmf;

.field public static final enum c:Lsmf;

.field public static final enum d:Lsmf;

.field public static final synthetic e:[Lsmf;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lsmf;

    const-string v1, "Filled"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsmf;->a:Lsmf;

    new-instance v1, Lsmf;

    const-string v2, "FilledTonal"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lsmf;->b:Lsmf;

    new-instance v2, Lsmf;

    const-string v3, "Outlined"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lsmf;->c:Lsmf;

    new-instance v3, Lsmf;

    const-string v4, "OutlinedVariant"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v4, Lsmf;

    const-string v5, "Text"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lsmf;->d:Lsmf;

    new-instance v5, Lsmf;

    const-string v6, "Elevated"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array/range {v0 .. v5}, [Lsmf;

    move-result-object v0

    sput-object v0, Lsmf;->e:[Lsmf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsmf;
    .registers 2

    const-class v0, Lsmf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsmf;

    return-object p0
.end method

.method public static values()[Lsmf;
    .registers 1

    sget-object v0, Lsmf;->e:[Lsmf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsmf;

    return-object v0
.end method
