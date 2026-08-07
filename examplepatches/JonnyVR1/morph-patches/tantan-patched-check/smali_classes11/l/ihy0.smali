.class public final synthetic Ll/ihy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/tar0;

.field public final synthetic b:Landroid/net/Uri;

.field public final synthetic c:Ll/p1m;


# direct methods
.method public synthetic constructor <init>(Ll/tar0;Landroid/net/Uri;Ll/p1m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ihy0;->a:Ll/tar0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ihy0;->b:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ihy0;->c:Ll/p1m;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ihy0;->a:Ll/tar0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ihy0;->b:Landroid/net/Uri;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ihy0;->c:Ll/p1m;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/tar0;->U8(Landroid/net/Uri;Ll/p1m;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
