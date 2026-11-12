.class public final enum Lz32;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lz32;

.field public static final enum c:Lz32;

.field public static final enum d:Lz32;

.field public static final synthetic e:[Lz32;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lz32;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lz32;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lz32;->b:Lz32;

    new-instance v1, Lz32;

    const/4 v2, 0x1

    const-string v3, "summary"

    const-string v4, "SUMMARY"

    invoke-direct {v1, v4, v2, v3}, Lz32;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lz32;->c:Lz32;

    new-instance v2, Lz32;

    const/4 v3, 0x2

    const-string v4, "ask-aria"

    const-string v5, "ASKARIA"

    invoke-direct {v2, v5, v3, v4}, Lz32;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lz32;->d:Lz32;

    filled-new-array {v0, v1, v2}, [Lz32;

    move-result-object v0

    sput-object v0, Lz32;->e:[Lz32;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lz32;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lz32;
    .registers 2

    const-class v0, Lz32;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lz32;

    return-object p0
.end method

.method public static values()[Lz32;
    .registers 1

    sget-object v0, Lz32;->e:[Lz32;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lz32;

    return-object v0
.end method
