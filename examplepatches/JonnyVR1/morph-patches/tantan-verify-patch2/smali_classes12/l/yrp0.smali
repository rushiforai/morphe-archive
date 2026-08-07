.class public final synthetic Ll/yrp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ivl;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Landroid/webkit/SslErrorHandler;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/net/URI;

.field public final synthetic i:Landroid/webkit/WebView;


# direct methods
.method public synthetic constructor <init>(Ll/ivl;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/SslErrorHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URI;Landroid/webkit/WebView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yrp0;->a:Ll/ivl;

    iput-object p2, p0, Ll/yrp0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/yrp0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/yrp0;->d:Landroid/webkit/SslErrorHandler;

    iput-object p5, p0, Ll/yrp0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/yrp0;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/yrp0;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/yrp0;->h:Ljava/net/URI;

    iput-object p9, p0, Ll/yrp0;->i:Landroid/webkit/WebView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/yrp0;->a:Ll/ivl;

    iget-object v1, p0, Ll/yrp0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/yrp0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/yrp0;->d:Landroid/webkit/SslErrorHandler;

    iget-object v4, p0, Ll/yrp0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/yrp0;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/yrp0;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/yrp0;->h:Ljava/net/URI;

    iget-object v8, p0, Ll/yrp0;->i:Landroid/webkit/WebView;

    invoke-static/range {v0 .. v8}, Ll/zrp0;->a(Ll/ivl;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/SslErrorHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URI;Landroid/webkit/WebView;)V

    return-void
.end method
