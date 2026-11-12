.class public final synthetic Lql;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsl;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lsl;Landroid/content/Context;B)V
    .registers 4

    iput-byte p3, p0, Lql;->a:B

    iput-object p1, p0, Lql;->b:Lsl;

    iput-object p2, p0, Lql;->c:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-byte v0, p0, Lql;->a:B

    const/4 v1, 0x6

    iget-object v2, p0, Lql;->c:Landroid/content/Context;

    iget-object p0, p0, Lql;->b:Lsl;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_3a

    new-instance v0, Lxa;

    const/4 v4, 0x3

    invoke-direct {v0, p0, v2, v4}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lam;

    new-instance v5, Lc4;

    invoke-direct {v5, p0, v1}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v5, v0}, Lam;-><init>(Lc4;Ljava/lang/Runnable;)V

    invoke-static {v4, v3}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v2}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_23
    new-instance v0, Lrl;

    invoke-direct {v0, p0, v3}, Lrl;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lam;

    new-instance v5, Lc4;

    invoke-direct {v5, p0, v1}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v5, v0}, Lam;-><init>(Lc4;Ljava/lang/Runnable;)V

    invoke-static {v4, v3}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v2}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
