.class public final synthetic Ll/rpm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Passby;

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Passby;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rpm;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/rpm;->b:Lcom/p1/mobile/putong/data/Passby;

    iput-boolean p3, p0, Ll/rpm;->c:Z

    iput-object p4, p0, Ll/rpm;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rpm;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/rpm;->b:Lcom/p1/mobile/putong/data/Passby;

    iget-boolean v2, p0, Ll/rpm;->c:Z

    iget-object p0, p0, Ll/rpm;->d:Ll/y20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/upm;->b(Ljava/lang/String;Lcom/p1/mobile/putong/data/Passby;ZLl/y20;Ljava/lang/Throwable;)V

    return-void
.end method
