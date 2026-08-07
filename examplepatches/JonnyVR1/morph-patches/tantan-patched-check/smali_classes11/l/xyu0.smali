.class public final synthetic Ll/xyu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lzu0;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ll/tct0;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:J

.field public final synthetic f:Ll/rdw0;


# direct methods
.method public synthetic constructor <init>(Ll/lzu0;Ljava/lang/Object;Ll/tct0;Ljava/lang/String;JLl/rdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xyu0;->a:Ll/lzu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xyu0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xyu0;->c:Ll/tct0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/xyu0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-wide p5, p0, Ll/xyu0;->e:J

    .line 13
    .line 14
    iput-object p7, p0, Ll/xyu0;->f:Ll/rdw0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xyu0;->a:Ll/lzu0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xyu0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Ll/xyu0;->c:Ll/tct0;

    .line 6
    .line 7
    iget-object v3, p0, Ll/xyu0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-wide v4, p0, Ll/xyu0;->e:J

    .line 10
    .line 11
    iget-object v6, p0, Ll/xyu0;->f:Ll/rdw0;

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v6}, Ll/lzu0;->q(Ljava/lang/Object;Ll/tct0;Ljava/lang/String;JLl/rdw0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
