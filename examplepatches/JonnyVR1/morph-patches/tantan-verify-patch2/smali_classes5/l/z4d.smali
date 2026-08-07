.class public final synthetic Ll/z4d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ll/x20;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4d;->a:Ll/x20;

    iput-object p2, p0, Ll/z4d;->b:Ll/x20;

    iput-object p3, p0, Ll/z4d;->c:Ll/x20;

    iput-object p4, p0, Ll/z4d;->d:Ll/x20;

    iput-object p5, p0, Ll/z4d;->e:Ll/x20;

    iput-object p6, p0, Ll/z4d;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/z4d;->a:Ll/x20;

    iget-object v1, p0, Ll/z4d;->b:Ll/x20;

    iget-object v2, p0, Ll/z4d;->c:Ll/x20;

    iget-object v3, p0, Ll/z4d;->d:Ll/x20;

    iget-object v4, p0, Ll/z4d;->e:Ll/x20;

    iget-object v5, p0, Ll/z4d;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/util/DebugUtil;->gd(Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)V

    return-void
.end method
