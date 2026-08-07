.class public final synthetic Ll/xv6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dw6;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/dw6;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xv6;->a:Ll/dw6;

    iput-wide p2, p0, Ll/xv6;->b:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xv6;->a:Ll/dw6;

    iget-wide v1, p0, Ll/xv6;->b:J

    invoke-static {v0, v1, v2}, Ll/dw6;->b3(Ll/dw6;J)Lrx/c;

    move-result-object p0

    return-object p0
.end method
