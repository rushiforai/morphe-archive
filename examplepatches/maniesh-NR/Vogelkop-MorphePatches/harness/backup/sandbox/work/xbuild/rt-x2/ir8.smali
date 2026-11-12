.class public final synthetic Lir8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;ILjava/lang/String;Lcom/opera/api/Callback;)V
    .registers 6

    .line 16
    const/4 v0, 0x0

    iput-byte v0, p0, Lir8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lir8;->c:Ljava/lang/Object;

    iput p2, p0, Lir8;->b:I

    iput-object p3, p0, Lir8;->d:Ljava/lang/Object;

    iput-object p4, p0, Lir8;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lbuj;ILjava/io/File;Ljava/lang/String;)V
    .registers 6

    .line 15
    const/4 v0, 0x2

    iput-byte v0, p0, Lir8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lir8;->c:Ljava/lang/Object;

    iput p2, p0, Lir8;->b:I

    iput-object p3, p0, Lir8;->e:Ljava/lang/Object;

    iput-object p4, p0, Lir8;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lx79;Lx2g;ILr2g;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lir8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lir8;->c:Ljava/lang/Object;

    iput-object p2, p0, Lir8;->d:Ljava/lang/Object;

    iput p3, p0, Lir8;->b:I

    iput-object p4, p0, Lir8;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lir8;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lir8;->d:Ljava/lang/Object;

    iget-object v4, p0, Lir8;->e:Ljava/lang/Object;

    iget v5, p0, Lir8;->b:I

    iget-object p0, p0, Lir8;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8c

    check-cast p0, Lbuj;

    check-cast v4, Ljava/io/File;

    check-cast v3, Ljava/lang/String;

    check-cast p1, Lyni;

    if-nez p1, :cond_20

    const p1, 0x7f14114f

    invoke-virtual {p0, p1}, Lbuj;->a(I)V

    goto :goto_44

    :cond_20
    iget-object p1, p1, Lyni;->a:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-static {v0, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->setHeight(I)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-lt v0, v5, :cond_38

    move v1, v2

    :cond_38
    new-instance v0, Lztj;

    invoke-direct {v0, p0, v4, v3, v1}, Lztj;-><init>(Lbuj;Ljava/io/File;Ljava/lang/String;Z)V

    filled-new-array {p1}, [Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-static {v0, p0}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    :goto_44
    return-void

    :pswitch_45
    check-cast p0, Lx79;

    check-cast v3, Lx2g;

    check-cast v4, Lr2g;

    check-cast p1, Ljava/lang/Boolean;

    add-int/2addr v5, v2

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, v3, v5, p1, v4}, Lx79;->c0(Lx2g;IZLr2g;)V

    return-void

    :pswitch_56
    check-cast p0, Landroid/content/Context;

    check-cast v3, Ljava/lang/String;

    check-cast v4, Lcom/opera/api/Callback;

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_7f

    const v0, 0x7f04067b

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v0, Luq8;

    invoke-static {p0}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v3

    invoke-direct {v0, p0, v3, v2, p1}, Luq8;-><init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1, v1, v5, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_87

    :cond_7f
    sget p1, Lvmj;->g:I

    const/16 p1, 0x30

    invoke-static {p0, v3, v5, v5, p1}, Ltmj;->j(Landroid/content/Context;Ljava/lang/String;III)Lvmj;

    move-result-object v0

    :goto_87
    invoke-interface {v4, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_56
        :pswitch_45
    .end packed-switch
.end method
