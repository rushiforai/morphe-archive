.class public final synthetic Ll/cr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:I

.field public final synthetic d:Ll/xl80;

.field public final synthetic e:Ll/y0m;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cr20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

    iput-object p2, p0, Ll/cr20;->b:Ljava/util/ArrayList;

    iput p3, p0, Ll/cr20;->c:I

    iput-object p4, p0, Ll/cr20;->d:Ll/xl80;

    iput-object p5, p0, Ll/cr20;->e:Ll/y0m;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cr20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

    iget-object v1, p0, Ll/cr20;->b:Ljava/util/ArrayList;

    iget v2, p0, Ll/cr20;->c:I

    iget-object v3, p0, Ll/cr20;->d:Ll/xl80;

    iget-object v4, p0, Ll/cr20;->e:Ll/y0m;

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->u(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
