.class public final enum Luzc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic b:[Luzc;

.field public static final synthetic c:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Luzc;

    const/4 v1, 0x0

    const-string v2, "id"

    const-string v3, "ID"

    invoke-direct {v0, v3, v1, v2}, Luzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Luzc;

    const/4 v2, 0x1

    const-string v3, "parent_id"

    const-string v4, "PARENT_ID"

    invoke-direct {v1, v4, v2, v3}, Luzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Luzc;

    const/4 v3, 0x2

    const-string v4, "key"

    const-string v5, "KEY"

    invoke-direct {v2, v5, v3, v4}, Luzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Luzc;

    const/4 v4, 0x3

    const-string v5, "value"

    const-string v6, "VALUE"

    invoke-direct {v3, v6, v4, v5}, Luzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Luzc;

    const/4 v5, 0x4

    const-string v6, "date_created"

    const-string v7, "DATE_CREATED"

    invoke-direct {v4, v7, v5, v6}, Luzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Luzc;

    const/4 v6, 0x5

    const-string v7, "confidential"

    const-string v8, "CONFIDENTIAL"

    invoke-direct {v5, v8, v6, v7}, Luzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v5}, [Luzc;

    move-result-object v0

    sput-object v0, Luzc;->b:[Luzc;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Luzc;->c:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Luzc;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Luzc;
    .registers 2

    const-class v0, Luzc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Luzc;

    return-object p0
.end method

.method public static values()[Luzc;
    .registers 1

    sget-object v0, Luzc;->b:[Luzc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Luzc;

    return-object v0
.end method
