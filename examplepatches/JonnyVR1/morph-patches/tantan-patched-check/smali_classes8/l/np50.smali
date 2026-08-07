.class public final synthetic Ll/np50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/np50;->a:Ll/y20;

    iput-object p2, p0, Ll/np50;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/np50;->a:Ll/y20;

    iget-object p0, p0, Ll/np50;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/b;->d(Ll/y20;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method
