.class public final synthetic Ll/i440;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DoublePair;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/data/DoublePair;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i440;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/i440;->b:Lcom/p1/mobile/putong/data/DoublePair;

    iput-object p3, p0, Ll/i440;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i440;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, p0, Ll/i440;->b:Lcom/p1/mobile/putong/data/DoublePair;

    iget-object p0, p0, Ll/i440;->c:Ljava/util/List;

    check-cast p1, Ll/z80;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/b;->e1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/data/DoublePair;Ljava/util/List;Ll/z80;)V

    return-void
.end method
