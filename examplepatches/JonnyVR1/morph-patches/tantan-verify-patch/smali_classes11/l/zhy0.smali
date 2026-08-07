.class public final Ll/zhy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/thy0;


# direct methods
.method public constructor <init>(Ll/thy0;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-wide p2, p0, Ll/zhy0;->a:J

    .line 2
    .line 3
    iput-object p1, p0, Ll/zhy0;->b:Ll/thy0;

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
    iget-object v0, p0, Ll/zhy0;->b:Ll/thy0;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/zhy0;->a:J

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Ll/thy0;->w(Ll/thy0;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
