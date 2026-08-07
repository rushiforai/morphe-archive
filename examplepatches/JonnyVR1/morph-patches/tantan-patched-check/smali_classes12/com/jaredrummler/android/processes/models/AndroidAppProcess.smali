.class public Lcom/jaredrummler/android/processes/models/AndroidAppProcess;
.super Lcom/jaredrummler/android/processes/models/AndroidProcess;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;
    }
.end annotation


# static fields
.field private static final ANDROID_PROCESS_NAME_REGEX:Ljava/lang/String; = "^([\\p{L}]{1}[\\p{L}\\p{N}_]*[\\.:])*[\\p{L}][\\p{L}\\p{N}_]*$"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/jaredrummler/android/processes/models/AndroidAppProcess;",
            ">;"
        }
    .end annotation
.end field

.field private static final SYS_SUPPORTS_SCHEDGROUPS:Z


# instance fields
.field public final foreground:Z

.field public final uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const-string v1, "/dev/cpuctl/tasks"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sput-boolean v0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->SYS_SUPPORTS_SCHEDGROUPS:Z

    .line 13
    .line 14
    new-instance v0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$a;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$a;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(I)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    const-string v1, "^([\\p{L}]{1}[\\p{L}\\p{N}_]*[\\.:])*[\\p{L}][\\p{L}\\p{N}_]*$"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    new-instance v0, Ljava/io/File;

    .line 17
    .line 18
    const-string v1, "/data/data"

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->f()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    sget-boolean v0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->SYS_SUPPORTS_SCHEDGROUPS:Z

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->a()Lcom/jaredrummler/android/processes/models/Cgroup;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v2, "cpuacct"

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/jaredrummler/android/processes/models/Cgroup;->getGroup(Ljava/lang/String;)Lcom/jaredrummler/android/processes/models/ControlGroup;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "cpu"

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Lcom/jaredrummler/android/processes/models/Cgroup;->getGroup(Ljava/lang/String;)Lcom/jaredrummler/android/processes/models/ControlGroup;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    iget-object v3, v2, Lcom/jaredrummler/android/processes/models/ControlGroup;->group:Ljava/lang/String;

    .line 59
    .line 60
    const-string v4, "pid_"

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    iget-object v3, v0, Lcom/jaredrummler/android/processes/models/ControlGroup;->group:Ljava/lang/String;

    .line 69
    .line 70
    const-string v4, "bg_non_interactive"

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    xor-int/2addr v3, v1

    .line 77
    :try_start_0
    iget-object v4, v2, Lcom/jaredrummler/android/processes/models/ControlGroup;->group:Ljava/lang/String;

    .line 78
    .line 79
    const-string v5, "/"

    .line 80
    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    aget-object v1, v4, v1

    .line 86
    .line 87
    const-string v4, "uid_"

    .line 88
    .line 89
    const-string v5, ""

    .line 90
    .line 91
    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    goto :goto_0

    .line 100
    :catch_0
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->d()Lcom/jaredrummler/android/processes/models/Status;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Lcom/jaredrummler/android/processes/models/Status;->getUid()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    :goto_0
    iget-object v4, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    invoke-virtual {v2}, Lcom/jaredrummler/android/processes/models/ControlGroup;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    invoke-virtual {v0}, Lcom/jaredrummler/android/processes/models/ControlGroup;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    const-string v0, "name=%s, pid=%d, uid=%d, foreground=%b, cpuacct=%s, cpu=%s"

    .line 135
    .line 136
    invoke-static {v0, p1}, Ll/co0;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_0
    new-instance p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;

    .line 141
    .line 142
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;-><init>(I)V

    .line 143
    .line 144
    .line 145
    throw p0

    .line 146
    :cond_1
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->c()Lcom/jaredrummler/android/processes/models/Stat;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->d()Lcom/jaredrummler/android/processes/models/Status;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v0}, Lcom/jaredrummler/android/processes/models/Stat;->policy()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_2

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    const/4 v1, 0x0

    .line 162
    :goto_1
    invoke-virtual {v2}, Lcom/jaredrummler/android/processes/models/Status;->getUid()I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    iget-object v2, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    filled-new-array {v2, p1, v3, v4}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    const-string v2, "name=%s, pid=%d, uid=%d foreground=%b"

    .line 185
    .line 186
    invoke-static {v2, p1}, Ll/co0;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    move v3, v1

    .line 190
    move v1, v0

    .line 191
    :goto_2
    iput-boolean v3, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->foreground:Z

    .line 192
    .line 193
    iput v1, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->uid:I

    .line 194
    .line 195
    return-void

    .line 196
    :cond_3
    new-instance p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;

    .line 197
    .line 198
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;-><init>(I)V

    .line 199
    .line 200
    .line 201
    throw p0
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 202
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess;-><init>(Landroid/os/Parcel;)V

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->foreground:Z

    .line 204
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->uid:I

    return-void
.end method


# virtual methods
.method public e(Landroid/content/Context;I)Landroid/content/pm/PackageInfo;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0, p2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, ":"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    aget-object p0, p0, v0

    .line 11
    .line 12
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->foreground:Z

    .line 5
    .line 6
    int-to-byte p2, p2

    .line 7
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->uid:I

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
