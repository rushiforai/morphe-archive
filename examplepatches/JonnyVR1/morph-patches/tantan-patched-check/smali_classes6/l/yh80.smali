.class public final synthetic Ll/yh80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/ci80;

.field public final synthetic b:Lcom/p1/mobile/putong/data/MessageLocation;


# direct methods
.method public synthetic constructor <init>(Ll/ci80;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yh80;->a:Ll/ci80;

    iput-object p2, p0, Ll/yh80;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yh80;->a:Ll/ci80;

    iget-object p0, p0, Ll/yh80;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {v0, p0}, Ll/ci80;->d(Ll/ci80;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
