.class public final synthetic Ll/d84;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h84;


# direct methods
.method public synthetic constructor <init>(Ll/h84;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d84;->a:Ll/h84;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d84;->a:Ll/h84;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    invoke-static {p0, p1}, Ll/h84;->J3(Ll/h84;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method
