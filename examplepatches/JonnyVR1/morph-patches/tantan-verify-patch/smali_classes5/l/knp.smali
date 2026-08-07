.class public final synthetic Ll/knp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aop;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/aop;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/knp;->a:Ll/aop;

    iput-boolean p2, p0, Ll/knp;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/knp;->a:Ll/aop;

    iget-boolean p0, p0, Ll/knp;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/aop;->l(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
