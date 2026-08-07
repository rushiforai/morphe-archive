.class public final synthetic Ll/as9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Ljava/lang/Boolean;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Boolean;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/as9;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-object p2, p0, Ll/as9;->b:Ljava/lang/Boolean;

    iput-object p3, p0, Ll/as9;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/as9;->d:Lcom/p1/mobile/putong/data/User;

    iput-object p5, p0, Ll/as9;->e:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/as9;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-object v1, p0, Ll/as9;->b:Ljava/lang/Boolean;

    iget-object v2, p0, Ll/as9;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/as9;->d:Lcom/p1/mobile/putong/data/User;

    iget-object v4, p0, Ll/as9;->e:Ljava/lang/Boolean;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->X(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Boolean;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
