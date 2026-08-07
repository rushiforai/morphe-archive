.class public Ll/jph0$a;
.super Ll/u2f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jph0;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/u2f<",
        "Ll/hph0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic d:Ll/jph0;


# direct methods
.method public constructor <init>(Ll/jph0;Landroidx/room/RoomDatabase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jph0$a;->d:Ll/jph0;

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
    const-string p0, "INSERT OR REPLACE INTO `SystemIdInfo` (`work_spec_id`,`generation`,`system_id`) VALUES (?,?,?)"

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
    check-cast p2, Ll/hph0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jph0$a;->k(Ll/r7h0;Ll/hph0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ll/r7h0;Ll/hph0;)V
    .locals 2
    .param p1    # Ll/r7h0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/hph0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-object v0, p2, Ll/hph0;->a:Ljava/lang/String;

    .line 3
    .line 4
    invoke-interface {p1, p0, v0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ll/hph0;->a()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    int-to-long v0, p0

    .line 12
    const/4 p0, 0x2

    .line 13
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 14
    .line 15
    .line 16
    iget p0, p2, Ll/hph0;->c:I

    .line 17
    .line 18
    int-to-long v0, p0

    .line 19
    const/4 p0, 0x3

    .line 20
    invoke-interface {p1, p0, v0, v1}, Ll/p7h0;->bindLong(IJ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
