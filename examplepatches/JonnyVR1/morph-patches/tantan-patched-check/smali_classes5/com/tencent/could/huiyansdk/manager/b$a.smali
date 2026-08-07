.class public Lcom/tencent/could/huiyansdk/manager/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/callback/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/manager/b;->a(Ljava/lang/String;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/tencent/could/huiyansdk/manager/b;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/manager/b;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->d:Lcom/tencent/could/huiyansdk/manager/b;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, "start compare."

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const-string v3, "AuthStateManager"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->d:Lcom/tencent/could/huiyansdk/manager/b;

    .line 12
    .line 13
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_END:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 20
    .line 21
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->LOCAL_DETECTION_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;Z)V

    .line 25
    .line 26
    .line 27
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->a:Z

    .line 28
    .line 29
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->b:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/b$a;->c:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v2, p0}, Lcom/tencent/could/huiyansdk/api/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, ""

    .line 40
    .line 41
    invoke-virtual {v0, v2, p0}, Lcom/tencent/could/huiyansdk/api/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
