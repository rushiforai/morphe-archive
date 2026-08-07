.class public final synthetic Ll/jka0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cla0;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/cla0;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jka0;->a:Ll/cla0;

    iput-boolean p2, p0, Ll/jka0;->b:Z

    iput-boolean p3, p0, Ll/jka0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jka0;->a:Ll/cla0;

    iget-boolean v1, p0, Ll/jka0;->b:Z

    iget-boolean p0, p0, Ll/jka0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/cla0;->D0(Ll/cla0;ZZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
