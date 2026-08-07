.class public final synthetic Ll/bv40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cv40;


# direct methods
.method public synthetic constructor <init>(Ll/cv40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bv40;->a:Ll/cv40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bv40;->a:Ll/cv40;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    invoke-static {p0, p1}, Ll/cv40;->h4(Ll/cv40;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
