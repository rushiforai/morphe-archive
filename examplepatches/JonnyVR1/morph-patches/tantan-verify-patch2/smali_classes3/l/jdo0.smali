.class public final synthetic Ll/jdo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qdo0;


# direct methods
.method public synthetic constructor <init>(Ll/qdo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdo0;->a:Ll/qdo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdo0;->a:Ll/qdo0;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    invoke-static {p0, p1}, Ll/qdo0;->P3(Ll/qdo0;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method
