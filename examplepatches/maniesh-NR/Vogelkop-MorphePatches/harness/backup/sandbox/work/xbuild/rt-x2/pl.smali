.class public final synthetic Lpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsl;


# direct methods
.method public synthetic constructor <init>(Lsl;B)V
    .registers 3

    iput-byte p2, p0, Lpl;->a:B

    iput-object p1, p0, Lpl;->b:Lsl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    iget-byte v0, p0, Lpl;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lpl;->b:Lsl;

    packed-switch v0, :pswitch_data_8c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    new-instance v3, Lqxh;

    const-string v4, "Start recording a video and continue when ready."

    invoke-direct {v3, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v4, Lql;

    invoke-direct {v4, p0, p1, v2}, Lql;-><init>(Lsl;Landroid/content/Context;B)V

    new-instance v5, Lql;

    invoke-direct {v5, p0, p1, v1}, Lql;-><init>(Lsl;Landroid/content/Context;B)V

    new-instance p0, Lgkj;

    invoke-direct {p0, v2, v2}, Lnz0;-><init>(ZZ)V

    const-string p1, "Sync and restart"

    iput-object p1, p0, Lgkj;->a:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lgkj;->b:Ljava/lang/String;

    const-string v6, "Sync"

    iput-object v6, p0, Lgkj;->c:Ljava/lang/String;

    const-string v6, "Prepare sync"

    iput-object v6, p0, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object p1, p0, Lgkj;->e:Lekj;

    iput-object p1, p0, Lgkj;->f:Lfkj;

    iput-object p1, p0, Lgkj;->g:Lqp2;

    iput-object v4, p0, Lgkj;->h:Ldkj;

    iput-object p1, p0, Lgkj;->i:Ldkj;

    iput-object v5, p0, Lgkj;->j:Lql;

    iput v2, p0, Lgkj;->k:I

    iput v2, p0, Lgkj;->l:I

    iput v2, p0, Lgkj;->m:I

    iput-boolean v1, p0, Lgkj;->n:Z

    iput-object v3, p0, Lgkj;->o:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {v0, p0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_55
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lsl;->d:Lwy;

    new-instance v2, Lnl;

    invoke-direct {v2, p0, v1}, Lnl;-><init>(Lsl;B)V

    invoke-virtual {v0, p1, v2}, Lwy;->S(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_64
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lsl;->d:Lwy;

    invoke-virtual {v0}, Lwy;->R()V

    iget-object v1, p0, Lsl;->f:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "sync_timestamp"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v1, Lnl;

    invoke-direct {v1, p0, v2}, Lnl;-><init>(Lsl;B)V

    invoke-virtual {v0, p1, v1}, Lwy;->S(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_64
        :pswitch_55
    .end packed-switch
.end method
