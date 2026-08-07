.class public Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->g0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->i:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->i:Landroid/widget/TextView;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 28
    .line 29
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-lez p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->i:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->i:Landroid/widget/TextView;

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;->a:Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 62
    .line 63
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
