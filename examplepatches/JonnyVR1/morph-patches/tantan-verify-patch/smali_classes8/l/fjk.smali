.class public final synthetic Ll/fjk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fjk;->a:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fjk;->a:Lcom/p1/mobile/putong/core/data/ChatGroup;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/ijk;->i0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
