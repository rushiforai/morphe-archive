.class public final synthetic Ll/w0m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Ljava/lang/String;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w0m0;->a:Lv/VText;

    iput-object p2, p0, Ll/w0m0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/w0m0;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w0m0;->a:Lv/VText;

    iget-object v1, p0, Ll/w0m0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/w0m0;->c:Lv/VText;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;->b(Lv/VText;Ljava/lang/String;Lv/VText;)V

    return-void
.end method
