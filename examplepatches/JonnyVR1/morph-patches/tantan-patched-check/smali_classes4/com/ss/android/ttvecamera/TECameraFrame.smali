.class public Lcom/ss/android/ttvecamera/TECameraFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/TECameraFrame$d;,
        Lcom/ss/android/ttvecamera/TECameraFrame$e;,
        Lcom/ss/android/ttvecamera/TECameraFrame$f;,
        Lcom/ss/android/ttvecamera/TECameraFrame$b;,
        Lcom/ss/android/ttvecamera/TECameraFrame$c;,
        Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field public c:J

.field private d:Lcom/ss/android/ttvecamera/TECameraFrame$d;

.field private e:Lcom/ss/android/ttvecamera/TECameraFrame$c;


# direct methods
.method public constructor <init>(IIJ)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    invoke-direct {v0, v1, v1, v2, v3}, Lcom/ss/android/ttvecamera/TECameraFrame$c;-><init>(IIJ)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 13
    .line 14
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->a:I

    .line 15
    .line 16
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->b:I

    .line 17
    .line 18
    iput-wide p3, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->c:J

    .line 19
    .line 20
    return-void
.end method

.method public static g(Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraFrame$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :pswitch_0
    const/16 p0, 0x100

    .line 15
    .line 16
    return p0

    .line 17
    :pswitch_1
    const/16 p0, 0x2a

    .line 18
    .line 19
    return p0

    .line 20
    :pswitch_2
    const/16 p0, 0x29

    .line 21
    .line 22
    return p0

    .line 23
    :pswitch_3
    const/16 p0, 0x27

    .line 24
    .line 25
    return p0

    .line 26
    :pswitch_4
    const/16 p0, 0x10

    .line 27
    .line 28
    return p0

    .line 29
    :pswitch_5
    const/16 p0, 0x11

    .line 30
    .line 31
    return p0

    .line 32
    :pswitch_6
    const p0, 0x32315659

    .line 33
    .line 34
    .line 35
    return p0

    .line 36
    :pswitch_7
    const/16 p0, 0x23

    .line 37
    .line 38
    return p0

    .line 39
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public a()[B
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/ss/android/ttvecamera/TECameraFrame$b;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TECameraFrame$b;->a()[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public b()Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$c;->a:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 4
    .line 5
    return-object p0
.end method

.method public c()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/ss/android/ttvecamera/TECameraFrame$e;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TECameraFrame$e;->a()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public d([BILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V
    .locals 9

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraFrame$b;

    .line 2
    .line 3
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->a:I

    .line 4
    .line 5
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->b:I

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->c:J

    .line 8
    .line 9
    move-object v5, p1

    .line 10
    move v6, p2

    .line 11
    move-object v7, p3

    .line 12
    move v8, p4

    .line 13
    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttvecamera/TECameraFrame$b;-><init>(IIJ[BILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 17
    .line 18
    return-void
.end method

.method public e(II[FLcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraFrame$e;

    .line 2
    .line 3
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->a:I

    .line 4
    .line 5
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->b:I

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->c:J

    .line 8
    .line 9
    move v5, p1

    .line 10
    move v6, p2

    .line 11
    move-object v7, p3

    .line 12
    move-object v8, p4

    .line 13
    move v9, p5

    .line 14
    invoke-direct/range {v0 .. v9}, Lcom/ss/android/ttvecamera/TECameraFrame$e;-><init>(IIJII[FLcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 18
    .line 19
    return-void
.end method

.method public f(Ll/zrh0;ILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V
    .locals 9

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraFrame$f;

    .line 2
    .line 3
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->a:I

    .line 4
    .line 5
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->b:I

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->c:J

    .line 8
    .line 9
    move-object v5, p1

    .line 10
    move v6, p2

    .line 11
    move-object v7, p3

    .line 12
    move v8, p4

    .line 13
    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttvecamera/TECameraFrame$f;-><init>(IIJLl/zrh0;ILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->e:Lcom/ss/android/ttvecamera/TECameraFrame$c;

    .line 17
    .line 18
    return-void
.end method

.method public h(Lcom/ss/android/ttvecamera/TECameraFrame$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraFrame;->d:Lcom/ss/android/ttvecamera/TECameraFrame$d;

    .line 2
    .line 3
    return-void
.end method
