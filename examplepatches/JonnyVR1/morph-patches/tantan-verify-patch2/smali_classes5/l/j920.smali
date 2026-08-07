.class public final synthetic Ll/j920;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j920;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/j920;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j920;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/j920;->b:Ll/y20;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/p920$a;->e(Lcom/p1/mobile/putong/data/User;Ll/y20;Ljava/lang/Boolean;)V

    return-void
.end method
