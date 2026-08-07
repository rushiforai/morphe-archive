.class public final synthetic Ll/zv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inbox/d;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inbox/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zv3;->a:Lcom/clevertap/android/sdk/inbox/d;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zv3;->a:Lcom/clevertap/android/sdk/inbox/d;

    invoke-static {p0}, Lcom/clevertap/android/sdk/inbox/d;->b(Lcom/clevertap/android/sdk/inbox/d;)V

    return-void
.end method
