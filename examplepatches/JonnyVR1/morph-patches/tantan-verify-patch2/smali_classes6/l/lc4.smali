.class public final synthetic Ll/lc4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/oc4;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Music;


# direct methods
.method public synthetic constructor <init>(Ll/oc4;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lc4;->a:Ll/oc4;

    iput-object p2, p0, Ll/lc4;->b:Lcom/p1/mobile/putong/data/Music;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lc4;->a:Ll/oc4;

    iget-object p0, p0, Ll/lc4;->b:Lcom/p1/mobile/putong/data/Music;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/oc4;->x(Ll/oc4;Lcom/p1/mobile/putong/data/Music;Ll/gcg0;)V

    return-void
.end method
