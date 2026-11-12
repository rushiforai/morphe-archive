.class public final enum Lowf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lowf;

.field public static final enum d:Lowf;

.field public static final enum e:Lowf;

.field public static final enum f:Lowf;

.field public static final synthetic g:[Lowf;


# instance fields
.field public final a:B

.field public final b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lowf;

    const/4 v1, 0x0

    const/4 v2, 0x4

    const-string v3, "DEFAULT"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lowf;-><init>(IILjava/lang/String;Z)V

    sput-object v0, Lowf;->c:Lowf;

    new-instance v2, Lowf;

    const/4 v3, 0x3

    const-string v5, "HIGH_USAGE"

    invoke-direct {v2, v4, v3, v5, v1}, Lowf;-><init>(IILjava/lang/String;Z)V

    sput-object v2, Lowf;->d:Lowf;

    new-instance v5, Lowf;

    const-string v6, "HIGHEST_USAGE"

    const/4 v7, 0x2

    invoke-direct {v5, v7, v7, v6, v1}, Lowf;-><init>(IILjava/lang/String;Z)V

    sput-object v5, Lowf;->e:Lowf;

    new-instance v6, Lowf;

    const-string v7, "NAVIGATION"

    invoke-direct {v6, v3, v4, v7, v1}, Lowf;-><init>(IILjava/lang/String;Z)V

    sput-object v6, Lowf;->f:Lowf;

    filled-new-array {v0, v2, v5, v6}, [Lowf;

    move-result-object v0

    sput-object v0, Lowf;->g:[Lowf;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Z)V
    .registers 5

    invoke-direct {p0, p3, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p2, p0, Lowf;->a:B

    iput-boolean p4, p0, Lowf;->b:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lowf;
    .registers 2

    const-class v0, Lowf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lowf;

    return-object p0
.end method

.method public static values()[Lowf;
    .registers 1

    sget-object v0, Lowf;->g:[Lowf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lowf;

    return-object v0
.end method
