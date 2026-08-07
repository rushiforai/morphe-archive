.class public final Ll/ak1$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ak1;->g(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/ak1$a",
        "Ll/wo0;",
        "",
        "frame",
        "",
        "percentage",
        "",
        "h",
        "(ID)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/ak1;


# direct methods
.method public constructor <init>(Ll/ak1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ak1$a;->a:Ll/ak1;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(ID)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/ak1$a;->a:Ll/ak1;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ak1;->f()Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->pauseAnimation()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
