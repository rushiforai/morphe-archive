.class public final synthetic Ll/sw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-boolean p2, p0, Ll/sw9;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-boolean p0, p0, Ll/sw9;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->Z0(Lcom/p1/mobile/putong/feed/api/b;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
