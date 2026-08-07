.class public final Ll/xby0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/way0;

.field public final synthetic b:J

.field public final synthetic c:Ll/say0;


# direct methods
.method public constructor <init>(Ll/say0;Ll/way0;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/xby0;->a:Ll/way0;

    .line 2
    .line 3
    iput-wide p3, p0, Ll/xby0;->b:J

    .line 4
    .line 5
    iput-object p1, p0, Ll/xby0;->c:Ll/say0;

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
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xby0;->c:Ll/say0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xby0;->a:Ll/way0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget-wide v3, p0, Ll/xby0;->b:J

    .line 7
    .line 8
    invoke-static {v0, v1, v2, v3, v4}, Ll/say0;->G(Ll/say0;Ll/way0;ZJ)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/xby0;->c:Ll/say0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/say0;->e:Ll/way0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0}, Ll/hcy0;->L(Ll/way0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
