.class public Lcom/clevertap/android/pushsdk/values;
.super Ljava/lang/Object;


# instance fields
.field private final Class:[Ljava/lang/Object;

.field public Movie:D

.field private final decodeByteArray:[I

.field private final duration:[F

.field private final height:[J

.field private isOpaque:I

.field public onContextItemSelected:Ljava/lang/Object;

.field public onOptionsItemSelected:F

.field public openContextMenu:I

.field public registerForContextMenu:J

.field public setContentView:I

.field private setTime:I

.field private final sync:[D

.field public unregisterForContextMenu:J

.field public valueOf:F

.field public values:D

.field public width:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->height:[J

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    new-array v1, v0, [D

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->sync:[D

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    const/4 v1, 0x7

    aput-object p1, v0, v1

    const/4 p1, 0x0

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;I)V
    .locals 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    new-array v2, v0, [J

    iput-object v2, p0, Lcom/clevertap/android/pushsdk/values;->height:[J

    new-array v2, v0, [F

    iput-object v2, p0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    new-array v2, v0, [D

    iput-object v2, p0, Lcom/clevertap/android/pushsdk/values;->sync:[D

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    const/4 v2, 0x7

    aput-object p1, v0, v2

    const/16 p1, 0x8

    aput p2, v1, p1

    const/4 p1, 0x0

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;J)V
    .locals 3

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->height:[J

    new-array v2, v0, [F

    iput-object v2, p0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    new-array v2, v0, [D

    iput-object v2, p0, Lcom/clevertap/android/pushsdk/values;->sync:[D

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    const/4 v2, 0x7

    aput-object p1, v0, v2

    const/16 p1, 0x8

    aput-wide p2, v1, p1

    const/4 p1, 0x0

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->height:[J

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    new-array v1, v0, [D

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->sync:[D

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    const/4 v1, 0x7

    aput-object p1, v0, v1

    const/16 p1, 0x8

    aput-object p2, v0, p1

    const/4 p1, 0x0

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->height:[J

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    new-array v1, v0, [D

    iput-object v1, p0, Lcom/clevertap/android/pushsdk/values;->sync:[D

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    const/4 v1, 0x7

    aput-object p1, v0, v1

    const/16 p1, 0x8

    aput-object p2, v0, p1

    const/16 p1, 0x9

    aput-object p3, v0, p1

    const/4 p1, 0x0

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    return-void
.end method


# virtual methods
.method public openContextMenu(I)I
    .locals 20

    move-object/from16 v0, p0

    const/16 v2, 0xa

    const/16 v3, 0xe

    const/16 v4, 0x2f

    const/16 v5, 0x63

    const/16 v6, 0x4f

    const/4 v7, 0x5

    const/16 v8, 0x30

    const/4 v9, 0x3

    const/16 v10, 0xc

    const/16 v11, 0xb

    const/16 v12, 0x9

    const/16 v13, 0x80

    const/16 v14, 0x8

    const/4 v15, 0x7

    const/16 v16, 0x0

    const/16 v17, 0x2

    const/16 v18, 0x0

    const/16 v19, 0x4

    const/4 v1, 0x1

    packed-switch p1, :pswitch_data_0

    return p1

    :pswitch_0
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x5d

    aput v0, v1, v2

    return v18

    :pswitch_1
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x4d

    aput v0, v1, v2

    return v18

    :pswitch_2
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x45

    aput v0, v1, v2

    return v18

    :pswitch_3
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, -0x1

    iget-object v5, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    add-int/lit8 v6, v3, -0x1

    aget-object v6, v5, v6

    add-int/lit8 v7, v3, -0x1

    aput-object v16, v5, v7

    check-cast v6, [I

    array-length v6, v6

    aput v6, v2, v4

    sub-int/2addr v3, v1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput-object v16, v5, v3

    return v18

    :pswitch_4
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v15, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_5
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x6f

    aput v0, v1, v2

    return v18

    :pswitch_6
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x6d

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_7
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x7d

    aput v0, v1, v2

    return v18

    :pswitch_8
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x2b

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v5, v1, v2

    add-int/2addr v4, v5

    aput v4, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget v0, v1, v0

    aput v0, v1, v2

    return v18

    :pswitch_9
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v6, v1, v2

    return v18

    :pswitch_a
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x3a

    aput v0, v1, v2

    return v18

    :pswitch_b
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x79

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_c
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput-object v16, v1, v2

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    aget-object v4, v1, v2

    aput-object v16, v1, v2

    check-cast v4, [I

    array-length v4, v4

    aput v4, v3, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput-object v16, v1, v2

    return v18

    :pswitch_d
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x75

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v5, v1, v2

    add-int/2addr v4, v5

    aput v4, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget v0, v1, v0

    aput v0, v1, v2

    return v18

    :pswitch_e
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-wide v4, v1, v14

    aput-wide v4, v1, v2

    add-int/lit8 v4, v2, 0x2

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-wide v4, v1, v2

    aput-wide v4, v1, v3

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    add-int/lit8 v3, v2, -0x1

    aget-object v3, v0, v3

    add-int/lit8 v6, v2, -0x1

    aput-object v16, v0, v6

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, -0x1

    aput-wide v4, v1, v2

    return v18

    :pswitch_f
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v1, v2, v3

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v3, -0x1

    add-int/lit8 v1, v3, -0x1

    aget v1, v2, v1

    aget v3, v2, v3

    add-int/2addr v1, v3

    aput v1, v2, v0

    return v18

    :pswitch_10
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x48

    aput v0, v1, v2

    return v18

    :pswitch_11
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x21

    aput v0, v1, v2

    return v18

    :pswitch_12
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v3, v1

    aget-wide v1, v2, v3

    iput-wide v1, v0, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    return v18

    :pswitch_13
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    aget-wide v3, v1, v3

    aput-wide v3, v1, v2

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    add-int/lit8 v5, v2, -0x1

    add-int/lit8 v6, v2, -0x2

    aget-object v6, v0, v6

    add-int/lit8 v7, v2, -0x2

    aput-object v16, v0, v7

    aput-object v6, v0, v5

    add-int/lit8 v2, v2, -0x2

    aput-wide v3, v1, v2

    return v18

    :pswitch_14
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v4, v1, v15

    aput-object v4, v1, v2

    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-wide v4, v1, v14

    aput-wide v4, v1, v3

    return v18

    :pswitch_15
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput-object v16, v1, v2

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    aget-object v3, v1, v2

    aput-object v16, v1, v2

    check-cast v3, [I

    array-length v1, v3

    aput v1, v0, v2

    return v18

    :pswitch_16
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x29

    aput v0, v1, v2

    return v18

    :pswitch_17
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v4, v1, v14

    aput-object v4, v1, v2

    add-int/lit8 v4, v2, 0x2

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v2

    aput-object v16, v1, v2

    aput-object v0, v1, v3

    add-int/lit8 v3, v2, -0x1

    aget-object v3, v1, v3

    add-int/lit8 v4, v2, -0x1

    aput-object v16, v1, v4

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, -0x1

    aput-object v0, v1, v2

    return v18

    :pswitch_18
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v11, v1, v2

    return v18

    :pswitch_19
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x32

    aput v0, v1, v2

    return v18

    :pswitch_1a
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x4b

    aput v0, v1, v2

    return v18

    :pswitch_1b
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v4, v1, -0x2

    add-int/lit8 v5, v1, -0x2

    aget v5, v3, v5

    aget v6, v3, v2

    add-int/2addr v5, v6

    aput v5, v3, v4

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v1, -0x2

    aget v4, v3, v4

    aput v4, v3, v2

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v13, v3, v1

    return v18

    :pswitch_1c
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x1f

    aput v0, v1, v2

    return v18

    :pswitch_1d
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput-object v16, v1, v2

    return v18

    :pswitch_1e
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x13

    aput v0, v1, v2

    return v18

    :pswitch_1f
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v1, v2

    add-int/lit8 v4, v2, 0x2

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget v0, v1, v2

    aget v3, v1, v3

    rem-int/2addr v0, v3

    aput v0, v1, v2

    return v18

    :pswitch_20
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aput v4, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v13, v1, v3

    return v18

    :pswitch_21
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x43

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_22
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v5, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v5, v1, v2

    add-int/2addr v4, v5

    aput v4, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget v0, v1, v0

    aput v0, v1, v2

    return v18

    :pswitch_23
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v5, v1, v2

    return v18

    :pswitch_24
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x50

    aput v0, v1, v2

    return v18

    :pswitch_25
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v4, v1, -0x2

    add-int/lit8 v5, v1, -0x2

    aget v5, v3, v5

    aget v2, v3, v2

    div-int/2addr v5, v2

    aput v5, v3, v4

    add-int/lit8 v1, v1, -0x2

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aput-object v16, v0, v1

    return v18

    :pswitch_26
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v18, v1, v2

    return v18

    :pswitch_27
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x47

    aput v0, v1, v2

    return v18

    :pswitch_28
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, -0x1

    aget-object v4, v2, v4

    sub-int/2addr v3, v1

    aput-object v16, v2, v3

    iput-object v4, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    return v18

    :pswitch_29
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x59

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_2a
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x65

    aput v0, v1, v2

    return v18

    :pswitch_2b
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v4, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v5, v1, v2

    add-int/2addr v4, v5

    aput v4, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget v0, v1, v0

    aput v0, v1, v2

    return v18

    :pswitch_2c
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v9, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    shl-int v2, v3, v2

    aput v2, v1, v0

    return v18

    :pswitch_2d
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v13, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    rem-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_2e
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v6, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v5, v1, v2

    add-int/2addr v4, v5

    aput v4, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget v0, v1, v0

    aput v0, v1, v2

    return v18

    :pswitch_2f
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aget-object v4, v3, v2

    aput-object v16, v3, v2

    aput-object v4, v3, v14

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput-object v4, v3, v2

    return v18

    :pswitch_30
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v2, 0x1

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v5, v1, v10

    aput-object v5, v1, v2

    iget-object v5, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    add-int/lit8 v6, v2, 0x2

    iput v6, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-wide v7, v5, v3

    aput-wide v7, v5, v4

    add-int/2addr v2, v9

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v11

    aput-object v0, v1, v6

    return v18

    :pswitch_31
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aget-object v1, v0, v2

    aput-object v16, v0, v2

    aput-object v1, v0, v10

    return v18

    :pswitch_32
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v2

    aput-object v0, v1, v3

    return v18

    :pswitch_33
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v11

    aput-object v0, v1, v2

    return v18

    :pswitch_34
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v4, v1, v15

    aput-object v4, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v12

    aput-object v0, v1, v3

    return v18

    :pswitch_35
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    aget-wide v1, v0, v2

    aput-wide v1, v0, v3

    return v18

    :pswitch_36
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-wide v3, v1, v10

    aput-wide v3, v1, v2

    return v18

    :pswitch_37
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    aget-wide v1, v0, v2

    aput-wide v1, v0, v10

    return v18

    :pswitch_38
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v19, v1, v2

    return v18

    :pswitch_39
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v8, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v18, v1, v3

    return v18

    :pswitch_3a
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 v0, 0x6

    aput v0, v1, v2

    return v18

    :pswitch_3b
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    aget-object v3, v1, v3

    aput-object v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v2

    aput-object v16, v1, v2

    aput-object v0, v1, v11

    return v18

    :pswitch_3c
    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v3, v1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aget-object v1, v0, v3

    aput-object v16, v0, v3

    aput-object v1, v0, v2

    return v18

    :pswitch_3d
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget-object v0, v1, v0

    aput-object v0, v1, v2

    return v18

    :pswitch_3e
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v12

    aput-object v0, v1, v2

    return v18

    :pswitch_3f
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aget-object v4, v3, v2

    aput-object v16, v3, v2

    if-nez v4, :cond_0

    goto :goto_0

    :cond_0
    move/from16 v1, v18

    :goto_0
    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    return v18

    :pswitch_40
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    :goto_1
    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    if-ltz v2, :cond_1

    aput-object v16, v3, v2

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_1
    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    aput-object v0, v3, v18

    return v18

    :pswitch_41
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v15, v1, v2

    return v18

    :pswitch_42
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x3e

    aput v0, v1, v2

    return v18

    :pswitch_43
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x19

    aput v0, v1, v2

    return v18

    :pswitch_44
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v12, v1, v2

    return v18

    :pswitch_45
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v4, v1, -0x2

    add-int/lit8 v5, v1, -0x2

    aget v5, v3, v5

    aget v2, v3, v2

    rem-int/2addr v5, v2

    aput v5, v3, v4

    add-int/lit8 v1, v1, -0x2

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aput-object v16, v0, v1

    return v18

    :pswitch_46
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v19, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v7, v1, v3

    return v18

    :pswitch_47
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v4, v1, -0x2

    add-int/lit8 v5, v1, -0x2

    aget v5, v3, v5

    aget v6, v3, v2

    add-int/2addr v5, v6

    aput v5, v3, v4

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v1, v1, -0x2

    aget v0, v3, v1

    aput v0, v3, v2

    return v18

    :pswitch_48
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x69

    aput v0, v1, v2

    return v18

    :pswitch_49
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aput v4, v1, v2

    add-int/lit8 v4, v2, 0x2

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v13, v1, v3

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget v0, v1, v2

    aget v3, v1, v3

    rem-int/2addr v0, v3

    aput v0, v1, v2

    return v18

    :pswitch_4a
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v7, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_4b
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aput-object v16, v0, v2

    return v18

    :pswitch_4c
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v1, v3

    return v18

    :pswitch_4d
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v1, v2, v3

    return v18

    :pswitch_4e
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    aget v2, v3, v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    move/from16 v1, v18

    :goto_2
    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    return v18

    :pswitch_4f
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aget-object v4, v3, v2

    aput-object v16, v3, v2

    if-eqz v4, :cond_3

    goto :goto_3

    :cond_3
    move/from16 v1, v18

    :goto_3
    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    return v18

    :pswitch_50
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v14

    aput-object v0, v1, v2

    return v18

    :pswitch_51
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/4 v3, 0x0

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v1, v1, v2

    cmpl-float v1, v4, v1

    aput v1, v0, v3

    return v18

    :pswitch_52
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->duration:[F

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget v0, v0, Lcom/clevertap/android/pushsdk/values;->onOptionsItemSelected:F

    aput v0, v1, v2

    return v18

    :pswitch_53
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v8, v1, v2

    return v18

    :pswitch_54
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    aget-wide v2, v1, v2

    iput-wide v2, v0, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    return v18

    :pswitch_55
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    add-int/lit8 v3, v1, -0x2

    add-int/lit8 v1, v1, -0x2

    aget-wide v4, v0, v1

    aget-wide v1, v0, v2

    sub-long/2addr v4, v1

    aput-wide v4, v0, v3

    return v18

    :pswitch_56
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-wide v4, v1, v12

    aput-wide v4, v1, v2

    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v15

    aput-object v0, v1, v3

    return v18

    :pswitch_57
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v4, -0x1a

    aput v4, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v8, v1, v3

    return v18

    :pswitch_58
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v18, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v18, v1, v3

    return v18

    :pswitch_59
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    aget-wide v1, v0, v2

    aput-wide v1, v0, v12

    return v18

    :pswitch_5a
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->height:[J

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-wide v3, v0, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    aput-wide v3, v1, v2

    return v18

    :pswitch_5b
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v3, v1, -0x2

    add-int/lit8 v1, v1, -0x2

    aget v1, v0, v1

    aget v2, v0, v2

    add-int/2addr v1, v2

    aput v1, v0, v3

    return v18

    :pswitch_5c
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v18, v1, v2

    return v18

    :pswitch_5d
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v4, 0x25

    aput v4, v1, v2

    add-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v18, v1, v3

    return v18

    :pswitch_5e
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v9, v1, v2

    return v18

    :pswitch_5f
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v7, v1, v2

    return v18

    :pswitch_60
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x2c

    aput v0, v1, v2

    return v18

    :pswitch_61
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v3, v1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget v1, v2, v3

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    return v18

    :pswitch_62
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x7a

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    aget v4, v1, v4

    aget v5, v1, v2

    sub-int/2addr v4, v5

    aput v4, v1, v3

    add-int/lit8 v3, v2, -0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x2

    add-int/lit8 v2, v2, -0x2

    aget v2, v1, v2

    aget v3, v1, v3

    shl-int/2addr v2, v3

    aput v2, v1, v0

    return v18

    :pswitch_63
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v4, v1, v2

    return v18

    :pswitch_64
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    rem-int/2addr v3, v2

    aput v3, v1, v0

    return v18

    :pswitch_65
    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    sub-int/2addr v2, v1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    aget v2, v3, v2

    if-eqz v2, :cond_4

    goto :goto_4

    :cond_4
    move/from16 v1, v18

    :goto_4
    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    return v18

    :pswitch_66
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v3, v1, -0x2

    add-int/lit8 v1, v1, -0x2

    aget v1, v0, v1

    aget v2, v0, v2

    rem-int/2addr v1, v2

    aput v1, v0, v3

    return v18

    :pswitch_67
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v13, v1, v2

    return v18

    :pswitch_68
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    aget v0, v1, v0

    aput v0, v1, v2

    return v18

    :pswitch_69
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v3, 0x31

    aput v3, v1, v2

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v3, v2, -0x1

    aget v3, v1, v3

    aget v2, v1, v2

    add-int/2addr v3, v2

    aput v3, v1, v0

    :pswitch_6a
    return v18

    :pswitch_6b
    iget-object v2, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v2, v3

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v4, v3, -0x1

    add-int/lit8 v5, v3, -0x1

    aget v5, v2, v5

    aget v6, v2, v3

    rem-int/2addr v5, v6

    aput v5, v2, v4

    sub-int/2addr v3, v1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    aput-object v16, v0, v3

    return v18

    :pswitch_6c
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aput v17, v1, v2

    return v18

    :pswitch_6d
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v3, v1, -0x2

    add-int/lit8 v1, v1, -0x2

    aget v1, v0, v1

    aget v2, v0, v2

    sub-int/2addr v1, v2

    aput v1, v0, v3

    return v18

    :pswitch_6e
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    aget v1, v1, v2

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    return v18

    :pswitch_6f
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    aget-object v3, v1, v2

    aput-object v16, v1, v2

    iput-object v3, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    return v18

    :pswitch_70
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->setTime:I

    return v18

    :pswitch_71
    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v2, v1, -0x1

    iput v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    add-int/lit8 v3, v1, -0x2

    add-int/lit8 v1, v1, -0x2

    aget v1, v0, v1

    aget v2, v0, v2

    shr-int/2addr v1, v2

    aput v1, v0, v3

    return v18

    :pswitch_72
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x10

    aput v0, v1, v2

    return v18

    :pswitch_73
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget v0, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    aput v0, v1, v2

    return v18

    :pswitch_74
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->decodeByteArray:[I

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    const/16 v0, 0x16

    aput v0, v1, v2

    return v18

    :pswitch_75
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    aput-object v0, v1, v2

    return v18

    :pswitch_76
    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->Class:[Ljava/lang/Object;

    iget v2, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->isOpaque:I

    aget-object v0, v1, v15

    aput-object v0, v1, v2

    return v18

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_76
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
