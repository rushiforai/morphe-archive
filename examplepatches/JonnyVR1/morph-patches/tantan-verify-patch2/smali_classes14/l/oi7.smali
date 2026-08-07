.class public final synthetic Ll/oi7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatGroupMember;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oi7;->a:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oi7;->a:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/e;->g6(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
