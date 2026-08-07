.class public final synthetic Ll/drq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/operate/a;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/operate/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/drq0;->a:Lcom/tencent/could/huiyansdk/operate/a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/drq0;->a:Lcom/tencent/could/huiyansdk/operate/a;

    invoke-static {p0}, Lcom/tencent/could/huiyansdk/operate/a;->b(Lcom/tencent/could/huiyansdk/operate/a;)V

    return-void
.end method
