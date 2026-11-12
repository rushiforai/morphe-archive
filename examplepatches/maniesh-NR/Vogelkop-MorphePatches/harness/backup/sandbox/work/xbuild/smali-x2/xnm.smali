.class public final enum Lxnm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lxnm;

.field public static final synthetic d:[Lxnm;


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lxnm;

    const-wide/16 v4, 0x0

    const-string v3, ""

    const-string v1, "UNDEFINED"

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lxnm;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    sput-object v0, Lxnm;->c:Lxnm;

    new-instance v1, Lxnm;

    const-wide/16 v5, -0x7d01

    const-string v4, "Aria is not ready"

    const-string v2, "ARIANOTREADY"

    const/4 v3, 0x1

    invoke-direct/range {v1 .. v6}, Lxnm;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    new-instance v2, Lxnm;

    const-wide/16 v6, -0x7d03

    const-string v5, "Chat does not exist"

    const-string v3, "CHATNOTFOUND"

    const/4 v4, 0x2

    invoke-direct/range {v2 .. v7}, Lxnm;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    filled-new-array {v0, v1, v2}, [Lxnm;

    move-result-object v0

    sput-object v0, Lxnm;->d:[Lxnm;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;J)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-wide p4, p0, Lxnm;->a:J

    iput-object p3, p0, Lxnm;->b:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxnm;
    .registers 2

    const-class v0, Lxnm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxnm;

    return-object p0
.end method

.method public static values()[Lxnm;
    .registers 1

    sget-object v0, Lxnm;->d:[Lxnm;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxnm;

    return-object v0
.end method
