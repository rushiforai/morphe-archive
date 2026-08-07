.class public final synthetic Ll/n1z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/u1z;

.field public final synthetic b:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n1z;->a:Ll/u1z;

    iput-object p2, p0, Ll/n1z;->b:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n1z;->a:Ll/u1z;

    iget-object p0, p0, Ll/n1z;->b:Landroid/net/Uri;

    invoke-static {v0, p0}, Ll/u1z;->r0(Ll/u1z;Landroid/net/Uri;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
