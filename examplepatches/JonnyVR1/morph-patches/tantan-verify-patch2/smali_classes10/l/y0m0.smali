.class public final synthetic Ll/y0m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y0m0;->a:Lv/VText;

    iput-object p2, p0, Ll/y0m0;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0m0;->a:Lv/VText;

    iget-object p0, p0, Ll/y0m0;->b:Lv/VText;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->e(Lv/VText;Lv/VText;)V

    return-void
.end method
