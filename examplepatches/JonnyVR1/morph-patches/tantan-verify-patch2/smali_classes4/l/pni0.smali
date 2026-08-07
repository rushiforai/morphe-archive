.class public final synthetic Ll/pni0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qni0;


# direct methods
.method public synthetic constructor <init>(Ll/qni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pni0;->a:Ll/qni0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pni0;->a:Ll/qni0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/qni0;->f0(Ll/qni0;Ljava/util/List;)V

    return-void
.end method
