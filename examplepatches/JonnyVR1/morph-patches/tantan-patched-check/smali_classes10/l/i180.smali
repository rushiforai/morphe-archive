.class public final synthetic Ll/i180;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j080;


# direct methods
.method public synthetic constructor <init>(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i180;->a:Ll/j080;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i180;->a:Ll/j080;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    invoke-virtual {p0, p1}, Ll/j080;->i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method
