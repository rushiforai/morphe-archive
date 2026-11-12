.class public final enum Lads_mobile_sdk/ak2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Ltmj;

.field public static final enum b:Lads_mobile_sdk/ak2;

.field public static final enum c:Lads_mobile_sdk/ak2;

.field public static final enum d:Lads_mobile_sdk/ak2;

.field public static final synthetic e:[Lads_mobile_sdk/ak2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lads_mobile_sdk/ak2;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lads_mobile_sdk/ak2;->b:Lads_mobile_sdk/ak2;

    new-instance v1, Lads_mobile_sdk/ak2;

    const-string v2, "FIFO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lads_mobile_sdk/ak2;->c:Lads_mobile_sdk/ak2;

    new-instance v2, Lads_mobile_sdk/ak2;

    const-string v3, "ECPM"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lads_mobile_sdk/ak2;->d:Lads_mobile_sdk/ak2;

    filled-new-array {v0, v1, v2}, [Lads_mobile_sdk/ak2;

    move-result-object v0

    sput-object v0, Lads_mobile_sdk/ak2;->e:[Lads_mobile_sdk/ak2;

    new-instance v0, Lh58;

    new-instance v0, Ltmj;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Ltmj;-><init>(B)V

    sput-object v0, Lads_mobile_sdk/ak2;->a:Ltmj;

    return-void
.end method

.method public static values()[Lads_mobile_sdk/ak2;
    .registers 1

    sget-object v0, Lads_mobile_sdk/ak2;->e:[Lads_mobile_sdk/ak2;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lads_mobile_sdk/ak2;

    return-object v0
.end method
