.class public Lcom/opera/hype/emoji/EmojiTextView;
.super Lyq1;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0016\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/hype/emoji/EmojiTextView;",
        "Lyq1;",
        "emoji"
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
.field public static final synthetic i:I


# instance fields
.field public final h:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const v0, 0x1010084

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lcom/opera/hype/emoji/EmojiTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lyq1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object p2, p0, Lyq1;->c:Lbpd;

    if-nez p2, :cond_e

    new-instance p2, Lbpd;

    invoke-direct {p2, p0}, Lbpd;-><init>(Landroid/widget/TextView;)V

    iput-object p2, p0, Lyq1;->c:Lbpd;

    :cond_e
    iget-object p2, p2, Lbpd;->c:Ljava/lang/Object;

    check-cast p2, Leq6;

    iget-object p2, p2, Leq6;->a:Ljava/lang/Object;

    check-cast p2, Lgyg;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Lgyg;->T(Z)V

    new-instance p2, Lvg4;

    const/4 p3, 0x4

    invoke-direct {p2, p1, p3}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/hype/emoji/EmojiTextView;->h:Lzyk;

    return-void
.end method


# virtual methods
.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 11

    if-eqz p1, :cond_e8

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_e8

    iget-object p2, p0, Lcom/opera/hype/emoji/EmojiTextView;->h:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lfz7;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Landroid/text/PrecomputedText;

    if-nez v0, :cond_e2

    instance-of v0, p1, Lapg;

    if-nez v0, :cond_e2

    instance-of v0, p1, Landroid/text/Spannable;

    if-eqz v0, :cond_22

    check-cast p1, Landroid/text/Spannable;

    goto :goto_28

    :cond_22
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    move-object p1, v0

    :goto_28
    const-class v0, Lbz7;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-static {p1, v0}, Ly4h;->n(Landroid/text/Spannable;Ls15;)V

    new-instance v0, Ld;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p1}, Ld;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v0}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object v0

    const/4 v3, -0x1

    move v4, v3

    :goto_3e
    invoke-virtual {v0}, Lk1j;->hasNext()Z

    move-result v5

    const/16 v6, 0x21

    if-eqz v5, :cond_63

    invoke-virtual {v0}, Lk1j;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    if-ne v3, v5, :cond_55

    add-int/lit8 v3, v3, 0x1

    goto :goto_3e

    :cond_55
    if-ge v4, v3, :cond_5f

    new-instance v7, Lbz7;

    invoke-direct {v7}, Lbz7;-><init>()V

    invoke-interface {p1, v7, v4, v3, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :cond_5f
    add-int/lit8 v3, v5, 0x1

    move v4, v5

    goto :goto_3e

    :cond_63
    if-ge v4, v3, :cond_6d

    new-instance v0, Lbz7;

    invoke-direct {v0}, Lbz7;-><init>()V

    invoke-interface {p1, v0, v4, v3, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :cond_6d
    iget-object p2, p2, Lfz7;->a:Landroid/content/Context;

    sget-object v0, Loz7;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-static {p2}, Lcs5;->v(Landroid/content/Context;)Lvh9;

    move-result-object v0

    if-nez v0, :cond_86

    new-instance v0, Lvh9;

    new-instance v3, Lth9;

    const v4, 0x7f030008

    const-string v5, "Noto Color Emoji Compat"

    invoke-direct {v3, v5, v4}, Lth9;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, p2, v3}, Lvh9;-><init>(Landroid/content/Context;Lth9;)V

    :cond_86
    const/4 v3, 0x0

    iput-boolean v3, v0, Ltx7;->b:Z

    invoke-static {p2, v0}, Loz7;->a(Landroid/content/Context;Lvh9;)Z

    move-result p2

    if-eqz p2, :cond_e2

    invoke-static {}, Lxx7;->a()Lxx7;

    move-result-object p2

    invoke-virtual {p2}, Lxx7;->c()I

    move-result p2

    if-ne p2, v1, :cond_e2

    const-class p2, Lay7;

    invoke-static {p2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p2

    invoke-static {p1, p2}, Ly4h;->n(Landroid/text/Spannable;Ls15;)V

    invoke-static {}, Lxx7;->a()Lxx7;

    move-result-object p2

    invoke-virtual {p2, p1}, Lxx7;->k(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    const-class p2, Llam;

    invoke-static {p2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    new-instance v1, Lexj;

    invoke-direct {v1, p1, v0, p2, v2}, Lexj;-><init>(Landroid/text/Spanned;ILs15;Lmt5;)V

    invoke-static {v1}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object p2

    :cond_bc
    :goto_bc
    invoke-virtual {p2}, Lk1j;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e2

    invoke-virtual {p2}, Lk1j;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpwj;

    new-instance v1, Lay7;

    iget-object v2, v0, Lpwj;->a:Ljava/lang/Object;

    check-cast v2, Lcz7;

    invoke-direct {v1, v2}, Lay7;-><init>(Lcz7;)V

    iget-object v2, v0, Lpwj;->a:Ljava/lang/Object;

    if-eq v1, v2, :cond_bc

    invoke-interface {p1, v2}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    iget v2, v0, Lpwj;->b:I

    iget v3, v0, Lpwj;->c:I

    iget v0, v0, Lpwj;->d:I

    invoke-interface {p1, v1, v2, v3, v0}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_bc

    :cond_e2
    sget-object p2, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    return-void

    :cond_e8
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    return-void
.end method
