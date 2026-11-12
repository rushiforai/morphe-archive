.class public final Lbnf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Landroid/util/SparseArray;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lbnf;->c:Landroid/util/SparseArray;

    sget v1, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;->c:I

    new-instance v1, Lzmf;

    const-class v2, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;

    const-string v3, "MediaPlayback"

    invoke-direct {v1, v2, v3}, Lzmf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    const v2, 0x7f0a060f

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget v1, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PresentationListenerService;->b:I

    new-instance v1, Lzmf;

    const-class v2, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PresentationListenerService;

    const-string v3, "MediaPresentation"

    invoke-direct {v1, v2, v3}, Lzmf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    const v2, 0x7f0a07bf

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget v1, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$CastListenerService;->b:I

    new-instance v1, Lzmf;

    const-class v2, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$CastListenerService;

    const-string v3, "MediaRemote"

    invoke-direct {v1, v2, v3}, Lzmf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    const v2, 0x7f0a082a

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lbnf;->a:I

    iput p2, p0, Lbnf;->b:I

    return-void
.end method

.method public static a(I)Lua7;
    .registers 4

    new-instance v0, Lcm;

    const/4 v1, 0x0

    const/4 v2, 0x5

    invoke-direct {v0, v1, p0, v2}, Lcm;-><init>(Ljava/lang/String;IB)V

    const-string p0, "media"

    invoke-static {p0, v0}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object p0

    return-object p0
.end method
