.class public final synthetic Ll/tdu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/tdu;->a:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tdu;->a:J

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p1}, Ll/udu;->g(JLjava/lang/Long;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method
