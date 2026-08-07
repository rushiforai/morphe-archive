.class public final synthetic Lcom/tantanapp/common/network/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/network/ObservableRunner;

.field public final synthetic b:Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/network/e;->a:Lcom/tantanapp/common/network/ObservableRunner;

    iput-object p2, p0, Lcom/tantanapp/common/network/e;->b:Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/e;->a:Lcom/tantanapp/common/network/ObservableRunner;

    iget-object p0, p0, Lcom/tantanapp/common/network/e;->b:Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->h(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;Ljava/lang/Throwable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
