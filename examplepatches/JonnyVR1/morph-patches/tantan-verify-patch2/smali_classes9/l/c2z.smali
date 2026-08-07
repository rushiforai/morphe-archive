.class public final synthetic Ll/c2z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/d3z;

.field public final synthetic b:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Ll/d3z;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2z;->a:Ll/d3z;

    iput-object p2, p0, Ll/c2z;->b:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c2z;->a:Ll/d3z;

    iget-object p0, p0, Ll/c2z;->b:Landroid/net/Uri;

    invoke-static {v0, p0}, Ll/d3z;->K(Ll/d3z;Landroid/net/Uri;)V

    return-void
.end method
