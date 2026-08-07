.class public final synthetic Ll/c26;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/pcj;

.field public final synthetic b:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c26;->a:Ll/pcj;

    iput-object p2, p0, Ll/c26;->b:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c26;->a:Ll/pcj;

    iget-object p0, p0, Ll/c26;->b:Landroid/net/Uri;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/e26;->a(Ll/pcj;Landroid/net/Uri;Ll/gcg0;)V

    return-void
.end method
