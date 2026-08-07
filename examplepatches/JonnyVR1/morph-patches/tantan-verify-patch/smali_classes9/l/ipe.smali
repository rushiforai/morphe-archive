.class public Ll/ipe;
.super Ll/tya0;
.source "SourceFile"


# instance fields
.field public y:Ll/tm90;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/tya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/tm90;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/tm90;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ipe;->y:Ll/tm90;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Y(Ll/ipe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipe;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z(Ll/ipe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipe;->a0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic a0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Dk:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/zwk;->g()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic b0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ak:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/zwk;->k()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/tya0;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ipe;->y:Ll/tm90;

    .line 5
    .line 6
    iget-object p1, p1, Ll/tm90;->b:Lv/VText;

    .line 7
    .line 8
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ipe;->y:Ll/tm90;

    .line 14
    .line 15
    iget-object p1, p1, Ll/tm90;->c:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ipe;->y:Ll/tm90;

    .line 21
    .line 22
    iget-object p1, p1, Ll/tm90;->d:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/ipe;->y:Ll/tm90;

    .line 28
    .line 29
    iget-object p1, p1, Ll/tm90;->f:Lv/VText;

    .line 30
    .line 31
    new-instance v0, Ll/gpe;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/gpe;-><init>(Ll/ipe;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ipe;->y:Ll/tm90;

    .line 40
    .line 41
    iget-object p1, p1, Ll/tm90;->g:Lv/VText;

    .line 42
    .line 43
    new-instance v0, Ll/hpe;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/hpe;-><init>(Ll/ipe;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ipe;->y:Ll/tm90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1, p1}, Ll/tm90;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/ipe;->y:Ll/tm90;

    .line 16
    .line 17
    iget-object v1, v0, Ll/tm90;->a:Lv/VLinear_Dividers;

    .line 18
    .line 19
    iput-object v1, p0, Ll/tya0;->u:Lv/VLinear_Dividers;

    .line 20
    .line 21
    iget-object v1, v0, Ll/tm90;->c:Lv/VText;

    .line 22
    .line 23
    iput-object v1, p0, Ll/tya0;->w:Lv/VText;

    .line 24
    .line 25
    iget-object v0, v0, Ll/tm90;->d:Lv/VText;

    .line 26
    .line 27
    iput-object v0, p0, Ll/tya0;->x:Lv/VText;

    .line 28
    .line 29
    return-object p1
.end method
