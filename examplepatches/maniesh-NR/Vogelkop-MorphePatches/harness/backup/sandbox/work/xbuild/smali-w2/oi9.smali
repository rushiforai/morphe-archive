.class public final enum Loi9;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Li06;

.field public static final enum c:Loi9;

.field public static final enum d:Loi9;

.field public static final enum e:Loi9;

.field public static final enum f:Loi9;

.field public static final synthetic g:[Loi9;

.field public static final synthetic h:Lh58;


# instance fields
.field public final a:S


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Loi9;

    const-string v1, "POPULAR_EVENTS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Loi9;-><init>(Ljava/lang/String;II)V

    sput-object v0, Loi9;->c:Loi9;

    new-instance v1, Loi9;

    const-string v2, "TEAM_FOLLOW"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Loi9;-><init>(Ljava/lang/String;II)V

    sput-object v1, Loi9;->d:Loi9;

    new-instance v2, Loi9;

    const-string v3, "MATCH_FOLLOW"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Loi9;-><init>(Ljava/lang/String;II)V

    sput-object v2, Loi9;->e:Loi9;

    new-instance v3, Loi9;

    const/4 v4, 0x3

    const/16 v5, 0x3e7

    const-string v6, "UNKNOWN"

    invoke-direct {v3, v6, v4, v5}, Loi9;-><init>(Ljava/lang/String;II)V

    sput-object v3, Loi9;->f:Loi9;

    filled-new-array {v0, v1, v2, v3}, [Loi9;

    move-result-object v0

    sput-object v0, Loi9;->g:[Loi9;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Loi9;->h:Lh58;

    new-instance v0, Li06;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Li06;-><init>(B)V

    sput-object v0, Loi9;->b:Li06;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-short p3, p0, Loi9;->a:S

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Loi9;
    .registers 2

    const-class v0, Loi9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Loi9;

    return-object p0
.end method

.method public static values()[Loi9;
    .registers 1

    sget-object v0, Loi9;->g:[Loi9;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Loi9;

    return-object v0
.end method
