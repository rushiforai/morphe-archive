.class public final Lcom/opera/hype/image/editor/TextBoxEditText;
.super Lcom/opera/hype/emoji/EmojiTextView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001:\u0001\u0008B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/opera/hype/image/editor/TextBoxEditText;",
        "Lcom/opera/hype/emoji/EmojiTextView;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "cfl",
        "image-editor"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic o:[Lxtb;


# instance fields
.field public final j:Lfz2;

.field public k:Z

.field public l:Luam;

.field public final m:La01;

.field public n:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lcom/opera/hype/image/editor/TextBoxEditText;

    const-string v2, "strokeColor"

    const-string v3, "getStrokeColor()I"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lcom/opera/hype/image/editor/TextBoxEditText;->o:[Lxtb;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const v0, 0x7f0403f4

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/hype/emoji/EmojiTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lfz2;

    invoke-direct {p1, p0}, Lfz2;-><init>(Lcom/opera/hype/image/editor/TextBoxEditText;)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->j:Lfz2;

    new-instance p1, Lbxk;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lbxk;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->l:Luam;

    new-instance p1, La01;

    invoke-direct {p1}, Landroid/text/InputFilter$AllCaps;-><init>()V

    const/4 p2, 0x0

    iput-boolean p2, p1, La01;->a:Z

    iput-object p1, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->m:La01;

    invoke-virtual {p0}, Landroid/widget/TextView;->getMaxLines()I

    move-result p2

    const/4 v0, 0x1

    if-lt p2, v0, :cond_3b

    invoke-virtual {p0}, Landroid/widget/TextView;->getInputType()I

    move-result p2

    const v0, 0x2000f

    and-int/2addr p2, v0

    const v0, 0x20001

    if-ne p2, v0, :cond_3b

    new-instance p2, Lcfl;

    invoke-direct {p2, p0}, Lcfl;-><init>(Lcom/opera/hype/image/editor/TextBoxEditText;)V

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_3b
    invoke-virtual {p0}, Landroid/widget/TextView;->getFilters()[Landroid/text/InputFilter;

    move-result-object p2

    array-length v0, p2

    add-int/lit8 v1, v0, 0x1

    invoke-static {p2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    aput-object p1, p2, v0

    check-cast p2, [Landroid/text/InputFilter;

    invoke-virtual {p0, p2}, Lyq1;->setFilters([Landroid/text/InputFilter;)V

    new-instance p1, Lh63;

    const/16 p2, 0x8

    invoke-direct {p1, p0, p2}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method public static s(Landroid/text/Editable;)V
    .registers 5

    const-class v0, Lsik;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    new-instance v2, Lexj;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v1, v0, v3}, Lexj;-><init>(Landroid/text/Spanned;ILs15;Lmt5;)V

    invoke-static {v2}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object v0

    :cond_14
    :goto_14
    invoke-virtual {v0}, Lk1j;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-virtual {v0}, Lk1j;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpwj;

    iget-object v1, v1, Lpwj;->a:Ljava/lang/Object;

    if-eqz v1, :cond_14

    invoke-interface {p0, v1}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    goto :goto_14

    :cond_28
    return-void
.end method


# virtual methods
.method public final getDefaultEditable()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getDefaultMovementMethod()Landroid/text/method/MovementMethod;
    .registers 1

    invoke-static {}, Landroid/text/method/ArrowKeyMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p0

    return-object p0
.end method

.method public final getFreezesText()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final bridge synthetic getText()Ljava/lang/CharSequence;
    .registers 1

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object p0

    return-object p0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-boolean v0, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->k:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final setAllCaps(Z)V
    .registers 4

    iget-object v0, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->m:La01;

    iget-boolean v1, v0, La01;->a:Z

    if-eq v1, p1, :cond_11

    iput-boolean p1, v0, La01;->a:Z

    if-eqz p1, :cond_11

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_11
    return-void
.end method

.method public final setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 3

    sget-object p2, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    invoke-super {p0, p1, p2}, Lcom/opera/hype/emoji/EmojiTextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    return-void
.end method

.method public final t()Landroid/text/Editable;
    .registers 4

    iget-boolean v0, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->n:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object p0

    return-object p0

    :cond_9
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_b
    iput-boolean v0, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->n:Z

    invoke-super {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_11
    .catchall {:try_start_b .. :try_end_11} :catchall_30

    if-nez v0, :cond_17

    iput-boolean v1, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->n:Z

    const/4 p0, 0x0

    return-object p0

    :cond_17
    :try_start_17
    instance-of v2, v0, Landroid/text/Editable;

    if-eqz v2, :cond_22

    invoke-super {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Editable;

    goto :goto_2d

    :cond_22
    sget-object v2, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    invoke-super {p0, v0, v2}, Lcom/opera/hype/emoji/EmojiTextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-super {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Editable;
    :try_end_2d
    .catchall {:try_start_17 .. :try_end_2d} :catchall_30

    :goto_2d
    iput-boolean v1, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->n:Z

    return-object v0

    :catchall_30
    move-exception v0

    iput-boolean v1, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->n:Z

    throw v0
.end method

.method public final u(Landroid/text/Editable;)V
    .registers 9

    invoke-static {p1}, Lcom/opera/hype/image/editor/TextBoxEditText;->s(Landroid/text/Editable;)V

    new-instance v0, Lbu4;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lbu4;-><init>(Ljava/lang/CharSequence;Lmt5;)V

    new-instance v2, Ld82;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Ld82;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lkotlin/Pair;

    invoke-direct {v6, v0, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lbj9;

    invoke-direct {v0, v2, v6, v1, v3}, Lbj9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    new-instance v2, Ld82;

    invoke-direct {v2, v0, v3}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lbvk;

    const/16 v3, 0xe

    invoke-direct {v0, v3}, Lbvk;-><init>(B)V

    new-instance v3, Lm2m;

    invoke-direct {v3, v2, v0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lali;

    const/16 v2, 0x1a

    invoke-direct {v0, v2}, Lali;-><init>(B)V

    new-instance v2, Lx1j;

    invoke-direct {v2, v3, v0, v1}, Lx1j;-><init>(Lm2m;Lali;Lmt5;)V

    invoke-static {v2}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object v0

    :goto_47
    invoke-virtual {v0}, Lk1j;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7c

    invoke-virtual {v0}, Lk1j;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/Pair;

    iget-object v2, v1, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v1, v1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    new-instance v3, Lsik;

    sget-object v5, Lcom/opera/hype/image/editor/TextBoxEditText;->o:[Lxtb;

    aget-object v5, v5, v4

    iget-object v5, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->j:Lfz2;

    iget-object v5, v5, La7f;->b:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-direct {v3, v5, p0}, Lsik;-><init>(ILcom/opera/hype/image/editor/TextBoxEditText;)V

    const/16 v5, 0x12

    invoke-interface {p1, v3, v2, v1, v5}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_47

    :cond_7c
    return-void
.end method
