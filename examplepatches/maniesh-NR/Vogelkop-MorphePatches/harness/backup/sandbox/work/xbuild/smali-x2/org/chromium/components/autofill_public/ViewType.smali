.class public Lorg/chromium/components/autofill_public/ViewType;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lorg/chromium/components/autofill_public/ViewType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Landroid/view/autofill/AutofillId;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ll7k;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Ll7k;-><init>(B)V

    sput-object v0, Lorg/chromium/components/autofill_public/ViewType;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/view/autofill/AutofillId;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/autofill/AutofillId;

    iput-object v0, p0, Lorg/chromium/components/autofill_public/ViewType;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/components/autofill_public/ViewType;->b:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/components/autofill_public/ViewType;->c:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/chromium/components/autofill_public/ViewType;->d:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/view/autofill/AutofillId;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/chromium/components/autofill_public/ViewType;->a:Landroid/view/autofill/AutofillId;

    .line 34
    iput-object p2, p0, Lorg/chromium/components/autofill_public/ViewType;->b:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lorg/chromium/components/autofill_public/ViewType;->c:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lorg/chromium/components/autofill_public/ViewType;->d:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    iget-object v0, p0, Lorg/chromium/components/autofill_public/ViewType;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {v0, p1, p2}, Landroid/view/autofill/AutofillId;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lorg/chromium/components/autofill_public/ViewType;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lorg/chromium/components/autofill_public/ViewType;->c:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p0, p0, Lorg/chromium/components/autofill_public/ViewType;->d:[Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    return-void
.end method
