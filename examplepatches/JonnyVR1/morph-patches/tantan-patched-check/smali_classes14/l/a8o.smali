.class public final synthetic Ll/a8o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/b8o;


# direct methods
.method public synthetic constructor <init>(Ll/b8o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a8o;->a:Ll/b8o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a8o;->a:Ll/b8o;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    invoke-static {p0, p1}, Ll/b8o;->d(Ll/b8o;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
