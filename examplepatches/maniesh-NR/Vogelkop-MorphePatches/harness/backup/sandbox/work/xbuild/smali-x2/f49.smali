.class public final synthetic Lf49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lg49;


# direct methods
.method public synthetic constructor <init>(Lg49;B)V
    .registers 3

    iput-byte p2, p0, Lf49;->a:B

    iput-object p1, p0, Lf49;->b:Lg49;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lf49;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lf49;->b:Lg49;

    packed-switch v0, :pswitch_data_46

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    iget-object v0, p0, Lg49;->b:Lm9k;

    iget-object v0, v0, Lm9k;->d:Ll9k;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_30

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2e

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2b

    const/4 v1, 0x3

    if-ne v0, v1, :cond_27

    sget-object v1, Lbh0;->d:Lbh0;

    goto :goto_30

    :cond_27
    invoke-static {}, Lh9o;->p()V

    goto :goto_37

    :cond_2b
    sget-object v1, Lbh0;->c:Lbh0;

    goto :goto_30

    :cond_2e
    sget-object v1, Lbh0;->b:Lbh0;

    :cond_30
    :goto_30
    if-eqz v1, :cond_37

    iget-object p0, p0, Lg49;->c:Lucc;

    invoke-virtual {p0, v1}, Lucc;->a(Ljava/lang/Object;)V

    :cond_37
    :goto_37
    return-void

    :pswitch_38
    iput-object v1, p0, Lg49;->e:Loml;

    iget-object p0, p0, Lg49;->d:Lb7k;

    if-eqz p0, :cond_45

    iget-object p0, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextSwitcher;

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    :cond_45
    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method
