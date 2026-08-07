.class public final Lcom/clevertap/android/sdk/i$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/i$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/i;->i(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/clevertap/android/sdk/i$e",
        "Lcom/clevertap/android/sdk/i$b;",
        "",
        "a",
        "()V",
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


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/i;

.field final synthetic b:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/i;Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/i$e;->a:Lcom/clevertap/android/sdk/i;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/i$e;->b:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/i$e;->a:Lcom/clevertap/android/sdk/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/i;->a(Lcom/clevertap/android/sdk/i;)Lcom/clevertap/android/sdk/i$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/clevertap/android/sdk/i$e;->b:Landroid/app/Activity;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/clevertap/android/sdk/i$d;->a(Landroid/app/Activity;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
