.class public final Ll/b3n$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ymo$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b3n;->l(Ljava/util/List;Lcom/p1/mobile/putong/data/SubGender;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0019\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/b3n$b",
        "Ll/ymo$a;",
        "Lcom/p1/mobile/putong/data/SubGender;",
        "optionId",
        "",
        "a",
        "(Lcom/p1/mobile/putong/data/SubGender;)V",
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
.field public final synthetic a:Ll/b3n;


# direct methods
.method public constructor <init>(Ll/b3n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b3n$b;->a:Ll/b3n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/SubGender;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b3n$b;->a:Ll/b3n;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/b3n;->e(Ll/b3n;Lcom/p1/mobile/putong/data/SubGender;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/b3n$b;->a:Ll/b3n;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p0, p1}, Ll/b3n;->f(Ll/b3n;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    invoke-static {v0, p1}, Ll/b3n;->e(Ll/b3n;Lcom/p1/mobile/putong/data/SubGender;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/b3n$b;->a:Ll/b3n;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-static {p0, p1}, Ll/b3n;->f(Ll/b3n;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
