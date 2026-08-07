.class public Ll/fjq0$a;
.super Ll/u2f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fjq0;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/u2f<",
        "Ll/djq0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic d:Ll/fjq0;


# direct methods
.method public constructor <init>(Ll/fjq0;Landroidx/room/RoomDatabase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fjq0$a;->d:Ll/fjq0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/u2f;-><init>(Landroidx/room/RoomDatabase;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "INSERT OR REPLACE INTO `WorkProgress` (`work_spec_id`,`progress`) VALUES (?,?)"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i(Ll/r7h0;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ll/r7h0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p2, Ll/djq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fjq0$a;->k(Ll/r7h0;Ll/djq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ll/r7h0;Ll/djq0;)V
    .locals 1
    .param p1    # Ll/r7h0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/djq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p2}, Ll/djq0;->b()Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-interface {p1, p0, v0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ll/djq0;->a()Landroidx/work/Data;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Landroidx/work/Data;->g(Landroidx/work/Data;)[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p2, 0x2

    .line 18
    invoke-interface {p1, p2, p0}, Ll/p7h0;->bindBlob(I[B)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
