.class public final enum Lf7j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lf7j;

.field public static final enum d:Lf7j;

.field public static final enum e:Lf7j;

.field public static final synthetic f:[Lf7j;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lf7j;

    const v1, 0x7f1410c8

    const-string v2, "light"

    const-string v3, "LIGHT"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lf7j;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lf7j;->c:Lf7j;

    new-instance v1, Lf7j;

    const v2, 0x7f1410c5

    const-string v3, "dark"

    const-string v4, "DARK"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lf7j;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lf7j;->d:Lf7j;

    new-instance v2, Lf7j;

    const v3, 0x7f1410c6

    const-string v4, "follow_system"

    const-string v5, "FOLLOW_SYSTEM"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Lf7j;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v2, Lf7j;->e:Lf7j;

    filled-new-array {v0, v1, v2}, [Lf7j;

    move-result-object v0

    sput-object v0, Lf7j;->f:[Lf7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lf7j;->a:I

    iput-object p4, p0, Lf7j;->b:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf7j;
    .registers 2

    const-class v0, Lf7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf7j;

    return-object p0
.end method

.method public static values()[Lf7j;
    .registers 1

    sget-object v0, Lf7j;->f:[Lf7j;

    invoke-virtual {v0}, [Lf7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf7j;

    return-object v0
.end method
