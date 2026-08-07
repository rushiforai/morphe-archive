.class public final synthetic Ll/a6j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/toppicks/a;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/core/ui/toppicks/a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6j0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/a6j0;->b:Z

    iput-object p3, p0, Ll/a6j0;->c:Lcom/p1/mobile/putong/core/ui/toppicks/a;

    iput-boolean p4, p0, Ll/a6j0;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a6j0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/a6j0;->b:Z

    iget-object v2, p0, Ll/a6j0;->c:Lcom/p1/mobile/putong/core/ui/toppicks/a;

    iget-boolean p0, p0, Ll/a6j0;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/toppicks/a;->m0(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/core/ui/toppicks/a;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
