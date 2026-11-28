.class public final synthetic Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;"
    method = "toString$lambda$0$0"
    proto = "(Ljava/net/InetAddress;)Ljava/lang/CharSequence;"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Ljava/net/InetAddress;

    invoke-static {p1}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->$r8$lambda$CGsFA4ItjDlrJByu-dW17M4q0sI(Ljava/net/InetAddress;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
