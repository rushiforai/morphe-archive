.class public final synthetic Ll/crq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/operate/a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/operate/a;Ljava/lang/String;ZLjava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crq0;->a:Lcom/tencent/could/huiyansdk/operate/a;

    iput-object p2, p0, Ll/crq0;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/crq0;->c:Z

    iput-object p4, p0, Ll/crq0;->d:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/crq0;->a:Lcom/tencent/could/huiyansdk/operate/a;

    iget-object v1, p0, Ll/crq0;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/crq0;->c:Z

    iget-object p0, p0, Ll/crq0;->d:Ljava/io/File;

    invoke-static {v0, v1, v2, p0}, Lcom/tencent/could/huiyansdk/operate/a;->a(Lcom/tencent/could/huiyansdk/operate/a;Ljava/lang/String;ZLjava/io/File;)V

    return-void
.end method
