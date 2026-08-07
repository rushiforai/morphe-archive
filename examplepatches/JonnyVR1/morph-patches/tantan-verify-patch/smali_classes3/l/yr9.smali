.class public final synthetic Ll/yr9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ll/dwl;

.field public final synthetic e:Ll/cwl;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/cwl;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yr9;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/yr9;->b:Z

    iput-boolean p3, p0, Ll/yr9;->c:Z

    iput-object p4, p0, Ll/yr9;->d:Ll/dwl;

    iput-object p5, p0, Ll/yr9;->e:Ll/cwl;

    iput-boolean p6, p0, Ll/yr9;->f:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yr9;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/yr9;->b:Z

    iget-boolean v2, p0, Ll/yr9;->c:Z

    iget-object v3, p0, Ll/yr9;->d:Ll/dwl;

    iget-object v4, p0, Ll/yr9;->e:Ll/cwl;

    iget-boolean v5, p0, Ll/yr9;->f:Z

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->J(Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/cwl;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
