.class public final synthetic Lwfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfge;


# direct methods
.method public synthetic constructor <init>(Lfge;B)V
    .registers 3

    iput-byte p2, p0, Lwfe;->a:B

    iput-object p1, p0, Lwfe;->b:Lfge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    iget-byte p1, p0, Lwfe;->a:B

    iget-object p0, p0, Lwfe;->b:Lfge;

    packed-switch p1, :pswitch_data_7c

    iget-object p1, p0, Lfge;->y:Lha2;

    iget-object v0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_22

    iget-object v0, p1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_22

    iget-object p0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object p1, p1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    :cond_22
    return-void

    :pswitch_23
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "*/*"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    new-instance v1, Lqj2;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v1}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void

    :pswitch_41
    iget-object p1, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7b

    iget-object v0, p0, Lfge;->x:Lrc9;

    new-instance v1, Lhu5;

    const/16 v2, 0x18

    invoke-direct {v1, p0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v0, Lrc9;->a:Ltcl;

    iget-object p0, v0, Lrc9;->b:Lbf9;

    invoke-static {v3}, Laib;->Q(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_78

    sget-object v4, Lp6l;->a:Lp6l;

    new-instance v5, Lvzk;

    const-string p1, ""

    invoke-direct {v5, p0, p1, v3, v1}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lcom/opera/android/browser/b;

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/opera/android/browser/b;-><init>(Ltcl;Ljava/lang/String;Lp6l;Lzun;Z)V

    goto :goto_7b

    :cond_78
    invoke-virtual {p0, v3, v1}, Lbf9;->G(Ljava/lang/String;Lcom/opera/api/Callback;)V

    :cond_7b
    :goto_7b
    return-void

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_41
        :pswitch_23
    .end packed-switch
.end method
