.class public final synthetic Ll/dil;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gil;


# direct methods
.method public synthetic constructor <init>(Ll/gil;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dil;->a:Ll/gil;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dil;->a:Ll/gil;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    invoke-static {p0, p1}, Ll/gil;->J3(Ll/gil;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method
