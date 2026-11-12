.class public final synthetic Lo3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FilenameFilter;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lo3b;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 3

    iget-byte p0, p0, Lo3b;->a:B

    const/4 p1, 0x0

    packed-switch p0, :pswitch_data_26

    const-string p0, "s"

    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_17

    const-string p0, "StoredAds.txt"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    const/4 p1, 0x1

    :cond_17
    return p1

    :pswitch_18
    const-string p0, ".mhtml"

    invoke-virtual {p2, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_1f
    const-string p0, ".html"

    invoke-static {p2, p0, p1}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_18
    .end packed-switch
.end method
