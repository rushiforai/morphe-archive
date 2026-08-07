.class public final synthetic Ll/gll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lll;


# direct methods
.method public synthetic constructor <init>(Ll/lll;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gll;->a:Ll/lll;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gll;->a:Ll/lll;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/lll;->O3(Ll/lll;Ljava/util/List;)V

    return-void
.end method
