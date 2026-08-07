.class public final Ll/cgw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/webkit/WebView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/dgw0;


# direct methods
.method public constructor <init>(Ll/dgw0;Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/cgw0;->a:Landroid/webkit/WebView;

    .line 2
    .line 3
    iput-object p3, p0, Ll/cgw0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/cgw0;->c:Ll/dgw0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cgw0;->a:Landroid/webkit/WebView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cgw0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/dgw0;->i(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method
