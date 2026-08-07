.class public final synthetic Ll/t7k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/d8k0;

.field public final synthetic b:Ll/vak0;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/d8k0;Ll/vak0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t7k0;->a:Ll/d8k0;

    iput-object p2, p0, Ll/t7k0;->b:Ll/vak0;

    iput-object p3, p0, Ll/t7k0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t7k0;->a:Ll/d8k0;

    iget-object v1, p0, Ll/t7k0;->b:Ll/vak0;

    iget-object p0, p0, Ll/t7k0;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0}, Ll/d8k0;->N(Ll/d8k0;Ll/vak0;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
