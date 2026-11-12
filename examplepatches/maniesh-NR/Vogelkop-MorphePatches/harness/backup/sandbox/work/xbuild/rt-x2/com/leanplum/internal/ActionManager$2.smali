.class Lcom/leanplum/internal/ActionManager$2;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/ActionManager;->listenForLocalNotifications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/ActionManager;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/ActionManager;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/ActionManager$2;->this$0:Lcom/leanplum/internal/ActionManager;

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 9

    const-string p0, "__leanplum_local_message_"

    const/4 v0, 0x0

    :try_start_3
    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "__leanplum_messaging__"

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-wide/16 v3, 0x0

    invoke-interface {v2, p0, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {v2}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_63

    :try_start_2d
    const-class p0, Lcom/leanplum/internal/LeanplumLocalPushHelper;

    const-string v2, "cancelLocalPush"

    const-class v5, Landroid/content/Context;

    const-class v6, Ljava/lang/String;

    filled-new-array {v5, v6}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v2, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide p0

    cmp-long p0, v3, p0

    if-lez p0, :cond_57

    const/4 p0, 0x1

    goto :goto_58

    :cond_57
    move p0, v0

    :goto_58
    if-eqz p0, :cond_61

    const-string p1, "Cancelled notification"

    new-array v1, v0, [Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_61
    .catchall {:try_start_2d .. :try_end_61} :catchall_62

    :cond_61
    return p0

    :catchall_62
    return v0

    :catchall_63
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return v0
.end method
