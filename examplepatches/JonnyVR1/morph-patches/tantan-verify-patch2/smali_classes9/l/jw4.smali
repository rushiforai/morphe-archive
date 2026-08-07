.class public final synthetic Ll/jw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mw4;

.field public final synthetic b:Lv/VCheckBox;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;


# direct methods
.method public synthetic constructor <init>(Ll/mw4;Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jw4;->a:Ll/mw4;

    iput-object p2, p0, Ll/jw4;->b:Lv/VCheckBox;

    iput-object p3, p0, Ll/jw4;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/jw4;->d:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jw4;->a:Ll/mw4;

    iget-object v1, p0, Ll/jw4;->b:Lv/VCheckBox;

    iget-object v2, p0, Ll/jw4;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/jw4;->d:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    invoke-static {v0, v1, v2, p0}, Ll/mw4;->e4(Ll/mw4;Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method
