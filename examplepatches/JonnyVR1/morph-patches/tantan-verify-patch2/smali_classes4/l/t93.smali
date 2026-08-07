.class public final synthetic Ll/t93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u93;


# direct methods
.method public synthetic constructor <init>(Ll/u93;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t93;->a:Ll/u93;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t93;->a:Ll/u93;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/u93;->u(Ll/u93;Landroid/util/Pair;)V

    return-void
.end method
