.class public final synthetic Lp42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt42;


# direct methods
.method public synthetic constructor <init>(Lt42;B)V
    .registers 3

    iput-byte p2, p0, Lp42;->a:B

    iput-object p1, p0, Lp42;->b:Lt42;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lp42;->a:B

    iget-object p0, p0, Lp42;->b:Lt42;

    packed-switch v0, :pswitch_data_86

    check-cast p1, Landroid/content/Intent;

    iget-object p0, p0, Lt42;->v:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11
    move-object v2, p1

    check-cast v2, Lye;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, p0, Lt42;->v:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Lue;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lyw3;

    invoke-direct {v3, v1}, Lyw3;-><init>(Ldx3;)V

    new-instance v4, Lwth;

    invoke-direct {v4, v1}, Lwth;-><init>(Lcom/opera/android/BrowserActivity;)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v5

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object v6, p0, Ld6j;->c:Lx5f;

    new-instance v7, Lrbe;

    const/16 p0, 0x16

    invoke-direct {v7, p0}, Lrbe;-><init>(B)V

    sget-object v8, Lte;->Bo:Lqii;

    invoke-direct/range {v0 .. v8}, Lue;-><init>(Landroid/content/Context;Lye;Livn;Lg1j;Lq6e;Lorm;Ljv0;Lte;)V

    return-object v0

    :pswitch_44
    check-cast p1, Ltsn;

    iget-object v0, p0, Lt42;->w:Lei;

    iget-object p0, p0, Lx22;->l:Lmrn;

    iget-object v0, v0, Lei;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    iget-object v1, p1, Ltsn;->c:Lnsn;

    iget-object p1, p1, Ltsn;->b:Llsn;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_78

    const/4 v2, 0x1

    if-eq v1, v2, :cond_75

    const/4 v2, 0x2

    if-eq v1, v2, :cond_75

    const/4 v2, 0x3

    if-eq v1, v2, :cond_72

    const/4 v2, 0x4

    if-eq v1, v2, :cond_6f

    const/4 v2, 0x5

    if-ne v1, v2, :cond_6a

    sget-object v1, Lnrn;->d:Lnrn;

    goto :goto_7a

    :cond_6a
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    goto :goto_85

    :cond_6f
    sget-object v1, Lnrn;->c:Lnrn;

    goto :goto_7a

    :cond_72
    sget-object v1, Lnrn;->b:Lnrn;

    goto :goto_7a

    :cond_75
    sget-object v1, Lnrn;->a:Lnrn;

    goto :goto_7a

    :cond_78
    sget-object v1, Lnrn;->c:Lnrn;

    :goto_7a
    invoke-virtual {v0, v1}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->d(Lnrn;)V

    invoke-virtual {p0, p1}, Lmrn;->h(Llsn;)V

    invoke-virtual {p0, p1}, Lmrn;->h(Llsn;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_85
    return-object p0

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_44
        :pswitch_11
    .end packed-switch
.end method
