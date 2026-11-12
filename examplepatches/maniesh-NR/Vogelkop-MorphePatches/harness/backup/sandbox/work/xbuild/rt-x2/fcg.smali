.class public final Lfcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln37;
.implements Lpn9;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lfcg;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Loba;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkuf;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lkuf;-><init>(B)V

    sput-object v0, Lfcg;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Loba;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfcg;->a:Loba;

    return-void
.end method


# virtual methods
.method public final a()Loba;
    .registers 1

    iget-object p0, p0, Lfcg;->a:Loba;

    return-object p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    iget-object p0, p0, Lfcg;->a:Loba;

    invoke-virtual {p0, p1, p2}, Loba;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
