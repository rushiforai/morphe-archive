.class public final synthetic Lhhb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llhb;


# direct methods
.method public synthetic constructor <init>(Llhb;B)V
    .registers 3

    iput-byte p2, p0, Lhhb;->a:B

    iput-object p1, p0, Lhhb;->b:Llhb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lhhb;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lhhb;->b:Llhb;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Ls50;

    iput-boolean v1, p0, Llhb;->j:Z

    iput-object p1, p0, Llhb;->i:Ls50;

    iput-boolean v1, p0, Llhb;->k:Z

    return-void

    :pswitch_11
    check-cast p1, Lyz;

    iput-boolean v1, p0, Llhb;->j:Z

    iget-object v0, p0, Llhb;->h:Lyz;

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Lyz;->c()V

    goto :goto_1f

    :cond_1d
    iput-object p1, p0, Llhb;->h:Lyz;

    :goto_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
