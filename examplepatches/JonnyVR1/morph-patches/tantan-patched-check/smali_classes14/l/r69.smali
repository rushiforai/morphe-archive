.class public final synthetic Ll/r69;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x69;


# direct methods
.method public synthetic constructor <init>(Ll/x69;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r69;->a:Ll/x69;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r69;->a:Ll/x69;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/x69;->j3(Ll/x69;Ljava/util/List;)V

    return-void
.end method
