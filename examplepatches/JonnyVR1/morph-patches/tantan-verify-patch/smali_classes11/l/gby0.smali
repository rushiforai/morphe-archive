.class public final Ll/gby0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/os/Bundle;

.field public final synthetic b:Ll/way0;

.field public final synthetic c:Ll/way0;

.field public final synthetic d:J

.field public final synthetic e:Ll/say0;


# direct methods
.method public constructor <init>(Ll/say0;Landroid/os/Bundle;Ll/way0;Ll/way0;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/gby0;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    iput-object p3, p0, Ll/gby0;->b:Ll/way0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/gby0;->c:Ll/way0;

    .line 6
    .line 7
    iput-wide p5, p0, Ll/gby0;->d:J

    .line 8
    .line 9
    iput-object p1, p0, Ll/gby0;->e:Ll/say0;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/gby0;->e:Ll/say0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gby0;->a:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object v2, p0, Ll/gby0;->b:Ll/way0;

    .line 6
    .line 7
    iget-object v3, p0, Ll/gby0;->c:Ll/way0;

    .line 8
    .line 9
    iget-wide v4, p0, Ll/gby0;->d:J

    .line 10
    .line 11
    invoke-static/range {v0 .. v5}, Ll/say0;->D(Ll/say0;Landroid/os/Bundle;Ll/way0;Ll/way0;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
