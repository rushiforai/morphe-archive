.class public final synthetic Ll/iro;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/a;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/a;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iro;->a:Lcom/p1/mobile/putong/core/ui/match/a;

    iput-object p2, p0, Ll/iro;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/iro;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/iro;->d:Ll/x20;

    iput-object p5, p0, Ll/iro;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/iro;->a:Lcom/p1/mobile/putong/core/ui/match/a;

    iget-object v1, p0, Ll/iro;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/iro;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/iro;->d:Ll/x20;

    iget-object v4, p0, Ll/iro;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ljava/util/List;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/match/a;->l(Lcom/p1/mobile/putong/core/ui/match/a;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
