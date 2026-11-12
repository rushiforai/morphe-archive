.class public final synthetic Lvpe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic a:Lwpe;

.field public final synthetic b:Landroid/widget/EditText;

.field public final synthetic c:Lbz0;


# direct methods
.method public synthetic constructor <init>(Lwpe;Landroid/widget/EditText;Lbz0;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvpe;->a:Lwpe;

    iput-object p2, p0, Lvpe;->b:Landroid/widget/EditText;

    iput-object p3, p0, Lvpe;->c:Lbz0;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 p1, 0x6

    if-eq p2, p1, :cond_b

    invoke-static {p3}, Loup;->g0(Landroid/view/KeyEvent;)Z

    move-result p1

    if-nez p1, :cond_b

    const/4 p0, 0x0

    return p0

    :cond_b
    iget-object p1, p0, Lvpe;->b:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_21

    iget-object p1, p0, Lvpe;->a:Lwpe;

    iget-object p0, p0, Lvpe;->c:Lbz0;

    invoke-virtual {p1, p0}, Lwpe;->onPositiveButtonClicked(Lbz0;)V

    invoke-virtual {p0}, Lzp1;->dismiss()V

    :cond_21
    const/4 p0, 0x1

    return p0
.end method
