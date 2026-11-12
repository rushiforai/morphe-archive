.class public final enum Lub6;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lub6;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lub6;

    const-string v1, "USAGE_STATISTICS"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lub6;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lub6;

    const-string v2, "GENERAL_INTERESTS"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lub6;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lub6;

    const-string v3, "NEWS_TOPICS"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Lub6;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lub6;

    const-string v4, "LOCATION"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lub6;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lub6;

    const-string v5, "PERSONALIZED_NEWS"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lub6;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lub6;

    const-string v6, "PERSONALIZED_ADS"

    const/4 v8, 0x6

    invoke-direct {v5, v6, v7, v8}, Lub6;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lub6;

    const-string v7, "CMP_CONSENT"

    const/4 v9, 0x7

    invoke-direct {v6, v7, v8, v9}, Lub6;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v6}, [Lub6;

    move-result-object v0

    sput-object v0, Lub6;->a:[Lub6;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lub6;
    .registers 2

    const-class v0, Lub6;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lub6;

    return-object p0
.end method

.method public static values()[Lub6;
    .registers 1

    sget-object v0, Lub6;->a:[Lub6;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lub6;

    return-object v0
.end method
