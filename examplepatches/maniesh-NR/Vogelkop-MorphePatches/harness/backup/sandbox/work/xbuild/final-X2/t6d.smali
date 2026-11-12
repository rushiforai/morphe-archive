.class public final enum Lt6d;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lt6d;

.field public static final enum b:Lt6d;

.field public static final enum c:Lt6d;

.field public static final enum d:Lt6d;

.field public static final synthetic e:[Lt6d;

.field public static final synthetic f:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lt6d;

    const-string v1, "VISIBLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lt6d;->a:Lt6d;

    new-instance v1, Lt6d;

    const-string v2, "OVERLAPPED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lt6d;->b:Lt6d;

    new-instance v2, Lt6d;

    const-string v3, "HIDING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lt6d;->c:Lt6d;

    new-instance v3, Lt6d;

    const-string v4, "HIDDEN"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lt6d;->d:Lt6d;

    filled-new-array {v0, v1, v2, v3}, [Lt6d;

    move-result-object v0

    sput-object v0, Lt6d;->e:[Lt6d;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lt6d;->f:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lt6d;
    .registers 2

    const-class v0, Lt6d;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lt6d;

    return-object p0
.end method

.method public static values()[Lt6d;
    .registers 1

    sget-object v0, Lt6d;->e:[Lt6d;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lt6d;

    return-object v0
.end method
