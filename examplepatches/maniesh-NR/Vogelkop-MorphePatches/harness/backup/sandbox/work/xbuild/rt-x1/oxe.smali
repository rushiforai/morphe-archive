.class public final Loxe;
.super Ldx4;
.source "SourceFile"


# instance fields
.field public final g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x6978

    invoke-direct {p0, v0}, Ldx4;-><init>(I)V

    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    invoke-virtual {p1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Loxe;->g:Z

    return-void
.end method


# virtual methods
.method public final b(Lhx4;)Lix4;
    .registers 2

    iget-boolean p0, p0, Loxe;->g:Z

    if-nez p0, :cond_a

    sget-object p0, Lnxe;->a:[Lnxe;

    const/4 p0, 0x5

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_a
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final h(Lr6j;I)Lr6j;
    .registers 10

    new-instance v2, Lx6j;

    new-instance p0, Lnf8;

    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lnf8;-><init>(B)V

    const-class v0, Lzwe;

    invoke-direct {v2, v0, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Lzbe;

    const/16 p0, 0xa

    invoke-direct {v6, p0}, Lzbe;-><init>(B)V

    const v3, 0x7f14103a    # 1.9681E38f

    const v4, 0x7f080599

    const/4 v5, 0x1

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0
.end method
