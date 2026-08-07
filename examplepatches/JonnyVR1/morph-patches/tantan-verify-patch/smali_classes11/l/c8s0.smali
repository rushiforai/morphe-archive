.class public final synthetic Ll/c8s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Ll/d8s0;

.field public final synthetic b:Ll/v7s0;

.field public final synthetic c:Landroid/webkit/WebView;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/d8s0;Ll/v7s0;Landroid/webkit/WebView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c8s0;->a:Ll/d8s0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c8s0;->b:Ll/v7s0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/c8s0;->c:Landroid/webkit/WebView;

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/c8s0;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c8s0;->a:Ll/d8s0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/d8s0;->e:Ll/f8s0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/c8s0;->b:Ll/v7s0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/c8s0;->c:Landroid/webkit/WebView;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    iget-boolean p0, p0, Ll/c8s0;->d:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, p1, p0}, Ll/f8s0;->d(Ll/v7s0;Landroid/webkit/WebView;Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
