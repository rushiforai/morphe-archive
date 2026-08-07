.class public final synthetic Ll/okd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/okd;->a:Ll/hk0$a;

    iput-wide p2, p0, Ll/okd;->b:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/okd;->a:Ll/hk0$a;

    iget-wide v1, p0, Ll/okd;->b:J

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, v2, p1}, Ll/wld;->Y0(Ll/hk0$a;JLl/hk0;)V

    return-void
.end method
