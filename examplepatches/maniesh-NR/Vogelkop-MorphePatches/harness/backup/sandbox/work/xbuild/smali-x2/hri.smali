.class public final enum Lhri;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lhri;

.field public static final enum b:Lhri;

.field public static final enum c:Lhri;

.field public static final synthetic d:[Lhri;

.field public static final synthetic e:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lhri;

    const-string v1, "ACTIVE_SEARCH_ENGINE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lhri;->a:Lhri;

    new-instance v1, Lhri;

    const-string v2, "ARIA_SEARCH_ENGINE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lhri;->b:Lhri;

    new-instance v2, Lhri;

    const-string v3, "DEFAULT_SEARCH_ENGINE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lhri;->c:Lhri;

    filled-new-array {v0, v1, v2}, [Lhri;

    move-result-object v0

    sput-object v0, Lhri;->d:[Lhri;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lhri;->e:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhri;
    .registers 2

    const-class v0, Lhri;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhri;

    return-object p0
.end method

.method public static values()[Lhri;
    .registers 1

    sget-object v0, Lhri;->d:[Lhri;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhri;

    return-object v0
.end method
