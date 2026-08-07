.class public final synthetic Ll/n1x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p1x;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/p1x;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n1x;->a:Ll/p1x;

    iput-object p2, p0, Ll/n1x;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n1x;->a:Ll/p1x;

    iget-object p0, p0, Ll/n1x;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/p1x;->n(Ll/p1x;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method
