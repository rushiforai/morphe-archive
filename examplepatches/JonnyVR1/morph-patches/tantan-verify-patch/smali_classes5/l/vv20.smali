.class public final synthetic Ll/vv20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mw20;


# direct methods
.method public synthetic constructor <init>(Ll/mw20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vv20;->a:Ll/mw20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vv20;->a:Ll/mw20;

    check-cast p1, Lcom/p1/mobile/putong/data/DoublePair;

    invoke-static {p0, p1}, Ll/mw20;->l0(Ll/mw20;Lcom/p1/mobile/putong/data/DoublePair;)V

    return-void
.end method
