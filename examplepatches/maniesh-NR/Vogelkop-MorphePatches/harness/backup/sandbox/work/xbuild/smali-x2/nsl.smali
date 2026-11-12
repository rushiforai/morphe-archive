.class public final enum Lnsl;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lnsl;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Lavj;

.field public static final enum e:Lnsl;

.field public static final enum f:Lnsl;

.field public static final enum g:Lnsl;

.field public static final enum h:Lnsl;

.field public static final enum i:Lnsl;

.field public static final enum j:Lnsl;

.field public static final synthetic k:[Lnsl;

.field public static final synthetic l:Lh58;


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 15

    new-instance v0, Lnsl;

    const/4 v1, 0x0

    const v2, 0x7f0a0bb7

    const/4 v3, 0x4

    const-string v4, "PEN"

    invoke-direct {v0, v1, v2, v3, v4}, Lnsl;-><init>(IIILjava/lang/String;)V

    sput-object v0, Lnsl;->e:Lnsl;

    new-instance v1, Lnsl;

    const/4 v2, 0x1

    const v4, 0x7f0a0bb9

    const/4 v5, 0x6

    const-string v6, "TEXT"

    invoke-direct {v1, v2, v4, v5, v6}, Lnsl;-><init>(IIILjava/lang/String;)V

    sput-object v1, Lnsl;->f:Lnsl;

    new-instance v2, Lnsl;

    const/4 v4, 0x2

    const v6, 0x7f0a0bb8

    const-string v7, "PLACEHOLDER"

    invoke-direct {v2, v4, v6, v4, v7}, Lnsl;-><init>(IIILjava/lang/String;)V

    sput-object v2, Lnsl;->g:Lnsl;

    move v4, v3

    new-instance v3, Lnsl;

    const/4 v6, 0x3

    const v7, 0x7f0a0bb4

    const-string v8, "BLUR"

    invoke-direct {v3, v6, v7, v4, v8}, Lnsl;-><init>(IIILjava/lang/String;)V

    sput-object v3, Lnsl;->h:Lnsl;

    move v6, v4

    new-instance v4, Lnsl;

    const-string v7, "EMOJI"

    const v8, 0x7f0a0bb6

    invoke-direct {v4, v6, v8, v5, v7}, Lnsl;-><init>(IIILjava/lang/String;)V

    sput-object v4, Lnsl;->i:Lnsl;

    new-instance v5, Lnsl;

    const/4 v13, 0x1

    const/4 v14, 0x0

    const-string v10, "CUTOUT"

    const/4 v11, 0x5

    const v12, 0x7f0a0bb5

    move-object v9, v5

    invoke-direct/range {v9 .. v14}, Lnsl;-><init>(Ljava/lang/String;IIZZ)V

    sput-object v5, Lnsl;->j:Lnsl;

    filled-new-array/range {v0 .. v5}, [Lnsl;

    move-result-object v0

    sput-object v0, Lnsl;->k:[Lnsl;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lnsl;->l:Lh58;

    new-instance v0, Lavj;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lavj;-><init>(B)V

    sput-object v0, Lnsl;->d:Lavj;

    new-instance v0, Ll7k;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ll7k;-><init>(B)V

    sput-object v0, Lnsl;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public synthetic constructor <init>(IIILjava/lang/String;)V
    .registers 14

    and-int/lit8 v0, p3, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    move v7, v2

    goto :goto_9

    :cond_8
    move v7, v1

    :goto_9
    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_13

    move v8, v1

    :goto_e
    move-object v3, p0

    move v5, p1

    move v6, p2

    move-object v4, p4

    goto :goto_15

    :cond_13
    move v8, v2

    goto :goto_e

    :goto_15
    invoke-direct/range {v3 .. v8}, Lnsl;-><init>(Ljava/lang/String;IIZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZZ)V
    .registers 6

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 26
    iput p3, p0, Lnsl;->a:I

    .line 27
    iput-boolean p4, p0, Lnsl;->b:Z

    .line 28
    iput-boolean p5, p0, Lnsl;->c:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnsl;
    .registers 2

    const-class v0, Lnsl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnsl;

    return-object p0
.end method

.method public static values()[Lnsl;
    .registers 1

    sget-object v0, Lnsl;->k:[Lnsl;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnsl;

    return-object v0
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
