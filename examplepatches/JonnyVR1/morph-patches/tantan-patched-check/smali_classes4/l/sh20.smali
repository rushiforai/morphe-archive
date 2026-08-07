.class public final synthetic Ll/sh20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/th20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Ll/th20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sh20;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/sh20;->b:Ll/th20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sh20;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/sh20;->b:Ll/th20;

    invoke-static {v0, p0}, Ll/th20$a;->c(Lcom/p1/mobile/putong/data/User;Ll/th20;)V

    return-void
.end method
