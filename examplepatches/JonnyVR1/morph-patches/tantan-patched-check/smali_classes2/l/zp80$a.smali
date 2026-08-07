.class public Ll/zp80$a;
.super Ll/u2f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zp80;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/u2f<",
        "Ll/xp80;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic d:Ll/zp80;


# direct methods
.method public constructor <init>(Ll/zp80;Landroidx/room/RoomDatabase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zp80$a;->d:Ll/zp80;

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
    const-string p0, "INSERT OR REPLACE INTO `Preference` (`key`,`long_value`) VALUES (?,?)"

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
    check-cast p2, Ll/xp80;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zp80$a;->k(Ll/r7h0;Ll/xp80;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ll/r7h0;Ll/xp80;)V
    .locals 3
    .param p1    # Ll/r7h0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/xp80;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p2}, Ll/xp80;->a()Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-interface {p1, p0, v0}, Ll/p7h0;->bindString(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ll/xp80;->b()Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x2

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ll/p7h0;->bindNull(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p2}, Ll/xp80;->b()Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-interface {p1, v0, v1, v2}, Ll/p7h0;->bindLong(IJ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
