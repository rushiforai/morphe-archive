.class public final synthetic Ll/oz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rz0;


# direct methods
.method public synthetic constructor <init>(Ll/rz0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oz0;->a:Ll/rz0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oz0;->a:Ll/rz0;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    invoke-static {p0, p1}, Ll/rz0;->e4(Ll/rz0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method
