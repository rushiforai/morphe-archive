.class public final Ll/eib0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eib0;->register()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J1\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "l/eib0$b",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "section",
        "",
        "scroll",
        "isClick",
        "sectionSource",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V",
        "pay_intlGmsRelease"
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
.field public final synthetic a:Ll/eib0;


# direct methods
.method public constructor <init>(Ll/eib0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eib0$b;->a:Ll/eib0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Ll/eib0$b;->a:Ll/eib0;

    .line 5
    .line 6
    invoke-virtual {p3}, Ll/t5;->o()Ll/ndb0;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->M()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    if-nez p4, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object p1, p4

    .line 18
    :goto_0
    iget-object p4, p0, Ll/eib0$b;->a:Ll/eib0;

    .line 19
    .line 20
    invoke-virtual {p4, p3, p1}, Ll/t5;->v(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 21
    .line 22
    .line 23
    iget-object p4, p0, Ll/eib0$b;->a:Ll/eib0;

    .line 24
    .line 25
    invoke-virtual {p4, p3}, Ll/t5;->j(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-interface {p3, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object p0, p0, Ll/eib0$b;->a:Ll/eib0;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/t5;->y(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
