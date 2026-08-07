.class public final synthetic Ll/lbh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ybh0;


# direct methods
.method public synthetic constructor <init>(Ll/ybh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lbh0;->a:Ll/ybh0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lbh0;->a:Ll/ybh0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0, p1}, Ll/ybh0;->G(Ll/ybh0;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
