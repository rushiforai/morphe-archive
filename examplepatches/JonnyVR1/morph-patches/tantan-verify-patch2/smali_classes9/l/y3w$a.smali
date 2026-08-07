.class public Ll/y3w$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g4m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y3w;->b(Ll/l2w;)Ll/zm3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l2w;


# direct methods
.method public constructor <init>(Ll/l2w;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y3w$a;->a:Ll/l2w;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/data/Followship;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3w$a;->a:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->f()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/Followship;

    .line 12
    .line 13
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3w$a;->a:Ll/l2w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2w;->c()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    return-object p0
.end method
