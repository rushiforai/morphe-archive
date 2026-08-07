.class public final synthetic Ll/x5z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y5z0;

.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ll/y5z0;IJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x5z0;->a:Ll/y5z0;

    .line 5
    .line 6
    iput p2, p0, Ll/x5z0;->b:I

    .line 7
    .line 8
    iput-wide p3, p0, Ll/x5z0;->c:J

    .line 9
    .line 10
    iput-wide p5, p0, Ll/x5z0;->d:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/x5z0;->a:Ll/y5z0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/y5z0;->b(Ll/y5z0;)Ll/a6z0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v2, p0, Ll/x5z0;->b:I

    .line 8
    .line 9
    iget-wide v3, p0, Ll/x5z0;->c:J

    .line 10
    .line 11
    iget-wide v5, p0, Ll/x5z0;->d:J

    .line 12
    .line 13
    invoke-interface/range {v1 .. v6}, Ll/a6z0;->p(IJJ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
