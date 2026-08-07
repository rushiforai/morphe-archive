.class public final Ll/dps0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/klw0;->k(Landroid/content/Context;)Ll/klw0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/klw0;->l()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/llw0;->j(Landroid/content/Context;)Ll/llw0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/llw0;->k()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception p0

    .line 27
    const-string p1, "DefaultGmsgHandlers.ResetPaid"

    .line 28
    .line 29
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2, p0, p1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
