.class public final Lrlp;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lrlp;->i:B

    iput-object p1, p0, Lrlp;->j:Ljava/lang/Object;

    iput-object p2, p0, Lrlp;->k:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lrlp;->i:B

    iget-object v1, p0, Lrlp;->j:Ljava/lang/Object;

    iget-object p0, p0, Lrlp;->k:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    check-cast p0, Lylp;

    check-cast v1, Lpro;

    iget-object v0, v1, Lpro;->h:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1b

    invoke-static {v0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_19

    move-object v0, v1

    :cond_19
    if-nez v0, :cond_1f

    :cond_1b
    iget-object v0, p0, Lylp;->z:Liio;

    iget-object v0, v0, Liio;->b:Ljava/lang/String;

    :cond_1f
    new-instance v2, Lyjo;

    iget-object p0, p0, Lvoo;->x:Ljava/io/File;

    if-eqz p0, :cond_26

    move-object v1, p0

    :cond_26
    const-string p0, "index.html"

    invoke-direct {v2, v1, p0, v0}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :pswitch_2c
    check-cast v1, Lgzo;

    check-cast p0, Ljava/lang/String;

    iget-object v0, v1, Lgzo;->a:Ljava/util/Map;

    sget-object v1, Lgzo;->b:Lkotlin/text/Regex;

    new-instance v2, Lcno;

    const/4 v3, 0x7

    invoke-direct {v2, v0, v3}, Lcno;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p0, v2}, Lkotlin/text/Regex;->k(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method
