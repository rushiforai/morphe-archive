.class public final synthetic Ll/cp20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Ljava/lang/Integer;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cp20;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/cp20;->b:Ljava/lang/Integer;

    iput-object p3, p0, Ll/cp20;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cp20;->a:Lv/VDraweeView;

    iget-object v1, p0, Ll/cp20;->b:Ljava/lang/Integer;

    iget-object p0, p0, Ll/cp20;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->a(Lv/VDraweeView;Ljava/lang/Integer;Ljava/lang/String;)V

    return-void
.end method
