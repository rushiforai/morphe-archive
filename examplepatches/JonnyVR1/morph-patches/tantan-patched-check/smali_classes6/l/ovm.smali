.class public final synthetic Ll/ovm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qvm;

.field public final synthetic b:Ll/v670;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/qvm;Ll/v670;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ovm;->a:Ll/qvm;

    iput-object p2, p0, Ll/ovm;->b:Ll/v670;

    iput-object p3, p0, Ll/ovm;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ovm;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ovm;->a:Ll/qvm;

    iget-object v1, p0, Ll/ovm;->b:Ll/v670;

    iget-object v2, p0, Ll/ovm;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/ovm;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qvm;->a(Ll/qvm;Ll/v670;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;)V

    return-void
.end method
