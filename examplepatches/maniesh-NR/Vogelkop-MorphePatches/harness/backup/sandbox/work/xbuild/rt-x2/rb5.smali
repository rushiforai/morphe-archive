.class public final synthetic Lrb5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:J

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Livh;Lowh;JLinm;B)V
    .registers 7

    .line 16
    iput-byte p6, p0, Lrb5;->a:B

    iput-object p1, p0, Lrb5;->b:Ljava/lang/Object;

    iput-object p2, p0, Lrb5;->c:Ljava/lang/Object;

    iput-wide p3, p0, Lrb5;->d:J

    iput-object p5, p0, Lrb5;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ltid;Lzid;[BJ)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lrb5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrb5;->b:Ljava/lang/Object;

    iput-object p2, p0, Lrb5;->c:Ljava/lang/Object;

    iput-object p3, p0, Lrb5;->e:Ljava/lang/Object;

    iput-wide p4, p0, Lrb5;->d:J

    return-void
.end method

.method public synthetic constructor <init>(Lwyd;JLandroid/net/Uri;Llq3;)V
    .registers 7

    .line 15
    const/4 v0, 0x3

    iput-byte v0, p0, Lrb5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrb5;->b:Ljava/lang/Object;

    iput-wide p2, p0, Lrb5;->d:J

    iput-object p4, p0, Lrb5;->c:Ljava/lang/Object;

    iput-object p5, p0, Lrb5;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    iget-byte v0, p0, Lrb5;->a:B

    iget-object v1, p0, Lrb5;->e:Ljava/lang/Object;

    iget-object v2, p0, Lrb5;->c:Ljava/lang/Object;

    iget-wide v3, p0, Lrb5;->d:J

    iget-object p0, p0, Lrb5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_98

    check-cast p0, Lwyd;

    check-cast v2, Landroid/net/Uri;

    check-cast v1, Llq3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v1, Llq3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iget-byte v1, v1, Llq3;->b:B

    iget-object v5, p0, Lwyd;->c:Lglh;

    const/4 v6, 0x0

    if-eqz v1, :cond_42

    const/4 v7, 0x1

    if-eq v1, v7, :cond_35

    const/4 v6, 0x2

    if-ne v1, v6, :cond_53

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lhpd;

    const/4 v6, 0x7

    invoke-direct {v1, p0, v2, v6}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v1, v0, v3, v4}, Lglh;->h(Ljava/lang/Runnable;Ljava/lang/String;J)V

    goto :goto_53

    :cond_35
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Luyd;

    invoke-direct {v1, p0, v6}, Luyd;-><init>(Lwyd;B)V

    invoke-virtual {v5, v1, v0, v3, v4}, Lglh;->h(Ljava/lang/Runnable;Ljava/lang/String;J)V

    goto :goto_53

    :cond_42
    iget-object v0, p0, Lwyd;->e:Ljava/util/HashSet;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v0, Ltyd;

    invoke-direct {v0, p0, v6}, Ltyd;-><init>(Lwyd;B)V

    invoke-virtual {v5, v0}, Lglh;->f(Lcom/opera/api/Callback;)V

    :cond_53
    :goto_53
    return-void

    :pswitch_54
    check-cast p0, Ltid;

    check-cast v2, Lzid;

    check-cast v1, [B

    if-nez v2, :cond_62

    invoke-static {v1}, Lzid;->a([B)Ljava/lang/String;

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    goto :goto_83

    :cond_62
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    filled-new-array {v2, v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "ExpirationUpdate(%s): %tF %tT"

    invoke-static {v5, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    iget-object p0, p0, Ltid;->a:Lorg/chromium/media/MediaDrmBridge;

    sget-object v0, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    iget-object v0, v2, Lzid;->a:[B

    new-instance v1, Lpid;

    invoke-direct {v1, v0, v3, v4}, Lpid;-><init>([BJ)V

    invoke-virtual {p0, v1}, Lorg/chromium/media/MediaDrmBridge;->m(Lvid;)V

    :goto_83
    return-void

    :pswitch_84
    check-cast p0, Livh;

    check-cast v2, Lowh;

    check-cast v1, Lx61;

    invoke-interface {p0, v2, v3, v4, v1}, Livh;->n(Lowh;JLx61;)V

    return-void

    :pswitch_8e
    check-cast p0, Livh;

    check-cast v2, Lowh;

    check-cast v1, Lhwh;

    invoke-interface {p0, v2, v3, v4, v1}, Livh;->t(Lowh;JLhwh;)V

    return-void

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_8e
        :pswitch_84
        :pswitch_54
    .end packed-switch
.end method
