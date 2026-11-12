.class public final enum Lmd8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lmd8;

.field public static final enum c:Lmd8;

.field public static final synthetic d:[Lmd8;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lmd8;

    const-string v1, "CLICK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1}, Lmd8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lmd8;->b:Lmd8;

    new-instance v1, Lmd8;

    const-string v2, "IMPRESSION"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v2}, Lmd8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lmd8;->c:Lmd8;

    filled-new-array {v0, v1}, [Lmd8;

    move-result-object v0

    sput-object v0, Lmd8;->d:[Lmd8;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lmd8;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmd8;
    .registers 2

    const-class v0, Lmd8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmd8;

    return-object p0
.end method

.method public static values()[Lmd8;
    .registers 1

    sget-object v0, Lmd8;->d:[Lmd8;

    invoke-virtual {v0}, [Lmd8;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmd8;

    return-object v0
.end method
