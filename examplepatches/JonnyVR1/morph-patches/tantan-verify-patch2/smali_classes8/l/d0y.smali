.class public final synthetic Ll/d0y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r0y;


# direct methods
.method public synthetic constructor <init>(Ll/r0y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d0y;->a:Ll/r0y;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0y;->a:Ll/r0y;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/r0y;->u0(Ll/r0y;Ljava/util/List;)V

    return-void
.end method
