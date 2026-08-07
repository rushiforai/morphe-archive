.class public final synthetic Ll/uwk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zwk0;


# direct methods
.method public synthetic constructor <init>(Ll/zwk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uwk0;->a:Ll/zwk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uwk0;->a:Ll/zwk0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;

    invoke-static {p0, p1}, Ll/zwk0;->l(Ll/zwk0;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V

    return-void
.end method
