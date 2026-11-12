.class public final enum Lvmn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lvmn;

.field public static final enum c:Lvmn;

.field public static final enum d:Lvmn;

.field public static final synthetic e:[Lvmn;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lvmn;

    const/4 v1, 0x0

    const-string v2, "Failed to fetch wallpapers: %s"

    const-string v3, "NETWORK_ERROR"

    invoke-direct {v0, v3, v1, v2}, Lvmn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lvmn;->b:Lvmn;

    new-instance v1, Lvmn;

    const/4 v2, 0x1

    const-string v3, "Invalid themes: %s"

    const-string v4, "INVALID_THEMES"

    invoke-direct {v1, v4, v2, v3}, Lvmn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lvmn;->c:Lvmn;

    new-instance v2, Lvmn;

    const/4 v3, 0x2

    const-string v4, "No valid wallpapers from list: %s"

    const-string v5, "INVALID_WALLPAPERS"

    invoke-direct {v2, v5, v3, v4}, Lvmn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lvmn;->d:Lvmn;

    filled-new-array {v0, v1, v2}, [Lvmn;

    move-result-object v0

    sput-object v0, Lvmn;->e:[Lvmn;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lvmn;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvmn;
    .registers 2

    const-class v0, Lvmn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvmn;

    return-object p0
.end method

.method public static values()[Lvmn;
    .registers 1

    sget-object v0, Lvmn;->e:[Lvmn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvmn;

    return-object v0
.end method


# virtual methods
.method public final d(Ljava/io/Serializable;)Ljava/lang/String;
    .registers 4

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lvmn;->a:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
