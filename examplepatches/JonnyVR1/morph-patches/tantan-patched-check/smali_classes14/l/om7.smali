.class public final synthetic Ll/om7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/om7;->a:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/om7;->a:Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/e;->O4(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
