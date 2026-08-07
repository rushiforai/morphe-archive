.class public final synthetic Ll/pkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rkn;


# direct methods
.method public synthetic constructor <init>(Ll/rkn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pkn;->a:Ll/rkn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkn;->a:Ll/rkn;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/rkn;->Q2(Ll/rkn;Ljava/util/List;)V

    return-void
.end method
