.class public final synthetic Lcom/clevertap/android/sdk/task/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/task/d;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/task/d;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/clevertap/android/sdk/task/c;->a:Lcom/clevertap/android/sdk/task/d;

    iput-object p2, p0, Lcom/clevertap/android/sdk/task/c;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/task/c;->a:Lcom/clevertap/android/sdk/task/d;

    iget-object p0, p0, Lcom/clevertap/android/sdk/task/c;->b:Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/task/d;->b(Lcom/clevertap/android/sdk/task/d;Ljava/lang/Object;)V

    return-void
.end method
