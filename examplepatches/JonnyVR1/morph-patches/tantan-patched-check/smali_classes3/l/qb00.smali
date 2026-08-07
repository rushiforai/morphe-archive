.class public final synthetic Ll/qb00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;

.field public final synthetic b:Lcom/p1/mobile/putong/data/MiniWidgetData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qb00;->a:Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;

    iput-object p2, p0, Ll/qb00;->b:Lcom/p1/mobile/putong/data/MiniWidgetData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qb00;->a:Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;

    iget-object p0, p0, Ll/qb00;->b:Lcom/p1/mobile/putong/data/MiniWidgetData;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->h(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/util/Pair;)V

    return-void
.end method
