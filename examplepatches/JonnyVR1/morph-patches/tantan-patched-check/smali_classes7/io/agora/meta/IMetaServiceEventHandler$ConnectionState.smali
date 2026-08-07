.class public Lio/agora/meta/IMetaServiceEventHandler$ConnectionState;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/meta/IMetaServiceEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConnectionState"
.end annotation


# static fields
.field public static final META_CONNECTION_STATE_ABORTED:I = 0x5

.field public static final META_CONNECTION_STATE_CONNECTED:I = 0x3

.field public static final META_CONNECTION_STATE_CONNECTING:I = 0x2

.field public static final META_CONNECTION_STATE_DISCONNECTED:I = 0x1

.field public static final META_CONNECTION_STATE_RECONNECTING:I = 0x4


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
