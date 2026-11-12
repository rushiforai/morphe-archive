.class public final enum Ln7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum e:Ln7j;

.field public static final enum f:Ln7j;

.field public static final enum g:Ln7j;

.field public static final synthetic h:[Ln7j;


# instance fields
.field public final a:B

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Ln7j;

    const/4 v5, 0x0

    const/4 v6, -0x1

    const-string v1, "ALWAYS_LOCKED"

    const/4 v2, 0x0

    const/4 v3, 0x1

    const v4, 0x7f14105f

    invoke-direct/range {v0 .. v6}, Ln7j;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Ln7j;->e:Ln7j;

    new-instance v1, Ln7j;

    const/4 v6, 0x0

    const v7, 0x7fffffff

    const-string v2, "NEVER_LOCKED"

    const/4 v4, 0x2

    const v5, 0x7f141061

    invoke-direct/range {v1 .. v7}, Ln7j;-><init>(Ljava/lang/String;IIIII)V

    sput-object v1, Ln7j;->f:Ln7j;

    new-instance v2, Ln7j;

    const v7, 0x7f12005f

    const/16 v8, 0xa

    const-string v3, "TEN_MINUTES_UNLOCKED"

    const/4 v5, 0x3

    invoke-direct/range {v2 .. v8}, Ln7j;-><init>(Ljava/lang/String;IIIII)V

    sput-object v2, Ln7j;->g:Ln7j;

    filled-new-array {v0, v1, v2}, [Ln7j;

    move-result-object v0

    sput-object v0, Ln7j;->h:[Ln7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIII)V
    .registers 7

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Ln7j;->a:B

    iput p4, p0, Ln7j;->b:I

    iput p5, p0, Ln7j;->c:I

    iput p6, p0, Ln7j;->d:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ln7j;
    .registers 2

    const-class v0, Ln7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ln7j;

    return-object p0
.end method

.method public static values()[Ln7j;
    .registers 1

    sget-object v0, Ln7j;->h:[Ln7j;

    invoke-virtual {v0}, [Ln7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ln7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 4

    iget v0, p0, Ln7j;->c:I

    if-eqz v0, :cond_13

    iget p0, p0, Ln7j;->d:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, p0, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_13
    iget p0, p0, Ln7j;->b:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getDescription()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getIcon()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getValue()I
    .registers 1

    iget p0, p0, Ln7j;->d:I

    return p0
.end method
