.class public final Ll/jby0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/say0;


# direct methods
.method public constructor <init>(Ll/say0;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-wide p2, p0, Ll/jby0;->a:J

    .line 2
    .line 3
    iput-object p1, p0, Ll/jby0;->b:Ll/say0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jby0;->b:Ll/say0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v1v0;->i()Ll/n9s0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Ll/jby0;->a:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/n9s0;->p(J)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/jby0;->b:Ll/say0;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/say0;->e:Ll/way0;

    .line 16
    .line 17
    return-void
.end method
