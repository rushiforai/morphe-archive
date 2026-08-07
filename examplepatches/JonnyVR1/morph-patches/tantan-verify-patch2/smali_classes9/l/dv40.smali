.class public final synthetic Ll/dv40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gv40;


# direct methods
.method public synthetic constructor <init>(Ll/gv40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dv40;->a:Ll/gv40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dv40;->a:Ll/gv40;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    invoke-static {p0, p1}, Ll/gv40;->c(Ll/gv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method
