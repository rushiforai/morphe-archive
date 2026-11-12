.class public final synthetic Lgol;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhol;


# direct methods
.method public synthetic constructor <init>(Lhol;B)V
    .registers 3

    iput-byte p2, p0, Lgol;->a:B

    iput-object p1, p0, Lgol;->b:Lhol;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lgol;->a:B

    iget-object p0, p0, Lgol;->b:Lhol;

    packed-switch v0, :pswitch_data_4c

    iget-object p0, p0, Lhol;->a:Lfol;

    iget-object p0, p0, Lfol;->a:Ljava/lang/String;

    invoke-static {p0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lhol;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3c

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    const/4 p0, 0x0

    goto :goto_3d

    :cond_3c
    const/4 p0, 0x1

    :goto_3d
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_42
    iget-object p0, p0, Lhol;->a:Lfol;

    iget-object p0, p0, Lfol;->a:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_42
        :pswitch_14
    .end packed-switch
.end method
