.class public final synthetic Ll/qpm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/Passby;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLcom/p1/mobile/putong/data/Passby;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qpm;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/qpm;->b:Z

    iput-object p3, p0, Ll/qpm;->c:Lcom/p1/mobile/putong/data/Passby;

    iput-object p4, p0, Ll/qpm;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qpm;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/qpm;->b:Z

    iget-object v2, p0, Ll/qpm;->c:Lcom/p1/mobile/putong/data/Passby;

    iget-object p0, p0, Ll/qpm;->d:Ll/y20;

    check-cast p1, Ll/z80;

    invoke-static {v0, v1, v2, p0, p1}, Ll/upm;->u(Ljava/lang/String;ZLcom/p1/mobile/putong/data/Passby;Ll/y20;Ll/z80;)V

    return-void
.end method
