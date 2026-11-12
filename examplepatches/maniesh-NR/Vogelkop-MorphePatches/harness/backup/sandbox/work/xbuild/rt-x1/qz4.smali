.class public final Lqz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lype;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqz4;->a:B

    iput-object p1, p0, Lqz4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/url/GURL;)Z
    .registers 4

    iget-byte v0, p0, Lqz4;->a:B

    iget-object p0, p0, Lqz4;->b:Ljava/lang/Object;

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_46

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, LJ/N;->M5iQ0HEB(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lxgf;

    invoke-direct {v0, p1}, Lxgf;-><init>(Ljava/lang/String;)V

    sget-object p1, Llqm;->i:Llqm;

    iput-object p1, v0, Lxgf;->m:Llqm;

    iput-boolean v1, v0, Lxgf;->n:Z

    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    invoke-static {p0, v0}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    :cond_24
    return v1

    :pswitch_25
    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lype;

    invoke-interface {v0, p1}, Lype;->a(Lorg/chromium/url/GURL;)Z

    move-result v0

    if-eqz v0, :cond_2b

    goto :goto_3f

    :cond_3e
    const/4 v1, 0x0

    :goto_3f
    return v1

    :pswitch_40
    check-cast p0, Lrz4;

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->q0(Lorg/chromium/url/GURL;)V

    return v1

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_40
        :pswitch_25
    .end packed-switch
.end method
