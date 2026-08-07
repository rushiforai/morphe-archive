.class public final synthetic Ll/m570;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/n570;


# direct methods
.method public synthetic constructor <init>(Ll/n570;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m570;->a:Ll/n570;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m570;->a:Ll/n570;

    check-cast p1, Ljava/util/Map;

    invoke-static {p0, p1}, Ll/n570;->h(Ll/n570;Ljava/util/Map;)V

    return-void
.end method
