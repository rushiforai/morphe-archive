.class public Lorg/chromium/base/process_launcher/IChildProcessArgs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lorg/chromium/base/process_launcher/IChildProcessArgs;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lorg/chromium/base/IApkInfo;

.field public b:Lorg/chromium/base/IAndroidInfo;

.field public c:Z

.field public d:I

.field public e:[Ljava/lang/String;

.field public f:I

.field public g:J

.field public h:Lorg/chromium/base/IDeviceInfo;

.field public i:[Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

.field public j:Lorg/chromium/base/library_loader/IRelroLibInfo;

.field public k:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luz8;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Luz8;-><init>(B)V

    sput-object v0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->c:Z

    iput v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->d:I

    iput v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->f:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->g:J

    iput v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->k:I

    return-void
.end method

.method public static a(Ljava/lang/Object;)I
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_23

    instance-of v1, p0, [Ljava/lang/Object;

    if-eqz v1, :cond_18

    check-cast p0, [Ljava/lang/Object;

    array-length v1, p0

    move v2, v0

    :goto_b
    if-ge v0, v1, :cond_17

    aget-object v3, p0, v0

    invoke-static {v3}, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a(Ljava/lang/Object;)I

    move-result v3

    or-int/2addr v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_17
    return v2

    :cond_18
    instance-of v1, p0, Landroid/os/Parcelable;

    if-eqz v1, :cond_23

    check-cast p0, Landroid/os/Parcelable;

    invoke-interface {p0}, Landroid/os/Parcelable;->describeContents()I

    move-result p0

    return p0

    :cond_23
    return v0
.end method


# virtual methods
.method public final describeContents()I
    .registers 3

    iget-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a:Lorg/chromium/base/IApkInfo;

    invoke-static {v0}, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->b:Lorg/chromium/base/IAndroidInfo;

    invoke-static {v1}, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a(Ljava/lang/Object;)I

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->h:Lorg/chromium/base/IDeviceInfo;

    invoke-static {v1}, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a(Ljava/lang/Object;)I

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->i:[Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    invoke-static {v1}, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a(Ljava/lang/Object;)I

    move-result v1

    or-int/2addr v0, v1

    iget-object p0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->j:Lorg/chromium/base/library_loader/IRelroLibInfo;

    invoke-static {p0}, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a(Ljava/lang/Object;)I

    move-result p0

    or-int/2addr v0, p0

    return v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 6

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a:Lorg/chromium/base/IApkInfo;

    invoke-static {p1, v1, p2}, Llcp;->N(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->b:Lorg/chromium/base/IAndroidInfo;

    invoke-static {p1, v1, p2}, Llcp;->N(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    iget-boolean v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->c:Z

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->d:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->e:[Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    iget v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->f:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-wide v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->g:J

    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->h:Lorg/chromium/base/IDeviceInfo;

    invoke-static {p1, v1, p2}, Llcp;->N(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->i:[Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    invoke-virtual {p1, v1, p2}, Landroid/os/Parcel;->writeTypedArray([Landroid/os/Parcelable;I)V

    iget-object v1, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->j:Lorg/chromium/base/library_loader/IRelroLibInfo;

    invoke-static {p1, v1, p2}, Llcp;->N(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    iget p0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->k:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result p0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    sub-int p2, p0, v0

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-void
.end method
