.class public final Lel7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp59;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lel7;->a:B

    iput-object p1, p0, Lel7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method

.method private final d()V
    .registers 1

    return-void
.end method

.method private final e()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-byte p0, p0, Lel7;->a:B

    return-void
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lel7;->a:B

    iget-object p0, p0, Lel7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    check-cast p0, Luxk;

    sget-object p1, Luxk;->w:[Lxtb;

    iget-object p0, p0, Li93;->s:Lrn9;

    invoke-virtual {p0}, Lrn9;->F()V

    return-void

    :pswitch_11
    check-cast p1, Lj9j;

    check-cast p0, Lc9j;

    sget-object v0, Lc9j;->w:[Lxtb;

    iget-object p1, p1, Lj9j;->a:Ljava/lang/String;

    if-eqz p1, :cond_39

    iget-object v0, p0, Lc9j;->t:Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    iget-object v1, p0, Lc9j;->v:Lh63;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lc9j;->J0(Z)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    iget-object p0, p0, Lc9j;->v:Lh63;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_39
    return-void

    :pswitch_3a
    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->jumpDrawablesToCurrentState()V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_11
    .end packed-switch
.end method
