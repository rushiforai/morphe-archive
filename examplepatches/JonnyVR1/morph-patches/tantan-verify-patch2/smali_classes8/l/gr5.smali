.class public final synthetic Ll/gr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kr5;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/kr5;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gr5;->a:Ll/kr5;

    iput-object p2, p0, Ll/gr5;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/gr5;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gr5;->a:Ll/kr5;

    iget-object v1, p0, Ll/gr5;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/gr5;->c:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/kr5;->c(Ll/kr5;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method
