.class public final enum Lyp2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lyp2;

.field public static final enum b:Lyp2;

.field public static final enum c:Lyp2;

.field public static final enum d:Lyp2;

.field public static final synthetic e:[Lyp2;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lyp2;

    const-string v1, "ADDRESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lyp2;->a:Lyp2;

    new-instance v1, Lyp2;

    const-string v2, "EMAIL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lyp2;->b:Lyp2;

    new-instance v2, Lyp2;

    const-string v3, "NAME"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lyp2;->c:Lyp2;

    new-instance v3, Lyp2;

    const-string v4, "PHONE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lyp2;->d:Lyp2;

    filled-new-array {v0, v1, v2, v3}, [Lyp2;

    move-result-object v0

    sput-object v0, Lyp2;->e:[Lyp2;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lyp2;
    .registers 2

    const-class v0, Lyp2;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lyp2;

    return-object p0
.end method

.method public static values()[Lyp2;
    .registers 1

    sget-object v0, Lyp2;->e:[Lyp2;

    invoke-virtual {v0}, [Lyp2;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lyp2;

    return-object v0
.end method
