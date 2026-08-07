.class public final synthetic Ll/qay0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fm50;


# instance fields
.field public final synthetic a:Ll/vay0;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/vay0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qay0;->a:Ll/vay0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/qay0;->b:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qay0;->a:Ll/vay0;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/qay0;->b:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2, p1}, Ll/vay0;->b(JLjava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
