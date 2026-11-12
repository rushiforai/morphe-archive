.class public final enum Leya;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Leya;

.field public static final enum c:Leya;

.field public static final enum d:Leya;

.field public static final enum e:Leya;

.field public static final enum f:Leya;

.field public static final synthetic g:[Leya;

.field public static final synthetic h:Lh58;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Leya;

    const-string v1, "BLUR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Leya;-><init>(Ljava/lang/String;II)V

    sput-object v0, Leya;->b:Leya;

    new-instance v1, Leya;

    const-string v2, "PATH"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Leya;-><init>(Ljava/lang/String;II)V

    sput-object v1, Leya;->c:Leya;

    new-instance v2, Leya;

    const-string v3, "TEXT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Leya;-><init>(Ljava/lang/String;II)V

    sput-object v2, Leya;->d:Leya;

    new-instance v3, Leya;

    const-string v5, "EMOJI"

    const/4 v6, 0x3

    invoke-direct {v3, v5, v6, v4}, Leya;-><init>(Ljava/lang/String;II)V

    sput-object v3, Leya;->e:Leya;

    new-instance v4, Leya;

    const/4 v5, 0x4

    const v6, 0x7fffffff

    const-string v7, "CUTOUT"

    invoke-direct {v4, v7, v5, v6}, Leya;-><init>(Ljava/lang/String;II)V

    sput-object v4, Leya;->f:Leya;

    filled-new-array {v0, v1, v2, v3, v4}, [Leya;

    move-result-object v0

    sput-object v0, Leya;->g:[Leya;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Leya;->h:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Leya;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Leya;
    .registers 2

    const-class v0, Leya;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Leya;

    return-object p0
.end method

.method public static values()[Leya;
    .registers 1

    sget-object v0, Leya;->g:[Leya;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Leya;

    return-object v0
.end method
