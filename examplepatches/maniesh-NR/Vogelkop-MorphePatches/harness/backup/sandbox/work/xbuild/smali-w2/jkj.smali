.class public abstract Ljkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lal3;
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ljkj;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzug;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Ljkj;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(JZLjava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ljkj;->a:J

    iput-object p4, p0, Ljkj;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ljkj;->c:Z

    return-void
.end method

.method public static j(Lal3;)Ljkj;
    .registers 5

    invoke-interface {p0}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_15

    check-cast p0, Lml3;

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lol3;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lkkj;->k(Lml3;Ljava/lang/String;Ljava/lang/String;)Lkkj;

    move-result-object p0

    return-object p0

    :cond_15
    check-cast p0, Lpl3;

    new-instance v0, Llkj;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v1

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0}, Lpl3;->getUrl()Lshf;

    move-result-object p0

    invoke-direct {v0, v1, v2, v3, p0}, Llkj;-><init>(JLjava/lang/String;Lshf;)V

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/opera/android/bookmarks/c;)Lml3;
    .registers 3

    invoke-virtual {p0, p1}, Ljkj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    invoke-static {p0, p1}, Lalo;->H(Ljkj;Lml3;)Lml3;

    move-result-object p0

    return-object p0
.end method

.method public c(Lzk3;)Z
    .registers 2

    invoke-interface {p1, p0}, Lzk3;->c(Lol3;)Z

    move-result p0

    return p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final e(Lml3;)Z
    .registers 2

    invoke-static {p0, p1}, Lalo;->H(Ljkj;Lml3;)Lml3;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_12

    instance-of v0, p1, Lal3;

    if-eqz v0, :cond_14

    check-cast p1, Lal3;

    iget-wide v0, p0, Ljkj;->a:J

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 1

    iget-boolean p0, p0, Ljkj;->c:Z

    return p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Ljkj;->a:J

    return-wide v0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ljkj;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Ljkj;->a:J

    long-to-int p0, v0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    iget-boolean p2, p0, Ljkj;->c:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-wide v0, p0, Ljkj;->a:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object p0, p0, Ljkj;->b:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
