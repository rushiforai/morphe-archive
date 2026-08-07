.class public final synthetic Ll/pir;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fjr;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/fjr;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pir;->a:Ll/fjr;

    iput-boolean p2, p0, Ll/pir;->b:Z

    iput-object p3, p0, Ll/pir;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pir;->a:Ll/fjr;

    iget-boolean v1, p0, Ll/pir;->b:Z

    iget-object p0, p0, Ll/pir;->c:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/fjr;->l0(Ll/fjr;ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method
