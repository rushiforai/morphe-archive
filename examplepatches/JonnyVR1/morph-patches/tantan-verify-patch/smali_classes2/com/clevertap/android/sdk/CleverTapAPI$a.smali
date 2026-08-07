.class Lcom/clevertap/android/sdk/CleverTapAPI$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/CleverTapAPI;->u(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/CharSequence;

.field final synthetic d:I

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Z

.field final synthetic g:Lcom/clevertap/android/sdk/CleverTapAPI;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;ZLcom/clevertap/android/sdk/CleverTapAPI;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->c:Ljava/lang/CharSequence;

    .line 6
    .line 7
    iput p4, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->d:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->f:Z

    .line 12
    .line 13
    iput-object p7, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->g:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Void;
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1a
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "notification"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/app/NotificationManager;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    invoke-static {}, Ll/hx3;->a()V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->c:Ljava/lang/CharSequence;

    .line 21
    .line 22
    iget v4, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->d:I

    .line 23
    .line 24
    invoke-static {v2, v3, v4}, Ll/iy40;->a(Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/app/NotificationChannel;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->e:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2, v3}, Ll/a95;->a(Landroid/app/NotificationChannel;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-boolean v3, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->f:Z

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/b95;->a(Landroid/app/NotificationChannel;Z)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v2}, Ll/gy40;->a(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->g:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/clevertap/android/sdk/CleverTapAPI;->l(Lcom/clevertap/android/sdk/CleverTapAPI;)Lcom/clevertap/android/sdk/Logger;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v2, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->g:Lcom/clevertap/android/sdk/CleverTapAPI;

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapAPI;->B()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v4, "Notification channel "

    .line 56
    .line 57
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/clevertap/android/sdk/CleverTapAPI$a;->c:Ljava/lang/CharSequence;

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p0, " has been created"

    .line 70
    .line 71
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, v2, p0}, Lcom/clevertap/android/sdk/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-object v1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapAPI$a;->a()Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
