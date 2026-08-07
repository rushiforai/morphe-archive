.class public final synthetic Ll/ajt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gjt0;

.field public final synthetic b:Z

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/gjt0;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ajt0;->a:Ll/gjt0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/ajt0;->b:Z

    .line 7
    .line 8
    iput-wide p3, p0, Ll/ajt0;->c:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ajt0;->a:Ll/gjt0;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/ajt0;->b:Z

    .line 4
    .line 5
    iget-wide v2, p0, Ll/ajt0;->c:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, v3}, Ll/gjt0;->zzo(ZJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
