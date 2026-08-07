.class public final synthetic Lcom/tantanapp/common/network/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/network/ObservableRunner;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/network/ObservableRunner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/network/g;->a:Lcom/tantanapp/common/network/ObservableRunner;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/g;->a:Lcom/tantanapp/common/network/ObservableRunner;

    invoke-static {p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->f(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
