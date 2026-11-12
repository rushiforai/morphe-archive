.class public final enum Lu3g;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum d:Lu3g;

.field public static final enum e:Lu3g;

.field public static final enum f:Lu3g;

.field public static final synthetic g:[Lu3g;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lu3g;

    const v3, 0x7f140c69

    const/4 v4, 0x0

    const/4 v1, 0x0

    const v2, 0x7f130032

    const-string v5, "DEFAULT"

    invoke-direct/range {v0 .. v5}, Lu3g;-><init>(IIIILjava/lang/String;)V

    sput-object v0, Lu3g;->d:Lu3g;

    new-instance v1, Lu3g;

    const v4, 0x7f14103c

    const/4 v5, 0x0

    const/4 v2, 0x1

    const v3, 0x7f130035

    const-string v6, "SEARCH"

    invoke-direct/range {v1 .. v6}, Lu3g;-><init>(IIIILjava/lang/String;)V

    sput-object v1, Lu3g;->e:Lu3g;

    new-instance v2, Lu3g;

    const v5, 0x7f141226

    const/4 v6, -0x1

    const/4 v3, 0x2

    const v4, 0x7f130040

    const-string v7, "SYNCING"

    invoke-direct/range {v2 .. v7}, Lu3g;-><init>(IIIILjava/lang/String;)V

    sput-object v2, Lu3g;->f:Lu3g;

    filled-new-array {v0, v1, v2}, [Lu3g;

    move-result-object v0

    sput-object v0, Lu3g;->g:[Lu3g;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(IIIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0, p5, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Lu3g;->a:I

    iput p3, p0, Lu3g;->b:I

    iput p4, p0, Lu3g;->c:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lu3g;
    .registers 2

    const-class v0, Lu3g;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lu3g;

    return-object p0
.end method

.method public static values()[Lu3g;
    .registers 1

    sget-object v0, Lu3g;->g:[Lu3g;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lu3g;

    return-object v0
.end method
