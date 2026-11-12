.class public final Lwv3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwv3;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)I
    .registers 2

    if-eqz p1, :cond_b

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->e:Lw6j;

    iget-object p1, p1, Lw6j;->d:Ljava/lang/Object;

    check-cast p1, Lknf;

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    if-eqz p1, :cond_1b

    invoke-interface {p1}, Lknf;->B()Likc;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmnf;

    iget p0, p0, Lmnf;->a:I

    return p0

    :cond_1b
    iget-object p0, p0, Lwv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->M0()Lysl;

    move-result-object p0

    invoke-interface {p0}, Lysl;->h()I

    move-result p0

    return p0
.end method

.method public final b()Landroid/graphics/Rect;
    .registers 6

    iget-object v0, p0, Lwv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->z1:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt8l;

    iget-object v1, v1, Lt8l;->c:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq8l;

    const v2, 0x7f0a0b49

    invoke-virtual {v0, v2}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    iget v3, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v4

    invoke-virtual {p0, v4}, Lwv3;->a(Lb2l;)I

    move-result p0

    add-int/2addr p0, v3

    iput p0, v2, Landroid/graphics/Rect;->top:I

    iget p0, v2, Landroid/graphics/Rect;->bottom:I

    iget-object v1, v1, Lq8l;->a:Lp8l;

    sget-object v3, Lp8l;->a:Lp8l;

    if-ne v1, v3, :cond_3b

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->M0()Lysl;

    move-result-object v0

    invoke-interface {v0}, Lysl;->g()I

    move-result v0

    goto :goto_3c

    :cond_3b
    const/4 v0, 0x0

    :goto_3c
    sub-int/2addr p0, v0

    iput p0, v2, Landroid/graphics/Rect;->bottom:I

    return-object v2
.end method
