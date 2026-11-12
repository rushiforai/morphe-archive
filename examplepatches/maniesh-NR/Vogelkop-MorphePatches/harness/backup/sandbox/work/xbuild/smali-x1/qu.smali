.class public final Lqu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lru;


# direct methods
.method public synthetic constructor <init>(Lru;B)V
    .registers 3

    iput-byte p2, p0, Lqu;->a:B

    iput-object p1, p0, Lqu;->b:Lru;

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
    .registers 4

    iget-byte v0, p0, Lqu;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lqu;->b:Lru;

    packed-switch v0, :pswitch_data_3a

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->j:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean p1, p1, Ll6b;->q:Z

    if-eqz p1, :cond_1d

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p0

    iget-object p0, p0, Lhm9;->j:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    :cond_1d
    return-void

    :pswitch_1e
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v0

    iget-object v0, v0, Lhm9;->g:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v0, v0, Ll6b;->q:Z

    if-nez v0, :cond_33

    if-eqz p1, :cond_32

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-nez p1, :cond_33

    :cond_32
    const/4 v1, 0x1

    :cond_33
    invoke-virtual {p0, v1}, Lru;->M0(Z)V

    invoke-virtual {p0}, Lru;->L0()V

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Lqu;->a:B

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Lqu;->a:B

    return-void
.end method
