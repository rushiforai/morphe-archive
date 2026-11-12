.class public final enum Ltw1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ltw1;

.field public static final enum c:Ltw1;

.field public static final enum d:Ltw1;

.field public static final enum e:Ltw1;

.field public static final enum f:Ltw1;

.field public static final enum g:Ltw1;

.field public static final synthetic h:[Ltw1;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Ltw1;

    const/4 v1, 0x0

    const-string v2, "nd"

    const-string v3, "NO_DATA"

    invoke-direct {v0, v3, v1, v2}, Ltw1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Ltw1;->b:Ltw1;

    new-instance v1, Ltw1;

    const/4 v2, 0x1

    const-string v3, "null"

    const-string v4, "UID_NULL"

    invoke-direct {v1, v4, v2, v3}, Ltw1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Ltw1;->c:Ltw1;

    new-instance v2, Ltw1;

    const/4 v3, 0x2

    const-string v4, "empty"

    const-string v5, "UID_EMPTY"

    invoke-direct {v2, v5, v3, v4}, Ltw1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Ltw1;->d:Ltw1;

    new-instance v3, Ltw1;

    const/4 v4, 0x3

    const-string v5, "err_conv"

    const-string v6, "ERROR_CONVERSION"

    invoke-direct {v3, v6, v4, v5}, Ltw1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Ltw1;->e:Ltw1;

    new-instance v4, Ltw1;

    const/4 v5, 0x4

    const-string v6, "err_attr"

    const-string v7, "ERROR_ATTRIBUTE"

    invoke-direct {v4, v7, v5, v6}, Ltw1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Ltw1;->f:Ltw1;

    new-instance v5, Ltw1;

    const/4 v6, 0x5

    const-string v7, "err_start"

    const-string v8, "ERROR_START"

    invoke-direct {v5, v8, v6, v7}, Ltw1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Ltw1;->g:Ltw1;

    filled-new-array/range {v0 .. v5}, [Ltw1;

    move-result-object v0

    sput-object v0, Ltw1;->h:[Ltw1;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ltw1;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltw1;
    .registers 2

    const-class v0, Ltw1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltw1;

    return-object p0
.end method

.method public static values()[Ltw1;
    .registers 1

    sget-object v0, Ltw1;->h:[Ltw1;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltw1;

    return-object v0
.end method
