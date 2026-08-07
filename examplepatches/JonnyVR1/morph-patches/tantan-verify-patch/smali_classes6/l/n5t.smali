.class public final synthetic Ll/n5t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/LiveModule;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/LiveModule;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n5t;->a:Lcom/p1/mobile/putong/live/LiveModule;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n5t;->a:Lcom/p1/mobile/putong/live/LiveModule;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->R(Lcom/p1/mobile/putong/live/LiveModule;Landroid/net/NetworkInfo;)V

    return-void
.end method
