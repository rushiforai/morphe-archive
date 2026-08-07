.class public final synthetic Ll/jb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iput-object p2, p0, Ll/jb60;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iget-object p0, p0, Ll/jb60;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->e(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ljava/lang/Runnable;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
