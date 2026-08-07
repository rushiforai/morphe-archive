.class public final synthetic Ll/g1l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/k1l0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/k1l0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g1l0;->a:Ll/k1l0;

    iput-object p2, p0, Ll/g1l0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g1l0;->a:Ll/k1l0;

    iget-object p0, p0, Ll/g1l0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/k1l0;->e(Ll/k1l0;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
