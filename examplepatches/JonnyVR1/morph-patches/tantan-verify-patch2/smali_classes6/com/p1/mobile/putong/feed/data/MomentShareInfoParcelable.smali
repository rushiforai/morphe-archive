.class public Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;
.super Lcom/p1/mobile/putong/feed/data/MomentShareInfo;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;)V
    .locals 1

    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;-><init>()V

    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 58
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 59
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 60
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 61
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    .line 62
    iput-object p7, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
