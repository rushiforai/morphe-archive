.class public final enum Lz17;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lz17;

.field public static final synthetic d:[Lz17;


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lz17;

    const-wide/16 v4, 0x0

    const-string v3, ""

    const-string v1, "UNDEFINED"

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lz17;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    sput-object v0, Lz17;->c:Lz17;

    new-instance v1, Lz17;

    const-wide/16 v5, -0x7d02

    const-string v4, "User is not logged in"

    const-string v2, "USERNOTLOGGEDIN"

    const/4 v3, 0x1

    invoke-direct/range {v1 .. v6}, Lz17;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    new-instance v2, Lz17;

    const-wide/16 v6, -0x7d03

    const-string v5, "Chat does not exist"

    const-string v3, "CHATNOTFOUND"

    const/4 v4, 0x2

    invoke-direct/range {v2 .. v7}, Lz17;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    new-instance v3, Lz17;

    const-wide/16 v7, -0x7d04

    const-string v6, "Chat in use"

    const-string v4, "CHATINUSE"

    const/4 v5, 0x3

    invoke-direct/range {v3 .. v8}, Lz17;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    filled-new-array {v0, v1, v2, v3}, [Lz17;

    move-result-object v0

    sput-object v0, Lz17;->d:[Lz17;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;J)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-wide p4, p0, Lz17;->a:J

    iput-object p3, p0, Lz17;->b:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lz17;
    .registers 2

    const-class v0, Lz17;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lz17;

    return-object p0
.end method

.method public static values()[Lz17;
    .registers 1

    sget-object v0, Lz17;->d:[Lz17;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lz17;

    return-object v0
.end method
