.class public final enum Lvvj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lvvj;

.field public static final enum d:Lvvj;

.field public static final enum e:Lvvj;

.field public static final enum f:Lvvj;

.field public static final synthetic g:[Lvvj;


# instance fields
.field public final a:B

.field public final b:Lqw4;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lvvj;

    new-instance v1, Luvj;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Luvj;-><init>(B)V

    const-string v2, "NAME"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v3, v1}, Lvvj;-><init>(Ljava/lang/String;IILqw4;)V

    sput-object v0, Lvvj;->c:Lvvj;

    new-instance v1, Lvvj;

    new-instance v2, Luvj;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Luvj;-><init>(B)V

    const-string v3, "SIZE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4, v2}, Lvvj;-><init>(Ljava/lang/String;IILqw4;)V

    sput-object v1, Lvvj;->d:Lvvj;

    new-instance v2, Lvvj;

    new-instance v3, Luvj;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Luvj;-><init>(B)V

    const-string v4, "MOST_RECENT"

    const/4 v5, 0x2

    invoke-direct {v2, v4, v5, v5, v3}, Lvvj;-><init>(Ljava/lang/String;IILqw4;)V

    sput-object v2, Lvvj;->e:Lvvj;

    new-instance v3, Lvvj;

    new-instance v4, Luvj;

    const/4 v5, 0x3

    invoke-direct {v4, v5}, Luvj;-><init>(B)V

    const-string v5, "TYPE"

    const/4 v6, 0x3

    invoke-direct {v3, v5, v6, v6, v4}, Lvvj;-><init>(Ljava/lang/String;IILqw4;)V

    sput-object v3, Lvvj;->f:Lvvj;

    filled-new-array {v0, v1, v2, v3}, [Lvvj;

    move-result-object v0

    sput-object v0, Lvvj;->g:[Lvvj;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILqw4;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lvvj;->a:B

    iput-object p4, p0, Lvvj;->b:Lqw4;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvvj;
    .registers 2

    const-class v0, Lvvj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvvj;

    return-object p0
.end method

.method public static values()[Lvvj;
    .registers 1

    sget-object v0, Lvvj;->g:[Lvvj;

    invoke-virtual {v0}, [Lvvj;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvvj;

    return-object v0
.end method
