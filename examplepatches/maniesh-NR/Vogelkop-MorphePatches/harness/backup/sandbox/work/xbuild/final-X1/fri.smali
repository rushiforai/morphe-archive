.class public final enum Lfri;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lfri;

.field public static final enum b:Lfri;

.field public static final enum c:Lfri;

.field public static final enum d:Lfri;

.field public static final synthetic e:[Lfri;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lfri;

    const-string v1, "PLAIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lfri;->a:Lfri;

    new-instance v1, Lfri;

    const-string v2, "FOREGROUND_TINT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lfri;->b:Lfri;

    new-instance v2, Lfri;

    const-string v3, "CIRCLE_BACKGROUND"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lfri;->c:Lfri;

    new-instance v3, Lfri;

    const-string v4, "CIRCLE_BACKGROUND_WITH_TINTED_ICON"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lfri;->d:Lfri;

    filled-new-array {v0, v1, v2, v3}, [Lfri;

    move-result-object v0

    sput-object v0, Lfri;->e:[Lfri;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfri;
    .registers 2

    const-class v0, Lfri;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfri;

    return-object p0
.end method

.method public static values()[Lfri;
    .registers 1

    sget-object v0, Lfri;->e:[Lfri;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfri;

    return-object v0
.end method
