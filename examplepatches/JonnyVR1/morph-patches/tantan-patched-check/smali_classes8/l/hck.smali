.class public final synthetic Ll/hck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hck;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    iput-object p2, p0, Ll/hck;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hck;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    iget-object p0, p0, Ll/hck;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/Throwable;)V

    return-void
.end method
