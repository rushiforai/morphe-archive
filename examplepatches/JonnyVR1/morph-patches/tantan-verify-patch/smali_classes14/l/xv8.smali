.class public final synthetic Ll/xv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-boolean p2, p0, Ll/xv8;->b:Z

    iput-object p3, p0, Ll/xv8;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-boolean v1, p0, Ll/xv8;->b:Z

    iget-object p0, p0, Ll/xv8;->c:Ljava/lang/String;

    check-cast p1, Ll/vg60;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/j;->j3(Lcom/p1/mobile/putong/core/api/j;ZLjava/lang/String;Ll/vg60;)V

    return-void
.end method
