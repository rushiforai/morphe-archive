.class public final synthetic Ll/f40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i40;


# direct methods
.method public synthetic constructor <init>(Ll/i40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f40;->a:Ll/i40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f40;->a:Ll/i40;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    invoke-static {p0, p1}, Ll/i40;->L3(Ll/i40;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method
