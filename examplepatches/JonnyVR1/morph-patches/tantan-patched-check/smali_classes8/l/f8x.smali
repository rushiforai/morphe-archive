.class public final synthetic Ll/f8x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k8x;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/k8x;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f8x;->a:Ll/k8x;

    iput-object p2, p0, Ll/f8x;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f8x;->a:Ll/k8x;

    iget-object p0, p0, Ll/f8x;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/k8x;->e0(Ll/k8x;Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V

    return-void
.end method
