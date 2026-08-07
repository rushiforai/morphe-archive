.class public interface abstract Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;,
        Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0008`\u0018\u0000 \r2\u00020\u0001:\u0001\u000eJ-\u0010\t\u001a\u00020\u00082\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0005\u001a\u00020\u00042\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006H&\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "Landroidx/lifecycle/DefaultLifecycleObserver;",
        "Landroid/widget/RelativeLayout;",
        "relativeLayout",
        "Ll/brm;",
        "config",
        "Landroid/view/View$OnClickListener;",
        "clickListener",
        "",
        "setup",
        "(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V",
        "cleanup",
        "()V",
        "Companion",
        "a",
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
.field public static final Companion:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;->a:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;

    sput-object v0, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;->Companion:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;

    return-void
.end method


# virtual methods
.method public abstract cleanup()V
.end method

.method public abstract setup(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V
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
.end method
