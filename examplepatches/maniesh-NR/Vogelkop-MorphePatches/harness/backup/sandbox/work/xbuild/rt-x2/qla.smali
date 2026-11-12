.class public final enum Lqla;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lqla;

.field public static final synthetic b:[Lqla;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lqla;

    const/4 v1, 0x0

    const-string v2, "Mini"

    const-string v3, "MINI"

    invoke-direct {v0, v3, v1, v2}, Lqla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lqla;

    const-string v2, "OFA"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v2}, Lqla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lqla;->a:Lqla;

    new-instance v2, Lqla;

    const/4 v3, 0x2

    const-string v4, "News"

    const-string v5, "NEWS"

    invoke-direct {v2, v5, v3, v4}, Lqla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2}, [Lqla;

    move-result-object v0

    sput-object v0, Lqla;->b:[Lqla;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lqla;
    .registers 2

    const-class v0, Lqla;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lqla;

    return-object p0
.end method

.method public static values()[Lqla;
    .registers 1

    sget-object v0, Lqla;->b:[Lqla;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lqla;

    return-object v0
.end method
