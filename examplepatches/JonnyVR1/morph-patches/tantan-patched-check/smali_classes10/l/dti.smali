.class public final synthetic Ll/dti;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dti;->a:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dti;->a:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w(II)V

    return-void
.end method
