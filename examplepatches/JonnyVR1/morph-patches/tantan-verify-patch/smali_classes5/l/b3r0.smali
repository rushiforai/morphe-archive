.class public final synthetic Ll/b3r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/utils/h;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/utils/h;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b3r0;->a:Lcom/tencent/could/huiyansdk/utils/h;

    iput-object p2, p0, Ll/b3r0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b3r0;->a:Lcom/tencent/could/huiyansdk/utils/h;

    iget-object p0, p0, Ll/b3r0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/utils/h;->a(Lcom/tencent/could/huiyansdk/utils/h;Ljava/lang/String;)V

    return-void
.end method
