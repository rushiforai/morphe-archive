.class public Ll/xtj0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Ljava/lang/String;

.field public static final b:[Ljava/lang/String;

.field public static final c:[Ljava/lang/String;

.field public static final d:[Ljava/lang/String;

.field public static final e:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "\u662f\u5426\u89e3\u9664\u914d\u5bf9"

    .line 2
    .line 3
    const-string v1, "\u89e3\u9664\u914d\u5bf9\u5c06\u540c\u65f6\u53d6\u6d88\u559c\u6b22"

    .line 4
    .line 5
    const-string v2, "\u89e3\u9664\u914d\u5bf9"

    .line 6
    .line 7
    const-string v3, "\u53d6\u6d88"

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sput-object v1, Ll/xtj0;->a:[Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "\u89e3\u9664\u914d\u5bf9\u5c06\u540c\u65f6\u53d6\u6d88\u5173\u6ce8"

    .line 16
    .line 17
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/xtj0;->b:[Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "\u662f\u5426\u786e\u8ba4\u53d6\u6d88\u5173\u6ce8"

    .line 24
    .line 25
    const-string v1, "\u53d6\u6d88\u5173\u6ce8\u5c06\u540c\u65f6\u89e3\u9664\u914d\u5bf9"

    .line 26
    .line 27
    const-string v3, "\u786e\u8ba4"

    .line 28
    .line 29
    const-string v4, "\u518d\u60f3\u60f3"

    .line 30
    .line 31
    filled-new-array {v0, v1, v3, v4}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/xtj0;->c:[Ljava/lang/String;

    .line 36
    .line 37
    const-string v0, "\u662f\u5426\u786e\u8ba4\u53d6\u6d88\u559c\u6b22"

    .line 38
    .line 39
    const-string v1, "\u53d6\u6d88\u559c\u6b22\u5c06\u540c\u65f6\u89e3\u9664\u914d\u5bf9"

    .line 40
    .line 41
    filled-new-array {v0, v1, v3, v4}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Ll/xtj0;->d:[Ljava/lang/String;

    .line 46
    .line 47
    sput-object v2, Ll/xtj0;->e:Ljava/lang/CharSequence;

    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/xtj0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3}, Ll/xtj0;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/th0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/th0;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v5, Ll/wtj0;

    .line 6
    .line 7
    invoke-direct {v5, p0}, Ll/wtj0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x0

    .line 12
    move-object v1, p0

    .line 13
    move-object v2, p1

    .line 14
    move-object v6, p2

    .line 15
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->confirmThenUnmatch(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p3}, Ll/th0;->c()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
