.class public final synthetic Lbeb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzdb;


# direct methods
.method public synthetic constructor <init>(Lzdb;B)V
    .registers 3

    iput-byte p2, p0, Lbeb;->a:B

    iput-object p1, p0, Lbeb;->b:Lzdb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lbeb;->a:B

    const/4 v1, 0x2

    iget-object p0, p0, Lbeb;->b:Lzdb;

    check-cast p1, Lsm8;

    packed-switch v0, :pswitch_data_32

    iget-byte v0, p1, Lsm8;->a:B

    iget-object v2, p1, Lsm8;->c:Ltm8;

    const/4 v3, 0x1

    if-eq v0, v3, :cond_19

    if-ne v0, v1, :cond_20

    iget-object p1, p1, Lsm8;->d:Lorg/chromium/url/GURL;

    invoke-virtual {p0, p1, v2}, Lzdb;->c(Lorg/chromium/url/GURL;Ltm8;)V

    goto :goto_20

    :cond_19
    iget-boolean p1, p1, Lsm8;->b:Z

    iget-object v0, v2, Ltm8;->a:Lorg/chromium/url/GURL;

    invoke-virtual {p0, v0, p1}, Lzdb;->i(Lorg/chromium/url/GURL;Z)V

    :cond_20
    :goto_20
    return-void

    :pswitch_21
    iget-object p0, p0, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_30

    iget-byte v0, p1, Lsm8;->a:B

    if-ne v0, v1, :cond_2c

    iget-object p1, p1, Lsm8;->d:Lorg/chromium/url/GURL;

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    :goto_2d
    invoke-static {p0, p1}, LJ/N;->MzEZdCyU(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_30
    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
