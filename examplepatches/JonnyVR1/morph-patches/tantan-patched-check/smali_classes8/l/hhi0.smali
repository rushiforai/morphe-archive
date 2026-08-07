.class public final synthetic Ll/hhi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hhi0;->a:Ll/xc00;

    iput-boolean p2, p0, Ll/hhi0;->b:Z

    iput-object p3, p0, Ll/hhi0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hhi0;->a:Ll/xc00;

    iget-boolean v1, p0, Ll/hhi0;->b:Z

    iget-object p0, p0, Ll/hhi0;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/shi0;->S(Ll/xc00;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
