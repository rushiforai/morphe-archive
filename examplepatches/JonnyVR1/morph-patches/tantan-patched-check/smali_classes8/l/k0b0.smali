.class public final synthetic Ll/k0b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0b0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/k0b0;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iput-object p3, p0, Ll/k0b0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k0b0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/k0b0;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iget-object p0, p0, Ll/k0b0;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0}, Ll/o0b0;->b(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
