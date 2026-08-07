.class public final synthetic Ll/sq20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ll/xl80;

.field public final synthetic e:Ll/y0m;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;

    iput-object p2, p0, Ll/sq20;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/sq20;->c:Ljava/lang/Object;

    iput-object p4, p0, Ll/sq20;->d:Ll/xl80;

    iput-object p5, p0, Ll/sq20;->e:Ll/y0m;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/sq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;

    iget-object v1, p0, Ll/sq20;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Ll/sq20;->c:Ljava/lang/Object;

    iget-object v3, p0, Ll/sq20;->d:Ll/xl80;

    iget-object v4, p0, Ll/sq20;->e:Ll/y0m;

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->p(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
