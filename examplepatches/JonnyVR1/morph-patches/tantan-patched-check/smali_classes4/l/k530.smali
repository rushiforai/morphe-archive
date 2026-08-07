.class public final synthetic Ll/k530;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k530;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k530;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->D4(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
