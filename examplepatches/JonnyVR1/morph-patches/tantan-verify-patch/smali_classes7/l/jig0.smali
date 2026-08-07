.class public final synthetic Ll/jig0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/llg0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ll/bxg0;

.field public final synthetic f:Ll/klg0;


# direct methods
.method public synthetic constructor <init>(Ll/llg0;Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;Ll/klg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jig0;->a:Ll/llg0;

    iput-object p2, p0, Ll/jig0;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/jig0;->c:J

    iput-object p5, p0, Ll/jig0;->d:Ljava/lang/Object;

    iput-object p6, p0, Ll/jig0;->e:Ll/bxg0;

    iput-object p7, p0, Ll/jig0;->f:Ll/klg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/jig0;->a:Ll/llg0;

    iget-object v1, p0, Ll/jig0;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/jig0;->c:J

    iget-object v4, p0, Ll/jig0;->d:Ljava/lang/Object;

    iget-object v5, p0, Ll/jig0;->e:Ll/bxg0;

    iget-object v6, p0, Ll/jig0;->f:Ll/klg0;

    invoke-virtual/range {v0 .. v6}, Ll/llg0;->g(Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;Ll/klg0;)V

    return-void
.end method
