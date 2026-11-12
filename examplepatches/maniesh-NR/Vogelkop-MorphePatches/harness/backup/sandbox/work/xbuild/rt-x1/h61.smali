.class public final Lh61;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ligd;
.implements Lylo;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lh61;->a:Landroid/content/Context;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Z)V
    .registers 3

    .line 10
    iput-object p1, p0, Lh61;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    return-object p0
.end method

.method public final b(I)I
    .registers 3

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    const v0, 0x7f06063b

    invoke-static {p1, p0, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public final g(Ligi;)Ljgd;
    .registers 6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-ge v0, v1, :cond_16

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    if-eqz p0, :cond_45

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "com.amazon.hardware.tv_screen"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_45

    :cond_16
    iget-object p0, p1, Ligi;->d:Ljava/lang/Object;

    check-cast p0, Loj9;

    iget-object p0, p0, Loj9;->n:Ljava/lang/String;

    invoke-static {p0}, Ldzd;->i(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ltym;->D(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Creating an asynchronous MediaCodec adapter for track type "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lw7d;->G(Ljava/lang/String;)V

    new-instance v0, Lrn9;

    new-instance v1, Lse2;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lse2;-><init>(BI)V

    new-instance v2, Lse2;

    const/4 v3, 0x1

    invoke-direct {v2, v3, p0}, Lse2;-><init>(BI)V

    invoke-direct {v0, v1, v2}, Lrn9;-><init>(Lse2;Lse2;)V

    iput-boolean v3, v0, Lrn9;->b:Z

    invoke-virtual {v0, p1}, Lrn9;->p(Ligi;)Lte2;

    move-result-object p0

    return-object p0

    :cond_45
    new-instance p0, Ldvj;

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Ldvj;-><init>(B)V

    invoke-virtual {p0, p1}, Ldvj;->g(Ligi;)Ljgd;

    move-result-object p0

    return-object p0
.end method
