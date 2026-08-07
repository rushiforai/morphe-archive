.class public final synthetic Ll/w4k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q5k0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/q5k0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w4k0;->a:Ll/q5k0;

    iput-object p2, p0, Ll/w4k0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w4k0;->a:Ll/q5k0;

    iget-object p0, p0, Ll/w4k0;->b:Ljava/lang/String;

    check-cast p1, Ll/kfn0;

    invoke-static {v0, p0, p1}, Ll/q5k0;->t(Ll/q5k0;Ljava/lang/String;Ll/kfn0;)Ll/kfn0;

    move-result-object p0

    return-object p0
.end method
