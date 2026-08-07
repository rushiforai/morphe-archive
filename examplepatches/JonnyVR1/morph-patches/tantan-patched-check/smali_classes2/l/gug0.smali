.class public final Ll/gug0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Ljava/lang/String;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Ljava/util/ArrayList;

.field public e:Ltech/sud/gip/core/GameInfo;

.field public final f:Ll/dog0;

.field public g:I

.field public h:Ll/bgg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/gug0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/gug0;->i:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ltech/sud/gip/core/SudLoadMGParamModel;ILjava/lang/String;Ll/krg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Ll/gug0;->g:I

    .line 13
    .line 14
    new-instance v1, Ll/mrg0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/mrg0;-><init>(Ll/gug0;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/gug0;->a:Landroid/content/Context;

    .line 20
    .line 21
    iput p3, p0, Ll/gug0;->b:I

    .line 22
    .line 23
    iput-object p4, p0, Ll/gug0;->c:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p5, p0, Ll/gug0;->f:Ll/dog0;

    .line 26
    .line 27
    new-instance p0, Ll/gmg0;

    .line 28
    .line 29
    sget-object p3, Ll/dlg0;->c:Ll/dlg0;

    .line 30
    .line 31
    const/4 p4, 0x0

    .line 32
    const-string p5, "SudGameRuntime hasn\'t been initialized"

    .line 33
    .line 34
    if-eqz p3, :cond_2

    .line 35
    .line 36
    invoke-direct {p0, p1, p2, p3, v1}, Ll/gmg0;-><init>(Landroid/content/Context;Ltech/sud/gip/core/SudLoadMGParamModel;Ll/dlg0;Ll/mrg0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/f0h0;

    .line 43
    .line 44
    sget-object p2, Ll/dlg0;->c:Ll/dlg0;

    .line 45
    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    invoke-direct {p0, p1, p2, v1}, Ll/f0h0;-><init>(Landroid/content/Context;Ll/dlg0;Ll/mrg0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    new-instance p0, Ll/thg0;

    .line 55
    .line 56
    sget-object p2, Ll/dlg0;->c:Ll/dlg0;

    .line 57
    .line 58
    if-eqz p2, :cond_0

    .line 59
    .line 60
    invoke-direct {p0, p1, p2, v1}, Ll/thg0;-><init>(Landroid/content/Context;Ll/dlg0;Ll/mrg0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-static {p5}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p4

    .line 71
    :cond_1
    invoke-static {p5}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p4

    .line 75
    :cond_2
    invoke-static {p5}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p4
.end method
