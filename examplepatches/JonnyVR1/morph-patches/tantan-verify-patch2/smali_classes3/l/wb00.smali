.class public final synthetic Ll/wb00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wb00;->a:Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wb00;->a:Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;

    check-cast p1, Lcom/p1/mobile/putong/data/MiniWidgetEnvelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->g(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetEnvelope;)V

    return-void
.end method
