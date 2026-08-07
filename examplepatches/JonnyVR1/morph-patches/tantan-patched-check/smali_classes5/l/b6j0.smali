.class public final synthetic Ll/b6j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/toppicks/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/core/ui/toppicks/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b6j0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-object p2, p0, Ll/b6j0;->b:Lcom/p1/mobile/putong/core/ui/toppicks/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b6j0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-object p0, p0, Ll/b6j0;->b:Lcom/p1/mobile/putong/core/ui/toppicks/a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/toppicks/a;->j0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/core/ui/toppicks/a;Ljava/lang/Throwable;)V

    return-void
.end method
