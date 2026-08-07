.class public final synthetic Ll/r7k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/d8k0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/d8k0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r7k0;->a:Ll/d8k0;

    iput-object p2, p0, Ll/r7k0;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r7k0;->a:Ll/d8k0;

    iget-object p0, p0, Ll/r7k0;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Ll/d8k0;->Z(Ll/d8k0;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
