.class public final Lpu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lpu;->a:B

    iput-object p1, p0, Lpu;->b:Ljava/lang/Object;

    iput-object p2, p0, Lpu;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final b(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final j(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final k(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 5

    iget-byte v0, p0, Lpu;->a:B

    iget-object v1, p0, Lpu;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object p0, p0, Lpu;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_62

    check-cast p0, Landroid/widget/Button;

    if-eqz p1, :cond_12

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_12
    check-cast v1, Lbg7;

    iget-object p1, v1, Lbg7;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_22
    check-cast p0, Lru;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lkotlin/text/StringsKt;->m0(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_37

    move-object p1, v2

    :cond_37
    if-eqz p1, :cond_3f

    new-instance v0, Lyt1;

    invoke-direct {v0, p1}, Lyt1;-><init>(Ljava/lang/String;)V

    goto :goto_40

    :cond_3f
    move-object v0, v2

    :goto_40
    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object p1

    if-eqz v0, :cond_53

    check-cast v1, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget p0, p0, Lru;->A:I

    invoke-virtual {v0, p0, v1}, Lyt1;->a(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    goto :goto_54

    :cond_53
    move-object p0, v2

    :goto_54
    iget-object p1, p1, Lxu;->e:Lode;

    if-eqz v0, :cond_5d

    new-instance v2, Lwu;

    invoke-direct {v2, v0, p0}, Lwu;-><init>(Lzt1;Landroid/graphics/drawable/Drawable;)V

    :cond_5d
    invoke-static {p1, v2}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Lpu;->a:B

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Lpu;->a:B

    return-void
.end method
