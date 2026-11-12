.class public final enum Llbf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Llbf;

.field public static final enum b:Llbf;

.field public static final enum c:Llbf;

.field public static final enum d:Llbf;

.field public static final synthetic e:[Llbf;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Llbf;

    const-string v1, "Empty"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Llbf;->a:Llbf;

    new-instance v1, Llbf;

    const-string v2, "Url"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Llbf;->b:Llbf;

    new-instance v2, Llbf;

    const-string v3, "Search"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Llbf;->c:Llbf;

    new-instance v3, Llbf;

    const-string v4, "Yat"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Llbf;->d:Llbf;

    filled-new-array {v0, v1, v2, v3}, [Llbf;

    move-result-object v0

    sput-object v0, Llbf;->e:[Llbf;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llbf;
    .registers 2

    const-class v0, Llbf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llbf;

    return-object p0
.end method

.method public static values()[Llbf;
    .registers 1

    sget-object v0, Llbf;->e:[Llbf;

    invoke-virtual {v0}, [Llbf;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llbf;

    return-object v0
.end method
