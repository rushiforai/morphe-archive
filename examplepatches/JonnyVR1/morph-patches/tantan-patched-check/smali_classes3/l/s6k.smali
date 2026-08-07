.class public final synthetic Ll/s6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/u6k;

.field public final synthetic b:D

.field public final synthetic c:D


# direct methods
.method public synthetic constructor <init>(Ll/u6k;DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s6k;->a:Ll/u6k;

    iput-wide p2, p0, Ll/s6k;->b:D

    iput-wide p4, p0, Ll/s6k;->c:D

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/s6k;->a:Ll/u6k;

    iget-wide v1, p0, Ll/s6k;->b:D

    iget-wide v3, p0, Ll/s6k;->c:D

    invoke-static {v0, v1, v2, v3, v4}, Ll/u6k;->f(Ll/u6k;DD)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
