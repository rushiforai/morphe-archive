.class public final synthetic Ll/ouy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/ruy;

.field public final synthetic b:Ll/qzz;


# direct methods
.method public synthetic constructor <init>(Ll/ruy;Ll/qzz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ouy;->a:Ll/ruy;

    iput-object p2, p0, Ll/ouy;->b:Ll/qzz;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ouy;->a:Ll/ruy;

    iget-object p0, p0, Ll/ouy;->b:Ll/qzz;

    invoke-static {v0, p0}, Ll/ruy;->h0(Ll/ruy;Ll/qzz;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
