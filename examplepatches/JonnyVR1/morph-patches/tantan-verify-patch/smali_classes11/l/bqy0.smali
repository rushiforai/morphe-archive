.class public final synthetic Ll/bqy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fqy0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ll/fqy0;Ljava/lang/String;JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bqy0;->a:Ll/fqy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bqy0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/bqy0;->c:J

    .line 9
    .line 10
    iput-wide p5, p0, Ll/bqy0;->d:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bqy0;->a:Ll/fqy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bqy0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v2, p0, Ll/bqy0;->c:J

    .line 6
    .line 7
    iget-wide v4, p0, Ll/bqy0;->d:J

    .line 8
    .line 9
    invoke-virtual/range {v0 .. v5}, Ll/fqy0;->n(Ljava/lang/String;JJ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
