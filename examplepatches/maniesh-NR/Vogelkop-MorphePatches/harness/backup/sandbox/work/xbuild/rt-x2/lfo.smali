.class public final synthetic Llfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsfo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V
    .registers 9

    iput-byte p8, p0, Llfo;->a:B

    iput-object p1, p0, Llfo;->b:Lsfo;

    iput-object p2, p0, Llfo;->c:Ljava/lang/String;

    iput-object p3, p0, Llfo;->d:Ljava/lang/String;

    iput-object p4, p0, Llfo;->e:Ljava/lang/String;

    iput-object p5, p0, Llfo;->f:Ljava/lang/String;

    iput-object p6, p0, Llfo;->g:Ljava/lang/String;

    iput-object p7, p0, Llfo;->h:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Llfo;->a:B

    packed-switch v0, :pswitch_data_58

    move-object v9, p1

    check-cast v9, Lspa;

    sget-object p1, Lapa;->b:Lapa;

    const-string p1, "DELETE"

    invoke-static {p1}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object p1

    iput-object p1, v9, Lspa;->b:Lapa;

    new-instance v1, Lmfo;

    const/4 v10, 0x1

    iget-object v2, p0, Llfo;->b:Lsfo;

    iget-object v3, p0, Llfo;->c:Ljava/lang/String;

    iget-object v4, p0, Llfo;->d:Ljava/lang/String;

    iget-object v5, p0, Llfo;->e:Ljava/lang/String;

    iget-object v6, p0, Llfo;->f:Ljava/lang/String;

    iget-object v7, p0, Llfo;->g:Ljava/lang/String;

    iget-object v8, p0, Llfo;->h:Ljava/lang/String;

    invoke-direct/range {v1 .. v10}, Lmfo;-><init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lspa;B)V

    iget-object p0, v9, Lspa;->a:Ltgm;

    invoke-virtual {v1, p0, p0}, Lmfo;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2e
    move-object v8, p1

    check-cast v8, Lspa;

    sget-object p1, Lapa;->b:Lapa;

    const-string p1, "PUT"

    invoke-static {p1}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object p1

    iput-object p1, v8, Lspa;->b:Lapa;

    new-instance v0, Lmfo;

    const/4 v9, 0x0

    iget-object v1, p0, Llfo;->b:Lsfo;

    iget-object v2, p0, Llfo;->c:Ljava/lang/String;

    iget-object v3, p0, Llfo;->d:Ljava/lang/String;

    iget-object v4, p0, Llfo;->e:Ljava/lang/String;

    iget-object v5, p0, Llfo;->f:Ljava/lang/String;

    iget-object v6, p0, Llfo;->g:Ljava/lang/String;

    iget-object v7, p0, Llfo;->h:Ljava/lang/String;

    invoke-direct/range {v0 .. v9}, Lmfo;-><init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lspa;B)V

    iget-object p0, v8, Lspa;->a:Ltgm;

    invoke-virtual {v0, p0, p0}, Lmfo;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
