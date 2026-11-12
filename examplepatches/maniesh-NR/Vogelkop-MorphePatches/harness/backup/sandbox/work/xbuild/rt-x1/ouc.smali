.class public final Louc;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Louc;

.field public static final HAS_CLICKED_UPSELL_NOTIFICATION_FIELD_NUMBER:I = 0x2

.field public static final HAS_SHOWN_UPSELL_IN_APP_FIELD_NUMBER:I = 0x3

.field public static final HAS_SHOWN_UPSELL_NOTIFICATION_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lp1g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private hasClickedUpsellNotification_:Z

.field private hasShownUpsellInApp_:Z

.field private hasShownUpsellNotification_:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Louc;

    invoke-direct {v0}, Lgv9;-><init>()V

    sput-object v0, Louc;->DEFAULT_INSTANCE:Louc;

    const-class v1, Louc;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public static bridge synthetic a()Louc;
    .registers 1

    sget-object v0, Louc;->DEFAULT_INSTANCE:Louc;

    return-object v0
.end method

.method public static b()Louc;
    .registers 1

    sget-object v0, Louc;->DEFAULT_INSTANCE:Louc;

    return-object v0
.end method


# virtual methods
.method public final c()Z
    .registers 1

    iget-boolean p0, p0, Louc;->hasClickedUpsellNotification_:Z

    return p0
.end method

.method public final d()Z
    .registers 1

    iget-boolean p0, p0, Louc;->hasShownUpsellInApp_:Z

    return p0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    sget-object p0, Lmuc;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_56

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Louc;->PARSER:Lp1g;

    if-nez p0, :cond_2d

    const-class p1, Louc;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Louc;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Louc;->DEFAULT_INSTANCE:Louc;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Louc;->PARSER:Lp1g;

    :cond_27
    monitor-exit p1

    return-object p0

    :goto_29
    monitor-exit p1
    :try_end_2a
    .catchall {:try_start_1a .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29

    :cond_2d
    return-object p0

    :pswitch_2e
    sget-object p0, Louc;->DEFAULT_INSTANCE:Louc;

    return-object p0

    :pswitch_31
    const-string p0, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u1007\u0000\u0002\u1007\u0001\u0003\u1007\u0002"

    sget-object p1, Louc;->DEFAULT_INSTANCE:Louc;

    const-string p2, "bitField0_"

    const-string p3, "hasShownUpsellNotification_"

    const-string v0, "hasClickedUpsellNotification_"

    const-string v1, "hasShownUpsellInApp_"

    filled-new-array {p2, p3, v0, v1}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_46
    new-instance p0, Lnuc;

    invoke-static {}, Louc;->a()Louc;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_50
    new-instance p0, Louc;

    invoke-direct {p0}, Lgv9;-><init>()V

    return-object p0

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_50
        :pswitch_46
        :pswitch_31
        :pswitch_2e
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e()Z
    .registers 1

    iget-boolean p0, p0, Louc;->hasShownUpsellNotification_:Z

    return p0
.end method

.method public final f()V
    .registers 2

    iget v0, p0, Louc;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Louc;->bitField0_:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Louc;->hasClickedUpsellNotification_:Z

    return-void
.end method

.method public final g()V
    .registers 2

    iget v0, p0, Louc;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Louc;->bitField0_:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Louc;->hasShownUpsellInApp_:Z

    return-void
.end method

.method public final h()V
    .registers 3

    iget v0, p0, Louc;->bitField0_:I

    const/4 v1, 0x1

    or-int/2addr v0, v1

    iput v0, p0, Louc;->bitField0_:I

    iput-boolean v1, p0, Louc;->hasShownUpsellNotification_:Z

    return-void
.end method
