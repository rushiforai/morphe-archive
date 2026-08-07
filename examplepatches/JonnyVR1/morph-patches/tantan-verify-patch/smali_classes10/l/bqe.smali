.class public final synthetic Ll/bqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bqe;->a:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bqe;->a:Ljava/util/HashSet;

    check-cast p1, Ll/jjs;

    invoke-static {p0, p1}, Ll/cqe;->a(Ljava/util/HashSet;Ll/jjs;)V

    return-void
.end method
