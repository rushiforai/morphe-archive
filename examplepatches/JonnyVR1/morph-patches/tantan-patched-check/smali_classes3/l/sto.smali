.class public final synthetic Ll/sto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vto;


# direct methods
.method public synthetic constructor <init>(Ll/vto;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sto;->a:Ll/vto;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sto;->a:Ll/vto;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/vto;->v(Ll/vto;Ljava/lang/Throwable;)V

    return-void
.end method
