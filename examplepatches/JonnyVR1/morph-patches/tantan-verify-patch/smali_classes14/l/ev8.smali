.class public final synthetic Ll/ev8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/ev8;->a:J

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ev8;->a:J

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/api/j;->p4(J)V

    return-void
.end method
