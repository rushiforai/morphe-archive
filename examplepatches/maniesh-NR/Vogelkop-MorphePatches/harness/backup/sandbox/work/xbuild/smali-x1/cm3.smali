.class public final enum Lcm3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum d:Lcm3;

.field public static final enum e:Lcm3;

.field public static final enum f:Lcm3;

.field public static final synthetic g:[Lcm3;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lcm3;

    const v3, 0x7f140385

    const/4 v4, 0x0

    const/4 v1, 0x0

    const v2, 0x7f130010

    const-string v5, "DEFAULT"

    invoke-direct/range {v0 .. v5}, Lcm3;-><init>(IIIILjava/lang/String;)V

    sput-object v0, Lcm3;->d:Lcm3;

    new-instance v1, Lcm3;

    const v4, 0x7f14103c

    const/4 v5, 0x0

    const/4 v2, 0x1

    const v3, 0x7f130035

    const-string v6, "SEARCH"

    invoke-direct/range {v1 .. v6}, Lcm3;-><init>(IIIILjava/lang/String;)V

    sput-object v1, Lcm3;->e:Lcm3;

    new-instance v2, Lcm3;

    const v5, 0x7f141226

    const/4 v6, -0x1

    const/4 v3, 0x2

    const v4, 0x7f130040

    const-string v7, "SYNCING"

    invoke-direct/range {v2 .. v7}, Lcm3;-><init>(IIIILjava/lang/String;)V

    sput-object v2, Lcm3;->f:Lcm3;

    filled-new-array {v0, v1, v2}, [Lcm3;

    move-result-object v0

    sput-object v0, Lcm3;->g:[Lcm3;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(IIIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0, p5, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Lcm3;->a:I

    iput p3, p0, Lcm3;->b:I

    iput p4, p0, Lcm3;->c:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcm3;
    .registers 2

    const-class v0, Lcm3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcm3;

    return-object p0
.end method

.method public static values()[Lcm3;
    .registers 1

    sget-object v0, Lcm3;->g:[Lcm3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcm3;

    return-object v0
.end method
