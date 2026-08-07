.class public final synthetic Ll/g3h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i3h0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/i3h0;Lcom/p1/mobile/putong/core/newui/home/d;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g3h0;->a:Ll/i3h0;

    iput-object p2, p0, Ll/g3h0;->b:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p3, p0, Ll/g3h0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g3h0;->a:Ll/i3h0;

    iget-object v1, p0, Ll/g3h0;->b:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean p0, p0, Ll/g3h0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/i3h0;->g0(Ll/i3h0;Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
