.class public final synthetic Ll/a5a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g6a0;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/g6a0;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a5a0;->a:Ll/g6a0;

    iput-boolean p2, p0, Ll/a5a0;->b:Z

    iput-boolean p3, p0, Ll/a5a0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a5a0;->a:Ll/g6a0;

    iget-boolean v1, p0, Ll/a5a0;->b:Z

    iget-boolean p0, p0, Ll/a5a0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/g6a0;->o0(Ll/g6a0;ZZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
