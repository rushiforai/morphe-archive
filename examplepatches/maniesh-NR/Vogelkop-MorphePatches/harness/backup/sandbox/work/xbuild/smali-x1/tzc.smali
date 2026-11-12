.class public final enum Ltzc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic b:[Ltzc;

.field public static final synthetic c:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ltzc;

    const/4 v1, 0x0

    const-string v2, "parent_id"

    const-string v3, "PARENT_ID"

    invoke-direct {v0, v3, v1, v2}, Ltzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Ltzc;

    const/4 v2, 0x1

    const-string v3, "insecurity_type"

    const-string v4, "INSECURITY_TYPE"

    invoke-direct {v1, v4, v2, v3}, Ltzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Ltzc;

    const/4 v3, 0x2

    const-string v4, "create_time"

    const-string v5, "CREATE_TIME"

    invoke-direct {v2, v5, v3, v4}, Ltzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Ltzc;

    const/4 v4, 0x3

    const-string v5, "is_muted"

    const-string v6, "IS_MUTED"

    invoke-direct {v3, v6, v4, v5}, Ltzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Ltzc;

    const/4 v5, 0x4

    const-string v6, "trigger_notification_from_backend"

    const-string v7, "TRIGGER_NOTIFICATION_FROM_BACKEND"

    invoke-direct {v4, v7, v5, v6}, Ltzc;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3, v4}, [Ltzc;

    move-result-object v0

    sput-object v0, Ltzc;->b:[Ltzc;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ltzc;->c:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ltzc;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltzc;
    .registers 2

    const-class v0, Ltzc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltzc;

    return-object p0
.end method

.method public static values()[Ltzc;
    .registers 1

    sget-object v0, Ltzc;->b:[Ltzc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltzc;

    return-object v0
.end method
