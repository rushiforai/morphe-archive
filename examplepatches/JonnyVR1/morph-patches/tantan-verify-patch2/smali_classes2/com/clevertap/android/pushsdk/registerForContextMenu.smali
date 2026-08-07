.class public Lcom/clevertap/android/pushsdk/registerForContextMenu;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/interfaces/NotificationRenderedListener;


# static fields
.field private static decodeByteArray:I

.field private static duration:C

.field private static height:C

.field private static isOpaque:C

.field public static final setContentView:[B

.field private static setTime:C

.field private static sync:I

.field public static final unregisterForContextMenu:I

.field private static final valueOf:Ljava/lang/String;


# instance fields
.field private Movie:J

.field private onContextItemSelected:Ljava/util/concurrent/ScheduledExecutorService;

.field private onOptionsItemSelected:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private openContextMenu:Z

.field private registerForContextMenu:J

.field private values:Landroid/content/BroadcastReceiver$PendingResult;

.field private final width:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    invoke-static {}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected()V

    const/4 v0, 0x0

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    const/4 v1, 0x1

    sput v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    invoke-static {}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu()V

    invoke-static {v0}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    add-int/lit8 v2, v2, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "\ub019\u2fea\u996a\ueaa7"

    invoke-static {v3, v2, v1}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Ljava/lang/String;I[Ljava/lang/Object;)V

    aget-object v0, v1, v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->valueOf:Ljava/lang/String;

    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    add-int/lit8 v0, v0, 0x7

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;-><init>(Lcom/clevertap/android/pushsdk/registerForContextMenu;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->width:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic onOptionsItemSelected(Lcom/clevertap/android/pushsdk/registerForContextMenu;)J
    .locals 16

    .line 4
    new-instance v0, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;)V

    sget-object v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v1, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0x74c

    const/16 v7, 0x18d

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v1, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v1, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v1, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v6, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v12, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v1, v1, v4

    int-to-byte v1, v1

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v1, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v1, v8, v3

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v7, v6, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    array-length v2, v1

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v1

    if-ge v5, v6, :cond_2

    aget-object v6, v1, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v8, v7, v4

    int-to-byte v8, v8

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x96b

    const/16 v13, 0x1e1

    invoke-static {v8, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v11, v3

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/16 v11, 0x16

    aget-byte v11, v7, v11

    int-to-byte v11, v11

    or-int/lit16 v14, v11, 0x34d

    int-to-short v14, v14

    new-array v15, v4, [Ljava/lang/Object;

    move/from16 p0, v3

    const/16 v3, 0x1eb

    invoke-static {v11, v14, v3, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v15, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v11, v7, v4

    int-to-byte v11, v11

    new-array v14, v4, [Ljava/lang/Object;

    invoke-static {v11, v9, v10, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v11, v14, p0

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v8, v3, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v8, 0x0

    invoke-virtual {v3, v8, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v7, v4

    int-to-byte v6, v6

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v6, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v11, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v11, 0x43

    aget-byte v7, v7, v11

    int-to-byte v7, v7

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v7, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v11, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    :goto_1
    add-int/lit8 v1, v3, 0x1

    aget v3, v2, v3

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v3

    const/16 v5, 0x12

    const/16 v6, 0x1d

    const/16 v7, 0x9

    const/4 v8, 0x4

    const/4 v9, 0x7

    packed-switch v3, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    move v3, v8

    goto :goto_1

    :pswitch_1
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-wide v7, v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->Movie:J

    iput-wide v7, v0, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    invoke-virtual {v0, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_3

    :pswitch_2
    const/16 v3, 0x13

    goto :goto_1

    :pswitch_3
    move v3, v7

    goto :goto_1

    :pswitch_4
    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v0, v0, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    return-wide v0

    :pswitch_5
    sget v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :goto_2
    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_3

    :pswitch_6
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto :goto_3

    :pswitch_7
    const/16 v3, 0x29

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v3, :cond_3

    const/16 v1, 0x11

    goto :goto_3

    :pswitch_8
    move v3, v5

    goto :goto_1

    :pswitch_9
    move v3, v4

    goto :goto_1

    :pswitch_a
    sget v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto :goto_2

    :pswitch_b
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_3
    :goto_3
    move v3, v1

    goto :goto_1

    :pswitch_c
    invoke-virtual {v0, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v3, :cond_3

    move v3, v6

    goto :goto_1

    :pswitch_d
    const/16 v3, 0x1e

    goto :goto_1

    :pswitch_e
    move v3, v9

    goto :goto_1

    :catchall_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_4

    throw v1

    :cond_4
    throw v0

    :pswitch_data_0
    .packed-switch -0xf
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

.method public static synthetic onOptionsItemSelected(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;
    .locals 16

    .line 2
    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    invoke-direct {v1, v0, v2}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0xa98

    const/16 v7, 0x165

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v0, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v6, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v12, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v0, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v7, v6, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/16 v7, 0x16

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v11, v8, v4

    int-to-byte v11, v11

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v13, 0x96b

    const/16 v14, 0x1e1

    invoke-static {v11, v13, v14, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v11, v12, v3

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    aget-byte v7, v8, v7

    int-to-byte v7, v7

    or-int/lit16 v12, v7, 0x34d

    int-to-short v12, v12

    new-array v15, v4, [Ljava/lang/Object;

    move/from16 p0, v3

    const/16 v3, 0x1eb

    invoke-static {v7, v12, v3, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v15, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v7, v8, v4

    int-to-byte v7, v7

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v10, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v12, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v11, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v3, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v8, v4

    int-to-byte v6, v6

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v6, v13, v14, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v11, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v11, 0x43

    aget-byte v8, v8, v11

    int-to-byte v8, v8

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v8, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v11, p0

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    :cond_3
    :goto_1
    add-int/lit8 v5, v3, 0x1

    const/16 v6, 0x27

    :try_start_3
    aget v0, v2, v3

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0

    const/16 v3, 0x9

    const/4 v8, 0x4

    const/16 v9, 0x4f

    const/4 v10, 0x7

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    const/4 v3, 0x5

    goto :goto_1

    :pswitch_1
    const/4 v0, 0x2

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v3, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/Future;

    iput-object v0, v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected:Ljava/util/concurrent/Future;

    goto :goto_4

    :catchall_2
    move-exception v0

    goto/16 :goto_6

    :pswitch_2
    const/16 v3, 0x18

    goto :goto_1

    :pswitch_3
    const/16 v3, 0xc

    goto :goto_1

    :pswitch_4
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/Future;

    return-object v0

    :pswitch_5
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    :goto_2
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    goto :goto_3

    :pswitch_6
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    goto :goto_4

    :pswitch_7
    const/16 v0, 0x12

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_4

    move v3, v7

    goto :goto_1

    :pswitch_8
    const/16 v3, 0x17

    goto :goto_1

    :pswitch_9
    move v3, v4

    goto :goto_1

    :pswitch_a
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    goto :goto_2

    :goto_3
    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_4

    :pswitch_b
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    :cond_4
    :goto_4
    move v3, v5

    goto :goto_1

    :pswitch_c
    const/16 v0, 0x29

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_4

    const/16 v0, 0x21

    :goto_5
    move v3, v0

    goto/16 :goto_1

    :pswitch_d
    const/16 v3, 0x2a

    goto/16 :goto_1

    :pswitch_e
    const/16 v3, 0x28

    goto/16 :goto_1

    :pswitch_f
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    throw v0

    :pswitch_10
    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/16 v3, 0xa

    if-eqz v0, :cond_3

    if-eq v0, v4, :cond_5

    goto/16 :goto_1

    :cond_5
    const/16 v0, 0x23

    goto :goto_5

    :pswitch_11
    move v3, v6

    goto/16 :goto_1

    :goto_6
    const/16 v3, 0x24

    if-lt v5, v3, :cond_6

    if-gt v5, v6, :cond_6

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v3, 0x22

    goto/16 :goto_1

    :cond_6
    throw v0

    :catchall_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_7

    throw v1

    :cond_7
    throw v0

    :pswitch_data_0
    .packed-switch -0x12
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

.method public static onOptionsItemSelected()V
    .locals 4

    .line 3
    const/16 v0, 0xaae

    new-array v1, v0, [B

    const-string v2, "t\u000c\u0080l\u000f\u0001\u0006\u00ff\u00fc\u0016\u00df\u001e\u00da)\u0006\u00f5\u0016\u0007\u00fe\u0008\u00fe\u0010\u0000\u00f9\u0004\u0008\u00fd\u0004\t\u00fc\u0008\u0003\u00fe\u0008\u0003\u00fe\u0008\t\u00f8\u000b\u0003\u00fb\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u0010\u0001\u00f8\u000b\u0007\u00f7\u0008\u0008\u00f9\u0008\t\u00f8\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u000f\u00fb\u00ff\u0010\u00fc\u00fd\u0008\t\u00f8\u0004\u0007\u0004\u00fd\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u0007\u0005\u00fc\u0004\u0007\u0006\u00fb\u0004\u0007\u0007\u00fa\u0004\u0007\u0008\u00f9\u0008\u0005\u00fc\u0010\u0002\u00f7\u000b\u0003\u00fb\u0004\u000b\u00fa\u0004\u0007\t\u00f8\t\u0008\u00f8\u0004\u0007\n\u00f7\u000b\u0001\u00fd\u0004\u0007\n\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdD\u0007\u00be\u00176\u00fc\u00f9\u000b\u00fc\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0004\t\u00fc\u000b\u0002\u00fc\u0008\t\u00f8\u000b\u0003\u00fb\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u0008\u0002\t\u00f9\u0008\u0008\u00f9\u0008\t\u00f8\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u0008\u0005\u00fc\u0008\u0002\n\u00f8\u0004\u000b\u00fa\u0004\u0007\u0004\u00fd\u0008\u0002\u000b\u00f7\u000b\u0005\u00f9\u0004\u0007\u0005\u00fc\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u0007\u0006\u00fb\u0004\u0007\u0007\u00fa\u0004\u0007\u0008\u00f9\u0004\u0007\u0008\u00f9\u0004\u0007\t\u00f8\u0008\u0002\u000c\u00f6\u0004\u0007\n\u00f7\u0008\u0003\u0002\u00ff\u0004\u0007\n\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca()\u00fd\u0004\u00f4\u000b\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca\u001e(\t\u00f4\u0005\u0001\u0010\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca\'&\u00fc\u0003\u00f6\u0004\r\u00fc\u0007\u00fe\u0008\u00fe\n\t\u00f6\u0004\u0008\u00fd\u0004\t\u00fc\u0008\u0003\u00fe\u0008\u0003\u00fe\u000c\u00fe\u00ff\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u000f\u0000\u00fa\u000e\u0000\u00fb\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0002\u00ff\u0004\u000c\u00f9\u000f\u0001\u00f9\u000f\u0002\u00f8\u0008\t\u00f8\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u0007\u0003\u00fe\u0004\u0007\u0004\u00fd\u0004\u0007\u0005\u00fc\u0004\u0007\u0005\u0000\u00ff\u0000\u000e\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca!&\u0002\u00fc\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca)\u0017\r\u00f6\u00ff\u0006\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0004\t\u00fc\u0008\u0003\u00fe\u0008\u0004\u00fd\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u0008\u0003\u0003\u00fe\u0008\u0008\u00f9\u0008\t\u00f8\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0002\u00ff\u0004\u000c\u00f9\u0008\u0003\u0004\u00fd\t\t\u00f7\u0008\u0007\u00fa\u000e\u0000\u00fb\u0004\r\u00f8\u0008\u000b\u00f6\u0004\u0007\u0003\u00fe\u0004\u0007\u0004\u00fd\u0004\u0007\u0005\u00fc\u0004\u0007\u0005\u0006\u0008\u00fe\r\u00f8\u0001\u0012\u00d46\u00ff\u0001\u00f2\u0015\u000f\u0001\u00c4<\u000b\u0003\u00fb\u0008\u00fc\u00cc;\u0006\u000c\u00f6\u0000\u0002\u0015\u00f5\u00ccB\u00fb\u0011\u0003\u00f1\t\u0005\u0008\u00fc\u00ca\'\u0016\u000b\u0005\u0008\u00f4\u00eb\u001b\u0011\u0003\u00f1\t\u0001\u00ff\u0006\u0003\u0000\r\u00f5\u0001\u000f\u0002\u00f9\u0012\u0005\u00fa\u0008\t\u00e2$\u00f0\u0005\u000b\u00ec!\u00f2\u0005\u0005\u00fa\u0015\u00df\u0019\u0008\u00fc\u0008\u00fc\u00f2\u0017\r\u00f6\u00ff\u0006\u00f2\u0013\u0008\u0000\u0002\u0014\u00fa\u00fc\u0002\u00e46\u00f0\u0001\u0015\u0002\u00fe\u0006\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca\u001a6\u00ee\u0005\u000e\u0007\u00f8\t\u0002\u00fa\u0018\u00ee\u00d0J\u0002\u00f8\u0006\u00c58\u000f\u0002\u00f8\u0015\u0000\u0003\u00f6\u000c\t\u00bd\u001a6\u00f0\u0001\u0015\u0002\u00fe\u0006\u0004\u00fe\u00e2\u0016\u0010\u0004\u0007\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cd8\u000f\u0002\t\u00f4\u000c\t\u00bd\u00173\u0000\u00f5\u0006\u0002\u0001\u0015\u0004\u00e1\u0016\u0001\u0005\u0007\u0010\u00f2\u0010\u00b5/\u0018\u000c\u00f9\u0008\u0008\u00fc\u00ee\u0016\u0011\u0005\u00fa\u000b\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca($\u0001\u00fa\u0008\u00fc\u00de6\u00f7\u0006\u00fb\u0004\u0010\u000f\u0001\u00c48\u000c\u00fc\u0014\u00f2\u0010\u0005\u00f0\u0012\u00c16\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdH\u00f4\n\u00c6!&\u00fb\u0003\u0001\u0010\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca)\u0017\r\u0000\u000b\u00ed\u0004\r\u00fc\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0004\t\u00fc\u0008\u0003\u00fe\u0008\u0004\u00fd\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u0008\u0003\u0005\u00fc\u000b\u0005\u00f9\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u0008\u0003\u0006\u00fb\t\t\u00f7\u0008\u0007\u00fa\u0008\u0008\u00f9\u0008\t\u00f8\u0004\u0007\u0004\u00fd\u0008\u000b\u00f6\u0004\u0007\u0005\u00fc\u0004\u0007\u0006\u00fb\u0004\u0007\u0007\u00fa\u0004\u0007\u0007\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0004\t\u00fc\u0008\u0003\u00fe\u0008\u0003\u00fe\u0008\t\u00f8\u000b\u0003\u00fb\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u0008\u0003\u0007\u00fa\u0008\u0007\u00fa\u000e\u0000\u00fb\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u0008\u0005\u00fc\u0010\u00fa\u00ff\u0008\u0003\u0008\u00f9\u0004\u000b\u00fa\u0004\u0007\u0004\u00fd\u0008\u0003\t\u00f8\t\t\u00f7\u0008\u0007\u00fa\u0008\u0008\u00f9\u0008\t\u00f8\u0004\u0007\u0005\u00fc\u0008\u000b\u00f6\u0004\u0007\u0006\u00fb\u0004\u0007\u0007\u00fa\u0004\u0007\u0008\u00f9\u0004\u0007\u0008\u00f9\u0004\u0007\t\u00f8\u0008\u0003\n\u00f7\u0004\u0007\n\u00f7\u0008\u0003\u000b\u00f6\u0004\u0007\n\u00f6\u0010\u0004\u0007\u00f5\u0001\u000f\u0002\u00f9\u0012\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cd8\u000f\u0002\t\u00f4\u000c\t\u00bd\u001e(\t\u00f4\u000c\t\u00f8\u00fe\u00fe\u00e7\u0015\u0001\u000f\u0002\u00f9\u0012\u00fc\u0015\u00f8\u00de/\u00f8\u0004\u00f6\u0010\u0004\u00e8\u0018\u0007\u00fb\u00fa\u0018\u00ee\u00d0J\u0002\u00f8\u0006\u00c58\u000f\u0002\u00f8\u0015\u0000\u0003\u00f6\u000c\t\u00bd(\u0013\u0008\u0000\u0002\u0014\u00fa\u00fc\u0002\u00e46\u00f0\u0001\u0015\u0002\u00fe\u0006\u00e4\u0015\u0010\u0007\u00f6\u00fd\u0005\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0004\t\u00fc\n\t\u00f6\u0004\n\u00fb\u0004\u000b\u00fa\u0004\u000c\u00f9\u000c\u0005\u00f8\u0004\r\u00f8\u0004\u000c\u00f9\u0004\u000e\u00f7\u0004\u000f\u00f6\u000c\u0005\u00f8\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u000c\u0006\u00f7\u000c\u0007\u00f6\u0004\u0007\u0004\u00fd\r\u00fd\u00ff\u0004\u0007\u0005\u00fc\r\u00fe\u00fe\u0004\u0007\u0006\u00fb\r\u00ff\u00fd\u0004\u0007\u0007\u00fa\t\t\u00f7\u0004\u0007\u0008\u00f9\u0004\u0007\t\u00f8\u0004\u0007\n\u00f7\r\u0000\u00fc\u0004\u0007\u0006\u00fb\t\u0008\u00f8\u0004\u0007\u000b\u00f6\t\t\u00f7\u0004\u0007\u0008\u00f9\u0004\u0007\t\u00f8\u0004\u0008\u0001\u00ff\u0004\u0008\u0002\u00fe\r\u0001\u00fb\u0004\u0008\u0003\u00fd\r\u0002\u00fa\u0004\u0008\u0004\u00fc\r\u0003\u00f9\u0008\u00fe\u0004\u0008\u0005\u00fb\u0004\u0008\u0006\u00fa\u0008\u00fe\u0004\u0008\u0007\u00f9\u0008\u00fe\u0004\u0008\u0008\u00f8\r\u0002\u00fa\u0004\u0008\u0003\u00fd\u0004\u0008\t\u00f7\u000b\u0003\u00fb\u0004\u0008\n\u00f6\u0004\t\u0000\u00ff\u0004\t\u0001\u00fe\u0008\u00fe\u000c\u0006\u00f7\u0004\t\u0002\u00fd\u0004\t\u0003\u00fc\r\u0004\u00f8\r\u0005\u00f7\r\u0006\u00f6\n\t\u00f6\u0004\t\u0004\u00fb\u000e\u00fc\u00ff\u0008\u00fe\u000e\u00fd\u00fe\u0004\t\u0005\u00fa\u000e\u00fe\u00fd\u0004\t\u0006\u00f9\u0004\t\u0007\u00f8\u0004\t\u0008\u00f7\u000b\u0002\u00fc\u0008\t\u00f8\u000b\u0003\u00fb\u0004\t\t\u00f6\u0008\u0003\u00fe\u0008\u000b\u00f6\u000b\u0003\u00fb\u0004\t\u0001\u00fe\u0008\u0005\u00fc\u0004\t\u0008\u00f7\u0004\n\u00ff\u00ff\u000e\u00ff\u00fc\u000e\u0000\u00fb\u0004\n\u0000\u00fe\u0008\u000b\u00f6\u0004\n\u0001\u00fd\u0004\n\u0002\u00fc\u0004\n\u0003\u00fb\r\u0000\u00fc\u000e\u0001\u00fa\u000b\u0003\u00fb\u0004\t\u0001\u00fe\u0004\n\u00ff\u00ff\u000e\u0002\u00f9\u000e\u0000\u00fb\u0004\n\u0000\u00fe\u0008\u000b\u00f6\u0004\n\u0004\u00fa\u0004\n\u0005\u00f9\u0004\n\u0006\u00f8\u0004\n\u0006\u00f8\u0004\n\u00ff\u00ff\u000e\u0003\u00f8\t\t\u00f7\u0008\u0007\u00fa\u0008\u0008\u00f9\u0008\t\u00f8\u0004\n\u0000\u00fe\u0008\u0003\u00fe\u0008\t\u00f8\u0004\n\u0007\u00f7\u0004\n\u0008\u00f6\u0004\u000b\u00fe\u00ff\u0004\u000b\u00fe\u00ff\u0004\n\u00ff\u00ff\u000e\u0004\u00f7\u0008\u0007\u00fa\u000e\u0000\u00fb\u0004\n\u0000\u00fe\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000b\u00ff\u00fe\u0004\u000b\u0000\u00fd\u0004\u000b\u0001\u00fc\u0004\u000b\u0002\u00fb\u000c\u0005\u00f8\u000f\u00fb\u00ff\u000f\u00fc\u00fe\u000f\u00fd\u00fd\u0004\u000b\u0003\u00fa\u0004\u000c\u00f9\u0004\u000e\u00f7\u0004\u000b\u0004\u00f9\u000f\u00fe\u00fc\u0004\u000b\u0005\u00f8\u000f\u00ff\u00fb\u0004\u000b\u0005\u00f8\u0004\u000b\u0006\u00f7\u000b\u0001\u00fd\u0004\u000b\u0007\u00f6\t\u0008\u00f8\u0004\u000b\u0007\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca($\u0001\u00fa\u0008\u00fc\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0004\t\u00fc\u000f\u0003\u00f7\u000b\u0003\u00fb\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u000f\u0004\u00f6\t\t\u00f7\u000b\u0005\u00f9\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u0008\u0005\u00fc\u0010\u00fa\u00ff\u0004\u0007\u0004\u00fd\u000b\u0003\u00fb\u0004\u000b\u00fa\u0004\u000c\u00f9\u0010\u00fb\u00fe\u0010\u00fc\u00fd\u0008\t\u00f8\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u0007\u0005\u00fc\u0004\u0007\u0006\u00fb\u0004\u0007\u0007\u00fa\u0004\u0007\u0003\u00fe\u0008\u00fe\u0004\u0008\u00fd\u0010\u00fd\u00fc\u000f\u00fc\u00fe\u000f\u00fd\u00fd\u0004\t\u00fc\u0004\u0007\u0008\u00f9\u0010\u00fe\u00fb\u0004\u0007\t\u00f8\u0010\u00ff\u00fa\u0004\u0007\t\u00f8\u0004\u0007\n\u00f7\t\u0008\u00f8\u0004\u0007\u000b\u00f6\u000b\u0001\u00fd\u0004\u0007\u000b\u0008\t\u00f4\u0010\u00ff\u00ee\u000e\u000c\u00f3\u00ed\u001a\u0008\t\u00e5\u000e\u000e\u000c\u00f3\u0007\u00fe\u0004\u0008\u00fd\t\u0006\u00fa\u0004\t\u00fc\u0004\n\u00fb\u0008\u0002\u00ff\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\r\u00f8\t\u0007\u00f9\t\u0008\u00f8\t\u0008\u00f8\u0004\u000e\u00f7\t\t\u00f7\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\n\u0000\u00ff\u0004\u0008\u00fd\u0004\u0007\u0003\u00fe\n\u0001\u00fe\t\u0008\u00f8\u0004\u0007\u0004\u00fd\u0008\u0002\u00ff\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\u0007\u0005\u00fc\u0004\u0007\u0006\u00fb\n\u0002\u00fd\u0004\u0007\u0007\u00fa\t\t\u00f7\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\u0007\u0008\u00f9\u0004\u0007\t\u00f8\n\u0003\u00fc\u0004\u0007\n\u00f7\n\u0004\u00fb\u0004\u0007\u000b\u00f6\u0004\u0008\u0001\u00ff\u0004\u0008\u0002\u00fe\n\u0006\u00f9\t\u0008\u00f8\u0004\u0008\u0003\u00fd\n\u0008\u00f7\u0008\u0002\u00ff\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\u0007\u0008\u00f9\n\t\u00f6\u0004\u0007\u0008\u00f9\u0004\u0008\u0004\u00fc\u0004\u000f\u00f6\u0008\u00fe\u0004\u0008\u0005\u00fb\u0004\u0008\u0006\u00fa\u0004\u0008\u0007\u00f9\u0004\u0008\u0008\u00f8\u0008\u00fe\u0004\u0008\t\u00f7\u0004\u0008\n\u00f6\u0004\t\u0000\u00ff\u0004\t\u0001\u00fe\u0008\u00fe\u0004\u0008\u0005\u00fb\u0004\t\u0002\u00fd\u0008\u00fe\u000b\u0001\u00fd\u0004\t\u0003\u00fc\u0004\t\u0004\u00fb\u0004\t\u0005\u00fa\u0004\t\u0006\u00f9\u0004\t\u0007\u00f8\u000b\u0002\u00fc\u0008\t\u00f8\u000b\u0003\u00fb\u0004\t\u0008\u00f7\u0008\u0003\u00fe\u0008\u0004\u00fd\u0004\t\t\u00f6\u0008\u0005\u00fc\u0004\t\u0007\u00f8\u0004\n\u00ff\u00ff\u000b\u0004\u00fa\u000b\u0005\u00f9\u0004\n\u0000\u00fe\u0008\u000b\u00f6\u0004\n\u0001\u00fd\u0004\n\u0002\u00fc\u0004\n\u0003\u00fb\u0004\n\u0003\u00fb\u0004\n\u00ff\u00ff\u000b\u0006\u00f8\u000b\u0007\u00f7\u0008\u0008\u00f9\u0008\t\u00f8\u0004\n\u0000\u00fe\u0008\u0003\u00fe\u0008\t\u00f8\u0004\n\u0004\u00fa\u0004\n\u0005\u00f9\u0004\n\u0006\u00f8\u000b\u0008\u00f6\u000c\u00fe\u00ff\u0004\t\t\u00f6\u0004\n\u0007\u00f7\u000c\u00ff\u00fe\u0004\n\u0008\u00f6\u000c\u0000\u00fd\u0004\n\u0008\u00f6\u0004\u000b\u00fe\u00ff\u000b\u0001\u00fd\u0004\u000b\u00ff\u00fe\t\u0008\u00f8\u0004\u000b\u00ff\u00fe\u0004\u000b\u0000\u00fd\u000c\u0001\u00fc\u0004\u000b\u0001\u00fc\u000c\u0002\u00fb\u0004\u000b\u0001\u0004\u00f0\u0014\u0005\u0001\u0012\u00e2$\u0001\u00fa\u0008\u00fc\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cd<\u000e\u00f2\u0012\u00fb\u0004\u00fd\u0013\u00be\u0018/\u0000\u0006\u0006\u00fa\u0018\u00ee\u00d0J\u0002\u00f8\u0006\u00c58\u000f\u0002\u00f8\u0015\u0000\u0003\u00f6\u000c\t\u00bd)\u0018\u0007\u00fb\u00f3\u001c\u00fe\u000e\u00f3\u0008\u0000\u0002\u0014\u00fa\u00fc\u0007\u00fe\u0010\u0003\u00f6\u0008\u0002\u0003\u00ff\u0004\u0008\u00fd\u0004\t\u00fc\u000b\u0002\u00fc\u0008\t\u00f8\u000b\u0003\u00fb\u0004\n\u00fb\u0008\u0005\u00fc\u0004\u000b\u00fa\u0004\u000c\u00f9\u0008\u0002\u0005\u00fd\u0010\u00fc\u00fd\u0008\t\u00f8\u0004\r\u00f8\u0008\u0003\u00fe\u0008\t\u00f8\u0004\u000e\u00f7\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0004\u0007\u0003\u00fe\u0008\u0005\u00fc\u0008\u0002\u0006\u00fc\u000f\u00fc\u00fe\u000f\u00fd\u00fd\u0004\u000b\u00fa\u0004\u0007\u0004\u00fd\u0008\u0002\u0007\u00fb\u000b\u0005\u00f9\u0004\u0007\u0005\u00fc\u0008\u000b\u00f6\u0004\u0007\u0006\u00fb\u0004\u0007\u0007\u00fa\u0004\u0007\u0008\u00f9\u0004\u0007\u0003\u00fe\u0008\u00fe\u0008\u0002\u0008\u00fa\u0004\u0008\u00fd\u0010\u00fa\u00ff\u0004\u0007\t\u00f8\u000b\u0003\u00fb\u0004\t\u00fc\u0004\u0007\n\u00f7\u000b\u0001\u00fd\u0004\u0007\u000b\u00f6\t\u0008\u00f8\u0004\u0007\u000b\u00f6\u0004\u0008\u0001\u00ff\t\u0008\u00f8\u0004\u0008\u0002\u00fe\u000b\u0001\u00fd\u0004\u0008\u0002\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdJ\u0002\u00f8\u0006\u00c5)(\u00fa\u00f8\u0002\u00f5\u000e\u000e\u000c\u00f3\u0007\u00fe\u0008\u00fe\u0004\u0008\u00fd\n\u00fc\u0004\t\u00fc\u000c\u00fa\r\u00f9\u0008\u0002\u00ff\u0004\n\u00fb\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\r\u00f8\u0008\u0003\u00fe\u0008\u0004\u00fd\u0004\u000e\u00f7\u0008\u0005\u00fc\u0004\u000f\u00f6\u0004\u0007\u0002\u00ff\u0008\u0006\u00fb\u0008\u0007\u00fa\u0008\u0008\u00f9\u0008\t\u00f8\u0004\u0007\u0003\u00fe\u0008\u000b\u00f6\u0004\u0007\u0004\u00fd\u0004\u0007\u0005\u00fc\u0004\u0007\u0006\u00fb\u0008\u00fe\u0004\u0008\u00fd\t\u0001\u00ff\u0004\t\u00fc\t\u0002\u00fe\u0004\n\u00fb\u0004\u000b\u00fa\u0004\u000c\u00f9\u0004\r\u00f8\u0004\u0007\u0007\u00fa\t\u0004\u00fc\u0004\u0007\u0008\u00f9\t\u0005\u00fb\u0004\u0007\u0008\u00f4\u0014\u0004\u00f5\u00ea&\u0002\u00fc\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca$\u0016\u000b\u00fe\u0001\u0014\u00fe\u00e7$\u0001\u00fa\u0008\u00fc\u0012\u0003\u00f8\u000c\u00f9"

    const-string v3, "ISO-8859-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput-object v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v0, 0xc4

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    return-void
.end method

.method private onOptionsItemSelected(Ljava/lang/String;)V
    .locals 21

    .line 1
    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    invoke-direct {v1, v0, v2}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0x340

    const/16 v7, 0x55

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v0, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v10, 0x406

    const/16 v11, 0x1e2

    invoke-static {v7, v10, v11, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    or-int/lit16 v12, v8, 0x8e4

    int-to-short v12, v12

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v13, v4, [Ljava/lang/Object;

    invoke-static {v8, v12, v6, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v13, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v0, v10, v11, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v7, v6, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_18

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/4 v13, 0x0

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v14, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v15, v14, v4

    int-to-byte v15, v15

    move/from16 p0, v3

    new-array v3, v4, [Ljava/lang/Object;

    const/16 p1, 0x43

    const/16 v7, 0x96b

    const/16 v16, 0x16

    const/16 v12, 0x1e1

    invoke-static {v15, v7, v12, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v3, p0

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    aget-byte v15, v14, v16

    int-to-byte v15, v15

    or-int/lit16 v9, v15, 0x34d

    int-to-short v9, v9

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v7, 0x1eb

    invoke-static {v15, v9, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    aget-byte v8, v14, v4

    int-to-byte v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v8, v10, v11, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v9, p0

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v13, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v14, v4

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x96b

    invoke-static {v6, v8, v12, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v7, v14, p1

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x347

    const/16 v12, 0x1ea

    invoke-static {v7, v9, v12, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    const/16 v9, 0x1f1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    const/16 p1, 0x43

    const/16 v16, 0x16

    move/from16 v0, p0

    :goto_1
    add-int/lit8 v3, v0, 0x1

    :try_start_3
    aget v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    sget-object v9, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v18, 0x2a3

    const/4 v6, 0x3

    const/16 v19, 0x53

    const/16 v20, 0x250

    const/4 v12, 0x4

    const/16 v14, 0x9

    const/16 v7, 0x8

    const/4 v8, 0x7

    const/4 v5, 0x2

    packed-switch v0, :pswitch_data_0

    :goto_2
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    goto/16 :goto_12

    :pswitch_0
    const/16 v0, 0x4a

    goto :goto_1

    :pswitch_1
    :try_start_4
    const-string v0, "\ub019\u2fea\u996a\ueaa7"

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    :goto_3
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :catchall_2
    move-exception v0

    move/from16 v5, v16

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    goto/16 :goto_15

    :pswitch_2
    const-string v0, ""

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto :goto_3

    :pswitch_3
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Process;->getGidForName(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    goto/16 :goto_4

    :pswitch_4
    iput v5, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v6, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v0, v6, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Ljava/lang/String;I[Ljava/lang/Object;)V

    aget-object v0, v7, p0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto :goto_3

    :pswitch_5
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :try_start_5
    sget-object v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v7, v6, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v7, v10, v11, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    aget-byte v6, v6, p1

    int-to-byte v6, v6

    sget v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v8, 0x128

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v12, 0x352

    invoke-static {v6, v12, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v9, p0

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v0, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :try_start_6
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto :goto_3

    :catchall_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3

    throw v5

    :cond_3
    throw v0

    :pswitch_6
    const-string v0, "\u92b1\u7282\ub672\ud4fd\u7b11\u2062\u03dc\u6a42\u4cf1\u18fd\u548b\uee6d\ue82c\ufbbe\uf05e\uc209\ue9be\udc85\uf2b3\uf83e\u4cf1\u18fd\u055c\uee74\ueaef\u36bb\ue82c\ufbbe\u2952\u9cb8\u028e\u56a9\uc5b9\udcd2\ubb9b\ud9f0\u1045\u6cd0"

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_3

    :pswitch_7
    iput v6, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v5, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v6, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-static {v0, v5, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v0

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    :goto_4
    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto/16 :goto_2

    :pswitch_8
    :try_start_7
    iput v5, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v6, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    :try_start_8
    new-array v5, v5, [Ljava/lang/Object;

    aput-object v6, v5, v4

    aput-object v0, v5, p0

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v0, v18

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x77d

    const/16 v9, 0x1d2

    invoke-static {v6, v8, v9, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v7, v0, v16

    int-to-byte v7, v7

    const/16 v8, 0xb

    aget-byte v8, v0, v8

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    const/16 v14, 0x1f1

    :try_start_9
    invoke-static {v7, v8, v14, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v9, p0

    check-cast v7, Ljava/lang/String;

    aget-byte v8, v0, v4

    int-to-byte v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v8, v10, v11, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v9, p0

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v0, v10, v11, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v9, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v8, v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v13, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :goto_5
    move/from16 v17, v14

    :goto_6
    const/16 v15, 0x1ea

    goto/16 :goto_12

    :catchall_4
    move-exception v0

    goto :goto_7

    :catchall_5
    move-exception v0

    const/16 v14, 0x1f1

    :goto_7
    :try_start_a
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_4

    throw v5

    :catchall_6
    move-exception v0

    :goto_8
    move/from16 v17, v14

    :goto_9
    move/from16 v5, v16

    const/16 v15, 0x1ea

    goto/16 :goto_15

    :cond_4
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    :catchall_7
    move-exception v0

    const/16 v14, 0x1f1

    goto :goto_8

    :pswitch_9
    const/16 v14, 0x1f1

    :try_start_b
    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v5, v0, v4

    int-to-byte v5, v5

    new-array v6, v4, [Ljava/lang/Object;

    const/16 v7, 0x97a

    invoke-static {v5, v7, v11, v6}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v6, p0

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v6, 0x13

    aget-byte v0, v0, v6

    int-to-byte v0, v0

    or-int/lit16 v6, v0, 0x622

    int-to-short v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v12, 0x1ea

    invoke-static {v0, v6, v12, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v7, p0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v13, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_8

    :try_start_c
    iput-wide v5, v1, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    const/16 v0, 0x1d

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_5

    :catchall_8
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_5

    throw v5

    :cond_5
    throw v0

    :pswitch_a
    const/16 v14, 0x1f1

    const v0, -0xfffffc

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    goto :goto_5

    :pswitch_b
    const/16 v17, 0x1f1

    :try_start_d
    iput v6, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v7, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v8, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_9

    :try_start_e
    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, p0

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v5, v0, v20

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x198

    const/16 v9, 0x1dc

    invoke-static {v5, v8, v9, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v7, p0

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v7, 0x18

    aget-byte v0, v0, v7

    int-to-byte v0, v0

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x12b

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x63b

    invoke-static {v0, v9, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, p0

    check-cast v0, Ljava/lang/String;

    filled-new-array {v15, v15, v15}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v5, v0, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v13, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_a

    :try_start_f
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    :goto_a
    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_6

    :catchall_9
    move-exception v0

    goto/16 :goto_9

    :catchall_a
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_6

    throw v5

    :cond_6
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    :pswitch_c
    const/16 v17, 0x1f1

    :try_start_10
    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v6, v4, [Ljava/lang/Object;

    const/16 v7, 0x793

    const/16 v8, 0x1db

    invoke-static {v0, v7, v8, v6}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v6, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_b

    :try_start_11
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_b

    :catchall_b
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_7

    throw v5

    :cond_7
    throw v0

    :pswitch_d
    const/16 v17, 0x1f1

    const-string v0, "\u92b1\u7282\ub672\ud4fd\u7b11\u2062\ud28e\u0c7c\u2311\u5d30\ubb41\u49cb\u4cf1\u18fd\u548b\uee6d\ue82c\ufbbe\u6b91\u03cc\ufc23\u99dc"

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_b

    :pswitch_e
    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    int-to-char v0, v0

    invoke-static {v0}, Landroid/text/AndroidCharacter;->getMirror(C)C

    move-result v0

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    goto :goto_a

    :pswitch_f
    const/16 v17, 0x1f1

    iput v5, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v6, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    :try_start_12
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v8, v7, v4

    int-to-byte v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v12, 0x793

    const/16 v14, 0x1db

    invoke-static {v8, v12, v14, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v9, p0

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v9, v7, v20

    int-to-byte v9, v9

    aget-byte v12, v7, v16

    int-to-short v12, v12

    or-int/lit16 v14, v12, 0x1ec

    int-to-short v14, v14

    new-array v15, v4, [Ljava/lang/Object;

    invoke-static {v9, v12, v14, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v9, v15, p0

    check-cast v9, Ljava/lang/String;

    aget-byte v7, v7, v4

    int-to-byte v7, v7

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v7, v10, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v12, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v8, v9, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_c

    :try_start_13
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto :goto_b

    :catchall_c
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_8

    throw v5

    :cond_8
    throw v0

    :pswitch_10
    const/16 v17, 0x1f1

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v0, v4

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v7, 0x111

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v12, 0x183

    invoke-static {v6, v12, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v9, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v8, 0x138

    aget-byte v0, v0, v8

    int-to-byte v0, v0

    or-int/lit16 v7, v7, 0x123

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x65a

    invoke-static {v0, v9, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, p0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    :goto_b
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_6

    :pswitch_11
    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-wide v5, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->Movie:J

    iput-wide v5, v1, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    const/16 v0, 0x1d

    :goto_c
    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_6

    :pswitch_12
    const/16 v17, 0x1f1

    iput v5, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    const/16 v5, 0x23

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v5, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    :try_start_14
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    sget-object v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v7, v6, v4

    int-to-byte v7, v7

    sget v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v8, 0x111

    int-to-short v8, v8

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v14, 0x183

    invoke-static {v7, v14, v8, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v12, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    aget-byte v6, v6, v19

    int-to-byte v6, v6

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v12, 0x639

    const/16 v14, 0x1e9

    invoke-static {v6, v12, v14, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v8, p0

    check-cast v6, Ljava/lang/String;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_d

    :try_start_15
    iput-wide v5, v1, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    const/16 v0, 0x1d

    goto :goto_c

    :catchall_d
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_9

    throw v5

    :cond_9
    throw v0

    :pswitch_13
    const/16 v17, 0x1f1

    iput v5, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    const/16 v6, 0x23

    invoke-virtual {v1, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v6, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    :try_start_16
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v8, v7, v4

    int-to-byte v8, v8

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v14, 0x793

    const/16 v15, 0x1db

    invoke-static {v8, v14, v15, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v12, p0

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v12, v7, v20

    int-to-byte v12, v12

    aget-byte v7, v7, v16

    int-to-short v7, v7

    or-int/lit16 v14, v7, 0x1ec

    int-to-short v14, v14

    new-array v15, v4, [Ljava/lang/Object;

    invoke-static {v12, v7, v14, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v15, p0

    check-cast v7, Ljava/lang/String;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_e

    :try_start_17
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_b

    :catchall_e
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_a

    throw v5

    :cond_a
    throw v0

    :pswitch_14
    const/16 v17, 0x1f1

    const-string v0, "\u1a5f\u0dce\u98bb\ub9a0\uead9\ud3de\u5289\u2d7a\u7a68\u5077\uf1ca\u852e\ude35\ud090\u92b1\u7282\ub672\ud4fd\u7b11\u2062\u03dc\u6a42\u4cf1\u18fd\u548b\uee6d\ue82c\ufbbe\uf05e\uc209\ue9be\udc85\uf2b3\uf83e\u4cf1\u18fd\u055c\uee74\ueaef\u36bb\ue82c\ufbbe\u7b89\ub769\ufb7a\uaef7\ufc23\u99dc"

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_b

    :pswitch_15
    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_9

    :try_start_18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v20

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0xb0

    const/16 v14, 0x1db

    invoke-static {v6, v8, v14, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, v18

    int-to-byte v5, v5

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x120

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0xaa5

    invoke-static {v5, v9, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v8, p0

    check-cast v5, Ljava/lang/String;

    filled-new-array {v15}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_f

    :try_start_19
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->onOptionsItemSelected:F

    const/16 v0, 0x25

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_6

    :catchall_f
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_b

    throw v5

    :cond_b
    throw v0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_9

    :pswitch_16
    const/16 v17, 0x1f1

    :try_start_1a
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_13

    :try_start_1b
    sget-object v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v7, v6, v4

    int-to-byte v7, v7

    aget-byte v8, v6, v14

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v7, v8, v11, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v9, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    aget-byte v8, v6, v19

    int-to-byte v8, v8

    const/16 v9, 0x11

    aget-byte v6, v6, v9

    int-to-short v6, v6

    new-array v9, v4, [Ljava/lang/Object;
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_12

    const/16 v15, 0x1ea

    :try_start_1c
    invoke-static {v8, v6, v15, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v9, p0

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v0, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_11

    :goto_d
    :try_start_1d
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_12

    :catchall_10
    move-exception v0

    :goto_e
    move/from16 v5, v16

    goto/16 :goto_15

    :catchall_11
    move-exception v0

    goto :goto_f

    :catchall_12
    move-exception v0

    const/16 v15, 0x1ea

    :goto_f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_c

    throw v5

    :cond_c
    throw v0

    :catchall_13
    move-exception v0

    const/16 v15, 0x1ea

    goto :goto_e

    :pswitch_17
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->values:Landroid/content/BroadcastReceiver$PendingResult;

    goto :goto_d

    :pswitch_18
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x28

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_10

    const/16 v0, 0x3a

    goto/16 :goto_1

    :pswitch_19
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x77

    goto/16 :goto_1

    :pswitch_1a
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x75

    goto/16 :goto_1

    :pswitch_1b
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-boolean v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->openContextMenu:Z

    :goto_10
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_12

    :pswitch_1c
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x29

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_10

    const/16 v0, 0x3f

    goto/16 :goto_1

    :pswitch_1d
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x6d

    goto/16 :goto_1

    :pswitch_1e
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x6b

    goto/16 :goto_1

    :pswitch_1f
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_10

    :try_start_1e
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v20

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x7c1

    const/16 v9, 0x1c3

    invoke-static {v6, v8, v9, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v7, 0x15

    aget-byte v5, v5, v7

    int-to-byte v5, v5

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x128

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x865

    invoke-static {v5, v9, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v8, p0

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_14

    goto/16 :goto_12

    :catchall_14
    move-exception v0

    :try_start_1f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_d

    throw v5

    :cond_d
    throw v0

    :pswitch_20
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    iput v5, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v5, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-eqz v5, :cond_e

    move v5, v4

    goto :goto_11

    :cond_e
    move/from16 v5, p0

    :goto_11
    iput-boolean v5, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->openContextMenu:Z

    goto/16 :goto_12

    :pswitch_21
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x5c

    goto/16 :goto_1

    :pswitch_22
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x51

    goto/16 :goto_1

    :pswitch_23
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_10

    :try_start_20
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    or-int/lit16 v7, v6, 0x752

    int-to-short v7, v7

    sget v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v8, 0x11b

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v6, v7, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v9, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/4 v7, 0x6

    aget-byte v5, v5, v7

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x823

    const/16 v9, 0x1e3

    invoke-static {v5, v8, v9, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v7, p0

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_15

    goto :goto_12

    :catchall_15
    move-exception v0

    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_f

    throw v5

    :cond_f
    throw v0

    :pswitch_24
    return-void

    :pswitch_25
    const/16 v17, 0x1f1

    move v0, v4

    goto/16 :goto_1

    :pswitch_26
    const/16 v17, 0x1f1

    const/16 v0, 0x47

    goto/16 :goto_1

    :pswitch_27
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto/16 :goto_10

    :pswitch_28
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_10
    :goto_12
    move v0, v3

    goto/16 :goto_1

    :pswitch_29
    const/16 v0, 0x12

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_10

    const/16 v0, 0x5a

    goto/16 :goto_1

    :pswitch_2a
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x5b

    goto/16 :goto_1

    :pswitch_2b
    const/16 v17, 0x1f1

    const/16 v0, 0x40

    goto/16 :goto_1

    :pswitch_2c
    const/16 v0, 0x12

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_10

    if-nez v0, :cond_10

    const/16 v0, 0x66

    goto/16 :goto_1

    :pswitch_2d
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x72

    goto/16 :goto_1

    :pswitch_2e
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x70

    goto/16 :goto_1

    :pswitch_2f
    move/from16 v5, v16

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    :try_start_22
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-eq v0, v14, :cond_11

    move/from16 v0, v19

    goto :goto_13

    :cond_11
    const/16 v0, 0x47

    :goto_13
    const/16 v16, 0x16

    goto/16 :goto_1

    :catchall_16
    move-exception v0

    const/16 v5, 0x16

    goto :goto_15

    :pswitch_30
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x6a

    goto :goto_13

    :pswitch_31
    move/from16 v5, v16

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_16

    const/16 v3, 0x67

    if-eqz v0, :cond_12

    if-eq v0, v4, :cond_13

    :cond_12
    move v0, v3

    goto :goto_13

    :cond_13
    const/16 v0, 0x4e

    goto :goto_13

    :pswitch_32
    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x6f

    goto :goto_13

    :pswitch_33
    move/from16 v5, v16

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    :try_start_23
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_17

    if-eq v0, v8, :cond_14

    const/16 v3, 0x3e

    if-eq v0, v3, :cond_15

    :cond_14
    const/16 v0, 0x3b

    goto :goto_14

    :cond_15
    const/16 v0, 0x47

    :goto_14
    move/from16 v16, v5

    goto/16 :goto_1

    :catchall_17
    move-exception v0

    goto :goto_15

    :pswitch_34
    move/from16 v5, v16

    const/16 v15, 0x1ea

    const/16 v17, 0x1f1

    const/16 v0, 0x74

    goto/16 :goto_1

    :goto_15
    sget-object v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v7, v6, v4

    int-to-byte v7, v7

    sget v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v9, v8, 0x732

    int-to-short v9, v9

    or-int/lit16 v12, v8, 0x11b

    int-to-short v12, v12

    new-array v14, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v12, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v14, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16

    if-lt v3, v4, :cond_16

    const/16 v7, 0x3b

    if-gt v3, v7, :cond_16

    goto :goto_16

    :cond_16
    aget-byte v7, v6, v4

    int-to-byte v7, v7

    or-int/lit16 v9, v8, 0x732

    int-to-short v9, v9

    or-int/lit16 v12, v8, 0x11b

    int-to-short v12, v12

    new-array v14, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v12, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v14, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17

    const/16 v7, 0x3b

    if-lt v3, v7, :cond_17

    const/16 v7, 0x40

    if-gt v3, v7, :cond_17

    goto :goto_16

    :cond_17
    aget-byte v6, v6, v4

    int-to-byte v6, v6

    or-int/lit16 v7, v8, 0x732

    int-to-short v7, v7

    or-int/lit16 v8, v8, 0x11b

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v6, v7, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v9, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_18

    const/16 v7, 0x40

    if-lt v3, v7, :cond_18

    const/16 v6, 0x47

    if-gt v3, v6, :cond_18

    :goto_16
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v0, 0x48

    goto/16 :goto_14

    :cond_18
    throw v0

    :catchall_18
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_19

    throw v1

    :cond_19
    throw v0

    nop

    :pswitch_data_0
    .packed-switch -0x35
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

.method public static synthetic openContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)J
    .locals 16

    new-instance v0, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;)V

    sget-object v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v1, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    sget v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v6, v5, 0x803

    int-to-short v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x18f

    invoke-static {v3, v6, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v6, v7, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v2, v1, v2

    int-to-byte v2, v2

    or-int/lit16 v7, v5, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v1, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v1, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v5, v5, 0x129

    int-to-short v5, v5

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v5, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v12, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v1, v1, v4

    int-to-byte v1, v1

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v1, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v1, v8, v3

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v7, v5, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    array-length v2, v1

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v1

    if-ge v5, v6, :cond_2

    aget-object v6, v1, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v8, v7, v4

    int-to-byte v8, v8

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x96b

    const/16 v13, 0x1e1

    invoke-static {v8, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v11, v3

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/16 v11, 0x16

    aget-byte v11, v7, v11

    int-to-byte v11, v11

    or-int/lit16 v14, v11, 0x34d

    int-to-short v14, v14

    new-array v15, v4, [Ljava/lang/Object;

    move/from16 p0, v3

    const/16 v3, 0x1eb

    invoke-static {v11, v14, v3, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v15, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v11, v7, v4

    int-to-byte v11, v11

    new-array v14, v4, [Ljava/lang/Object;

    invoke-static {v11, v9, v10, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v11, v14, p0

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v8, v3, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v8, 0x0

    invoke-virtual {v3, v8, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v7, v4

    int-to-byte v6, v6

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v6, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v11, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v11, 0x43

    aget-byte v7, v7, v11

    int-to-byte v7, v7

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v7, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v11, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    :goto_1
    add-int/lit8 v1, v3, 0x1

    aget v3, v2, v3

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v3

    const/16 v5, 0x9

    const/16 v6, 0x1d

    const/4 v7, 0x4

    const/16 v8, 0x12

    const/4 v9, 0x7

    packed-switch v3, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    move v3, v7

    goto :goto_1

    :pswitch_1
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-wide v7, v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu:J

    iput-wide v7, v0, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    invoke-virtual {v0, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :pswitch_2
    move v3, v5

    goto :goto_1

    :pswitch_3
    const/16 v3, 0x14

    goto :goto_1

    :pswitch_4
    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v0, v0, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    return-wide v0

    :pswitch_5
    sget v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :pswitch_6
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_3
    :goto_2
    move v3, v1

    goto :goto_1

    :pswitch_7
    invoke-virtual {v0, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v3, :cond_3

    move v3, v8

    goto :goto_1

    :pswitch_8
    const/16 v3, 0x13

    goto :goto_1

    :pswitch_9
    move v3, v9

    goto :goto_1

    :pswitch_a
    invoke-virtual {v0, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v3, :cond_3

    move v3, v6

    goto :goto_1

    :pswitch_b
    const/16 v3, 0x1e

    goto :goto_1

    :pswitch_c
    move v3, v4

    goto :goto_1

    :catchall_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_4

    throw v1

    :cond_4
    throw v0

    nop

    :pswitch_data_0
    .packed-switch -0xd
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

.method public static synthetic registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;J)J
    .locals 16

    .line 1
    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    move-wide/from16 v2, p1

    invoke-direct {v1, v0, v2, v3}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;J)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0x160

    const/16 v7, 0x141

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v0, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v6, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v12, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v0, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v7, v6, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/16 v8, 0x16

    const/4 v11, 0x0

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v12, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v13, v12, v4

    int-to-byte v13, v13

    new-array v14, v4, [Ljava/lang/Object;

    const/16 v15, 0x96b

    move/from16 p0, v3

    const/16 v3, 0x1e1

    invoke-static {v13, v15, v3, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v13, v14, p0

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    aget-byte v8, v12, v8

    int-to-byte v8, v8

    or-int/lit16 v14, v8, 0x34d

    int-to-short v14, v14

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v3, 0x1eb

    invoke-static {v8, v14, v3, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v7, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v7, v12, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v13, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v11, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v12, v4

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x1e1

    invoke-static {v6, v15, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v7, 0x43

    aget-byte v7, v12, v7

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v7, v12, v13, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    move/from16 v0, p0

    :goto_1
    add-int/lit8 v3, v0, 0x1

    const/16 v5, 0x2b

    const/16 v6, 0x1b

    const/16 v7, 0x23

    :try_start_3
    aget v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0

    const/16 v9, 0x8

    const/4 v12, 0x4

    const/4 v13, 0x7

    const/16 v14, 0x9

    packed-switch v0, :pswitch_data_0

    :goto_2
    const/16 v7, 0x1ea

    goto/16 :goto_4

    :pswitch_0
    const/4 v0, 0x5

    goto :goto_1

    :pswitch_1
    const/4 v0, 0x2

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v13}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v12, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    iput-wide v12, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu:J

    goto :goto_2

    :catchall_2
    move-exception v0

    const/16 v7, 0x1ea

    goto/16 :goto_6

    :pswitch_2
    const/16 v0, 0xb

    goto :goto_1

    :pswitch_3
    move v0, v6

    goto :goto_1

    :pswitch_4
    const/16 v0, 0x65

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v0, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    return-wide v0

    :pswitch_5
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    :goto_3
    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :pswitch_6
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v13}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto :goto_2

    :pswitch_7
    const/16 v0, 0x29

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x14

    goto :goto_1

    :pswitch_8
    const/16 v0, 0x2e

    goto :goto_1

    :pswitch_9
    const/16 v0, 0x2c

    goto :goto_1

    :pswitch_a
    const/16 v0, 0x4f

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    throw v0

    :pswitch_b
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    goto :goto_3

    :pswitch_c
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v13}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    goto :goto_2

    :pswitch_d
    const/16 v0, 0x12

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x22

    goto/16 :goto_1

    :pswitch_e
    const/16 v0, 0x33

    goto/16 :goto_1

    :pswitch_f
    const/16 v0, 0x31

    goto/16 :goto_1

    :pswitch_10
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v13}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    sget-object v9, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v13, v9, v4

    int-to-byte v13, v13

    aget-byte v14, v9, v14

    int-to-short v14, v14

    new-array v15, v4, [Ljava/lang/Object;

    invoke-static {v13, v14, v10, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v13, v15, p0

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    const/16 v14, 0x4c

    aget-byte v9, v9, v14

    int-to-byte v9, v9

    new-array v14, v4, [Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    const/16 v15, 0x631

    const/16 v7, 0x1ea

    :try_start_5
    invoke-static {v9, v15, v7, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v9, v14, p0

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v13, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    invoke-virtual {v9, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :try_start_6
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    :cond_3
    :goto_4
    move v0, v3

    goto/16 :goto_1

    :catchall_3
    move-exception v0

    goto :goto_6

    :catchall_4
    move-exception v0

    goto :goto_5

    :catchall_5
    move-exception v0

    const/16 v7, 0x1ea

    :goto_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    if-eqz v9, :cond_4

    throw v9

    :cond_4
    throw v0

    :pswitch_11
    const/16 v7, 0x1ea

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-eqz v0, :cond_5

    move v0, v14

    goto/16 :goto_1

    :cond_5
    move v0, v8

    goto/16 :goto_1

    :pswitch_12
    move v0, v5

    goto/16 :goto_1

    :pswitch_13
    const/16 v7, 0x1ea

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v0, :cond_6

    if-eq v0, v4, :cond_7

    :cond_6
    move v0, v4

    goto/16 :goto_1

    :cond_7
    const/16 v0, 0x24

    goto/16 :goto_1

    :pswitch_14
    const/16 v7, 0x1ea

    const/16 v0, 0x30

    goto/16 :goto_1

    :goto_6
    const/16 v9, 0x17

    if-lt v3, v9, :cond_8

    if-gt v3, v6, :cond_8

    const/16 v3, 0x15

    goto :goto_7

    :cond_8
    const/16 v6, 0x27

    if-lt v3, v6, :cond_9

    if-gt v3, v5, :cond_9

    const/16 v3, 0x23

    :goto_7
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_4

    :cond_9
    throw v0

    :catchall_6
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_a

    throw v1

    :cond_a
    throw v0

    nop

    :pswitch_data_0
    .packed-switch -0x15
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

.method public static synthetic registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 17

    .line 2
    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    sget v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v6, v5, 0x333

    int-to-short v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x14c

    invoke-static {v3, v6, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v6, v7, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    or-int/lit16 v7, v5, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v0, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v5, v5, 0x129

    int-to-short v5, v5

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v5, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v12, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v0, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v7, v5, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/16 v8, 0x16

    const/4 v11, 0x0

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v12, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v13, v12, v4

    int-to-byte v13, v13

    new-array v14, v4, [Ljava/lang/Object;

    const/16 v15, 0x96b

    move/from16 p0, v3

    const/16 v3, 0x1e1

    invoke-static {v13, v15, v3, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v13, v14, p0

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    aget-byte v8, v12, v8

    int-to-byte v8, v8

    or-int/lit16 v14, v8, 0x34d

    int-to-short v14, v14

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v3, 0x1eb

    invoke-static {v8, v14, v3, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v7, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v7, v12, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v13, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v11, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v12, v4

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x1e1

    invoke-static {v6, v15, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v7, 0x43

    aget-byte v7, v12, v7

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v7, v12, v13, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    move/from16 v0, p0

    :goto_1
    add-int/lit8 v3, v0, 0x1

    const/16 v5, 0x2a

    const/16 v6, 0x19

    :try_start_3
    aget v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0

    const/16 v7, 0x29

    const/16 v9, 0x4f

    const/16 v12, 0x8

    const/16 v13, 0x9

    const/4 v14, 0x4

    const/4 v15, 0x7

    packed-switch v0, :pswitch_data_0

    :goto_2
    const/16 v15, 0x1ea

    goto/16 :goto_3

    :pswitch_0
    move v0, v14

    goto :goto_1

    :pswitch_1
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v15}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onContextItemSelected:Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :catchall_2
    move-exception v0

    const/16 v16, 0x1ea

    goto/16 :goto_6

    :pswitch_2
    move v0, v13

    goto :goto_1

    :pswitch_3
    move v0, v6

    goto :goto_1

    :pswitch_4
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0

    :pswitch_5
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :pswitch_6
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v15}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v13}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto :goto_2

    :pswitch_7
    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x12

    goto :goto_1

    :pswitch_8
    const/16 v0, 0x32

    goto :goto_1

    :pswitch_9
    const/16 v0, 0x30

    goto :goto_1

    :pswitch_a
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :pswitch_b
    :try_start_4
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v15}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    :try_start_5
    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v9, v7, v4

    int-to-byte v9, v9

    aget-byte v12, v7, v13

    int-to-short v12, v12

    new-array v13, v4, [Ljava/lang/Object;

    invoke-static {v9, v12, v10, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v9, v13, p0

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const/16 v12, 0x4c

    aget-byte v7, v7, v12

    int-to-byte v7, v7

    new-array v12, v4, [Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    const/16 v13, 0x631

    const/16 v15, 0x1ea

    :try_start_6
    invoke-static {v7, v13, v15, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v12, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v7, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :try_start_7
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    :cond_3
    :goto_3
    move v0, v3

    goto/16 :goto_1

    :catchall_3
    move-exception v0

    :goto_4
    move/from16 v16, v15

    goto :goto_6

    :catchall_4
    move-exception v0

    goto :goto_5

    :catchall_5
    move-exception v0

    const/16 v15, 0x1ea

    :goto_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    if-eqz v7, :cond_4

    throw v7

    :cond_4
    throw v0

    :catchall_6
    move-exception v0

    const/16 v15, 0x1ea

    goto :goto_4

    :pswitch_c
    const/16 v15, 0x1ea

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x22

    goto/16 :goto_1

    :pswitch_d
    const/16 v15, 0x1ea

    const/16 v0, 0x2d

    goto/16 :goto_1

    :pswitch_e
    const/16 v15, 0x1ea

    const/16 v0, 0x2b

    goto/16 :goto_1

    :pswitch_f
    const/16 v15, 0x1ea

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    const/16 v3, 0xb

    if-eq v0, v3, :cond_5

    move v0, v4

    goto/16 :goto_1

    :cond_5
    const/16 v0, 0x24

    goto/16 :goto_1

    :pswitch_10
    move v0, v5

    goto/16 :goto_1

    :pswitch_11
    const/16 v16, 0x1ea

    :try_start_8
    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    if-eqz v0, :cond_6

    if-eq v0, v4, :cond_7

    :cond_6
    move v0, v15

    goto/16 :goto_1

    :cond_7
    const/16 v0, 0x14

    goto/16 :goto_1

    :catchall_7
    move-exception v0

    goto :goto_6

    :pswitch_12
    const/16 v16, 0x1ea

    const/16 v0, 0x2f

    goto/16 :goto_1

    :goto_6
    const/16 v7, 0x15

    if-lt v3, v7, :cond_8

    if-gt v3, v6, :cond_8

    const/16 v3, 0x13

    goto :goto_7

    :cond_8
    const/16 v6, 0x26

    if-lt v3, v6, :cond_9

    if-gt v3, v5, :cond_9

    const/16 v3, 0x23

    :goto_7
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_3

    :cond_9
    throw v0

    :catchall_8
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_a

    throw v1

    :cond_a
    throw v0

    :pswitch_data_0
    .packed-switch -0x13
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

.method public static registerForContextMenu()V
    .locals 1

    .line 3
    const/16 v0, 0x1c4b

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->isOpaque:C

    const v0, 0x8624

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->height:C

    const v0, 0xa42a

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setTime:C

    const/16 v0, 0x35

    sput-char v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->duration:C

    return-void
.end method

.method public static synthetic registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/String;)V
    .locals 16

    .line 4
    new-instance v0, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v1, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0x94a

    const/16 v7, 0x18e

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v1, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v1, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v11, v1, v8

    int-to-byte v11, v11

    or-int/lit16 v12, v11, 0x8e4

    int-to-short v12, v12

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v13, v4, [Ljava/lang/Object;

    invoke-static {v11, v12, v6, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v13, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v1, v1, v4

    int-to-byte v1, v1

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v1, v9, v10, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v1, v11, v3

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v7, v6, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    array-length v2, v1

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v1

    if-ge v5, v6, :cond_2

    aget-object v6, v1, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v11, v7, v4

    int-to-byte v11, v11

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v13, 0x96b

    const/16 v14, 0x1e1

    invoke-static {v11, v13, v14, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v11, v12, v3

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    const/16 v12, 0x16

    aget-byte v12, v7, v12

    int-to-byte v12, v12

    or-int/lit16 v15, v12, 0x34d

    int-to-short v15, v15

    move/from16 p0, v3

    new-array v3, v4, [Ljava/lang/Object;

    const/16 v8, 0x1eb

    invoke-static {v12, v15, v8, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v3, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v8, v7, v4

    int-to-byte v8, v8

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v9, v10, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v12, p0

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v11, v3, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v8, 0x0

    invoke-virtual {v3, v8, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v7, v4

    int-to-byte v6, v6

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v6, v13, v14, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v11, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v11, 0x43

    aget-byte v7, v7, v11

    int-to-byte v7, v7

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v7, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v11, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    const/16 v8, 0x1f

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    :goto_1
    add-int/lit8 v1, v3, 0x1

    aget v3, v2, v3

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v3

    const/16 v5, 0x29

    const/16 v6, 0x9

    const/4 v7, 0x7

    packed-switch v3, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    const/4 v3, 0x5

    goto :goto_1

    :pswitch_1
    const/4 v3, 0x2

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v5, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v3, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-direct {v5, v3}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected(Ljava/lang/String;)V

    goto :goto_2

    :pswitch_2
    const/16 v3, 0xb

    goto :goto_1

    :pswitch_3
    const/16 v3, 0x15

    goto :goto_1

    :pswitch_4
    return-void

    :pswitch_5
    sget v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    iput v3, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :pswitch_6
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v3, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    :cond_3
    :goto_2
    move v3, v1

    goto :goto_1

    :pswitch_7
    invoke-virtual {v0, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v3, :cond_3

    const/16 v1, 0x13

    goto :goto_2

    :pswitch_8
    const/16 v3, 0x14

    goto :goto_1

    :pswitch_9
    move v3, v6

    goto :goto_1

    :pswitch_a
    invoke-virtual {v0, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v3, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v3, :cond_3

    const/16 v1, 0x1e

    goto :goto_2

    :pswitch_b
    const/16 v3, 0x1f

    goto :goto_1

    :pswitch_c
    move v3, v4

    goto :goto_1

    :catchall_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_4

    throw v1

    :cond_4
    throw v0

    :pswitch_data_0
    .packed-switch -0xd
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

.method private static registerForContextMenu(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 12

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    :cond_0
    check-cast p0, [C

    .line 5
    sget-object v0, Lcom/guardsquare/dexguard/decodeByteArray;->setContentView:Ljava/lang/Object;

    monitor-enter v0

    .line 6
    :try_start_0
    array-length v1, p0

    new-array v1, v1, [C

    const/4 v2, 0x0

    .line 7
    sput v2, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    const/4 v3, 0x2

    .line 8
    new-array v3, v3, [C

    .line 9
    :goto_0
    sget v4, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    array-length v5, p0

    if-ge v4, v5, :cond_2

    .line 10
    aget-char v5, p0, v4

    aput-char v5, v3, v2

    add-int/lit8 v4, v4, 0x1

    .line 11
    aget-char v4, p0, v4

    const/4 v5, 0x1

    aput-char v4, v3, v5

    const v4, 0xe370

    move v6, v2

    :goto_1
    const/16 v7, 0x10

    if-ge v6, v7, :cond_1

    .line 12
    aget-char v7, v3, v5

    aget-char v8, v3, v2

    add-int v9, v8, v4

    shl-int/lit8 v10, v8, 0x4

    sget-char v11, Lcom/clevertap/android/pushsdk/registerForContextMenu;->height:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    ushr-int/lit8 v10, v8, 0x5

    sget-char v11, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setTime:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    sub-int/2addr v7, v9

    int-to-char v7, v7

    aput-char v7, v3, v5

    add-int v9, v7, v4

    shl-int/lit8 v10, v7, 0x4

    .line 13
    sget-char v11, Lcom/clevertap/android/pushsdk/registerForContextMenu;->duration:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    ushr-int/lit8 v7, v7, 0x5

    sget-char v10, Lcom/clevertap/android/pushsdk/registerForContextMenu;->isOpaque:C

    add-int/2addr v7, v10

    xor-int/2addr v7, v9

    sub-int/2addr v8, v7

    int-to-char v7, v8

    aput-char v7, v3, v2

    const v7, 0x9e37

    sub-int/2addr v4, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    .line 14
    :cond_1
    sget v4, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    aget-char v6, v3, v2

    aput-char v6, v1, v4

    add-int/lit8 v6, v4, 0x1

    .line 15
    aget-char v5, v3, v5

    aput-char v5, v1, v6

    add-int/lit8 v4, v4, 0x2

    .line 16
    sput v4, Lcom/guardsquare/dexguard/decodeByteArray;->registerForContextMenu:I

    goto :goto_0

    .line 17
    :cond_2
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2, p1}, Ljava/lang/String;-><init>([CII)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    aput-object p0, p2, v2

    return-void

    .line 18
    :goto_2
    monitor-exit v0

    throw p0
.end method

.method public static synthetic setContentView(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/lang/Runnable;
    .locals 16

    .line 1
    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0x6e8

    const/16 v7, 0x163

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v0, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v6, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v12, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v0, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v7, v6, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/16 v7, 0x16

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v11, v8, v4

    int-to-byte v11, v11

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v13, 0x96b

    const/16 v14, 0x1e1

    invoke-static {v11, v13, v14, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v11, v12, v3

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    aget-byte v7, v8, v7

    int-to-byte v7, v7

    or-int/lit16 v12, v7, 0x34d

    int-to-short v12, v12

    new-array v15, v4, [Ljava/lang/Object;

    move/from16 p0, v3

    const/16 v3, 0x1eb

    invoke-static {v7, v12, v3, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v15, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v7, v8, v4

    int-to-byte v7, v7

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v10, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v12, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v11, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v3, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v8, v4

    int-to-byte v6, v6

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v6, v13, v14, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v11, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v11, 0x43

    aget-byte v8, v8, v11

    int-to-byte v8, v8

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v8, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v11, p0

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    :goto_1
    :pswitch_0
    add-int/lit8 v5, v3, 0x1

    const/16 v6, 0x1a

    :try_start_3
    aget v0, v2, v3

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0

    const/16 v3, 0x29

    const/16 v8, 0x4f

    const/4 v9, 0x7

    const/4 v10, 0x4

    const/16 v11, 0x9

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    :pswitch_1
    move v3, v10

    goto :goto_1

    :pswitch_2
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->width:Ljava/lang/Runnable;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_5

    :catchall_2
    move-exception v0

    goto/16 :goto_6

    :pswitch_3
    const/16 v3, 0xb

    goto :goto_1

    :pswitch_4
    move v3, v6

    goto :goto_1

    :pswitch_5
    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    return-object v0

    :pswitch_6
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    goto :goto_4

    :goto_2
    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_5

    :pswitch_7
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v11}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto :goto_5

    :pswitch_8
    invoke-virtual {v1, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x14

    :goto_3
    move v3, v0

    goto :goto_1

    :pswitch_9
    const/16 v3, 0x27

    goto :goto_1

    :pswitch_a
    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    throw v0

    :pswitch_b
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    :goto_4
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    goto :goto_2

    :pswitch_c
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v11}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_3
    :goto_5
    move v3, v5

    goto :goto_1

    :pswitch_d
    const/16 v0, 0x12

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x24

    goto :goto_3

    :pswitch_e
    const/16 v3, 0x25

    goto/16 :goto_1

    :pswitch_f
    move v3, v4

    goto/16 :goto_1

    :pswitch_10
    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/16 v3, 0x4d

    if-eq v0, v3, :cond_4

    const/16 v3, 0x5d

    if-eq v0, v3, :cond_5

    :cond_4
    move v3, v11

    goto/16 :goto_1

    :cond_5
    move v3, v7

    goto/16 :goto_1

    :pswitch_11
    const/16 v3, 0x26

    goto/16 :goto_1

    :goto_6
    const/16 v3, 0x17

    if-lt v5, v3, :cond_6

    if-gt v5, v6, :cond_6

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v3, 0x15

    goto/16 :goto_1

    :cond_6
    throw v0

    :catchall_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_7

    throw v1

    :cond_7
    throw v0

    :pswitch_data_0
    .packed-switch -0x12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static setContentView(SII[Ljava/lang/Object;)V
    .locals 6

    .line 2
    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    rsub-int v1, p2, 0x1f2

    rsub-int/lit8 p0, p0, 0x76

    rsub-int p1, p1, 0xaa9

    new-array v1, v1, [B

    rsub-int p2, p2, 0x1f1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move-object v3, v0

    move v4, v2

    move v0, p1

    goto :goto_1

    :cond_0
    move v3, v2

    :goto_0
    int-to-byte v4, p0

    aput-byte v4, v1, v3

    if-ne v3, p2, :cond_1

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    aput-object p0, p3, v2

    return-void

    :cond_1
    add-int/lit8 v3, v3, 0x1

    aget-byte v4, v0, p1

    move v5, p1

    move p1, p0

    move p0, v4

    move v4, v3

    move-object v3, v0

    move v0, v5

    :goto_1
    add-int/2addr p1, p0

    add-int/lit8 p0, v0, 0x1

    add-int/lit8 p1, p1, -0x3

    move v0, p1

    move p1, p0

    move p0, v0

    move-object v0, v3

    move v3, v4

    goto :goto_0
.end method

.method public static synthetic unregisterForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/Future;
    .locals 16

    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    sget v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v6, v5, 0x938

    int-to-short v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x16f

    invoke-static {v3, v6, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v6, v7, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    or-int/lit16 v7, v5, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v0, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v5, v5, 0x129

    int-to-short v5, v5

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v5, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v12, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v0, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v7, v5, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/16 v7, 0x16

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v11, v8, v4

    int-to-byte v11, v11

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v13, 0x96b

    const/16 v14, 0x1e1

    invoke-static {v11, v13, v14, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v11, v12, v3

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    aget-byte v7, v8, v7

    int-to-byte v7, v7

    or-int/lit16 v12, v7, 0x34d

    int-to-short v12, v12

    new-array v15, v4, [Ljava/lang/Object;

    move/from16 p0, v3

    const/16 v3, 0x1eb

    invoke-static {v7, v12, v3, v15}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v15, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v7, v8, v4

    int-to-byte v7, v7

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v10, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v12, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v11, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v3, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v8, v4

    int-to-byte v6, v6

    new-array v11, v4, [Ljava/lang/Object;

    invoke-static {v6, v13, v14, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v11, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v11, 0x43

    aget-byte v8, v8, v11

    int-to-byte v8, v8

    new-array v11, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v8, v12, v13, v11}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v11, p0

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    :goto_1
    add-int/lit8 v5, v3, 0x1

    const/16 v6, 0x18

    :try_start_3
    aget v0, v2, v3

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0

    const/16 v3, 0x9

    const/16 v8, 0x8

    const/16 v9, 0x4f

    const/4 v10, 0x7

    const/4 v11, 0x4

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    :pswitch_0
    move v3, v11

    goto :goto_1

    :pswitch_1
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected:Ljava/util/concurrent/Future;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_5

    :catchall_2
    move-exception v0

    goto/16 :goto_6

    :pswitch_2
    const/16 v3, 0xa

    goto :goto_1

    :pswitch_3
    move v3, v6

    goto :goto_1

    :pswitch_4
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/Future;

    return-object v0

    :pswitch_5
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    goto :goto_4

    :goto_2
    invoke-virtual {v1, v11}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_5

    :pswitch_6
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto :goto_5

    :pswitch_7
    const/16 v0, 0x29

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x13

    :goto_3
    move v3, v0

    goto :goto_1

    :pswitch_8
    const/16 v3, 0x25

    goto :goto_1

    :pswitch_9
    const/16 v3, 0x23

    goto :goto_1

    :pswitch_a
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    throw v0

    :pswitch_b
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    :goto_4
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    goto :goto_2

    :pswitch_c
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v3}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_3
    :goto_5
    move v3, v5

    goto :goto_1

    :pswitch_d
    const/16 v0, 0x12

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_3

    const/16 v0, 0x20

    goto :goto_3

    :pswitch_e
    const/16 v3, 0x21

    goto/16 :goto_1

    :pswitch_f
    move v3, v4

    goto/16 :goto_1

    :pswitch_10
    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/16 v3, 0x3a

    if-eq v0, v3, :cond_4

    const/16 v0, 0x15

    goto :goto_3

    :cond_4
    move v3, v8

    goto/16 :goto_1

    :pswitch_11
    const/16 v3, 0x22

    goto/16 :goto_1

    :goto_6
    if-lt v5, v7, :cond_5

    if-gt v5, v6, :cond_5

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v3, 0x14

    goto/16 :goto_1

    :cond_5
    throw v0

    :catchall_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_6

    throw v1

    :cond_6
    throw v0

    :pswitch_data_0
    .packed-switch -0x12
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


# virtual methods
.method public onNotificationRendered(Z)V
    .locals 16

    new-instance v0, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v1, p0

    move/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;I)V

    sget-object v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v1, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    new-array v5, v4, [Ljava/lang/Object;

    const/16 v6, 0x9a

    const/16 v7, 0x175

    invoke-static {v3, v6, v7, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v5, v5, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v2, v1, v2

    int-to-byte v2, v2

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x732

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x1f1

    invoke-static {v2, v7, v9, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v8, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v7, v1, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x406

    const/16 v10, 0x1e2

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v3

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x1f

    aget-byte v8, v1, v8

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x8e4

    int-to-short v11, v11

    or-int/lit16 v6, v6, 0x129

    int-to-short v6, v6

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v8, v11, v6, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v12, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v1, v1, v4

    int-to-byte v1, v1

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v1, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v1, v8, v3

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v7, v6, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    array-length v2, v1

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v1

    const/16 v8, 0x16

    const/4 v11, 0x0

    if-ge v5, v6, :cond_2

    aget-object v6, v1, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v12, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v13, v12, v4

    int-to-byte v13, v13

    new-array v14, v4, [Ljava/lang/Object;

    const/16 v15, 0x96b

    move/from16 p0, v3

    const/16 v3, 0x1e1

    invoke-static {v13, v15, v3, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v13, v14, p0

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    aget-byte v8, v12, v8

    int-to-byte v8, v8

    or-int/lit16 v14, v8, 0x34d

    int-to-short v14, v14

    const/16 p1, 0x43

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v3, 0x1eb

    invoke-static {v8, v14, v3, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v7, p0

    check-cast v3, Ljava/lang/String;

    aget-byte v7, v12, v4

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v7, v9, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v13, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v11, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v12, v4

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x1e1

    invoke-static {v6, v15, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v7, v12, p1

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v12, 0x347

    const/16 v13, 0x1ea

    invoke-static {v7, v12, v13, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, p0

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 p0, v3

    const/16 p1, 0x43

    move/from16 v1, p0

    :goto_1
    add-int/lit8 v3, v1, 0x1

    aget v1, v2, v1

    invoke-virtual {v0, v1}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v1

    const/16 v5, 0x9

    const/4 v6, 0x4

    const/16 v7, 0x8

    const/4 v12, 0x7

    const/4 v13, 0x2

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    const/16 v1, 0xc

    goto :goto_1

    :pswitch_1
    const-string v1, "\uead9\ud3de\u27b5\u077e\u0425\u5941\u92b1\u7282\ua53d\u5e0b\u0425\u5941\uead9\ud3de\u03dc\u6a42\u50ce\u64d4\ue82c\ufbbe\u3d8f\u35f3"

    :goto_2
    iput-object v1, v0, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    invoke-virtual {v0, v13}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_4

    :pswitch_2
    invoke-static {}, Landroid/view/ViewConfiguration;->getEdgeSlop()I

    move-result v1

    :goto_3
    iput v1, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_4

    :pswitch_3
    iput v13, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v5, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v1, v5, v6}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Ljava/lang/String;I[Ljava/lang/Object;)V

    aget-object v1, v6, p0

    check-cast v1, Ljava/lang/String;

    goto :goto_2

    :pswitch_4
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    :try_start_3
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v6, v9, v10, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v7, p0

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, p1

    int-to-byte v5, v5

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x128

    int-to-short v7, v7

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v14, 0x352

    invoke-static {v5, v14, v7, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v12, p0

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v1, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_3

    throw v1

    :cond_3
    throw v0

    :pswitch_5
    iput v13, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v1, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v0, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v5, v0, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-direct {v1, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onOptionsItemSelected(Ljava/lang/String;)V

    goto :goto_4

    :pswitch_6
    const/16 v1, 0xf

    goto/16 :goto_1

    :pswitch_7
    const/16 v1, 0x11

    goto/16 :goto_1

    :pswitch_8
    return-void

    :pswitch_9
    sget v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    goto/16 :goto_3

    :pswitch_a
    iput v4, v0, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v0, v12}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v0, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v1, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_4
    :goto_4
    move v1, v3

    goto/16 :goto_1

    :pswitch_b
    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v1, :cond_4

    const/16 v1, 0x1a

    goto/16 :goto_1

    :pswitch_c
    const/16 v1, 0x27

    goto/16 :goto_1

    :pswitch_d
    const/16 v1, 0x25

    goto/16 :goto_1

    :pswitch_e
    invoke-virtual {v0, v8}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v1, v0, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    const/4 v3, 0x5

    const/16 v5, 0x1b

    if-eq v1, v3, :cond_5

    const/16 v3, 0x2c

    if-eq v1, v3, :cond_6

    :cond_5
    move v1, v5

    goto/16 :goto_1

    :cond_6
    move v1, v4

    goto/16 :goto_1

    :pswitch_f
    const/16 v1, 0x24

    goto/16 :goto_1

    :catchall_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_7

    throw v1

    :cond_7
    throw v0

    :pswitch_data_0
    .packed-switch -0x10
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

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 30

    new-instance v1, Lcom/clevertap/android/pushsdk/values;

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v1, v0, v2, v3}, Lcom/clevertap/android/pushsdk/values;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v2, 0x2c9

    aget-byte v3, v0, v2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    int-to-byte v3, v3

    sget v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v6, v5, 0x533

    int-to-short v6, v6

    const/16 v7, 0x16

    aget-byte v8, v0, v7

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v3, v6, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/4 v3, 0x0

    aget-object v6, v9, v3

    check-cast v6, Ljava/lang/String;

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    or-int/lit16 v8, v5, 0x732

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v10, 0x1f1

    invoke-static {v2, v8, v10, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v2, v9, v3

    check-cast v2, Ljava/lang/String;

    :try_start_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    aget-byte v8, v0, v4

    int-to-byte v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v10, 0x406

    const/16 v11, 0x1e2

    invoke-static {v8, v10, v11, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v9, v3

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/16 v9, 0x1f

    aget-byte v12, v0, v9

    int-to-byte v12, v12

    or-int/lit16 v13, v12, 0x8e4

    int-to-short v13, v13

    or-int/lit16 v5, v5, 0x129

    int-to-short v5, v5

    new-array v14, v4, [Ljava/lang/Object;

    invoke-static {v12, v13, v5, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v14, v3

    check-cast v5, Ljava/lang/String;

    aget-byte v0, v0, v4

    int-to-byte v0, v0

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v0, v10, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v12, v3

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v8, v5, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_20

    array-length v2, v0

    new-array v2, v2, [I

    move v5, v3

    :goto_0
    array-length v6, v0

    const/16 v12, 0x1eb

    const/16 v14, 0x1e1

    const/4 v15, 0x0

    if-ge v5, v6, :cond_2

    aget-object v6, v0, v5

    :try_start_1
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    sget-object v16, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 p0, 0x43

    aget-byte v8, v16, v4

    int-to-byte v8, v8

    move/from16 p1, v9

    new-array v9, v4, [Ljava/lang/Object;

    move/from16 p2, v7

    const/16 v7, 0x96b

    invoke-static {v8, v7, v14, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v8, v9, v3

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v9, v16, p2

    int-to-byte v9, v9

    move/from16 v17, v3

    or-int/lit16 v3, v9, 0x34d

    int-to-short v3, v3

    new-array v13, v4, [Ljava/lang/Object;

    invoke-static {v9, v3, v12, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v3, v13, v17

    check-cast v3, Ljava/lang/String;

    aget-byte v9, v16, v4

    int-to-byte v9, v9

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v9, v10, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v9, v12, v17

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v3, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v15, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    aget-byte v6, v16, v4

    int-to-byte v6, v6

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v6, v7, v14, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v8, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v7, v16, p0

    int-to-byte v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v9, 0x347

    const/16 v12, 0x1ea

    invoke-static {v7, v9, v12, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v7, v8, v17

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    aput v3, v2, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v9, p1

    move/from16 v7, p2

    move/from16 v3, v17

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    throw v1

    :cond_0
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    throw v1

    :cond_1
    throw v0

    :cond_2
    move/from16 v17, v3

    move/from16 p2, v7

    move/from16 p1, v9

    const/16 p0, 0x43

    move/from16 v0, v17

    :goto_1
    add-int/lit8 v3, v0, 0x1

    :try_start_3
    aget v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1f

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-string v13, ""

    const/16 v16, 0x6

    const/16 v18, 0xd

    const/16 v19, 0xb

    const/16 v5, 0x38

    const/16 v20, 0x13

    const/16 v12, 0x1e9

    const/16 v22, 0x250

    const/16 v6, 0x1d

    const/16 v10, 0x23

    const/16 v23, 0x4

    const/4 v7, 0x7

    const/4 v9, 0x2

    const/16 v14, 0x8

    packed-switch v0, :pswitch_data_0

    :goto_2
    move v10, v11

    const/16 v21, 0x1eb

    goto/16 :goto_18

    :pswitch_0
    const/16 v0, 0x4a

    :goto_3
    const/16 v10, 0x406

    const/16 v12, 0x1eb

    :goto_4
    const/16 v14, 0x1e1

    goto :goto_1

    :pswitch_1
    :try_start_4
    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v5, v0, v4

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x97a

    invoke-static {v5, v8, v11, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v7, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    aget-byte v0, v0, v20

    int-to-byte v0, v0

    or-int/lit16 v7, v0, 0x622

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v12, 0x1ea

    invoke-static {v0, v7, v12, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v0, v8, v17

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v15, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    :try_start_5
    iput-wide v7, v1, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    :goto_5
    invoke-virtual {v1, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_2

    :catchall_2
    move-exception v0

    :goto_6
    move/from16 v5, p2

    move v10, v11

    const/16 v21, 0x1eb

    goto/16 :goto_1c

    :catchall_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3

    throw v5

    :cond_3
    throw v0

    :pswitch_2
    iput v9, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v5, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    iput-wide v5, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->Movie:J

    goto :goto_2

    :pswitch_3
    const/16 v0, 0x28

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_4

    move v0, v7

    goto :goto_3

    :cond_4
    move v0, v3

    goto :goto_3

    :pswitch_4
    const/16 v0, 0x76

    goto :goto_3

    :pswitch_5
    const/16 v0, 0xc

    goto :goto_3

    :pswitch_6
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_4

    move/from16 v0, v19

    goto/16 :goto_3

    :pswitch_7
    move/from16 v0, v18

    goto/16 :goto_3

    :pswitch_8
    const/16 v0, 0x60

    goto/16 :goto_3

    :pswitch_9
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v22

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x118

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v10, 0x650

    invoke-static {v6, v10, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v8, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, v23

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x860

    invoke-static {v5, v8, v12, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v7, v17

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :try_start_7
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    :goto_7
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto/16 :goto_2

    :catchall_4
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_5

    throw v5

    :cond_5
    throw v0

    :pswitch_a
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    const/16 v6, 0x2a3

    aget-byte v6, v5, v6

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x103

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v10, 0x858

    invoke-static {v6, v10, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v8, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, v22

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0xa0c

    const/16 v10, 0x1e1

    invoke-static {v5, v8, v10, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v7, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    :try_start_9
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto :goto_7

    :catchall_5
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_6

    throw v5

    :cond_6
    throw v0

    :pswitch_b
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/RemoteMessage;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v5

    shr-int/lit8 v5, v5, 0x10

    rsub-int/lit8 v5, v5, 0x33

    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    move-result v6

    shr-int/2addr v6, v14

    add-int/lit8 v6, v6, 0x33

    const/16 v7, 0x30

    move/from16 v8, v17

    invoke-static {v13, v7, v8}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result v7

    const v8, 0xc419

    sub-int/2addr v8, v7

    int-to-char v7, v8

    invoke-static {v5, v6, v7}, Lcom/clevertap/android/pushsdk/unregisterForContextMenu;->setContentView(IIC)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    const-string v6, "unregisterForContextMenu"

    const-class v7, Lcom/google/firebase/messaging/RemoteMessage;

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v15, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    :try_start_b
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :catchall_6
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_7

    throw v5

    :cond_7
    throw v0

    :pswitch_c
    const-string v0, "\u7e62\uf50f\ucbbf\ue1cc\u89ae\uf258"

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :pswitch_d
    iput-object v13, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :pswitch_e
    const/4 v0, 0x3

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v5, 0x9

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v6, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    int-to-char v6, v6

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v5, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-static {v0, v6, v5}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CI)I

    move-result v0

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    move/from16 v0, v23

    goto/16 :goto_8

    :pswitch_f
    iput v9, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const/16 v5, 0x9

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v5, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v0, v5, v6}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Ljava/lang/String;I[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v0, v6, v17

    check-cast v0, Ljava/lang/String;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :pswitch_10
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :try_start_c
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x406

    invoke-static {v6, v8, v11, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v6, v7, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, p0

    int-to-byte v5, v5

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x128

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v10, 0x352

    invoke-static {v5, v10, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v8, v17

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    :try_start_d
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :catchall_7
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_8

    throw v5

    :cond_8
    throw v0

    :pswitch_11
    const-string v0, "\u6869\u9c53\u01d7\ub423"

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :pswitch_12
    iput v9, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v5, 0x9

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v5, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    invoke-static {v0, v5}, Landroid/text/TextUtils;->getOffsetBefore(Ljava/lang/CharSequence;I)I

    move-result v0

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    const/4 v0, 0x4

    :goto_8
    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    goto/16 :goto_2

    :pswitch_13
    const/4 v0, 0x3

    :try_start_e
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v5, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v6, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_a

    :try_start_f
    new-array v7, v9, [Ljava/lang/Object;

    aput-object v6, v7, v4

    const/16 v17, 0x0

    aput-object v5, v7, v17

    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v22

    int-to-byte v6, v6

    new-array v8, v4, [Ljava/lang/Object;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    const/16 v10, 0xa0c

    const/16 v13, 0x1e1

    :try_start_10
    invoke-static {v6, v10, v13, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v6, v8, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v23, 0x4

    aget-byte v8, v5, v23

    int-to-byte v8, v8

    new-array v10, v4, [Ljava/lang/Object;

    const/16 v14, 0x1a0

    invoke-static {v8, v14, v12, v10}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v8, v10, v17

    check-cast v8, Ljava/lang/String;

    aget-byte v10, v5, v4

    int-to-byte v10, v10

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v14, 0x406

    invoke-static {v10, v14, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v10, v12, v17

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    aget-byte v5, v5, v4

    int-to-byte v5, v5

    new-array v12, v4, [Ljava/lang/Object;

    const/16 v14, 0x406

    invoke-static {v5, v14, v11, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v12, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v10, v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v8, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    :try_start_11
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_7

    :catchall_8
    move-exception v0

    goto :goto_9

    :catchall_9
    move-exception v0

    const/16 v13, 0x1e1

    :goto_9
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_9

    throw v5

    :cond_9
    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    :catchall_a
    move-exception v0

    const/16 v13, 0x1e1

    goto/16 :goto_6

    :pswitch_14
    const/16 v13, 0x1e1

    :try_start_12
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_d

    :try_start_13
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v7, v5, v4

    int-to-byte v7, v7

    sget v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v8, 0x120

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v10, 0x8e3

    invoke-static {v7, v10, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v7, v9, v17

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    aget-byte v8, v5, v16

    int-to-byte v8, v8

    aget-byte v9, v5, v19

    int-to-short v9, v9

    new-array v10, v4, [Ljava/lang/Object;

    invoke-static {v8, v9, v12, v10}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v8, v10, v17

    check-cast v8, Ljava/lang/String;

    aget-byte v5, v5, v4

    int-to-byte v5, v5

    new-array v9, v4, [Ljava/lang/Object;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_c

    const/16 v12, 0x406

    :try_start_14
    invoke-static {v5, v12, v11, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v9, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v7, v8, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v15, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_b

    :try_start_15
    iput-wide v7, v1, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    goto/16 :goto_5

    :catchall_b
    move-exception v0

    goto :goto_a

    :catchall_c
    move-exception v0

    const/16 v12, 0x406

    :goto_a
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_a

    throw v5

    :cond_a
    throw v0

    :catchall_d
    move-exception v0

    const/16 v12, 0x406

    goto/16 :goto_6

    :pswitch_15
    const/16 v12, 0x406

    const/16 v13, 0x1e1

    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v5, v0, v4

    int-to-byte v5, v5

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x111

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v10, 0x183

    invoke-static {v5, v10, v7, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v8, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    aget-byte v0, v0, v18

    int-to-byte v0, v0

    or-int/lit16 v6, v6, 0x122

    int-to-short v6, v6

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x82e

    invoke-static {v0, v8, v6, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v0, v7, v17

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    goto/16 :goto_7

    :pswitch_16
    const/16 v12, 0x406

    const/16 v13, 0x1e1

    :try_start_16
    iput v9, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v9, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_11

    :try_start_17
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    sget-object v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v9, v7, v4

    int-to-byte v9, v9

    sget v10, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v10, v10, 0x111

    int-to-short v10, v10

    new-array v14, v4, [Ljava/lang/Object;

    const/16 v12, 0x183

    invoke-static {v9, v12, v10, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v9, v14, v17

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const/16 v10, 0x53

    aget-byte v7, v7, v10

    int-to-byte v7, v7

    or-int/lit16 v10, v7, 0x7c5

    int-to-short v10, v10

    new-array v12, v4, [Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_10

    const/16 v14, 0x1eb

    :try_start_18
    invoke-static {v7, v10, v14, v12}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v7, v12, v17

    check-cast v7, Ljava/lang/String;

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v9, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_f

    :try_start_19
    iput-wide v7, v1, Lcom/clevertap/android/pushsdk/values;->registerForContextMenu:J

    invoke-virtual {v1, v6}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    :goto_b
    move v10, v11

    move/from16 v21, v14

    goto/16 :goto_18

    :catchall_e
    move-exception v0

    :goto_c
    move/from16 v5, p2

    move v10, v11

    move/from16 v21, v14

    goto/16 :goto_1c

    :catchall_f
    move-exception v0

    goto :goto_d

    :catchall_10
    move-exception v0

    const/16 v14, 0x1eb

    :goto_d
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_b

    throw v5

    :cond_b
    throw v0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_e

    :catchall_11
    move-exception v0

    const/16 v14, 0x1eb

    goto :goto_c

    :pswitch_17
    const/16 v13, 0x1e1

    const/16 v14, 0x1eb

    :try_start_1a
    sget-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v5, v0, v4

    int-to-byte v5, v5

    sget v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v6, 0x720

    int-to-short v7, v7

    or-int/lit16 v6, v6, 0x110

    int-to-short v6, v6

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v5, v7, v6, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v8, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    aget-byte v0, v0, v20

    int-to-byte v0, v0

    new-array v6, v4, [Ljava/lang/Object;

    const/16 v7, 0x815

    const/16 v8, 0x1d2

    invoke-static {v0, v7, v8, v6}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v0, v6, v17

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v15, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_12

    :try_start_1b
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_b

    :catchall_12
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_c

    throw v5

    :cond_c
    throw v0
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_e

    :pswitch_18
    const/16 v13, 0x1e1

    const/16 v21, 0x1eb

    :try_start_1c
    iput v9, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v5, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v5, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v5, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onContextItemSelected:Ljava/util/concurrent/ScheduledExecutorService;

    :goto_e
    move v10, v11

    goto/16 :goto_18

    :catchall_13
    move-exception v0

    move/from16 v5, p2

    move v10, v11

    goto/16 :goto_1c

    :pswitch_19
    const/16 v13, 0x1e1

    const/16 v21, 0x1eb

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->onContextItemSelected:Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    :goto_f
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_e

    :pswitch_1a
    const/16 v13, 0x1e1

    const/16 v21, 0x1eb

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    iget-object v0, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->width:Ljava/lang/Runnable;

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_13

    goto :goto_f

    :pswitch_1b
    move/from16 v0, v23

    const/16 v13, 0x1e1

    const/16 v21, 0x1eb

    :try_start_1d
    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v5, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v6, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v10, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_14

    const/4 v12, 0x3

    :try_start_1e
    new-array v12, v12, [Ljava/lang/Object;

    aput-object v10, v12, v9

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v12, v4

    const/16 v17, 0x0

    aput-object v5, v12, v17

    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v10, v7, 0x101

    int-to-short v10, v10

    new-array v14, v4, [Ljava/lang/Object;

    const/16 v13, 0x623

    invoke-static {v6, v13, v10, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v6, v14, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v10, v5, p1

    int-to-byte v10, v10

    or-int/lit16 v13, v10, 0x164

    int-to-short v13, v13

    new-array v14, v4, [Ljava/lang/Object;

    move-object/from16 v16, v5

    const/16 v5, 0x1ea

    invoke-static {v10, v13, v5, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v10, v14, v17

    check-cast v10, Ljava/lang/String;

    aget-byte v13, v16, v4

    int-to-byte v13, v13

    new-array v14, v4, [Ljava/lang/Object;

    const/16 v5, 0x1e0

    const/16 v11, 0x95b

    invoke-static {v13, v11, v5, v14}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    aget-object v5, v14, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    aget-byte v11, v16, v4

    int-to-byte v11, v11

    or-int/lit16 v7, v7, 0x111

    int-to-short v7, v7

    new-array v13, v4, [Ljava/lang/Object;

    const/16 v14, 0x183

    invoke-static {v11, v14, v7, v13}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v7, v13, v17

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v5, v8, v7}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v10, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_15

    :try_start_1f
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    :goto_10
    invoke-virtual {v1, v9}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    :goto_11
    const/16 v10, 0x1e2

    goto/16 :goto_18

    :catchall_14
    move-exception v0

    move/from16 v5, p2

    const/16 v10, 0x1e2

    goto/16 :goto_1c

    :catchall_15
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_d

    throw v5

    :cond_d
    throw v0

    :pswitch_1c
    const/16 v21, 0x1eb

    const/16 v0, 0x54

    :goto_12
    move/from16 v12, v21

    const/16 v10, 0x406

    const/16 v11, 0x1e2

    :goto_13
    const/16 v14, 0x1e1

    const/16 v17, 0x0

    goto/16 :goto_1

    :pswitch_1d
    const/16 v21, 0x1eb

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_14

    :try_start_20
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    or-int/lit16 v7, v6, 0x752

    int-to-short v7, v7

    sget v8, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v8, 0x11b

    int-to-short v8, v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v6, v7, v8, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v6, v9, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, v16

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x823

    const/16 v9, 0x1e3

    invoke-static {v5, v8, v9, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v7, v17

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_16

    goto :goto_11

    :catchall_16
    move-exception v0

    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_e

    throw v5

    :cond_e
    throw v0

    :pswitch_1e
    const/16 v21, 0x1eb

    const/16 v0, 0x39

    goto :goto_12

    :pswitch_1f
    const/16 v21, 0x1eb

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_14

    :try_start_22
    const-class v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    const-string v6, "goAsync"

    invoke-virtual {v5, v6, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_17

    :try_start_23
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_10

    :catchall_17
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_f

    throw v5

    :cond_f
    throw v0

    :pswitch_20
    const/16 v21, 0x1eb

    iput v9, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v5, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v5, Landroid/content/BroadcastReceiver$PendingResult;

    iput-object v5, v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->values:Landroid/content/BroadcastReceiver$PendingResult;

    goto/16 :goto_11

    :pswitch_21
    const/16 v21, 0x1eb

    new-instance v24, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;

    const/4 v0, 0x5

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Landroid/content/Intent;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v27, v0

    check-cast v27, Landroid/os/Bundle;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v28, v0

    check-cast v28, Lcom/google/firebase/messaging/RemoteMessage;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Landroid/content/Context;

    invoke-direct/range {v24 .. v29}, Lcom/clevertap/android/pushsdk/registerForContextMenu$1;-><init>(Lcom/clevertap/android/pushsdk/registerForContextMenu;Landroid/content/Intent;Landroid/os/Bundle;Lcom/google/firebase/messaging/RemoteMessage;Landroid/content/Context;)V

    move-object/from16 v0, v24

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_10

    :pswitch_22
    const/16 v21, 0x1eb

    new-instance v24, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;

    const/4 v0, 0x4

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/clevertap/android/pushsdk/registerForContextMenu;

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Ljava/lang/Runnable;

    invoke-virtual {v1, v10}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-wide v5, v1, Lcom/clevertap/android/pushsdk/values;->unregisterForContextMenu:J

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Landroid/os/Bundle;

    move-wide/from16 v27, v5

    invoke-direct/range {v24 .. v29}, Lcom/clevertap/android/pushsdk/registerForContextMenu$4;-><init>(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/Runnable;JLandroid/os/Bundle;)V

    move-object/from16 v0, v24

    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_10

    :pswitch_23
    const/16 v21, 0x1eb

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_14

    :try_start_24
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x812

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;

    const/16 v10, 0x1e2

    invoke-static {v6, v7, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v6, v8, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, v4

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x1e0

    const/16 v11, 0x95b

    invoke-static {v5, v11, v8, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v7, v17

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_18

    :try_start_25
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    goto/16 :goto_10

    :catchall_18
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_10

    throw v5

    :cond_10
    throw v0
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_14

    :pswitch_24
    const/16 v21, 0x1eb

    :try_start_26
    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    invoke-virtual {v1, v14}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_1c

    :try_start_27
    sget-object v5, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v7, v7, 0x812

    int-to-short v7, v7

    new-array v8, v4, [Ljava/lang/Object;
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_1a

    const/16 v10, 0x1e2

    :try_start_28
    invoke-static {v6, v7, v10, v8}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v6, v8, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v5, v5, p1

    int-to-byte v5, v5

    new-array v7, v4, [Ljava/lang/Object;

    const/16 v8, 0x1a4

    const/16 v9, 0x1ed

    invoke-static {v5, v8, v9, v7}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v5, v7, v17

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_19

    goto :goto_18

    :catchall_19
    move-exception v0

    goto :goto_14

    :catchall_1a
    move-exception v0

    const/16 v10, 0x1e2

    :goto_14
    :try_start_29
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_11

    throw v5

    :catchall_1b
    move-exception v0

    :goto_15
    move/from16 v5, p2

    goto/16 :goto_1c

    :cond_11
    throw v0

    :catchall_1c
    move-exception v0

    const/16 v10, 0x1e2

    goto :goto_15

    :pswitch_25
    return-void

    :pswitch_26
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x69

    :goto_16
    move/from16 v12, v21

    :goto_17
    const/16 v10, 0x406

    goto/16 :goto_13

    :pswitch_27
    move v10, v11

    const/16 v21, 0x1eb

    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->sync:I

    iput v0, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    const/4 v0, 0x4

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    goto :goto_18

    :pswitch_28
    move v10, v11

    const/16 v21, 0x1eb

    iput v4, v1, Lcom/clevertap/android/pushsdk/values;->openContextMenu:I

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    const/16 v5, 0x9

    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu;->decodeByteArray:I

    :cond_12
    :goto_18
    move v0, v3

    :goto_19
    move v11, v10

    goto :goto_16

    :pswitch_29
    move v10, v11

    const/16 v0, 0x12

    const/16 v21, 0x1eb

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_12

    const/16 v0, 0x5b

    goto :goto_19

    :pswitch_2a
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x90

    goto :goto_16

    :pswitch_2b
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x8e

    goto :goto_16

    :pswitch_2c
    move v10, v11

    const/16 v0, 0x12

    const/16 v21, 0x1eb

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_12

    const/16 v0, 0x67

    goto :goto_19

    :pswitch_2d
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x68

    goto :goto_16

    :pswitch_2e
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x52

    goto :goto_16

    :pswitch_2f
    move v10, v11

    const/16 v0, 0x12

    const/16 v21, 0x1eb

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_12

    const/16 v0, 0x74

    goto :goto_19

    :pswitch_30
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x75

    goto :goto_16

    :pswitch_31
    const/16 v21, 0x1eb

    move v0, v4

    goto :goto_16

    :pswitch_32
    move v10, v11

    const/16 v0, 0x12

    const/16 v21, 0x1eb

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I

    if-nez v0, :cond_12

    const/16 v0, 0x7f

    goto :goto_19

    :pswitch_33
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x8b

    goto/16 :goto_16

    :pswitch_34
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x89

    goto/16 :goto_16

    :pswitch_35
    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x4f

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget-object v0, v1, Lcom/clevertap/android/pushsdk/values;->width:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    throw v0

    :pswitch_36
    move v0, v5

    move v10, v11

    const/16 v21, 0x1eb

    invoke-virtual {v1, v0}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_1b

    if-nez v0, :cond_12

    const/16 v0, 0x87

    goto/16 :goto_19

    :pswitch_37
    move/from16 v5, p2

    move v10, v11

    const/16 v21, 0x1eb

    :try_start_2a
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_1d

    const/16 v3, 0x50

    if-eq v0, v3, :cond_13

    const/16 v0, 0x81

    goto :goto_1a

    :cond_13
    move v0, v14

    :goto_1a
    move v11, v10

    move/from16 v12, v21

    const/16 p2, 0x16

    goto/16 :goto_17

    :catchall_1d
    move-exception v0

    const/16 v5, 0x16

    goto :goto_1c

    :pswitch_38
    const/16 v21, 0x1eb

    move/from16 v12, v21

    const/16 p2, 0x16

    const/16 v0, 0x88

    goto/16 :goto_17

    :pswitch_39
    move/from16 v5, p2

    move v10, v11

    const/16 v21, 0x1eb

    :try_start_2b
    invoke-virtual {v1, v5}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    iget v0, v1, Lcom/clevertap/android/pushsdk/values;->setContentView:I
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_1e

    const/16 v3, 0x5c

    if-eqz v0, :cond_14

    if-eq v0, v4, :cond_15

    :cond_14
    move v0, v3

    goto :goto_1b

    :cond_15
    const/16 v0, 0x4e

    :goto_1b
    move/from16 p2, v5

    goto/16 :goto_19

    :catchall_1e
    move-exception v0

    goto :goto_1c

    :pswitch_3a
    move/from16 v5, p2

    move v10, v11

    const/16 v21, 0x1eb

    const/16 v0, 0x8d

    goto/16 :goto_16

    :catchall_1f
    move-exception v0

    move/from16 v5, p2

    move v10, v11

    move/from16 v21, v12

    :goto_1c
    sget-object v6, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView:[B

    aget-byte v6, v6, v4

    int-to-byte v6, v6

    sget v7, Lcom/clevertap/android/pushsdk/registerForContextMenu;->unregisterForContextMenu:I

    or-int/lit16 v8, v7, 0x732

    int-to-short v8, v8

    or-int/lit16 v7, v7, 0x11b

    int-to-short v7, v7

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v6, v8, v7, v9}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->setContentView(SII[Ljava/lang/Object;)V

    const/16 v17, 0x0

    aget-object v6, v9, v17

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    const/16 v7, 0x37

    if-eqz v6, :cond_16

    const/16 v6, 0x2b

    if-lt v3, v6, :cond_16

    if-gt v3, v7, :cond_16

    move v3, v7

    goto :goto_1d

    :cond_16
    const/16 v6, 0x82

    if-lt v3, v6, :cond_17

    const/16 v6, 0x88

    if-gt v3, v6, :cond_17

    const/16 v3, 0x80

    :goto_1d
    iput-object v0, v1, Lcom/clevertap/android/pushsdk/values;->onContextItemSelected:Ljava/lang/Object;

    invoke-virtual {v1, v7}, Lcom/clevertap/android/pushsdk/values;->openContextMenu(I)I

    move v0, v3

    move/from16 p2, v5

    move v11, v10

    move/from16 v12, v21

    const/16 v10, 0x406

    goto/16 :goto_4

    :cond_17
    throw v0

    :catchall_20
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_18

    throw v1

    :cond_18
    throw v0

    nop

    :pswitch_data_0
    .packed-switch -0x3b
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
