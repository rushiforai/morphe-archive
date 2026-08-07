.class public final synthetic Ll/qwm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwm;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    iput-object p2, p0, Ll/qwm;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/qwm;->c:Ljava/util/Map;

    iput-object p4, p0, Ll/qwm;->d:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qwm;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    iget-object v1, p0, Ll/qwm;->b:Ljava/util/Map;

    iget-object v2, p0, Ll/qwm;->c:Ljava/util/Map;

    iget-object p0, p0, Ll/qwm;->d:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->l2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V

    return-void
.end method
