.class public final synthetic Ll/pz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/pz0;->a:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/pz0;->a:J

    check-cast p1, Ljava/util/Map;

    invoke-static {v0, v1, p1}, Ll/rz0;->b4(JLjava/util/Map;)V

    return-void
.end method
