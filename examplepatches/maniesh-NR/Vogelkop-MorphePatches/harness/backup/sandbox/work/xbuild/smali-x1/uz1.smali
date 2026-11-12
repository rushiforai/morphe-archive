.class public final synthetic Luz1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmm9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls02;


# direct methods
.method public synthetic constructor <init>(Ls02;B)V
    .registers 3

    iput-byte p2, p0, Luz1;->a:B

    iput-object p1, p0, Luz1;->b:Ls02;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final X(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 7

    iget-byte p2, p0, Luz1;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    const-string v3, "result_code"

    iget-object p0, p0, Luz1;->b:Ls02;

    packed-switch p2, :pswitch_data_2a

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_13

    move v0, v1

    :cond_13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1b
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_22

    move v0, v1

    :cond_22
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
