.class public final synthetic Ll/aao;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eao;


# direct methods
.method public synthetic constructor <init>(Ll/eao;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aao;->a:Ll/eao;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aao;->a:Ll/eao;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    invoke-static {p0, p1}, Ll/eao;->N3(Ll/eao;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method
