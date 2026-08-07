.class public final synthetic Ll/n17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u17;


# direct methods
.method public synthetic constructor <init>(Ll/u17;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n17;->a:Ll/u17;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n17;->a:Ll/u17;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/u17;->g(Ll/u17;Ljava/util/List;)V

    return-void
.end method
