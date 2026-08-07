.class public final synthetic Ll/cnk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jnk;


# direct methods
.method public synthetic constructor <init>(Ll/jnk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cnk;->a:Ll/jnk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cnk;->a:Ll/jnk;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1}, Ll/jnk;->e0(Ll/jnk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
