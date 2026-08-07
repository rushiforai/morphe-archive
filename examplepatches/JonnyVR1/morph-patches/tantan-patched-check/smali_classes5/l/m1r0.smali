.class public final synthetic Ll/m1r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/manager/f;

.field public final synthetic b:Lcom/tencent/could/huiyansdk/callback/e;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/manager/f;Lcom/tencent/could/huiyansdk/callback/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1r0;->a:Lcom/tencent/could/huiyansdk/manager/f;

    iput-object p2, p0, Ll/m1r0;->b:Lcom/tencent/could/huiyansdk/callback/e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m1r0;->a:Lcom/tencent/could/huiyansdk/manager/f;

    iget-object p0, p0, Ll/m1r0;->b:Lcom/tencent/could/huiyansdk/callback/e;

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/manager/f;->a(Lcom/tencent/could/huiyansdk/manager/f;Lcom/tencent/could/huiyansdk/callback/e;)V

    return-void
.end method
