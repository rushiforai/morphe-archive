.class public final synthetic Ll/ny30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/b240;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;


# direct methods
.method public synthetic constructor <init>(Ll/b240;Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ny30;->a:Ll/b240;

    iput-object p2, p0, Ll/ny30;->b:Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ny30;->a:Ll/b240;

    iget-object p0, p0, Ll/ny30;->b:Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;

    invoke-static {v0, p0}, Ll/b240;->y0(Ll/b240;Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;)V

    return-void
.end method
