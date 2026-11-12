.class public final synthetic Lzr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/startup/ContentWrapperLayout;

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/startup/ContentWrapperLayout;Landroid/widget/TextView;B)V
    .registers 4

    iput-byte p3, p0, Lzr5;->a:B

    iput-object p1, p0, Lzr5;->b:Lcom/opera/android/startup/ContentWrapperLayout;

    iput-object p2, p0, Lzr5;->c:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lzr5;->a:B

    iget-object v1, p0, Lzr5;->c:Landroid/widget/TextView;

    iget-object p0, p0, Lzr5;->b:Lcom/opera/android/startup/ContentWrapperLayout;

    packed-switch v0, :pswitch_data_52

    sget v0, Lcom/opera/android/startup/ContentWrapperLayout;->e:I

    iget-object v0, p0, Lcom/opera/android/startup/ContentWrapperLayout;->d:Lkl0;

    if-eqz v0, :cond_2c

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->g:Lwsf;

    iget-object p0, p0, Lcom/opera/android/startup/ContentWrapperLayout;->d:Lkl0;

    new-instance v1, Lvsf;

    const/4 v2, 0x0

    invoke-direct {v1, v0, p0, v2}, Lvsf;-><init>(Lwsf;Lkl0;B)V

    invoke-virtual {v0, v1}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    :cond_2c
    return-void

    :pswitch_2d
    sget v0, Lcom/opera/android/startup/ContentWrapperLayout;->e:I

    iget-object v0, p0, Lcom/opera/android/startup/ContentWrapperLayout;->d:Lkl0;

    if-eqz v0, :cond_50

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->g:Lwsf;

    iget-object p0, p0, Lcom/opera/android/startup/ContentWrapperLayout;->d:Lkl0;

    new-instance v1, Lvsf;

    const/4 v2, 0x1

    invoke-direct {v1, v0, p0, v2}, Lvsf;-><init>(Lwsf;Lkl0;B)V

    invoke-virtual {v0, v1}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    :cond_50
    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
