.class public final synthetic Ll/t6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:D

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/t6k;->a:D

    iput-wide p3, p0, Ll/t6k;->b:D

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/t6k;->a:D

    iget-wide v2, p0, Ll/t6k;->b:D

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, v3, p1}, Ll/u6k;->g(DDLjava/util/List;)Ll/j6k;

    move-result-object p0

    return-object p0
.end method
