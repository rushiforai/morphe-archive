.class public final enum Lqoc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lqoc;

.field public static final enum c:Lqoc;

.field public static final enum d:Lqoc;

.field public static final enum e:Lqoc;

.field public static final synthetic f:[Lqoc;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:J


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lqoc;

    sget-object v1, Lpn7;->b:Lon7;

    const/16 v1, 0x3c

    sget-object v2, Lun7;->e:Lun7;

    invoke-static {v1, v2}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    const-string v3, "REAL_TIME"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lqoc;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lqoc;->b:Lqoc;

    new-instance v1, Lqoc;

    const/16 v2, 0x1e

    sget-object v3, Lun7;->f:Lun7;

    invoke-static {v2, v3}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    const-string v4, "HALF_HOURLY"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lqoc;-><init>(Ljava/lang/String;IJ)V

    sput-object v1, Lqoc;->c:Lqoc;

    new-instance v2, Lqoc;

    sget-object v3, Lun7;->g:Lun7;

    invoke-static {v5, v3}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    const-string v6, "HOURLY"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v3, v4}, Lqoc;-><init>(Ljava/lang/String;IJ)V

    sput-object v2, Lqoc;->d:Lqoc;

    new-instance v3, Lqoc;

    sget-object v4, Lun7;->h:Lun7;

    invoke-static {v5, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v4

    const-string v6, "DAILY"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v4, v5}, Lqoc;-><init>(Ljava/lang/String;IJ)V

    sput-object v3, Lqoc;->e:Lqoc;

    filled-new-array {v0, v1, v2, v3}, [Lqoc;

    move-result-object v0

    sput-object v0, Lqoc;->f:[Lqoc;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lqoc;->g:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IJ)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-wide p3, p0, Lqoc;->a:J

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lqoc;
    .registers 2

    const-class v0, Lqoc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lqoc;

    return-object p0
.end method

.method public static values()[Lqoc;
    .registers 1

    sget-object v0, Lqoc;->f:[Lqoc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lqoc;

    return-object v0
.end method
