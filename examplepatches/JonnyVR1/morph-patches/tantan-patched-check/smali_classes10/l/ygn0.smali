.class public Ll/ygn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/fgn0;

.field public b:Z


# direct methods
.method public constructor <init>(Ll/fgn0;)V
    .locals 0
    .param p1    # Ll/fgn0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ygn0;->a:Ll/fgn0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ygn0;->a:Ll/fgn0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;->c(Ll/fgn0;)V

    .line 7
    .line 8
    .line 9
    iget-boolean p0, p0, Ll/ygn0;->b:Z

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;->b(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->G8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ygn0;->H(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
