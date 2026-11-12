.class public final enum Lew;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lew;

.field public static final enum c:Lew;

.field public static final enum d:Lew;

.field public static final enum e:Lew;

.field public static final enum f:Lew;

.field public static final enum g:Lew;

.field public static final enum h:Lew;

.field public static final enum i:Lew;

.field public static final enum j:Lew;

.field public static final synthetic k:[Lew;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Lew;

    const-string v1, "COUNTRY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lew;->b:Lew;

    new-instance v1, Lew;

    const-string v2, "ADMIN_AREA"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lew;->c:Lew;

    new-instance v2, Lew;

    const-string v3, "LOCALITY"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lew;->d:Lew;

    new-instance v3, Lew;

    const-string v4, "DEPENDENT_LOCALITY"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lew;->e:Lew;

    new-instance v4, Lew;

    const-string v5, "SORTING_CODE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lew;->f:Lew;

    new-instance v5, Lew;

    const-string v6, "POSTAL_CODE"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lew;->g:Lew;

    new-instance v6, Lew;

    const-string v7, "STREET_ADDRESS"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8, v8}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lew;->h:Lew;

    new-instance v7, Lew;

    const-string v8, "ORGANIZATION"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9, v9}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lew;->i:Lew;

    new-instance v8, Lew;

    const-string v9, "RECIPIENT"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10, v10}, Lew;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lew;->j:Lew;

    filled-new-array/range {v0 .. v8}, [Lew;

    move-result-object v0

    sput-object v0, Lew;->k:[Lew;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lew;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lew;
    .registers 2

    const-class v0, Lew;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lew;

    return-object p0
.end method

.method public static values()[Lew;
    .registers 1

    sget-object v0, Lew;->k:[Lew;

    invoke-virtual {v0}, [Lew;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lew;

    return-object v0
.end method
