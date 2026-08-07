.class public final synthetic Ll/old;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;IJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/old;->a:Ll/hk0$a;

    iput p2, p0, Ll/old;->b:I

    iput-wide p3, p0, Ll/old;->c:J

    iput-wide p5, p0, Ll/old;->d:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/old;->a:Ll/hk0$a;

    iget v1, p0, Ll/old;->b:I

    iget-wide v2, p0, Ll/old;->c:J

    iget-wide v4, p0, Ll/old;->d:J

    move-object v6, p1

    check-cast v6, Ll/hk0;

    invoke-static/range {v0 .. v6}, Ll/wld;->G1(Ll/hk0$a;IJJLl/hk0;)V

    return-void
.end method
