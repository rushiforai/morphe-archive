.class public Lcom/p1/mobile/android/app/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/app/c$b;,
        Lcom/p1/mobile/android/app/c$a;,
        Lcom/p1/mobile/android/app/c$c;
    }
.end annotation


# static fields
.field public static e:Lcom/p1/mobile/android/app/c;

.field public static f:Lcom/p1/mobile/android/app/c;

.field public static g:Lcom/p1/mobile/android/app/c;

.field public static h:Lcom/p1/mobile/android/app/c;

.field public static i:Lcom/p1/mobile/android/app/c;

.field public static j:Lcom/p1/mobile/android/app/c;

.field public static k:Lcom/p1/mobile/android/app/c;

.field public static l:Lcom/p1/mobile/android/app/c;

.field public static m:Lcom/p1/mobile/android/app/c;

.field public static n:Lcom/p1/mobile/android/app/c;

.field public static o:Lcom/p1/mobile/android/app/c;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Ljava/lang/String;

.field public final d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const-string v1, "Attach"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/android/app/c;->e:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    const-string v1, "AfterCreate"

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    const-string v1, "AfterCreateView"

    .line 24
    .line 25
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 29
    .line 30
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 31
    .line 32
    const-string v1, "Start"

    .line 33
    .line 34
    invoke-direct {v0, v1, v2, v2, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 38
    .line 39
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 40
    .line 41
    const-string v1, "Resume"

    .line 42
    .line 43
    invoke-direct {v0, v1, v2, v2, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 47
    .line 48
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 49
    .line 50
    const-string v1, "Pause"

    .line 51
    .line 52
    invoke-direct {v0, v1, v3, v2, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 56
    .line 57
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 58
    .line 59
    const-string v1, "Stop"

    .line 60
    .line 61
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 65
    .line 66
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 67
    .line 68
    const-string v1, "DestroyView"

    .line 69
    .line 70
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 71
    .line 72
    .line 73
    sput-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 74
    .line 75
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 76
    .line 77
    const-string v1, "Destroy"

    .line 78
    .line 79
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 80
    .line 81
    .line 82
    sput-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 83
    .line 84
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 85
    .line 86
    const-string v1, "Detach"

    .line 87
    .line 88
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 89
    .line 90
    .line 91
    sput-object v0, Lcom/p1/mobile/android/app/c;->n:Lcom/p1/mobile/android/app/c;

    .line 92
    .line 93
    new-instance v0, Lcom/p1/mobile/android/app/c;

    .line 94
    .line 95
    const-string v1, "Finish"

    .line 96
    .line 97
    invoke-direct {v0, v1, v3, v2, v2}, Lcom/p1/mobile/android/app/c;-><init>(Ljava/lang/String;ZZZ)V

    .line 98
    .line 99
    .line 100
    sput-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 101
    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/p1/mobile/android/app/c;->b:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/p1/mobile/android/app/c;->d:Z

    .line 11
    .line 12
    return-void
.end method
