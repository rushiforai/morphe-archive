.class public final synthetic Ll/x0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/internal/CallbackManagerImpl$a;


# instance fields
.field public final synthetic a:Ll/z0w;


# direct methods
.method public synthetic constructor <init>(Ll/z0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x0w;->a:Ll/z0w;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0w;->a:Ll/z0w;

    invoke-static {p0, p1, p2}, Ll/z0w;->b(Ll/z0w;ILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
