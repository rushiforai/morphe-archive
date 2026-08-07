.class public final synthetic Ll/l65;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/m65;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Greeting;


# direct methods
.method public synthetic constructor <init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l65;->a:Ll/m65;

    iput-object p2, p0, Ll/l65;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l65;->a:Ll/m65;

    iget-object p0, p0, Ll/l65;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-static {v0, p0}, Ll/m65;->G(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method
