.class public abstract enum Lh5j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Li5j;


# static fields
.field public static final enum a:Lf5j;

.field public static final enum b:Lg5j;

.field public static final synthetic c:[Lh5j;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Le5j;

    invoke-direct {v0}, Le5j;-><init>()V

    new-instance v1, Lf5j;

    invoke-direct {v1}, Lf5j;-><init>()V

    sput-object v1, Lh5j;->a:Lf5j;

    new-instance v2, Lg5j;

    invoke-direct {v2}, Lg5j;-><init>()V

    sput-object v2, Lh5j;->b:Lg5j;

    const/4 v3, 0x3

    new-array v3, v3, [Lh5j;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    sput-object v3, Lh5j;->c:[Lh5j;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lh5j;
    .registers 2

    const-class v0, Lh5j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lh5j;

    return-object p0
.end method

.method public static values()[Lh5j;
    .registers 1

    sget-object v0, Lh5j;->c:[Lh5j;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lh5j;

    return-object v0
.end method
