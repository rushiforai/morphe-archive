.class public final enum Lxen;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum d:Lxen;

.field public static final enum e:Lxen;

.field public static final enum f:Lxen;

.field public static final synthetic g:[Lxen;


# instance fields
.field public final a:B

.field public final b:I

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lxen;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v5, "UNAVAILABLE"

    invoke-direct/range {v0 .. v5}, Lxen;-><init>(IIIILjava/lang/String;)V

    sput-object v0, Lxen;->d:Lxen;

    new-instance v1, Lxen;

    const v4, 0x7f1412eb

    const v5, 0x7f0804c3

    const/4 v2, 0x1

    const/4 v3, 0x2

    const-string v6, "ACTIVE"

    invoke-direct/range {v1 .. v6}, Lxen;-><init>(IIIILjava/lang/String;)V

    sput-object v1, Lxen;->e:Lxen;

    new-instance v2, Lxen;

    const v5, 0x7f1412ea

    const v6, 0x7f0804c3

    const/4 v4, 0x1

    const-string v7, "INACTIVE"

    invoke-direct/range {v2 .. v7}, Lxen;-><init>(IIIILjava/lang/String;)V

    sput-object v2, Lxen;->f:Lxen;

    filled-new-array {v0, v1, v2}, [Lxen;

    move-result-object v0

    sput-object v0, Lxen;->g:[Lxen;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(IIIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0, p5, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p2, p0, Lxen;->a:B

    iput p3, p0, Lxen;->b:I

    iput p4, p0, Lxen;->c:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxen;
    .registers 2

    const-class v0, Lxen;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxen;

    return-object p0
.end method

.method public static values()[Lxen;
    .registers 1

    sget-object v0, Lxen;->g:[Lxen;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxen;

    return-object v0
.end method
