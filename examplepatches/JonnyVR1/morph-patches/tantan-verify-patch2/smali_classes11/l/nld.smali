.class public final synthetic Ll/nld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Ljava/lang/Object;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nld;->a:Ll/hk0$a;

    iput-object p2, p0, Ll/nld;->b:Ljava/lang/Object;

    iput-wide p3, p0, Ll/nld;->c:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nld;->a:Ll/hk0$a;

    iget-object v1, p0, Ll/nld;->b:Ljava/lang/Object;

    iget-wide v2, p0, Ll/nld;->c:J

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, v2, v3, p1}, Ll/wld;->f1(Ll/hk0$a;Ljava/lang/Object;JLl/hk0;)V

    return-void
.end method
