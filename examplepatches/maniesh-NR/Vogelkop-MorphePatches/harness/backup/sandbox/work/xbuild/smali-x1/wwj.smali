.class Lwwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final a:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwwj;->a:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-object p0, p0, Lwwj;->a:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    instance-of v0, p1, Landroid/text/Spannable;

    if-eqz v0, :cond_2e

    check-cast p1, Landroid/text/Spannable;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-class v1, Lcom/opera/android/text/ThemeDependentSpan;

    const/4 v2, 0x0

    invoke-interface {p1, v2, v0, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/opera/android/text/ThemeDependentSpan;

    array-length v0, p1

    if-lez v0, :cond_2e

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    array-length v0, p1

    :goto_20
    if-ge v2, v0, :cond_2e

    aget-object v1, p1, v2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-interface {v1, v3}, Lcom/opera/android/text/ThemeDependentSpan;->a(Landroid/content/Context;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    :cond_2e
    return-void
.end method
