.class public final synthetic Ll/k2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/l2;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/l2;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k2;->a:Ll/l2;

    iput-wide p2, p0, Ll/k2;->b:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k2;->a:Ll/l2;

    iget-wide v1, p0, Ll/k2;->b:J

    invoke-static {v0, v1, v2}, Ll/l2;->E(Ll/l2;J)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
