.class public final Ll/ayp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\r\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\r\u0010\u000cR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010\u000eR\u0014\u0010\u0011\u001a\u00020\u000f8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u0010\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/ayp;",
        "",
        "Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V",
        "Landroid/widget/FrameLayout;",
        "container",
        "",
        "a",
        "(Landroid/widget/FrameLayout;)V",
        "c",
        "()V",
        "b",
        "Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;",
        "Ll/n3n;",
        "Ll/n3n;",
        "delegate",
        "b_core_intlGmsRelease"
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
.field public final a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/n3n;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/ayp;->a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 8
    .line 9
    new-instance v0, Ll/n3n;

    .line 10
    .line 11
    sget-object v1, Ll/p3n;->INSTANCE:Ll/p3n;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/p3n;->d()Ll/o3n;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/16 v5, 0xc

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    move-object v1, p1

    .line 23
    invoke-direct/range {v0 .. v6}, Ll/n3n;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ll/o3n;ZLl/x20;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ayp;->b:Ll/n3n;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a(Landroid/widget/FrameLayout;)V
    .locals 6
    .param p1    # Landroid/widget/FrameLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ayp;->b:Ll/n3n;

    .line 5
    .line 6
    const/4 v4, 0x4

    .line 7
    const/4 v5, 0x0

    .line 8
    const/high16 v2, 0x41000000    # 8.0f

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v1, p1

    .line 12
    invoke-static/range {v0 .. v5}, Ll/n3n;->h(Ll/n3n;Landroid/widget/FrameLayout;FFILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayp;->b:Ll/n3n;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n3n;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayp;->b:Ll/n3n;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n3n;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
