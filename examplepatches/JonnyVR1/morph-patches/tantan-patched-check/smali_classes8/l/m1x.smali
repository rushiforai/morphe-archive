.class public final synthetic Ll/m1x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/p1x;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/p1x;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1x;->a:Ll/p1x;

    iput-object p2, p0, Ll/m1x;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m1x;->a:Ll/p1x;

    iget-object p0, p0, Ll/m1x;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Ll/p1x;->k(Ll/p1x;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
