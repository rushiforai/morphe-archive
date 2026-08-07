.class public final synthetic Ll/yga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yga;->a:Ll/jka;

    iput-object p2, p0, Ll/yga;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/yga;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yga;->a:Ll/jka;

    iget-object v1, p0, Ll/yga;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/yga;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/jka;->j1(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V

    return-void
.end method
