.class public final Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;
.super Ljava/lang/Object;
.source "CaptionAddonSupport.java"


# static fields
.field private static activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activity()Landroid/app/Activity;
    .registers 1

    .line 11
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public static aiInstalled()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method static context()Landroid/content/Context;
    .registers 1

    .line 10
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static initialize(Landroid/app/Activity;)V
    .registers 2

    if-nez p0, :cond_3

    return-void

    .line 9
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->context:Landroid/content/Context;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->activity:Ljava/lang/ref/WeakReference;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->initialize(Landroid/content/Context;)V

    return-void
.end method

.method public static memoryInstalled()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method public static simplifiedInstalled()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method
