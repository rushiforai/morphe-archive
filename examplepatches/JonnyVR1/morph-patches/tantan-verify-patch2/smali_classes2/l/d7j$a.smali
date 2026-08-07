.class public final Ll/d7j$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wie;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d7j;-><init>(Ljava/lang/String;Ll/kr0;Ll/f23;Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/d;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0008*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u001a\u0010\n\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0007\u001a\u0004\u0008\u0008\u0010\tR\u0014\u0010\u0003\u001a\u00020\u00028VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\t\u00a8\u0006\u000c"
    }
    d2 = {
        "l/d7j$a",
        "Ll/wie;",
        "",
        "renderingFps",
        "",
        "a",
        "(I)V",
        "I",
        "c",
        "()I",
        "animationFps",
        "b",
        "animated-drawable_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:I

.field public final synthetic b:Ll/d7j;


# direct methods
.method public constructor <init>(Ll/d7j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d7j$a;->b:Ll/d7j;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/d7j;->i(Ll/d7j;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/d7j$a;->a:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d7j$a;->b:Ll/d7j;

    .line 2
    .line 3
    invoke-static {v0}, Ll/d7j;->g(Ll/d7j;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/d7j$a;->b:Ll/d7j;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0}, Ll/d7j;->i(Ll/d7j;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-static {p1, v1, v2}, Lkotlin/ranges/a;->h(III)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {v0, p1}, Ll/d7j;->j(Ll/d7j;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/d7j$a;->b:Ll/d7j;

    .line 24
    .line 25
    invoke-static {p1}, Ll/d7j;->h(Ll/d7j;)Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/d7j$a;->b:Ll/d7j;

    .line 32
    .line 33
    invoke-static {p0}, Ll/d7j;->g(Ll/d7j;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-interface {p1, p0}, Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/c;->f(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7j$a;->b:Ll/d7j;

    .line 2
    .line 3
    invoke-static {p0}, Ll/d7j;->g(Ll/d7j;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/d7j$a;->a:I

    .line 2
    .line 3
    return p0
.end method
