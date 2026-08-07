.class public final Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;",
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "<init>",
        "()V",
        "Landroid/widget/RelativeLayout;",
        "relativeLayout",
        "Ll/brm;",
        "config",
        "Landroid/view/View$OnClickListener;",
        "clickListener",
        "",
        "setup",
        "(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;

    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;-><init>()V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;->INSTANCE:Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$b;->a(Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setup(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1    # Landroid/widget/RelativeLayout;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/brm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/View$OnClickListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
