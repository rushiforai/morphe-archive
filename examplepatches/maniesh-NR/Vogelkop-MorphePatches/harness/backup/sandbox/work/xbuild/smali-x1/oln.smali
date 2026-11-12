.class public final synthetic Loln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqln;


# direct methods
.method public synthetic constructor <init>(Lqln;B)V
    .registers 3

    iput-byte p2, p0, Loln;->a:B

    iput-object p1, p0, Loln;->b:Lqln;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Loln;->a:B

    iget-object p0, p0, Loln;->b:Lqln;

    packed-switch v0, :pswitch_data_70

    check-cast p1, Lqjn;

    invoke-virtual {p0}, Lqln;->r()V

    return-void

    :pswitch_d
    check-cast p1, Laln;

    if-eqz p1, :cond_6e

    iget-object v0, p0, Lqln;->a:Landroid/content/Context;

    iget-object v1, p0, Lqln;->m:Lrgh;

    iget-object v2, v1, Lrgh;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/res/Resources;

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 v2, v2, 0x5a

    div-int/lit8 v2, v2, 0x64

    iget-object v3, v1, Lrgh;->b:Ljava/lang/Object;

    check-cast v3, Landroid/content/res/Resources;

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v1, v1, Lrgh;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0700a0

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sub-int/2addr v3, v1

    mul-int/lit8 v3, v3, 0x5a

    div-int/lit8 v3, v3, 0x64

    new-instance v1, Lo2c;

    const/4 v4, 0x0

    invoke-direct {v1, v4, v2, v3, v4}, Lo2c;-><init>(ZIIZ)V

    invoke-interface {p1, v0, v1}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object p1

    iget-object p1, p1, Lxkn;->c:Ljava/lang/String;

    if-eqz p1, :cond_6e

    iget-object v0, p0, Lqln;->g:Lagm;

    iget-object p0, p0, Lqln;->b:Lumi;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_6e

    new-instance v1, Ljp5;

    const/16 v2, 0xa

    invoke-direct {v1, v0, p1, v2}, Ljp5;-><init>(Ljava/lang/Object;Ljava/lang/String;B)V

    invoke-virtual {p0, v1}, Lumi;->g(Ln5o;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_6e
    return-void

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
