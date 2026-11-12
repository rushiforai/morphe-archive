.class public final Lwb9;
.super Lxb9;
.source "SourceFile"


# instance fields
.field private final m:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final n:Lvk2;

.field public final o:Ltw2;

.field public final p:Lvwj;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;Lvk2;)V
    .registers 7

    invoke-direct/range {p0 .. p5}, Lxb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;)V

    new-instance p1, Ltw2;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ltw2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lwb9;->o:Ltw2;

    new-instance p1, Lvwj;

    new-instance p2, Lyk4;

    const/16 p4, 0x19

    invoke-direct {p2, p0, p4}, Lyk4;-><init>(Ljava/lang/Object;B)V

    new-instance p4, Lzt;

    const/4 p5, 0x6

    invoke-direct {p4, p0, p5}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, p4}, Lvwj;-><init>(Lyk4;Lzt;)V

    iput-object p1, p0, Lwb9;->p:Lvwj;

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a069d

    invoke-static {p3, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lwb9;->m:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lxb9;->b0(Landroid/widget/TextView;)V

    iput-object p6, p0, Lwb9;->n:Lvk2;

    return-void
.end method

.method public static bridge synthetic i0(Lwb9;)Landroid/widget/TextView;
    .registers 1

    iget-object p0, p0, Lwb9;->m:Landroid/widget/TextView;

    return-object p0
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 8

    invoke-super {p0, p1, p2}, Lxb9;->V(Lja2;Z)V

    iget-object p2, p0, Lwb9;->m:Landroid/widget/TextView;

    iget-object v0, p0, Lwb9;->p:Lvwj;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    iget-object p2, p0, Lwb9;->m:Landroid/widget/TextView;

    check-cast p1, Lkb9;

    iget-object p1, p1, Lkb9;->e:Ljava/lang/String;

    sget-object v0, Lbgc;->a:Ljava/util/regex/Pattern;

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    sget-object p1, Lbgc;->a:Ljava/util/regex/Pattern;

    invoke-virtual {p1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    :goto_1d
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_4e

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    iget-object v2, p0, Lwb9;->o:Ltw2;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lub9;

    iget-object v4, v2, Ltw2;->b:Ljava/lang/Object;

    check-cast v4, Lwb9;

    invoke-static {v4}, Lwb9;->i0(Lwb9;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v2, v4, v1}, Lub9;-><init>(Ltw2;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    const/16 v4, 0x11

    invoke-virtual {v0, v3, v1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_1d

    :cond_4e
    sget-object p0, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p2, v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-static {p2}, Lvwj;->a(Landroid/widget/TextView;)V

    return-void
.end method

.method public final f0(Lja2;)V
    .registers 5

    iget-object v0, p0, Lxb9;->d:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v0

    new-instance v1, Lvb9;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lvb9;-><init>(Lxb9;Lja2;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
