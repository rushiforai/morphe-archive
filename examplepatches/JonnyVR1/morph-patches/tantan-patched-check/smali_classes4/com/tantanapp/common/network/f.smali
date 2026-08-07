.class public final synthetic Lcom/tantanapp/common/network/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/network/ObservableRunner;

.field public final synthetic b:Lcom/tantanapp/common/network/ObservableRunner$Req;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$Req;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/network/f;->a:Lcom/tantanapp/common/network/ObservableRunner;

    iput-object p2, p0, Lcom/tantanapp/common/network/f;->b:Lcom/tantanapp/common/network/ObservableRunner$Req;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/f;->a:Lcom/tantanapp/common/network/ObservableRunner;

    iget-object p0, p0, Lcom/tantanapp/common/network/f;->b:Lcom/tantanapp/common/network/ObservableRunner$Req;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->b(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$Req;Lrx/Notification;)V

    return-void
.end method
