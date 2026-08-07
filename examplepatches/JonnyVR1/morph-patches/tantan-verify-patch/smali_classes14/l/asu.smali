.class public final synthetic Ll/asu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/isu;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Ll/isu;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/asu;->a:Ll/isu;

    iput-wide p2, p0, Ll/asu;->b:D

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/asu;->a:Ll/isu;

    iget-wide v1, p0, Ll/asu;->b:D

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, p1}, Ll/isu;->n(Ll/isu;DLjava/util/List;)V

    return-void
.end method
