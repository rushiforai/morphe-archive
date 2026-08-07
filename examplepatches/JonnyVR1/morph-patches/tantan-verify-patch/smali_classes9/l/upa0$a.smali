.class public final Ll/upa0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ppa0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/upa0;->m(Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/upa0$a",
        "Ll/ppa0$a;",
        "",
        "multipleChoice",
        "",
        "a",
        "(Z)V",
        "profile_intlGmsRelease"
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
.field public final synthetic a:Ll/upa0;


# direct methods
.method public constructor <init>(Ll/upa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/upa0$a;->a:Ll/upa0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upa0$a;->a:Ll/upa0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/upa0;->j()Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->f()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p0}, Ll/upa0;->b(Ll/upa0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
