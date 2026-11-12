.class public final Lzmo;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lwjh;


# direct methods
.method public synthetic constructor <init>(Lwjh;B)V
    .registers 3

    iput-byte p2, p0, Lzmo;->i:B

    iput-object p1, p0, Lzmo;->j:Lwjh;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lzmo;->i:B

    iget-object p0, p0, Lzmo;->j:Lwjh;

    packed-switch v0, :pswitch_data_24

    new-instance v0, Lyjo;

    iget-object p0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    const-string v1, "mraid.js"

    const-string v2, "https://img-odx.op-mobile.opera.com/a/js/mraid.js"

    invoke-direct {v0, p0, v1, v2}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :pswitch_15
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
