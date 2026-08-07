.class public final Ll/cxu0;
.super Ll/fxu0;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final l:Ll/hdw0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/hct0;Ll/hdw0;Ll/jdw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p4, p5}, Ll/fxu0;-><init>(Ljava/util/concurrent/Executor;Ll/hct0;Ll/jdw0;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/cxu0;->l:Ll/hdw0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fxu0;->b:Ljava/util/Map;

    .line 7
    .line 8
    invoke-virtual {p3, p0}, Ll/hdw0;->a(Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final g()Ljava/util/Map;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fxu0;->b:Ljava/util/Map;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
