.class public final synthetic Ll/kgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/z20;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Ll/z20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/kgr;->a:Z

    iput-object p2, p0, Ll/kgr;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/kgr;->c:Ll/z20;

    iput-object p4, p0, Ll/kgr;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/kgr;->a:Z

    iget-object v1, p0, Ll/kgr;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/kgr;->c:Ll/z20;

    iget-object p0, p0, Ll/kgr;->d:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, v2, p0, p1}, Ll/rgr;->d(ZLcom/p1/mobile/android/app/Act;Ll/z20;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
