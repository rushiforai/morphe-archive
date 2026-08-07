.class public final synthetic Ll/tkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:I

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tkd;->a:Ll/hk0$a;

    iput p2, p0, Ll/tkd;->b:I

    iput-wide p3, p0, Ll/tkd;->c:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tkd;->a:Ll/hk0$a;

    iget v1, p0, Ll/tkd;->b:I

    iget-wide v2, p0, Ll/tkd;->c:J

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, v2, v3, p1}, Ll/wld;->g1(Ll/hk0$a;IJLl/hk0;)V

    return-void
.end method
