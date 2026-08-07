.class public final synthetic Ll/mmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gnn;


# direct methods
.method public synthetic constructor <init>(Ll/gnn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mmn;->a:Ll/gnn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mmn;->a:Ll/gnn;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-static {p0, p1}, Ll/gnn;->m0(Ll/gnn;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method
