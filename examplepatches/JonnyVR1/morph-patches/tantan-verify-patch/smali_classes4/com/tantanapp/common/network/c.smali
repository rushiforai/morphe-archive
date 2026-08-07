.class public final synthetic Lcom/tantanapp/common/network/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/network/ObservableRunner;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/String;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/network/c;->a:Lcom/tantanapp/common/network/ObservableRunner;

    iput-object p2, p0, Lcom/tantanapp/common/network/c;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/tantanapp/common/network/c;->c:Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/c;->a:Lcom/tantanapp/common/network/ObservableRunner;

    iget-object v1, p0, Lcom/tantanapp/common/network/c;->b:Ljava/lang/String;

    iget-object p0, p0, Lcom/tantanapp/common/network/c;->c:Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, v1, p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->a(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/String;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;Lrx/Notification;)V

    return-void
.end method
