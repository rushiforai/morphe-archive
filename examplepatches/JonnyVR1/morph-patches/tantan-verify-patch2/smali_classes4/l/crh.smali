.class public final synthetic Ll/crh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/frh$a;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Ll/frh$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crh;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/crh;->b:Ll/frh$a;

    iput-boolean p3, p0, Ll/crh;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/crh;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/crh;->b:Ll/frh$a;

    iget-boolean p0, p0, Ll/crh;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/erh;->d(Lcom/p1/mobile/putong/data/User;Ll/frh$a;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
