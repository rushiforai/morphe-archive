.class public final synthetic Ll/t8a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Z

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jka;ZLcom/p1/mobile/putong/feed/data/Moment;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t8a;->a:Ll/jka;

    iput-boolean p2, p0, Ll/t8a;->b:Z

    iput-object p3, p0, Ll/t8a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p4, p0, Ll/t8a;->d:Z

    iput-object p5, p0, Ll/t8a;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t8a;->a:Ll/jka;

    iget-boolean v1, p0, Ll/t8a;->b:Z

    iget-object v2, p0, Ll/t8a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean v3, p0, Ll/t8a;->d:Z

    iget-object v4, p0, Ll/t8a;->e:Ll/y20;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static/range {v0 .. v5}, Ll/jka;->U0(Ll/jka;ZLcom/p1/mobile/putong/feed/data/Moment;ZLl/y20;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
