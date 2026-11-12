.class public final Lfz2;
.super La7f;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lci7;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lfz2;->c:B

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object p1, p0, Lfz2;->d:Ljava/lang/Object;

    .line 17
    invoke-direct {p0, v0}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/hype/image/editor/TextBoxEditText;)V
    .registers 3

    const/16 v0, 0x8

    iput-byte v0, p0, Lfz2;->c:B

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object p1, p0, Lfz2;->d:Ljava/lang/Object;

    invoke-direct {p0, v0}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lft7;)V
    .registers 3

    const/16 v0, 0x9

    iput-byte v0, p0, Lfz2;->c:B

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object p1, p0, Lfz2;->d:Ljava/lang/Object;

    .line 18
    invoke-direct {p0, v0}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Li76;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lfz2;->c:B

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object p1, p0, Lfz2;->d:Ljava/lang/Object;

    .line 16
    invoke-direct {p0, v0}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 20
    iput-byte p3, p0, Lfz2;->c:B

    iput-object p2, p0, Lfz2;->d:Ljava/lang/Object;

    invoke-direct {p0, p1}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lo8g;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lfz2;->c:B

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object p1, p0, Lfz2;->d:Ljava/lang/Object;

    .line 19
    invoke-direct {p0, v0}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lqk3;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lfz2;->c:B

    iput-object p1, p0, Lfz2;->d:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 15
    invoke-direct {p0, p1}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lfz2;->c:B

    const/4 v1, 0x0

    iget-object p0, p0, Lfz2;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_126

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eq p1, p2, :cond_46

    check-cast p0, Lft7;

    iget-object p0, p0, Lft7;->g:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object p1

    new-instance p2, Lu39;

    invoke-direct {p2, p1}, Lu39;-><init>(Lv39;)V

    :goto_23
    invoke-virtual {p2}, Lu39;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_46

    invoke-virtual {p2}, Lu39;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbfl;

    iget-object p1, p1, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->e:Lywl;

    iget-object v0, v0, Lywl;->b:Lfz2;

    sget-object v2, Lywl;->c:[Lxtb;

    aget-object v2, v2, v1

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p1, Lcom/opera/hype/image/editor/TextBoxEditText;->k:Z

    goto :goto_23

    :cond_46
    return-void

    :pswitch_47
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    if-eq p1, p2, :cond_68

    check-cast p0, Lcom/opera/hype/image/editor/TextBoxEditText;

    sget-object p1, Lcom/opera/hype/image/editor/TextBoxEditText;->o:[Lxtb;

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object p1

    if-eqz p1, :cond_68

    if-nez p2, :cond_65

    invoke-static {p1}, Lcom/opera/hype/image/editor/TextBoxEditText;->s(Landroid/text/Editable;)V

    goto :goto_68

    :cond_65
    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/TextBoxEditText;->u(Landroid/text/Editable;)V

    :cond_68
    :goto_68
    return-void

    :pswitch_69
    check-cast p2, Lcxh;

    check-cast p1, Lcxh;

    check-cast p0, Lfzk;

    invoke-virtual {p0}, Lfzk;->a()V

    return-void

    :pswitch_73
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eq p1, p2, :cond_9d

    check-cast p0, Llrg;

    iget-object p0, p0, Llrg;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :cond_89
    :goto_89
    if-ge v1, p1, :cond_9d

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Lhpg;

    invoke-interface {v0}, Lhpg;->b()Z

    move-result v2

    if-eq v2, p2, :cond_89

    invoke-interface {v0, p2}, Lhpg;->a(Z)V

    goto :goto_89

    :cond_9d
    return-void

    :pswitch_9e
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    if-eq p1, p2, :cond_b3

    check-cast p0, Lo8g;

    iget-object p0, p0, Lo8g;->a:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_b3
    return-void

    :pswitch_b4
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eq p1, v0, :cond_c7

    check-cast p0, Lci7;

    invoke-virtual {p0, p2}, Lci7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c7
    return-void

    :pswitch_c8
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lzm6;

    invoke-virtual {p0}, Lzm6;->f()V

    return-void

    :pswitch_d8
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    if-eq p1, p2, :cond_ed

    check-cast p0, Li76;

    iget-object p0, p0, Li76;->a:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_ed
    return-void

    :pswitch_ee
    check-cast p2, Landroid/graphics/Bitmap;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_ff

    check-cast p0, Lqk3;

    iget-object p0, p0, Lqk3;->a:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_ff
    return-void

    :pswitch_100
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lgz2;

    iget-object p0, p0, Lgz2;->b:Ljava/util/Set;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_114
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_124

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-interface {p1, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_114

    :cond_124
    return-void

    nop

    :pswitch_data_126
    .packed-switch 0x0
        :pswitch_100
        :pswitch_ee
        :pswitch_d8
        :pswitch_c8
        :pswitch_b4
        :pswitch_9e
        :pswitch_73
        :pswitch_69
        :pswitch_47
    .end packed-switch
.end method
