.class public final Lzw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldeg;

.field public final b:Lgv3;


# direct methods
.method public constructor <init>(Ldeg;Lgv3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzw0;->a:Ldeg;

    iput-object p2, p0, Lzw0;->b:Lgv3;

    return-void
.end method

.method public static a(Ldwh;ILkotlin/jvm/functions/Function1;)V
    .registers 5

    iget-object v0, p0, Ldwh;->b:Lgvh;

    invoke-virtual {v0, p1, p1}, Lgvh;->b(II)V

    invoke-virtual {p0}, Ldwh;->a()V

    invoke-virtual {p0}, Ldwh;->j()V

    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p0, p1}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    new-instance p1, Lphi;

    new-instance v0, Lab;

    const/4 v1, 0x6

    invoke-direct {v0, p2, v1}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {p0, p1}, Ldwh;->f(Lacl;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;IILjava/io/File;Lo29;Llol;)V
    .registers 9

    sget-object v0, Lyw0;->a:[I

    invoke-virtual {p5}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_15

    iget-object p0, p0, Lzw0;->a:Ldeg;

    invoke-virtual {p0, p4}, Ldeg;->h(Ljava/io/File;)Ldwh;

    move-result-object p0

    invoke-static {p0, p2, p6}, Lzw0;->a(Ldwh;ILkotlin/jvm/functions/Function1;)V

    return-void

    :cond_15
    invoke-static {p5}, Llg7;->g(Lo29;)Lkg7;

    move-result-object p0

    new-instance p2, Lvw0;

    iget p4, p0, Lkg7;->a:I

    invoke-static {p4, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-static {p4, p3}, Lic4;->R(Landroid/graphics/drawable/Drawable;I)Lo92;

    move-result-object p3

    iget p4, p0, Lkg7;->d:I

    const p5, 0x7f06063b

    invoke-static {p4, p1, p5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p4

    iget p0, p0, Lkg7;->b:I

    invoke-static {p0, p1, p5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-direct {p2, p3, p4, p0}, Lvw0;-><init>(Landroid/graphics/drawable/Drawable;ILjava/lang/Integer;)V

    invoke-virtual {p6, p2}, Llol;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final c(Landroid/content/Context;IILjava/lang/String;Llol;)V
    .registers 12

    iget-object v0, p0, Lzw0;->b:Lgv3;

    iget-object v0, v0, Lgv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object v0

    iget-object v0, v0, Lpne;->a:Ljava/lang/String;

    invoke-static {v0, p4}, Ldbh;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_40

    sget-object p0, Lo29;->n:Lo29;

    invoke-static {p0}, Llg7;->g(Lo29;)Lkg7;

    move-result-object p0

    new-instance p2, Lvw0;

    iget p4, p0, Lkg7;->a:I

    invoke-static {p4, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-static {p4, p3}, Lic4;->R(Landroid/graphics/drawable/Drawable;I)Lo92;

    move-result-object p3

    iget p4, p0, Lkg7;->d:I

    const v0, 0x7f06063b

    invoke-static {p4, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p4

    iget p0, p0, Lkg7;->b:I

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-direct {p2, p3, p4, p0}, Lvw0;-><init>(Landroid/graphics/drawable/Drawable;ILjava/lang/Integer;)V

    invoke-virtual {p5, p2}, Llol;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_40
    iget-object p3, p0, Lzw0;->a:Ldeg;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p3, v0}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p3

    new-instance v0, Ltw0;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p4

    move-object v1, p5

    invoke-direct/range {v0 .. v5}, Ltw0;-><init>(Llol;Lzw0;Landroid/content/Context;ILjava/lang/String;)V

    invoke-static {p3, v4, v0}, Lzw0;->a(Ldwh;ILkotlin/jvm/functions/Function1;)V

    return-void
.end method
