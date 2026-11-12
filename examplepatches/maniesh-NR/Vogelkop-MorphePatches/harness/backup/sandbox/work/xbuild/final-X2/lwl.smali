.class public final synthetic Llwl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:Lle9;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:Lrl;

.field public final synthetic f:Lvk2;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lrl;Lvk2;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llwl;->a:Lle9;

    iput-object p2, p0, Llwl;->b:Ljava/lang/String;

    iput-object p3, p0, Llwl;->c:Ljava/lang/String;

    iput-object p4, p0, Llwl;->d:Ljava/util/List;

    iput-object p5, p0, Llwl;->e:Lrl;

    iput-object p6, p0, Llwl;->f:Lvk2;

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 7

    iget-object v1, p0, Llwl;->a:Lle9;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    const-string v0, "payload"

    iget-object v2, p0, Llwl;->c:Ljava/lang/String;

    invoke-virtual {v4, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Llwl;->d:Ljava/util/List;

    if-eqz v0, :cond_3f

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3f

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    new-instance v3, Lvpb;

    invoke-direct {v3}, Lvpb;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_29

    :cond_39
    const-string v0, "device_ids"

    invoke-virtual {v2, v3, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_40

    :cond_3f
    const/4 v2, 0x0

    :goto_40
    if-eqz v2, :cond_47

    const-string v0, "target"

    invoke-virtual {v4, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_47
    new-instance v0, Lnwl;

    iget-object v2, p0, Llwl;->f:Lvk2;

    iget-object v3, p0, Llwl;->b:Ljava/lang/String;

    iget-object v5, p0, Llwl;->e:Lrl;

    invoke-direct/range {v0 .. v5}, Lnwl;-><init>(Lle9;Lvk2;Ljava/lang/String;Lorb;Lrl;)V

    return-object v0
.end method
