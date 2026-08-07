.class public final synthetic Ll/suk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yuk;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/yuk;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/suk;->a:Ll/yuk;

    iput-object p2, p0, Ll/suk;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/suk;->a:Ll/yuk;

    iget-object p0, p0, Ll/suk;->b:Ll/y20;

    check-cast p1, Ll/lsw;

    invoke-static {v0, p0, p1}, Ll/yuk;->R3(Ll/yuk;Ll/y20;Ll/lsw;)V

    return-void
.end method
