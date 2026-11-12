.class public final enum Ljy3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:Ly55;

.field public static final synthetic d:[Ljy3;

.field public static final synthetic e:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Ljy3;

    const-string v1, "default"

    const v2, 0x7f0a09ba

    const-string v3, "DEFAULT"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Ljy3;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v1, Ljy3;

    const-string v2, "language"

    const v3, 0x7f0a09d0

    const-string v4, "LANGUAGE"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Ljy3;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v2, Ljy3;

    const-string v3, "rewards"

    const v4, 0x7f0a09ec

    const-string v5, "REWARDS"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Ljy3;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v3, Ljy3;

    const-string v4, "startup"

    const v5, 0x7f0a09fe

    const-string v6, "STARTUP"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v4, v5}, Ljy3;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v4, Ljy3;

    const-string v5, "tabs"

    const v6, 0x7f0a09da

    const-string v7, "TABS"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v5, v6}, Ljy3;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v5, Ljy3;

    const-string v6, "islands"

    const v7, 0x7f0a0a07

    const-string v8, "ISLANDS"

    const/4 v9, 0x5

    invoke-direct {v5, v8, v9, v6, v7}, Ljy3;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    filled-new-array/range {v0 .. v5}, [Ljy3;

    move-result-object v0

    sput-object v0, Ljy3;->d:[Ljy3;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ljy3;->e:Lh58;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljy3;->c:Ly55;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ljy3;->a:Ljava/lang/String;

    iput p4, p0, Ljy3;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljy3;
    .registers 2

    const-class v0, Ljy3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljy3;

    return-object p0
.end method

.method public static values()[Ljy3;
    .registers 1

    sget-object v0, Ljy3;->d:[Ljy3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljy3;

    return-object v0
.end method
