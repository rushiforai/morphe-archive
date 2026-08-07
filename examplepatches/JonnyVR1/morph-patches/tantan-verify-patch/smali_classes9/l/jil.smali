.class public final synthetic Ll/jil;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kil;


# direct methods
.method public synthetic constructor <init>(Ll/kil;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jil;->a:Ll/kil;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jil;->a:Ll/kil;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    invoke-static {p0, p1}, Ll/kil;->J3(Ll/kil;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method
