.class public final synthetic Ll/va;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xa;


# direct methods
.method public synthetic constructor <init>(Ll/xa;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/va;->a:Ll/xa;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/va;->a:Ll/xa;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {p0, p1}, Ll/xa;->l0(Ll/xa;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
