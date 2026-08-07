.class public final synthetic Ll/l0o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/g1o0;


# direct methods
.method public synthetic constructor <init>(ZLl/g1o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/l0o0;->a:Z

    iput-object p2, p0, Ll/l0o0;->b:Ll/g1o0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/l0o0;->a:Z

    iget-object p0, p0, Ll/l0o0;->b:Ll/g1o0;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/g1o0;->x4(ZLl/g1o0;Ljava/util/List;)V

    return-void
.end method
