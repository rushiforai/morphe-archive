.class public final synthetic Ll/xhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

.field public final synthetic b:Ll/mdk;

.field public final synthetic c:Ll/fzq;

.field public final synthetic d:[Ll/w30;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/mdk;Ll/fzq;[Ll/w30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xhe;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    iput-object p2, p0, Ll/xhe;->b:Ll/mdk;

    iput-object p3, p0, Ll/xhe;->c:Ll/fzq;

    iput-object p4, p0, Ll/xhe;->d:[Ll/w30;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xhe;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    iget-object v1, p0, Ll/xhe;->b:Ll/mdk;

    iget-object v2, p0, Ll/xhe;->c:Ll/fzq;

    iget-object v3, p0, Ll/xhe;->d:[Ll/w30;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Ll/bie;->Q(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/mdk;Ll/fzq;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
