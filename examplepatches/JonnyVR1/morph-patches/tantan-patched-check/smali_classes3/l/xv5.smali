.class public final synthetic Ll/xv5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/rw5;


# direct methods
.method public synthetic constructor <init>(Ll/rw5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xv5;->a:Ll/rw5;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xv5;->a:Ll/rw5;

    invoke-virtual {p0}, Ll/rw5;->d()Lcom/p1/mobile/putong/remote_config/a;

    move-result-object p0

    return-object p0
.end method
