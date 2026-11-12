.class public final enum Lfpj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Ldpj;

.field public static final enum b:Lfpj;

.field public static final enum c:Lfpj;

.field public static final enum d:Lfpj;

.field public static final enum e:Lfpj;

.field public static final enum f:Lfpj;

.field public static final synthetic g:[Lfpj;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lfpj;

    const-string v1, "HEIGHT_COMPACT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lfpj;->b:Lfpj;

    new-instance v1, Lfpj;

    const-string v2, "COMPACT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lfpj;->c:Lfpj;

    new-instance v2, Lfpj;

    const-string v3, "MEDIUM"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lfpj;->d:Lfpj;

    new-instance v3, Lfpj;

    const-string v4, "EXPANDED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lfpj;->e:Lfpj;

    new-instance v4, Lfpj;

    const-string v5, "LARGE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lfpj;->f:Lfpj;

    filled-new-array {v0, v1, v2, v3, v4}, [Lfpj;

    move-result-object v0

    sput-object v0, Lfpj;->g:[Lfpj;

    new-instance v0, Lh58;

    new-instance v0, Ldpj;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldpj;-><init>(B)V

    sput-object v0, Lfpj;->a:Ldpj;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfpj;
    .registers 2

    const-class v0, Lfpj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfpj;

    return-object p0
.end method

.method public static values()[Lfpj;
    .registers 1

    sget-object v0, Lfpj;->g:[Lfpj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfpj;

    return-object v0
.end method
