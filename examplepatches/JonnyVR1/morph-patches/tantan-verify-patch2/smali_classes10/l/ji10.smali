.class public final Ll/ji10;
.super Ll/wb10;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\t\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000c\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0010\u001a\u00020\u00088\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0011"
    }
    d2 = {
        "Ll/ji10;",
        "Ll/wb10;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Ll/ki10;",
        "presenter",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Ll/ki10;)V",
        "",
        "C",
        "()I",
        "position",
        "getItemViewType",
        "(I)I",
        "f",
        "I",
        "pageCount",
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
.field public final f:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ki10;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/ki10;
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
    invoke-direct {p0, p1, p2}, Ll/wb10;-><init>(Lcom/p1/mobile/android/app/Act;Ll/i6t;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x3

    .line 11
    iput p1, p0, Ll/ji10;->f:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public C()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ji10;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    sget p0, Ll/yec0;->y4:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    sget p0, Ll/yec0;->m4:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_2
    sget p0, Ll/yec0;->a4:I

    .line 21
    .line 22
    return p0
.end method
