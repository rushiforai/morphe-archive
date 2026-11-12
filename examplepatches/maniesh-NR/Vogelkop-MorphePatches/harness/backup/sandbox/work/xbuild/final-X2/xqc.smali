.class public final synthetic Lxqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzqc;


# direct methods
.method public synthetic constructor <init>(Lzqc;B)V
    .registers 3

    iput-byte p2, p0, Lxqc;->a:B

    iput-object p1, p0, Lxqc;->b:Lzqc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lxqc;->a:B

    iget-object p0, p0, Lxqc;->b:Lzqc;

    packed-switch v0, :pswitch_data_48

    new-instance v0, Lwll;

    iget-object p0, p0, Lzqc;->a:Ldx3;

    invoke-direct {v0, p0}, Lwll;-><init>(Ldx3;)V

    return-object v0

    :pswitch_f
    new-instance v1, Lvrc;

    iget-object v2, p0, Lzqc;->a:Ldx3;

    iget-object v0, p0, Lzqc;->b:Ldw3;

    iget-object v0, v0, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object v4, p0, Lzqc;->c:Lj4c;

    iget-object v5, p0, Lzqc;->d:Ldw3;

    iget-object v0, p0, Lzqc;->e:Ldw3;

    invoke-virtual {v0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lorm;

    iget-object v7, p0, Lzqc;->h:Lwyn;

    new-instance v8, Lvx;

    const/16 v0, 0x17

    invoke-direct {v8, p0, v0}, Lvx;-><init>(Ljava/lang/Object;B)V

    iget-object v9, p0, Lzqc;->j:Ldw3;

    iget-object v10, p0, Lzqc;->k:Ldw3;

    iget-object v11, p0, Lzqc;->l:Ldw3;

    iget-object v12, p0, Lzqc;->m:Ldw3;

    invoke-direct/range {v1 .. v12}, Lvrc;-><init>(Ldx3;Lcom/opera/android/settings/SettingsManager;Lj4c;Ldw3;Lorm;Lwyn;Lvx;Ldw3;Ldw3;Ldw3;Ldw3;)V

    return-object v1

    :pswitch_3d
    new-instance v0, Lsqc;

    iget-object v1, p0, Lzqc;->a:Ldx3;

    iget-object p0, p0, Lzqc;->i:Lumi;

    invoke-direct {v0, v1, p0}, Lsqc;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_f
    .end packed-switch
.end method
