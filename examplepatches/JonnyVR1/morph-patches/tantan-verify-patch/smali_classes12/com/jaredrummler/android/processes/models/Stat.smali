.class public final Lcom/jaredrummler/android/processes/models/Stat;
.super Lcom/jaredrummler/android/processes/models/ProcFile;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/jaredrummler/android/processes/models/Stat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final fields:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/jaredrummler/android/processes/models/Stat$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/Stat$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/jaredrummler/android/processes/models/Stat;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/ProcFile;-><init>(Landroid/os/Parcel;)V

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/os/Parcel;Lcom/jaredrummler/android/processes/models/Stat$a;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/Stat;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/ProcFile;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/jaredrummler/android/processes/models/ProcFile;->content:Ljava/lang/String;

    .line 5
    .line 6
    const-string v0, "\\s+"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static get(I)Lcom/jaredrummler/android/processes/models/Stat;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/jaredrummler/android/processes/models/Stat;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "/proc/%d/stat"

    .line 12
    .line 13
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Lcom/jaredrummler/android/processes/models/Stat;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method


# virtual methods
.method public arg_end()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x30

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public arg_start()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x2f

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public blocked()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x1f

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public cguest_time()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x2b

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public cmajflt()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0xc

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public cminflt()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public cnswap()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x24

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public cstime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x10

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public cutime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0xf

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public delayacct_blkio_ticks()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x29

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public end_data()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x2d

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public endcode()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x1a

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public env_end()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x32

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public env_start()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x31

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public exit_code()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x33

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public exit_signal()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x25

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public flags()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getComm()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    const-string v0, "("

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, ")"

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getPid()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public guest_time()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x2a

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public itrealvalue()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x14

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public kstkeip()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x1d

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public kstkesp()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x1c

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public majflt()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0xb

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public minflt()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x9

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public nice()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x12

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public nswap()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x23

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public num_threads()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x13

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public pgrp()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public policy()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x28

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public ppid()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public priority()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x11

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public processor()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x26

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public rss()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x17

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public rsslim()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x18

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public rt_priority()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x27

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public session()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public sigcatch()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x21

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public sigignore()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x20

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public signal()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x1e

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public start_brk()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x2e

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public start_data()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x2c

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public startcode()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x19

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public startstack()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x1b

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public starttime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x15

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public state()C
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public stime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0xe

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public tpgid()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public tty_nr()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public utime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0xd

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public vsize()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x16

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public wchan()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 2
    .line 3
    const/16 v0, 0x22

    .line 4
    .line 5
    aget-object p0, p0, v0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/jaredrummler/android/processes/models/ProcFile;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/Stat;->fields:[Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
