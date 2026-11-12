.class public final enum Lokk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lokk;

.field public static final synthetic d:[Lokk;


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lokk;

    const-wide/16 v4, 0x0

    const-string v3, ""

    const-string v1, "UNDEFINED"

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lokk;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    sput-object v0, Lokk;->c:Lokk;

    new-instance v1, Lokk;

    const-wide/16 v5, -0x7d01

    const-string v4, "Aria is not ready"

    const-string v2, "ARIANOTREADY"

    const/4 v3, 0x1

    invoke-direct/range {v1 .. v6}, Lokk;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    new-instance v2, Lokk;

    const-wide/16 v6, -0x7d02

    const-string v5, "User is not logged in"

    const-string v3, "USERNOTLOGGEDIN"

    const/4 v4, 0x2

    invoke-direct/range {v2 .. v7}, Lokk;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    new-instance v3, Lokk;

    const-wide/16 v7, -0x7d03

    const-string v6, "Chat does not exist"

    const-string v4, "CHATNOTFOUND"

    const/4 v5, 0x3

    invoke-direct/range {v3 .. v8}, Lokk;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    new-instance v4, Lokk;

    const-wide/16 v8, -0x7d05

    const-string v7, "File not found"

    const-string v5, "FILENOTFOUND"

    const/4 v6, 0x4

    invoke-direct/range {v4 .. v9}, Lokk;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    filled-new-array {v0, v1, v2, v3, v4}, [Lokk;

    move-result-object v0

    sput-object v0, Lokk;->d:[Lokk;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;J)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-wide p4, p0, Lokk;->a:J

    iput-object p3, p0, Lokk;->b:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lokk;
    .registers 2

    const-class v0, Lokk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lokk;

    return-object p0
.end method

.method public static values()[Lokk;
    .registers 1

    sget-object v0, Lokk;->d:[Lokk;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lokk;

    return-object v0
.end method
