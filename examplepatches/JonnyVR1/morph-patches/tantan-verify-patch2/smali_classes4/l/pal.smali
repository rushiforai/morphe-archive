.class public final synthetic Ll/pal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pal;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pal;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->h5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
