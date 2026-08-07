.class public final synthetic Ll/rd8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sd8;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/sd8;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rd8;->a:Ll/sd8;

    iput-object p2, p0, Ll/rd8;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rd8;->a:Ll/sd8;

    iget-object p0, p0, Ll/rd8;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Ll/sd8;->k3(Ll/sd8;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
