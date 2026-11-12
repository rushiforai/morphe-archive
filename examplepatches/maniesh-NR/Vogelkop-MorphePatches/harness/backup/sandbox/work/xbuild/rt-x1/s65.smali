.class public final synthetic Ls65;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx65;


# direct methods
.method public synthetic constructor <init>(Lx65;B)V
    .registers 3

    iput-byte p2, p0, Ls65;->a:B

    iput-object p1, p0, Ls65;->b:Lx65;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Ls65;->a:B

    iget-object p0, p0, Ls65;->b:Lx65;

    packed-switch v0, :pswitch_data_3a

    check-cast p1, Ljava/lang/Runnable;

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    iput-object p1, p0, Lx65;->A:Ljava/lang/Runnable;

    invoke-virtual {p0}, Lx65;->l0()V

    return-void

    :pswitch_11
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-boolean v0, p0, Lx65;->C:Z

    if-nez v0, :cond_39

    const/4 v1, 0x1

    if-eqz p1, :cond_24

    iput-boolean v1, p0, Lx65;->x:Z

    invoke-virtual {p0}, Lx65;->m0()V

    goto :goto_39

    :cond_24
    iput-boolean v1, p0, Lx65;->y:Z

    if-nez v0, :cond_39

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getHost()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isStateSaved()Z

    move-result p1

    if-nez p1, :cond_39

    sget-object p1, Lyim;->c:Lyim;

    invoke-virtual {p0, p1}, Lx65;->n0(Lyim;)V

    :cond_39
    :goto_39
    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
