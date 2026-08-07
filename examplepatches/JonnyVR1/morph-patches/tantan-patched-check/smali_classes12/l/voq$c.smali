.class Ll/voq$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->l2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq$c;->a:Ll/voq;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public gestureDetected(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq$c;->a:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->V1(Ll/voq;)Ll/dul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/voq$c;->a:Ll/voq;

    .line 10
    .line 11
    invoke-static {p0}, Ll/voq;->V1(Ll/voq;)Ll/dul;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ll/dul;->gestureDetected(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onPreGestureAdded(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq$c;->a:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->V1(Ll/voq;)Ll/dul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/voq$c;->a:Ll/voq;

    .line 10
    .line 11
    invoke-static {p0}, Ll/voq;->V1(Ll/voq;)Ll/dul;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ll/dul;->onPreGestureAdded(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
