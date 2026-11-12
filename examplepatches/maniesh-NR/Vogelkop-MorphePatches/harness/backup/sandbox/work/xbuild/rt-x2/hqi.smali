.class public final synthetic Lhqi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lghf;


# direct methods
.method public synthetic constructor <init>(Lghf;B)V
    .registers 3

    iput-byte p2, p0, Lhqi;->a:B

    iput-object p1, p0, Lhqi;->b:Lghf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lhqi;->a:B

    const-string v1, "sdx_json_data"

    iget-object p0, p0, Lhqi;->b:Lghf;

    check-cast p1, Ljava/lang/Void;

    packed-switch v0, :pswitch_data_38

    new-instance p1, Ljava/io/File;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-direct {p1, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1d

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_1d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_20
    new-instance p1, Ljava/io/File;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-direct {p1, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_29
    invoke-static {p1}, Ls29;->h(Ljava/io/File;)[B

    move-result-object p0

    new-instance p1, Ljava/lang/String;

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_34} :catch_35

    goto :goto_36

    :catch_35
    const/4 p1, 0x0

    :goto_36
    return-object p1

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
