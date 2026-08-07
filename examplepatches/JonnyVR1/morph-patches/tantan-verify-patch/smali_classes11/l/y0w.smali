.class public final synthetic Ll/y0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/internal/CallbackManagerImpl$a;


# instance fields
.field public final synthetic a:Ll/z0w;

.field public final synthetic b:Ll/tvf;


# direct methods
.method public synthetic constructor <init>(Ll/z0w;Ll/tvf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y0w;->a:Ll/z0w;

    iput-object p2, p0, Ll/y0w;->b:Ll/tvf;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0w;->a:Ll/z0w;

    iget-object p0, p0, Ll/y0w;->b:Ll/tvf;

    invoke-static {v0, p0, p1, p2}, Ll/z0w;->a(Ll/z0w;Ll/tvf;ILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
