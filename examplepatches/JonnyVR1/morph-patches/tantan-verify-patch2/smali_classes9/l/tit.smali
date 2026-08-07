.class public final synthetic Ll/tit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vit;


# direct methods
.method public synthetic constructor <init>(Ll/vit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tit;->a:Ll/vit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tit;->a:Ll/vit;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    invoke-static {p0, p1}, Ll/vit;->S3(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V

    return-void
.end method
