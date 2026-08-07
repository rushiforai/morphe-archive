.class public final synthetic Ll/akk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ikk;


# direct methods
.method public synthetic constructor <init>(Ll/ikk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/akk;->a:Ll/ikk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/akk;->a:Ll/ikk;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1}, Ll/ikk;->l0(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
