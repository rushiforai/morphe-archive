.class public final synthetic Ltdo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwdo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lwdo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V
    .registers 8

    iput-byte p7, p0, Ltdo;->a:B

    iput-object p1, p0, Ltdo;->b:Lwdo;

    iput-object p2, p0, Ltdo;->c:Ljava/lang/String;

    iput-object p3, p0, Ltdo;->d:Ljava/lang/String;

    iput-object p4, p0, Ltdo;->e:Ljava/lang/String;

    iput-object p5, p0, Ltdo;->f:Ljava/lang/String;

    iput-object p6, p0, Ltdo;->g:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Ltdo;->a:B

    const-string v1, "event_id"

    const-string v2, "user_id"

    const-string v3, "lang"

    const-string v4, "country"

    const-string v5, "product"

    const-string v6, "subscribe"

    iget-object v7, p0, Ltdo;->g:Ljava/lang/String;

    iget-object v8, p0, Ltdo;->f:Ljava/lang/String;

    iget-object v9, p0, Ltdo;->e:Ljava/lang/String;

    iget-object v10, p0, Ltdo;->d:Ljava/lang/String;

    iget-object v11, p0, Ltdo;->c:Ljava/lang/String;

    iget-object p0, p0, Ltdo;->b:Lwdo;

    check-cast p1, Lspa;

    packed-switch v0, :pswitch_data_7a

    sget-object v0, Lapa;->b:Lapa;

    const-string v0, "DELETE"

    invoke-static {v0}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v0

    iput-object v0, p1, Lspa;->b:Lapa;

    iget-object v0, p1, Lspa;->a:Ltgm;

    iget-object p0, p0, Lwdo;->a:Ljava/lang/String;

    invoke-static {p0, v6, v0}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-eqz v11, :cond_35

    invoke-static {p1, v5, v11}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_35
    if-eqz v10, :cond_3a

    invoke-static {p1, v4, v10}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3a
    if-eqz v9, :cond_3f

    invoke-static {p1, v3, v9}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3f
    if-eqz v8, :cond_44

    invoke-static {p1, v2, v8}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_44
    if-eqz v7, :cond_49

    invoke-static {p1, v1, v7}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_49
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4c
    sget-object v0, Lapa;->b:Lapa;

    const-string v0, "POST"

    invoke-static {v0}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v0

    iput-object v0, p1, Lspa;->b:Lapa;

    iget-object v0, p1, Lspa;->a:Ltgm;

    iget-object p0, p0, Lwdo;->a:Ljava/lang/String;

    invoke-static {p0, v6, v0}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-eqz v11, :cond_62

    invoke-static {p1, v5, v11}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_62
    if-eqz v10, :cond_67

    invoke-static {p1, v4, v10}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_67
    if-eqz v9, :cond_6c

    invoke-static {p1, v3, v9}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6c
    if-eqz v8, :cond_71

    invoke-static {p1, v2, v8}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_71
    if-eqz v7, :cond_76

    invoke-static {p1, v1, v7}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_76
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_4c
    .end packed-switch
.end method
