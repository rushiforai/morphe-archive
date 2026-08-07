.class public final synthetic Ll/gsm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gsm;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    iput-object p2, p0, Ll/gsm;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/gsm;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gsm;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    iget-object v1, p0, Ll/gsm;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/gsm;->c:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d;

    invoke-static {v0, v1, p0, p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->a(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
