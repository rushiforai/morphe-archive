.class public final synthetic Ll/s8a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8a;->a:Ll/jka;

    iput-object p2, p0, Ll/s8a;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/s8a;->c:Z

    iput-object p4, p0, Ll/s8a;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s8a;->a:Ll/jka;

    iget-object v1, p0, Ll/s8a;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/s8a;->c:Z

    iget-object p0, p0, Ll/s8a;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/jka;->r6(Ll/jka;Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V

    return-void
.end method
