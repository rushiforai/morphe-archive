.class public final Lnicoid/network238/NetworkInit;
.super Ljava/lang/Object;


# direct methods
.method public static init(Landroid/content/Context;)V
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/OkHttp;->INSTANCE:Lnicoid/network238/okhttp3/OkHttp;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/OkHttp;->initialize(Landroid/content/Context;)V

    return-void
.end method
