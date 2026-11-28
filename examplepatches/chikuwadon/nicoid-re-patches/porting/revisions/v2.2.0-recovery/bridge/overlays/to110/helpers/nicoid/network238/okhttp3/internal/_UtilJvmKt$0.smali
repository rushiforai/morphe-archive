.class public final synthetic Lnicoid/network238/okhttp3/internal/_UtilJvmKt$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/okhttp3/EventListener$Factory;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/_UtilJvmKt;"
    method = "asFactory$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/EventListener;Lnicoid/network238/okhttp3/Call;)Lnicoid/network238/okhttp3/EventListener;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/EventListener;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/EventListener;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$0;->f$0:Lnicoid/network238/okhttp3/EventListener;

    return-void
.end method


# virtual methods
.method public final create(Lnicoid/network238/okhttp3/Call;)Lnicoid/network238/okhttp3/EventListener;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$0;->f$0:Lnicoid/network238/okhttp3/EventListener;

    invoke-static {v0, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->asFactory$lambda$0(Lnicoid/network238/okhttp3/EventListener;Lnicoid/network238/okhttp3/Call;)Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    return-object p1
.end method
