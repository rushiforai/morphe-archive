.class public final Ll/se1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o7h0$c;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/se1;",
        "Ll/o7h0$c;",
        "delegate",
        "Ll/re1;",
        "autoCloser",
        "<init>",
        "(Ll/o7h0$c;Ll/re1;)V",
        "Ll/o7h0$b;",
        "configuration",
        "Landroidx/room/AutoClosingRoomOpenHelper;",
        "b",
        "(Ll/o7h0$b;)Landroidx/room/AutoClosingRoomOpenHelper;",
        "a",
        "Ll/o7h0$c;",
        "Ll/re1;",
        "room-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ll/o7h0$c;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/re1;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/o7h0$c;Ll/re1;)V
    .locals 0
    .param p1    # Ll/o7h0$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/re1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/se1;->a:Ll/o7h0$c;

    .line 11
    .line 12
    iput-object p2, p0, Ll/se1;->b:Ll/re1;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/o7h0$b;)Ll/o7h0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/se1;->b(Ll/o7h0$b;)Landroidx/room/AutoClosingRoomOpenHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/o7h0$b;)Landroidx/room/AutoClosingRoomOpenHelper;
    .locals 2
    .param p1    # Ll/o7h0$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroidx/room/AutoClosingRoomOpenHelper;

    .line 5
    .line 6
    iget-object v1, p0, Ll/se1;->a:Ll/o7h0$c;

    .line 7
    .line 8
    invoke-interface {v1, p1}, Ll/o7h0$c;->a(Ll/o7h0$b;)Ll/o7h0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ll/se1;->b:Ll/re1;

    .line 13
    .line 14
    invoke-direct {v0, p1, p0}, Landroidx/room/AutoClosingRoomOpenHelper;-><init>(Ll/o7h0;Ll/re1;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method
