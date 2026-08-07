.class public final synthetic Ll/ztq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/callback/e;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/manager/b;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/manager/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ztq0;->a:Lcom/tencent/could/huiyansdk/manager/b;

    iput-object p2, p0, Ll/ztq0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztq0;->a:Lcom/tencent/could/huiyansdk/manager/b;

    iget-object p0, p0, Ll/ztq0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/manager/b;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method
