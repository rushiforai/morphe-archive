.class public final synthetic Ll/uuz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uuz;->a:Ll/tvz;

    iput-object p2, p0, Ll/uuz;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uuz;->a:Ll/tvz;

    iget-object p0, p0, Ll/uuz;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/tvz;->W7(Ll/tvz;Lcom/p1/mobile/putong/data/User;Ll/pf60;)V

    return-void
.end method
