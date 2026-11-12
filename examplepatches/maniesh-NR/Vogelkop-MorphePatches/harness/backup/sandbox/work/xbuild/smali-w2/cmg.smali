.class public final enum Lcmg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lcmg;

.field public static final enum c:Lcmg;

.field public static final enum d:Lcmg;

.field public static final enum e:Lcmg;

.field public static final synthetic f:[Lcmg;


# instance fields
.field public final a:Lf90;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lcmg;

    const/4 v1, 0x0

    sget-object v2, Lf90;->b:Lf90;

    const-string v3, "ROUNDUP_BANNER"

    invoke-direct {v0, v3, v1, v2}, Lcmg;-><init>(Ljava/lang/String;ILf90;)V

    sput-object v0, Lcmg;->b:Lcmg;

    new-instance v1, Lcmg;

    const/4 v2, 0x1

    sget-object v3, Lf90;->c:Lf90;

    const-string v4, "ROUNDUP_CAROUSEL_ITEM"

    invoke-direct {v1, v4, v2, v3}, Lcmg;-><init>(Ljava/lang/String;ILf90;)V

    sput-object v1, Lcmg;->c:Lcmg;

    new-instance v2, Lcmg;

    const/4 v3, 0x2

    sget-object v4, Lf90;->d:Lf90;

    const-string v5, "HIGHLIGHTS_CAROUSEL_ITEM"

    invoke-direct {v2, v5, v3, v4}, Lcmg;-><init>(Ljava/lang/String;ILf90;)V

    sput-object v2, Lcmg;->d:Lcmg;

    new-instance v3, Lcmg;

    const/4 v4, 0x3

    sget-object v5, Lf90;->e:Lf90;

    const-string v6, "ARTICLE"

    invoke-direct {v3, v6, v4, v5}, Lcmg;-><init>(Ljava/lang/String;ILf90;)V

    sput-object v3, Lcmg;->e:Lcmg;

    filled-new-array {v0, v1, v2, v3}, [Lcmg;

    move-result-object v0

    sput-object v0, Lcmg;->f:[Lcmg;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILf90;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcmg;->a:Lf90;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcmg;
    .registers 2

    const-class v0, Lcmg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcmg;

    return-object p0
.end method

.method public static values()[Lcmg;
    .registers 1

    sget-object v0, Lcmg;->f:[Lcmg;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcmg;

    return-object v0
.end method
