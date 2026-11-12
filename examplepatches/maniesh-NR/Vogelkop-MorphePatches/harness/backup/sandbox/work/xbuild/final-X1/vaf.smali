.class public final enum Lvaf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lvaf;

.field public static final enum c:Lvaf;

.field public static final enum d:Lvaf;

.field public static final enum e:Lvaf;

.field public static final enum f:Lvaf;

.field public static final enum g:Lvaf;

.field public static final enum h:Lvaf;

.field public static final synthetic i:[Lvaf;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lvaf;

    const/4 v1, 0x0

    const v2, 0x7f0a0a89

    const-string v3, "SLIM_START"

    invoke-direct {v0, v3, v1, v2}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lvaf;->b:Lvaf;

    new-instance v1, Lvaf;

    const/4 v2, 0x1

    const v3, 0x7f0a05f8

    const-string v4, "OUTER_START"

    invoke-direct {v1, v4, v2, v3}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lvaf;->c:Lvaf;

    new-instance v2, Lvaf;

    const/4 v3, 0x2

    const v4, 0x7f0a05f6

    const-string v5, "INNER_START"

    invoke-direct {v2, v5, v3, v4}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lvaf;->d:Lvaf;

    new-instance v3, Lvaf;

    const/4 v4, 0x3

    const v5, 0x7f0a05f7

    const-string v6, "INNER_START_2"

    invoke-direct {v3, v6, v4, v5}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lvaf;->e:Lvaf;

    new-instance v4, Lvaf;

    const/4 v5, 0x4

    const v6, 0x7f0a0906

    const-string v7, "SINGLE_END"

    invoke-direct {v4, v7, v5, v6}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lvaf;->f:Lvaf;

    new-instance v5, Lvaf;

    const/4 v6, 0x5

    const v7, 0x7f0a0355

    const-string v8, "DUAL_END_INNER"

    invoke-direct {v5, v8, v6, v7}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lvaf;->g:Lvaf;

    new-instance v6, Lvaf;

    const/4 v7, 0x6

    const v8, 0x7f0a0356

    const-string v9, "DUAL_END_OUTER"

    invoke-direct {v6, v9, v7, v8}, Lvaf;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lvaf;->h:Lvaf;

    filled-new-array/range {v0 .. v6}, [Lvaf;

    move-result-object v0

    sput-object v0, Lvaf;->i:[Lvaf;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lvaf;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvaf;
    .registers 2

    const-class v0, Lvaf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvaf;

    return-object p0
.end method

.method public static values()[Lvaf;
    .registers 1

    sget-object v0, Lvaf;->i:[Lvaf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvaf;

    return-object v0
.end method
