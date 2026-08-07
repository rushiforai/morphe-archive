.class public final synthetic Ll/zm40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:J

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zm40;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/zm40;->b:Z

    iput-object p3, p0, Ll/zm40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-wide p4, p0, Ll/zm40;->d:J

    iput-boolean p6, p0, Ll/zm40;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/zm40;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/zm40;->b:Z

    iget-object v2, p0, Ll/zm40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-wide v3, p0, Ll/zm40;->d:J

    iget-boolean v5, p0, Ll/zm40;->e:Z

    move-object v6, p1

    check-cast v6, Ll/uxj0;

    invoke-static/range {v0 .. v6}, Ll/cn40;->n(Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;JZLl/uxj0;)V

    return-void
.end method
