.class public final Ll/y9r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:J

.field public final synthetic c:Ll/n9s0;


# direct methods
.method public constructor <init>(Ll/n9s0;Ljava/lang/String;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/y9r0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-wide p3, p0, Ll/y9r0;->b:J

    .line 4
    .line 5
    iput-object p1, p0, Ll/y9r0;->c:Ll/n9s0;

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
    iget-object v0, p0, Ll/y9r0;->c:Ll/n9s0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y9r0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v2, p0, Ll/y9r0;->b:J

    .line 6
    .line 7
    invoke-static {v0, v1, v2, v3}, Ll/n9s0;->u(Ll/n9s0;Ljava/lang/String;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
