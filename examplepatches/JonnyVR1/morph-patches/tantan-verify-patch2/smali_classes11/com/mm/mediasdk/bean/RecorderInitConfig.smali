.class public Lcom/mm/mediasdk/bean/RecorderInitConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mediasdk/bean/RecorderInitConfig$b;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/mm/mediasdk/bean/RecorderInitConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final appId:Ljava/lang/String;

.field private isUseAR:Z

.field private pullConfigInterval:J

.field private final uid:Ljava/lang/String;

.field private final userVersionCode:I

.field private final userVersionName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/mm/mediasdk/bean/RecorderInitConfig$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/mm/mediasdk/bean/RecorderInitConfig$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 47
    iput-wide v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->pullConfigInterval:J

    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->appId:Ljava/lang/String;

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionCode:I

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionName:Ljava/lang/String;

    .line 51
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->uid:Ljava/lang/String;

    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->isUseAR:Z

    return-void
.end method

.method private constructor <init>(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->pullConfigInterval:J

    .line 7
    .line 8
    invoke-static {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->a(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->appId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->b(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionCode:I

    .line 19
    .line 20
    invoke-static {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->c(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->d(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->uid:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->e(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->pullConfigInterval:J

    .line 37
    .line 38
    invoke-static {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->f(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput-boolean p1, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->isUseAR:Z

    .line 43
    .line 44
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;Lcom/mm/mediasdk/bean/RecorderInitConfig$a;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;-><init>(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->appId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->uid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionCode:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->isUseAR:Z

    .line 2
    .line 3
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->appId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p2, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionCode:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->userVersionName:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->uid:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;->isUseAR:Z

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
