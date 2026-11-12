.class public final synthetic Lr2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx79;

.field public final synthetic c:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lx79;Lxbf;B)V
    .registers 4

    iput-byte p3, p0, Lr2g;->a:B

    iput-object p1, p0, Lr2g;->b:Lx79;

    iput-object p2, p0, Lr2g;->c:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 10

    iget-byte v0, p0, Lr2g;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lr2g;->c:Lxbf;

    iget-object p0, p0, Lr2g;->b:Lx79;

    packed-switch v0, :pswitch_data_7c

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_66

    iget-object p1, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p1, Lx79;

    iget-object v0, p1, Lx79;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lx79;->d:Ljava/lang/Object;

    check-cast p1, Lc3g;

    iget-object v5, v4, Lxbf;->b:Ljava/lang/Object;

    check-cast v5, Li32;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Ljbd;

    const/16 v7, 0xc

    invoke-direct {v6, v5, v0, p1, v7}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v6}, Lldk;->f(Ljava/lang/Runnable;)V

    iget-object p1, v4, Lxbf;->f:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lm2g;

    invoke-direct {v0, p1, v3}, Lm2g;-><init>(Lode;B)V

    invoke-virtual {v4, v0}, Lxbf;->i(Lcom/opera/api/Callback;)V

    iget-object p1, v4, Lxbf;->e:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lm2g;

    const/4 v3, 0x2

    invoke-direct {v0, p1, v3}, Lm2g;-><init>(Lode;B)V

    iget-object p1, v4, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Li32;

    new-instance v3, Lj12;

    const/16 v4, 0xb

    invoke-direct {v3, v0, v4}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lq2g;

    invoke-direct {v0, p1, v3, v2}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lldk;->f(Ljava/lang/Runnable;)V

    :cond_66
    iput-object v1, p0, Lx79;->e:Ljava/lang/Object;

    return-void

    :pswitch_69
    check-cast p1, Lx2g;

    if-nez p1, :cond_70

    iput-object v1, p0, Lx79;->e:Ljava/lang/Object;

    goto :goto_7b

    :cond_70
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lr2g;

    invoke-direct {v0, p0, v4, v3}, Lr2g;-><init>(Lx79;Lxbf;B)V

    invoke-virtual {p0, p1, v2, v2, v0}, Lx79;->c0(Lx2g;IZLr2g;)V

    :goto_7b
    return-void

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_69
    .end packed-switch
.end method
