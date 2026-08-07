.class public Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/spy/SpyDialogView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;
.source "SourceFile"

# interfaces
.implements Ll/iul;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings<",
        "Ll/tzf0;",
        ">;",
        "Ll/iul;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/spy/SpyDialogView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/spy/SpyDialogView;->j(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/tzf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tzf0;->K3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/ngn0;)V
    .locals 1
    .param p1    # Ll/ngn0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->d:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ll/uzf0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/uzf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/spy/SpyDialogView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->d:Lv/VText;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->c:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sget v0, Ll/qa00;->y:I

    .line 24
    .line 25
    sub-int/2addr p1, v0

    .line 26
    int-to-float p1, p1

    .line 27
    const v0, 0x3f098d60

    .line 28
    .line 29
    .line 30
    mul-float/2addr p1, v0

    .line 31
    float-to-int p1, p1

    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/i6t;

    .line 4
    .line 5
    const-string v0, "undercover"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/ahn0;->f(Ll/i6t;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpyDialogViewBindings;->c:Lv/VDraweeView;

    .line 5
    .line 6
    sget-object v0, Ll/zft;->c:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "context_livingAct"

    .line 9
    .line 10
    invoke-static {v1, p0, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
