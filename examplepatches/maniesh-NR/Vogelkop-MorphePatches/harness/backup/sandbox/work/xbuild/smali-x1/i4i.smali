.class public final enum Li4i;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Li4i;

.field public static final enum d:Li4i;

.field public static final enum e:Li4i;

.field public static final enum f:Li4i;

.field public static final synthetic g:[Li4i;


# instance fields
.field public final a:Z

.field public final b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Li4i;

    const-string v1, "PHONE_PORTRAIT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Li4i;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Li4i;->c:Li4i;

    new-instance v1, Li4i;

    const-string v3, "PHONE_LANDSCAPE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v2, v4}, Li4i;-><init>(Ljava/lang/String;IZZ)V

    sput-object v1, Li4i;->d:Li4i;

    new-instance v3, Li4i;

    const-string v5, "TABLET_PORTRAIT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v4, v2}, Li4i;-><init>(Ljava/lang/String;IZZ)V

    sput-object v3, Li4i;->e:Li4i;

    new-instance v2, Li4i;

    const-string v5, "TABLET_LANDSCAPE"

    const/4 v6, 0x3

    invoke-direct {v2, v5, v6, v4, v4}, Li4i;-><init>(Ljava/lang/String;IZZ)V

    sput-object v2, Li4i;->f:Li4i;

    filled-new-array {v0, v1, v3, v2}, [Li4i;

    move-result-object v0

    sput-object v0, Li4i;->g:[Li4i;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZZ)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Li4i;->a:Z

    iput-boolean p4, p0, Li4i;->b:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Li4i;
    .registers 2

    const-class v0, Li4i;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Li4i;

    return-object p0
.end method

.method public static values()[Li4i;
    .registers 1

    sget-object v0, Li4i;->g:[Li4i;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Li4i;

    return-object v0
.end method
