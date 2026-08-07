.class public final Ll/wvr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:J

.field public final synthetic c:Ll/jwr0;


# direct methods
.method public constructor <init>(Ll/jwr0;Ljava/lang/String;J)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/wvr0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-wide p3, p0, Ll/wvr0;->b:J

    .line 4
    .line 5
    iput-object p1, p0, Ll/wvr0;->c:Ll/jwr0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wvr0;->c:Ll/jwr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jwr0;->m(Ll/jwr0;)Ll/rwr0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/wvr0;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-wide v2, p0, Ll/wvr0;->b:J

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Ll/rwr0;->a(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/wvr0;->c:Ll/jwr0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/jwr0;->m(Ll/jwr0;)Ll/rwr0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/jwr0;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/rwr0;->b(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
