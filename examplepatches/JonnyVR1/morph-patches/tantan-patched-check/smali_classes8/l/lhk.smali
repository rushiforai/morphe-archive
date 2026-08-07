.class public final synthetic Ll/lhk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qhk;


# direct methods
.method public synthetic constructor <init>(Ll/qhk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lhk;->a:Ll/qhk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhk;->a:Ll/qhk;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1}, Ll/qhk;->j0(Ll/qhk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
