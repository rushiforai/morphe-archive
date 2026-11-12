.class public final synthetic Lrom;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsom;


# direct methods
.method public synthetic constructor <init>(Lsom;B)V
    .registers 3

    iput-byte p2, p0, Lrom;->a:B

    iput-object p1, p0, Lrom;->b:Lsom;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lrom;->a:B

    const/4 v1, 0x2

    iget-object p0, p0, Lrom;->b:Lsom;

    packed-switch v0, :pswitch_data_3c

    iget-object v0, p0, Lsom;->h:Lcom/opera/android/autofill/PasswordManager;

    new-instance v2, Lilm;

    invoke-direct {v2, p0, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, LJ/N;->MNdH5xQ5(Ljava/lang/Object;)V

    return-void

    :pswitch_16
    const/4 v0, 0x0

    iput-object v0, p0, Lsom;->g:Ljava/lang/Runnable;

    iget-object v0, p0, Lsom;->c:Li53;

    invoke-virtual {v0}, Li53;->d()Z

    move-result v1

    if-eqz v1, :cond_27

    iget-object p0, p0, Lsom;->d:Ldl3;

    invoke-virtual {v0, p0}, Li53;->a(Lql3;)V

    goto :goto_2a

    :cond_27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lsom;->k:Z

    :goto_2a
    return-void

    :pswitch_2b
    new-instance v0, Lcom/opera/android/autofill/PasswordManager;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lsom;->h:Lcom/opera/android/autofill/PasswordManager;

    new-instance v0, Lilm;

    invoke-direct {v0, p0, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, LJ/N;->MNdH5xQ5(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_16
    .end packed-switch
.end method
